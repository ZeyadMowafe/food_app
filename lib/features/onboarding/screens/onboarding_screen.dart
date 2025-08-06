
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food/core/helpers/extentions.dart';
import 'package:food/features/onboarding/screens/widgets/describe_photo.dart';
import 'package:food/features/onboarding/screens/widgets/place_of_food.dart';
import 'package:food/features/onboarding/screens/widgets/title_onboarding.dart';
import 'package:gap/gap.dart';

import '../../../core/routing/routers.dart';
import '../../../core/theming/styles.dart';
import 'widgets/onboarding_buttom.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<Map<String, String>> onboardingData = [
    {
      'image': 'assets/images/food.jpg',
      'title': 'All your favorites',
      'description': 'Get all your loved foods in one once place,\nyou just place the orer we do the rest'
    },
    {
      'image': 'assets/images/food2.jpg',
      'title': 'Fast Delivery',
      'description': 'Fast food delivery to your home'
    },
    {
      'image': 'assets/images/food3.jpg',
      'title': 'Live Tracking',
      'description': 'Real time tracking of your food'
    },
    {
      'image': 'assets/images/food4.jpg',
      'title': 'Easy Payment',
      'description': 'Payment made easy through cards'
    },
  ];

  void _goToNextPage() {
    if (_currentPage < onboardingData.length - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
    else {
      context.pushReplacementNamed(Routes.loginScreen);
      // يمكنك إضافة الانتقال لشاشة أخرى عند انتهاء الصفحات
    }

    // يمكنك إضافة الانتقال لشاشة أخرى عند انتهاء الصفحات
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView.builder(
            controller: _pageController,
            itemCount: onboardingData.length,
            onPageChanged: (int page) {
              setState(() {
                _currentPage = page;
              });
            },
            itemBuilder: (context, index) {
              return SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.only(top: 80.h),
                  child: Column(
                    children: [
                      PlaceOfFood(imagePath: onboardingData[index]['image']!),
                      const Gap(50),
                      TitleOnboarding(index , onboardingData),
                      const Gap(20),
                      DescribePhoto(index , onboardingData),
                      const Gap(40),
                    ],
                  ),
                ),
              );
            },
          ),

          // Dots Indicator
          Positioned(
            bottom: 230.h,
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
          ),

          // Next Button
          Positioned(
            bottom: 100.h,
            left: 20.w,
            right: 20.w,
            child: OnboardingButton(
              isLastPage: _currentPage == onboardingData.length - 1,
              onPressed: _goToNextPage,
            ),
          ),
          Positioned(
            bottom: 40.h,
            right: 20.w,
            left: 20.w,
           child: TextButton(onPressed: (){
             context.pushReplacementNamed(Routes.homeScreen);
           }, child: Text(
             'Skip',
             style: TextStyles.font16GrayRegular
           ),

           )
          ),
        ],
      ),
    );
  }

}

