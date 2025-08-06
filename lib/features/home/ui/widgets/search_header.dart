import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food/core/theming/colors.dart';
import 'package:food/core/widgets/app_text_form_field.dart';
import 'package:food/features/home/ui/home_screen.dart';
import 'package:food/features/home/ui/widgets/circle_of_icon.dart';

class SearchHeader extends StatelessWidget {
  const SearchHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverPersistentHeader(
      floating: true,
      delegate: StickyHeaderDelegate(
        minHeight: 100.h,
        maxHeight: 100.h,
        child: Container(
          color: Colors.white,
          padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
          child: AppTextFormField(
            backgroundColor: const Color(0xffF6F6F6),
            hintText: 'Search dishes, restaurant',
            validator: (value) {},
            suffixIcon: IconButton(
              onPressed: () {},
              icon: const CircleOfIcon(
                color: ColorsManager.mainOrange,
                iconPath: "assets/svgs/Search.svg",
                width: 18,
                height: 18,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
