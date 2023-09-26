import 'package:dartz/dartz.dart';
import 'package:flutter_courses/02.Ismail_Elmogy/clean_architecture/quote_app/core/error/failures.dart';
import 'package:flutter_courses/02.Ismail_Elmogy/clean_architecture/quote_app/features/random_quote/domain/entities/quote_entity.dart';

abstract class QuoteRepo {
  Future<Either<Failure, QuoteEntity>> getRandomQuote();
}
