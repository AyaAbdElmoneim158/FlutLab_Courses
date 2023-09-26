import 'dart:convert';

import 'package:flutter_courses/02.Ismail_Elmogy/clean_architecture/quote_app/core/error/exceptions.dart';
import 'package:flutter_courses/02.Ismail_Elmogy/clean_architecture/quote_app/core/utils/app_strings.dart';
import 'package:flutter_courses/02.Ismail_Elmogy/clean_architecture/quote_app/features/random_quote/data/models/quote_model.dart';
import 'package:flutter_courses/02.Ismail_Elmogy/clean_architecture/quote_app/features/random_quote/domain/entities/quote_entity.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class LocalDataSource {
  Future<QuoteEntity> getRandomQuote();
  Future<void> cacheQuote(QuoteModel quoteModel);
}

class LocalDataSourceImpl extends LocalDataSource {
  final SharedPreferences sharedPreferences;
  LocalDataSourceImpl(this.sharedPreferences);
  @override
  Future<void> cacheQuote(QuoteModel quoteModel) {
    return sharedPreferences.setString(
        AppStrings.cachedRandomQuote, json.encode(quoteModel));
  }

  @override
  Future<QuoteEntity> getRandomQuote() {
    final jsonString =
        sharedPreferences.getString(AppStrings.cachedRandomQuote);

    if (jsonString != null) {
      final cacheRandomQuote =
          Future.value(QuoteModel.fromJson(json.decode(jsonString)));
      return cacheRandomQuote;
    } else {
      throw CacheException();
    }
  }
}
