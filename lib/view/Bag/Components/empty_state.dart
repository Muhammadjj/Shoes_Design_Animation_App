import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

import '../../../theme/custom_app_theme.dart';

class EmptyState extends StatelessWidget {
  const EmptyState({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return SingleChildScrollView(
      child: SizedBox(
        width: width,
        height: height * 0.63,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FadeInDown(
              delay: const Duration(milliseconds: 3),
              child: const Text("No shoes added!",
                  style: AppThemes.bagEmptyListTitle),
            ),
            FadeInDown(
              delay: const Duration(milliseconds: 4),
              child: const Text(
                "Once you have added, come back:)",
                style: AppThemes.bagEmptyListSubTitle,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
