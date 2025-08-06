import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food/core/theming/colors.dart';
import 'package:food/core/theming/styles.dart';
import 'package:food/features/home/ui/home_screen.dart';

class GreetingHeader extends StatelessWidget {
  final String userName;

  const GreetingHeader({super.key, required this.userName});

  @override
  Widget build(BuildContext context) {
    return SliverPersistentHeader(
      pinned: false,
      delegate: StickyHeaderDelegate(
        minHeight: 40.h,
        maxHeight: 40.h,
        child: Container(
          color: Colors.white,
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Align(
            alignment: Alignment.centerLeft,
            child: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: 'Hey $userName, ',
                    style: TextStyles.font16GrayRegular,
                  ),
                  TextSpan(
                    text: 'Good Afternoon!',
                    style: TextStyles.font16GrayRegular.copyWith(
                      fontWeight: FontWeight.bold,
                      color: ColorsManager.darkBlue,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
