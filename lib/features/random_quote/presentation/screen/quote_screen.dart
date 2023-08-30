import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:quotes_app/core/utils/app_colors.dart';
import 'package:quotes_app/features/random_quote/presentation/cubit/random_quote_cubit.dart';
import 'package:quotes_app/features/random_quote/presentation/widgets/quote_container.dart';
import 'package:quotes_app/core/widgets/error_widget.dart' as error_widget;
import 'package:quotes_app/features/splash/presentation/cubit/locale_cubit.dart';

import '../../../../config/locale/app_localizations.dart';

class QuoteScreen extends StatefulWidget {
  const QuoteScreen({super.key});

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

  Widget _buildBodyContent() {
    return BlocBuilder<RandomQuoteCubit, RandomQuoteState>(
      builder: (context, state) {
        if (state is RandomQuoteLoading) {
          return Center(
              child: SpinKitRotatingCircle(
            color: AppColors.primaryColor,
            size: 50.0,
          ));
        } else if (state is RandomQuoteloaded) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: QuoteContainer(
                  quote: state.quote,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              CircleAvatar(
                radius: 25,
                backgroundColor: AppColors.primaryColor,
                child: IconButton(
                  icon: const Icon(
                    Icons.refresh,
                    color: Colors.black,
                  ),
                  onPressed: () => _getRandomQuote(),
                ),
              ),
            ],
          );
        } else if (state is RandomQuoteError) {
          return error_widget.ErrorWidget(() => _getRandomQuote());
        } else {
          return Center(
            child: SpinKitFadingCircle(
              color: AppColors.primaryColor,
            ),
          );
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () => _getRandomQuote(),
      child: Scaffold(
          appBar: AppBar(
              leading: IconButton(
                  icon: Icon(Icons.translate_outlined,
                      color: AppColors.primaryColor),
                  onPressed: () {
                    if (AppLocalizations.of(context)!.isEnLocale) {
                      BlocProvider.of<LocaleCubit>(context).toArabic();
                    } else {
                      BlocProvider.of<LocaleCubit>(context).toEnglish();
                    }
                  }),
              title:
                  Text(AppLocalizations.of(context)!.translate('app_name')!)),
          body: _buildBodyContent()),
    );
  }
}
