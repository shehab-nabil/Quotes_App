import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:quotes_app/core/error/failure.dart';
import 'package:quotes_app/core/usecases/usecases.dart';
import 'package:quotes_app/core/utils/app_strings.dart';
import 'package:quotes_app/features/random_quote/domain/entities/quote.dart';
import 'package:quotes_app/features/random_quote/domain/usecases/get_random_quote.dart';

part 'random_quote_state.dart';

class RandomQuoteCubit extends Cubit<RandomQuoteState> {
  RandomQuoteCubit({required this.getRandomQuoteUseCase})
      : super(RandomQuoteInitial());
  final GetRandomQuoteUseCase getRandomQuoteUseCase;
  Future<void> getRandomQuote() async {
    emit(RandomQuoteLoading());
    Either<Failure, Quote> response = await getRandomQuoteUseCase(NoParams());
    emit(response.fold(
        (failure) => RandomQuoteError(msg: failureMessage(failure)),
        (quote) => RandomQuoteloaded(quote: quote)));
  }

  String failureMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return AppStrings.serverFailure;
      case CacheFailure:
        return AppStrings.cacheFailure;
      default:
        return AppStrings.unexpectedFailure;
    }
  }
}
