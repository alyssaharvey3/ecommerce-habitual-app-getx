import 'package:flutter/material.dart';

import '../core/core_export.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    Key? key,
    this.onPressed,
    required this.buttonLabel,
    this.buttonColor,
    this.buttonWidth = 342,
    this.buttonHeight = 48,
    this.labelColor,
  }) : super(key: key);

  final VoidCallback? onPressed;
  final String buttonLabel;
  final Color? buttonColor, labelColor;
  final double? buttonWidth, buttonHeight;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: buttonWidth,
      height: buttonHeight,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: buttonColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(6),
          ),
        ),
        onPressed: onPressed,
        child: Text(
          buttonLabel,
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                color: labelColor ?? AppColors.white,
                fontWeight: FontWeight.w500,
              ),
        ),
      ),
    );
  }
}
