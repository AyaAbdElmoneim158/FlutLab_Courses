import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_courses/02.Ismail_Elmogy/clean_architecture/quote_app/core/error/failures.dart';
import 'package:flutter_courses/02.Ismail_Elmogy/clean_architecture/quote_app/core/usecases/usecase.dart';
import 'package:flutter_courses/02.Ismail_Elmogy/clean_architecture/quote_app/core/utils/app_strings.dart';
import 'package:flutter_courses/02.Ismail_Elmogy/clean_architecture/quote_app/features/random_quote/domain/entities/quote_entity.dart';
import 'package:flutter_courses/02.Ismail_Elmogy/clean_architecture/quote_app/features/random_quote/domain/usecases/get_random_quote_usecase.dart';
import 'package:flutter_courses/02.Ismail_Elmogy/clean_architecture/quote_app/features/random_quote/presentation/cubit/random_quote_state.dart';

class RandomQuoteCubit extends Cubit<RandomQuoteState> {
  final GetRandomQuote getRandomQuoteUseCase;
  RandomQuoteCubit({required this.getRandomQuoteUseCase})
      : super(RandomQuoteInitial());

  Future<void> getRandomQuote() async {
    emit(RandomQuoteIsLoading());
    Either<Failure, QuoteEntity> response =
        await getRandomQuoteUseCase.call(NoParams());
    emit(
      response.fold(
        (failure) => RandomQuoteError(msg: _mapFailureToMsg(failure)),
        (quote) => RandomQuoteLoaded(quote: quote),
      ),
    );
  }

  String _mapFailureToMsg(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return AppStrings.serverFailure;
      case CacheFailure:
        return AppStrings.cacheFailure;
      default:
        return AppStrings.unexpectedError;
    }
  }
}
