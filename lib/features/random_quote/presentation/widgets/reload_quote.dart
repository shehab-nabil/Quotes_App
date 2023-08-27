import 'package:flutter/material.dart';

import '../../../../core/utils/app_colors.dart';

class ReloadQuote extends StatelessWidget {
  const ReloadQuote({super.key});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 25,
      backgroundColor: AppColors.primaryColor,
      child: IconButton(
        icon: const Icon(
          Icons.refresh,
          color: Colors.black,
        ),
        onPressed: () {},
      ),
    );
  }
}
