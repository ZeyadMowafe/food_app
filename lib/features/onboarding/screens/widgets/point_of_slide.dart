
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PointOfSlide extends StatelessWidget {
  const PointOfSlide({
    super.key,
    required this.onboardingData,
    required int currentPage,
  }) : _currentPage = currentPage;

  final List<Map<String, String>> onboardingData;
  final int _currentPage;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 200.h,
      left: 0,
      right: 0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(
          onboardingData.length,
              (index) => Container(
            width: 10.w,
            height: 10.h,
            margin: EdgeInsets.symmetric(horizontal: 4.w),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: _currentPage == index
                  ? Colors.orange
                  : Colors.grey.withOpacity(0.5),
            ),
          ),
        ),
      ),
    );
  }
}