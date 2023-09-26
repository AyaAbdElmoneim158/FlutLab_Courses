import 'dart:convert';

import 'package:flutter_courses/02.Ismail_Elmogy/clean_architecture/quote_app/core/api/end_points.dart';
import 'package:flutter_courses/02.Ismail_Elmogy/clean_architecture/quote_app/core/error/exceptions.dart';
import 'package:flutter_courses/02.Ismail_Elmogy/clean_architecture/quote_app/core/utils/app_strings.dart';
import 'package:flutter_courses/02.Ismail_Elmogy/clean_architecture/quote_app/features/random_quote/data/models/quote_model.dart';
import 'package:http/http.dart' as http;

abstract class RemoteDataSource {
  Future<QuoteModel> getRandomQuote();
}

class RemoteDataSourceImpl extends RemoteDataSource {
  http.Client client;
  RemoteDataSourceImpl({required this.client});
  @override
  Future<QuoteModel> getRandomQuote() async {
    final res = await client.get(
      Uri.parse(EndPoints.randomQuote),
      headers: {AppStrings.contentType: AppStrings.applicationJson},
    );
    if (res.statusCode == 200) {
      return QuoteModel.fromJson(jsonDecode(res.body));
    } else {
      throw const ServerException();
    }
  }
}
