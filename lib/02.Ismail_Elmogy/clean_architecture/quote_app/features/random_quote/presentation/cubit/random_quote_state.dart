import 'package:equatable/equatable.dart';
import 'package:flutter_courses/02.Ismail_Elmogy/clean_architecture/quote_app/features/random_quote/domain/entities/quote_entity.dart';

// part of 'random_quote_cubit.dart';

abstract class RandomQuoteState extends Equatable {
  const RandomQuoteState();

  @override
  List<Object> get props => [];
}

class RandomQuoteInitial extends RandomQuoteState {}

class RandomQuoteIsLoading extends RandomQuoteState {}

class RandomQuoteLoaded extends RandomQuoteState {
  final QuoteEntity quote;

  const RandomQuoteLoaded({required this.quote});

  @override
  List<Object> get props => [quote];
}

class RandomQuoteError extends RandomQuoteState {
  final String msg;

  const RandomQuoteError({required this.msg});

  @override
  List<Object> get props => [msg];
}
