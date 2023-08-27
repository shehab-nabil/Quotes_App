import 'package:flutter/material.dart';
import 'package:quotes_app/core/utils/app_strings.dart';
import 'package:quotes_app/core/utils/media_query_values.dart';

import '../../../../config/routes/routes.dart';

class QuoteScreen extends StatefulWidget {
  const QuoteScreen({super.key});

  @override
  State<QuoteScreen> createState() => _QuoteScreenState();
}

class _QuoteScreenState extends State<QuoteScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppStrings.appName),
      ),
      body: Center(
        child: InkWell(
            onTap: () => context.push(routeName: Routes.favoriteQuoteRoute),
            child: Container(
                color: Colors.greenAccent,
                width: context.screenWidth,
                child: const Text('Quote', style: TextStyle(fontSize: 70)))),
      ),
    );
  }
}
