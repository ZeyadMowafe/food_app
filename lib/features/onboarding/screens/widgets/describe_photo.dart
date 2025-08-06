import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Padding DescribePhoto(int index, dynamic onboardingData) {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 30.w),
    child: Text(
      onboardingData[index]['description']!,
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: 16.sp,
        color: Colors.grey,
      ),
    ),
  );
}


