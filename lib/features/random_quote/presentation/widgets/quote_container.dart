import 'package:flutter/material.dart';

import '../../../../core/utils/app_colors.dart';

class QuoteContainer extends StatelessWidget {
  const QuoteContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
          color: AppColors.primaryColor,
          borderRadius: const BorderRadius.all(Radius.circular(30))),
      child: const Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Imagination is the living power and prime agent of all human perception',
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 23, height: 1.4, fontWeight: FontWeight.w600),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            'shehab nabil ',
            style: TextStyle(fontSize: 21, fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }
}
