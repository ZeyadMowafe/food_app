import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food/core/theming/colors.dart';
import 'package:food/core/theming/font_weight_helper.dart';
import 'package:food/features/home/ui/widgets/circle_of_icon.dart';
import 'package:gap/gap.dart';

class HomeAppBar extends StatelessWidget {
  final String userName;

  const HomeAppBar({super.key, required this.userName});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: false,
      floating: false,
      snap: false,
      expandedHeight: 0,
      toolbarHeight: 70.h,
      backgroundColor: Colors.white,
      elevation: 0,
      title: Row(
        children: [
          const CircleOfIcon(
            color: Color(0xffECF0F4),
            iconPath: "assets/svgs/Menu.svg",
            width: 16,
            height: 16,
          ),
          Gap(16.w),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'DELIVERY TO',
                style: TextStyle(
                  fontSize: 12.sp,
                  color: ColorsManager.mainOrange,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                '$userName Lab office',
                style: TextStyle(
                  fontSize: 14.sp,
                  color: const Color(0xff676767),
                  fontWeight: FontWeightHelper.regular,
                ),
              ),
            ],
          ),
          const Spacer(),
          const CircleOfIcon(
            color: Colors.black,
            iconPath: "assets/svgs/Icon_shop.svg",
            width: 22,
            height: 22,
          ),
        ],
      ),
    );
  }
}
