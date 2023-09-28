import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_courses/02.Ismail_Elmogy/clean_architecture/quote_app/core/utils/app_strings.dart';
import 'package:flutter_courses/02.Ismail_Elmogy/clean_architecture/quote_app/features/random_quote/presentation/cubit/random_quote_cubit.dart';
import '../../features/random_quote/presentation/screens/quote_screen.dart';
import 'package:flutter_courses/02.Ismail_Elmogy/clean_architecture/quote_app/injector.dart'
    as di;

class Routes {
  static const String initialRoute = '/';
  static const String randomQuoteRoute = '/randomQuote';
}

class AppRoutes {
  static Route? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      // case Routes.initialRoute:
      //   return MaterialPageRoute(builder: (context) {
      //     return  SplashScreen();
      //   });

      case Routes.randomQuoteRoute:
        return MaterialPageRoute(builder: ((context) {
          // ToDo:> BlocProvider
          // return const QuoteScreen();
          return BlocProvider(
            create: ((context) => di.sl<RandomQuoteCubit>()),
            child: const QuoteScreen(),
          );
        }));

      default:
        return undefinedRoute();
    }
  }

  static Route<dynamic> undefinedRoute() {
    return MaterialPageRoute(
        builder: ((context) => const Scaffold(
              body: Center(
                child: Text(AppStrings.noRouteFound),
              ),
            )));
  }
}
