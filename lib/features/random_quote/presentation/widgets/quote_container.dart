import 'package:flutter/material.dart';
import 'package:quotes_app/features/random_quote/domain/entities/quote.dart';

import '../../../../core/utils/app_colors.dart';

class QuoteContainer extends StatelessWidget {
  final Quote quote;
  const QuoteContainer({super.key, required this.quote});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
          color: AppColors.primaryColor,
          borderRadius: const BorderRadius.all(Radius.circular(30))),
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            quote.content,
            textAlign: TextAlign.center,
            style: const TextStyle(
                fontSize: 23, height: 1.4, fontWeight: FontWeight.w600),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            quote.author,
            style: const TextStyle(fontSize: 21, fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }
}
