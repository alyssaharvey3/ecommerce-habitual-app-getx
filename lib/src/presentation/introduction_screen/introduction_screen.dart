import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../common_widgets/primary_button.dart';
import '../../core/core_export.dart';

class IntroductionScreen extends StatelessWidget {
  const IntroductionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          Scaffold(
            body: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    AppTitles.introTitle,
                    style: Get.theme.textTheme.displayLarge,
                    textAlign: TextAlign.center,
                  ),
                  gapH280,
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: AppDimensions.p24),
                    child: SizedBox(
                      height: 48,
                      child: PrimaryButton(
                        onPressed: () {},
                        buttonLabel: "Let's begin",
                        color: AppColors.yellow500,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}