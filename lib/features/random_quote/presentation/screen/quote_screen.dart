import 'package:flutter/material.dart';
import 'package:quotes_app/core/utils/app_strings.dart';

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
      body: const Center(
        child: Text('Quote', style: TextStyle(fontSize: 70)),
      ),
    );
  }
}
