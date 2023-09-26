import 'package:flutter_courses/02.Ismail_Elmogy/clean_architecture/quote_app/features/random_quote/domain/entities/quote_entity.dart';

//: https://app.quicktype.io/
class QuoteModel extends QuoteEntity {
  const QuoteModel({
    required super.id,
    required super.quote,
    required super.author,
  });

  factory QuoteModel.fromJson(Map<String, dynamic> json) => QuoteModel(
        id: json['id'],
        quote: json['quote'],
        author: json['author'],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "quote": quote,
        "author": author,
      };
}
