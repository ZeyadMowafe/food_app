
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theming/colors.dart';

class OnboardingButton extends StatelessWidget {
  final bool? isLastPage;
  final VoidCallback onPressed;
  final double borderRadius;
  final Color buttonColor;
  final Color textColor;
  final String nextText;
  final String getStartedText;
  final double buttonHeight;
  final double horizontalPadding;

  const OnboardingButton({
    super.key,
    this.isLastPage,
    required this.onPressed,
    this.borderRadius = 12,
    this.buttonColor = ColorsManager.mainOrange,
    this.textColor = Colors.white,
    this.nextText = 'Next',
    this.getStartedText = 'Get Started',
    this.buttonHeight = 70,
    this.horizontalPadding = 12,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: horizontalPadding.w),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(borderRadius.r),
          boxShadow: [
            BoxShadow(
              color: buttonColor.withOpacity(0.3),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: TextButton(
          onPressed: onPressed,
          style: TextButton.styleFrom(
            backgroundColor: buttonColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius.r),
            ),
            minimumSize: Size(double.infinity, buttonHeight.h),
            padding: EdgeInsets.zero,
          ),
          child: Text(
            isLastPage! ? getStartedText : nextText,
            style: TextStyle(
              color: textColor,
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}

