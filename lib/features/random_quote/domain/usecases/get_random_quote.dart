import 'package:dartz/dartz.dart';
import 'package:quotes_app/core/error/failure.dart';
import 'package:quotes_app/core/usecases/usecases.dart';
import 'package:quotes_app/features/random_quote/domain/repositories/quote_repository.dart';
import 'package:quotes_app/features/random_quote/domain/entities/quote.dart';

class GetRandomQuoteUseCase implements UseCases<Quote, NoParams> {
  final QuoteRepository quoteRepository;

  GetRandomQuoteUseCase({required this.quoteRepository});

  @override
  Future<Either<Failure, Quote>> call(params) {
    return quoteRepository.getRandomQuto();
  }
}
