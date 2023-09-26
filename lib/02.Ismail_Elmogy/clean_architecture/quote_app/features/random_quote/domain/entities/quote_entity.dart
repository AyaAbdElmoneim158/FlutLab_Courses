/*
  https://dummyjson.com/quotes/random

  {
  "id": 6,
  "quote": "You miss 100% of the shots you don’t take.",
  "author": "Wayne Gretzky"
  }
 */

import 'package:equatable/equatable.dart';

class QuoteEntity extends Equatable {
  final int id;
  final String quote;
  final String author;

  const QuoteEntity(
      {required this.id, required this.quote, required this.author});
  factory QuoteEntity.fromJson(Map<String, dynamic> json) => QuoteEntity(
        id: json['id'],
        quote: json['quote'],
        author: json['author'],
      );
  @override
  List<Object?> get props => [id, quote, author];
}
