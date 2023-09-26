import 'package:dartz/dartz.dart';
import 'package:flutter_courses/02.Ismail_Elmogy/clean_architecture/quote_app/core/error/failures.dart';
import 'package:flutter_courses/02.Ismail_Elmogy/clean_architecture/quote_app/core/usecases/usecase.dart';
import 'package:flutter_courses/02.Ismail_Elmogy/clean_architecture/quote_app/features/random_quote/domain/entities/quote_entity.dart';
import 'package:flutter_courses/02.Ismail_Elmogy/clean_architecture/quote_app/features/random_quote/domain/repositories/quote_repo.dart';

class GetRandomQuote implements UseCase<QuoteEntity, NoParams> {
  final QuoteRepo quoteRepo;
  const GetRandomQuote({required this.quoteRepo});

  @override
  Future<Either<Failure, QuoteEntity>> call(NoParams params) =>
      quoteRepo.getRandomQuote();
}
