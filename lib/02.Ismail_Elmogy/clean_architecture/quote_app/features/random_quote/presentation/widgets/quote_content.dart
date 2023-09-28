import 'package:flutter/material.dart';
import 'package:flutter_courses/02.Ismail_Elmogy/clean_architecture/quote_app/core/utils/app_colors.dart';
import 'package:flutter_courses/02.Ismail_Elmogy/clean_architecture/quote_app/features/random_quote/domain/entities/quote_entity.dart';

class QuoteContent extends StatelessWidget {
  final QuoteEntity quote;
  const QuoteContent({Key? key, required this.quote}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      // context.width,
      margin: const EdgeInsets.all(20),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.primary,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Column(
        children: [
          Text(quote.quote,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyMedium),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 15),
            child: Text(quote.author,
                style: Theme.of(context).textTheme.bodyMedium),
          )
        ],
      ),
    );
  }
}
