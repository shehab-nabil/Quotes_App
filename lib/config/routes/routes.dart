import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quotes_app/features/random_quote/presentation/cubit/random_quote_cubit.dart';
import 'package:quotes_app/features/random_quote/presentation/screen/quote_screen.dart';
import 'package:quotes_app/features/splash/presentation/screen/splash_screen.dart';

import '../../injection_container.dart';

class Routes {
  static const String initialRoute = '/';
  static const String randomQuoteRoute = '/randomQoute';
}

class AppRoutes {
  static Route? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.initialRoute:
        return MaterialPageRoute(builder: (context) => const SplashScreen());
      case Routes.randomQuoteRoute:
        return MaterialPageRoute(
            builder: (context) => BlocProvider(
                  create: (context) => sl<RandomQuoteCubit>(),
                  child: const QuoteScreen(),
                ));

      default:
        return undefindRoute();
    }
  }

  static Route<dynamic> undefindRoute() {
    return MaterialPageRoute(
        builder: (context) => const Scaffold(
              body: Center(
                  child: Text('no Route find', style: TextStyle(fontSize: 70))),
            ));
  }
}
