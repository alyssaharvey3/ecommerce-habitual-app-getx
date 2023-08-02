import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common_widgets/common_widgets_export.dart';
import '../../../core/core_export.dart';

class HomeCategoryCard extends StatelessWidget {
  const HomeCategoryCard({
    Key? key,
    this.width,
    this.height,
    this.color,
    required this.title,
    required this.onTap,
  }) : super(key: key);

  final double? width;
  final double? height;
  final Color? color;
  final String title;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Card(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(
                Sizes.p10,
              ),
            ),
          ),
          color: color ?? AppColors.purple300,
          child: InkWell(
            borderRadius: const BorderRadius.all(
              Radius.circular(Sizes.p10),
            ),
            onTap: onTap,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(Sizes.p10),
              child: Padding(
                padding: const EdgeInsets.all(Sizes.p16),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: Get.textTheme.displayLarge,
                    ),
                    gapH28,
                    Align(
                      alignment: Alignment.centerRight,
                      child: PrimaryOutlinedButton(
                        hasText: false,
                        onPressed: onTap,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
