import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:food/core/theming/styles.dart';
import 'package:food/features/home/data/model/restaurant_model.dart';
import 'package:gap/gap.dart';

class RestaurantCard extends StatelessWidget {
  final RestaurantModel restaurant;

  const RestaurantCard({super.key, required this.restaurant});

  @override
  Widget build(BuildContext context) {
    final imageUrl = restaurant.image;
    final isAsset = imageUrl.startsWith('assets/');

    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(bottom: 20.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.r),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.03),
            spreadRadius: 1,
            blurRadius: 6,
            offset: const Offset(2, 2),
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.h, vertical: 10.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Gap(20.h),
            Container(
              height: 140.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.r),
                image: DecorationImage(
                  image: isAsset
                      ? AssetImage(imageUrl) as ImageProvider
                      : CachedNetworkImageProvider(imageUrl),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Gap(15.h),
            Text(
              restaurant.name,
              style: TextStyles.font20lightDark2Rugular,
            ),
            Gap(5.h),
            Wrap(
              spacing: 2.0,
              crossAxisAlignment: WrapCrossAlignment.center,
              children: [
                const Icon(Icons.restaurant_menu, size: 16, color: Colors.grey),
                for (var type in restaurant.foodTypes) ...[
                  Text(
                    type, 
                    style: const TextStyle(fontSize: 14, color:  Color.fromARGB(255, 85, 75, 75)),
                  ),
                  if (type != restaurant.foodTypes.last)
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 4),
                      child: Icon(Icons.circle, size: 4, color: Color.fromARGB(255, 87, 72, 72)),
                    ),
                ],
              ],
            ),
            Gap(10.h),
            Row(
              children: [
                SvgPicture.asset("assets/svgs/Star 1.svg", width: 22.w, height: 22.h),
                Gap(3.w),
                Text(
                  restaurant.rate.toString(),
                  style: TextStyles.font16blackRugular,
                ),
                Gap(30.w),
                SvgPicture.asset("assets/svgs/car_icon.svg", width: 20.w, height: 20.h),
                Gap(7.w),
                Text(
                  restaurant.deliveryFee,
                  style: TextStyles.font16blackRugular,
                ),
                Gap(30.w),
                SvgPicture.asset("assets/svgs/Clock.svg", width: 20.w, height: 20.h),
                Gap(7.w),
                Text(
                  restaurant.deliveryTime,
                  style: TextStyles.font16blackRugular,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
