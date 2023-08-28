import 'package:dartz/dartz.dart';
import 'package:quotes_app/core/error/exceptions.dart';
import 'package:quotes_app/core/error/failure.dart';
import 'package:quotes_app/core/network/network_info.dart';
import 'package:quotes_app/features/random_quote/data/datasources/random_quote_local_dat_source.dart';
import 'package:quotes_app/features/random_quote/data/datasources/random_quote_remote_data_source.dart';
import 'package:quotes_app/features/random_quote/domain/entities/quote.dart';
import 'package:quotes_app/features/random_quote/domain/repositories/quote_repository.dart';

class QuoteRepositoryImpl extends QuoteRepository {
  final NetworkInfo networkInfo;
  final RandomQuoteRemoteDataSource randomQuoteRemoteDataSource;
  final RandomQuoteLocalDataSource randomQuoteLocalDataSource;

  QuoteRepositoryImpl(
      {required this.networkInfo,
      required this.randomQuoteRemoteDataSource,
      required this.randomQuoteLocalDataSource});

  @override
  Future<Either<Failure, Quote>> getRandomQuto() async {
    if (await networkInfo.isConnected) {
      try {
        final remoteRandomQuote =
            await randomQuoteRemoteDataSource.getRandomQuote();
        randomQuoteLocalDataSource.cashQuote(remoteRandomQuote);
        return Right(remoteRandomQuote);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        final cachedRandomQuote =
            await randomQuoteLocalDataSource.getLastRandomQuote();
        return Right(cachedRandomQuote);
      } on LocalException {
        return Left(CacheFailure());
      }
    }
  }
}
