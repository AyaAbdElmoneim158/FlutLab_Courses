import 'package:dartz/dartz.dart';
import 'package:flutter_courses/02.Ismail_Elmogy/clean_architecture/quote_app/core/error/exceptions.dart';
import 'package:flutter_courses/02.Ismail_Elmogy/clean_architecture/quote_app/core/error/failures.dart';
import 'package:flutter_courses/02.Ismail_Elmogy/clean_architecture/quote_app/core/network/netwok_info.dart';
import 'package:flutter_courses/02.Ismail_Elmogy/clean_architecture/quote_app/features/random_quote/data/datasources/local_data_source.dart';
import 'package:flutter_courses/02.Ismail_Elmogy/clean_architecture/quote_app/features/random_quote/data/datasources/remote_data_source.dart';
import 'package:flutter_courses/02.Ismail_Elmogy/clean_architecture/quote_app/features/random_quote/data/models/quote_model.dart';
import 'package:flutter_courses/02.Ismail_Elmogy/clean_architecture/quote_app/features/random_quote/domain/entities/quote_entity.dart';
import 'package:flutter_courses/02.Ismail_Elmogy/clean_architecture/quote_app/features/random_quote/domain/repositories/quote_repo.dart';

class QuoteRepoImpl extends QuoteRepo {
  final RemoteDataSource remoteDataSource;
  final LocalDataSource localDataSource;
  final NetworkInfo networkInfo;
  QuoteRepoImpl(
      {required this.remoteDataSource,
      required this.networkInfo,
      required this.localDataSource});

  @override
  Future<Either<Failure, QuoteEntity>> getRandomQuote() async {
    // throw UnimplementedError();

    if (await networkInfo.isConnected) {
      try {
        final quoteEntity = await remoteDataSource.getRandomQuote();
        localDataSource.cacheQuote(
          // quoteEntity
          QuoteModel(
            id: quoteEntity.id,
            quote: quoteEntity.quote,
            author: quoteEntity.author,
          ),
        );
        return right(quoteEntity);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        return right(await localDataSource.getRandomQuote());
      } on CacheException {
        return Left(CacheFailure());
      }
    }
    /*
      if(is connected) -> get data from Api remoteDataSource.getRandomQuote();
      eles -> get data from Api
     */
  }
}
