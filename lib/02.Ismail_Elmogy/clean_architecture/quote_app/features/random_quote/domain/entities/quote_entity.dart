/*
  https://dummyjson.com/quotes/random
 res: ✅ 
  {
  "id": 6,
  "quote": "You miss 100% of the shots you don’t take.",
  "author": "Wayne Gretzky"
  }
  res: ✖️
  {
  "message": "Quote with id 'randoms' not found"
}
 */

import 'package:equatable/equatable.dart';

class QuoteEntity extends Equatable {
  final int id;
  final String quote;
  final String author;

  const QuoteEntity({
    required this.id,
    required this.quote,
    required this.author,
  });

  @override
  List<Object?> get props => [id, quote, author];
}
