import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quotes_app/config/locale/app_localizations_setup.dart';
import 'package:quotes_app/config/routes/routes.dart';
import 'package:quotes_app/core/utils/app_strings.dart';

import 'config/themes/app_theme.dart';
import 'features/splash/presentation/cubit/locale_cubit.dart';
import 'injection_container.dart';

class QuoteApp extends StatelessWidget {
  const QuoteApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<LocaleCubit>()..getSavedLang(),
      child: BlocBuilder<LocaleCubit, LocaleState>(
        buildWhen: (previous, current) {
          return previous != current;
        },
        builder: (context, state) {
          return MaterialApp(
            locale: state.local,
            debugShowCheckedModeBanner: false,
            title: AppStrings.appName,
            theme: appTheme(),
            onGenerateRoute: AppRoutes.onGenerateRoute,
            supportedLocales: AppLocalizationsSetup.supportedLocales,
            localeResolutionCallback:
                AppLocalizationsSetup.localeResolutionCallback,
            localizationsDelegates:
                AppLocalizationsSetup.localizationsDelegates,
          );
        },
      ),
    );
  }
}
