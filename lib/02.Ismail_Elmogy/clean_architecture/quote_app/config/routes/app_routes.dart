import 'package:flutter/material.dart';
import 'package:flutter_courses/02.Ismail_Elmogy/clean_architecture/quote_app/core/utils/app_strings.dart';
import '../../features/random_quote/presentation/screens/quote_screen.dart';

class Routes {
  static const String initialRoute = '/';
  static const String randomQuoteRoute = '/randomQuote';
}

class AppRoutes {
  static Route? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      // case Routes.initialRoute:
      //   return MaterialPageRoute(builder: (context) {
      //     return const SplashScreen();
      //   });

      case Routes.randomQuoteRoute:
        return MaterialPageRoute(builder: ((context) {
          return const QuoteScreen();
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
