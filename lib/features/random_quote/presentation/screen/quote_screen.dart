import 'package:flutter/material.dart';
import 'package:quotes_app/core/utils/app_strings.dart';
import 'package:quotes_app/features/random_quote/presentation/widgets/quote_container.dart';
import 'package:quotes_app/features/random_quote/presentation/widgets/reload_quote.dart';

class QuoteScreen extends StatefulWidget {
  const QuoteScreen({super.key});

  @override
  State<QuoteScreen> createState() => _QuoteScreenState();
}

class _QuoteScreenState extends State<QuoteScreen> {
  Widget _buildBodyContent() {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Center(
          child: QuoteContainer(),
        ),
        SizedBox(
          height: 10,
        ),
        ReloadQuote(),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(AppStrings.quotes),
        ),
        body: _buildBodyContent());
  }
}
