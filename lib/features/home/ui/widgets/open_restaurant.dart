import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:food/core/theming/styles.dart';
import 'package:gap/gap.dart';

class OpenRestaurantsHeader extends StatelessWidget {
  const OpenRestaurantsHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 2.h),
        child: Row(
          children: [
            Text('Open Restaurants', style: TextStyles.font20darkGrayRugular),
            const Spacer(),
            Text('See All', style:  TextStyles.font16blackRugular),
            Gap(10.w),
            SvgPicture.asset("assets/svgs/see_all_icon.svg"),
          ],
        ),
      ),
    );
  }
}
