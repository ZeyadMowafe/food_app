import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Text TitleOnboarding(int index, dynamic onboardingData) {
  return Text(
    onboardingData[index]['title']!,
    style: TextStyle(
      fontSize: 24.sp,
      fontWeight: FontWeight.bold,
    ),
  );
}

