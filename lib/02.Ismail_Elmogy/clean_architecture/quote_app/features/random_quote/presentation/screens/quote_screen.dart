import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_courses/02.Ismail_Elmogy/clean_architecture/quote_app/core/utils/app_colors.dart';
import 'package:flutter_courses/02.Ismail_Elmogy/clean_architecture/quote_app/core/utils/constants.dart';
import 'package:flutter_courses/02.Ismail_Elmogy/clean_architecture/quote_app/features/random_quote/domain/entities/quote_entity.dart';
import 'package:flutter_courses/02.Ismail_Elmogy/clean_architecture/quote_app/features/random_quote/presentation/cubit/random_quote_cubit.dart';
import 'package:flutter_courses/02.Ismail_Elmogy/clean_architecture/quote_app/features/random_quote/presentation/cubit/random_quote_state.dart';
import 'package:flutter_courses/02.Ismail_Elmogy/clean_architecture/quote_app/features/random_quote/presentation/widgets/quote_content.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_courses/02.Ismail_Elmogy/clean_architecture/quote_app/core/widgets/error_widget.dart'
    as error_widget;

class QuoteScreen extends StatefulWidget {
  const QuoteScreen({Key? key}) : super(key: key);

  @override
  State<QuoteScreen> createState() => _QuoteScreenState();
}

class _QuoteScreenState extends State<QuoteScreen> {
  _getRandomQuote() =>
      BlocProvider.of<RandomQuoteCubit>(context).getRandomQuote();

  @override
  void initState() {
    super.initState();
    _getRandomQuote();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: SizedBox(
        height: 132,
        child: Image.asset(
          'assets/Ismail_Elmogy_Quotes_App/images/quote.png',
          // ImgAssets.quote
        ),
      )
          // const Text(AppStrings.appName),
          ),
      body: BlocBuilder<RandomQuoteCubit, RandomQuoteState>(
          builder: (context, state) {
        if (state is RandomQuoteIsLoading) {
          return const Loading();
        } else if (state is RandomQuoteError) {
          return error_widget.ErrorWidget(onPress: () => _getRandomQuote());
        } else if (state is RandomQuoteLoaded) {
          return BodyQuoteScreen(quote: state.quote);
        } else {
          return const Loading();
        }
      }),
    );
  }
}

class Loading extends StatelessWidget {
  const Loading({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SpinKitFadingCircle(
        color: AppColors.primary,
      ),
    );
  }
}

class BodyQuoteScreen extends StatelessWidget {
  const BodyQuoteScreen({super.key, required this.quote});
  final QuoteEntity quote;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        QuoteContent(
          quote: quote,
        ),
        InkWell(
            onTap: () {
              Constants.showToast(msg: "Reload");
            }, //=> _getRandomQuote(),
            child: Container(
              margin: const EdgeInsets.symmetric(vertical: 15),
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.primary,
              ),
              child: const Icon(
                Icons.refresh,
                size: 28,
                color: Colors.white,
              ),
            ))
      ],
    );
  }
}
