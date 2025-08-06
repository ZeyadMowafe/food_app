import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:food/core/helpers/extentions.dart';
import 'package:food/core/routing/routers.dart';
import 'package:food/core/theming/styles.dart';
import 'package:food/features/home/data/model/category_model.dart';

import 'package:gap/gap.dart';

class CategoriesSection extends StatelessWidget {
  final List<ProductModel> products;

  const CategoriesSection({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
  child: Padding(
    padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text('All Categories', style: TextStyles.font20darkGrayRugular),
            const Spacer(),
            GestureDetector(
              onTap: () {
                context.pushNamed(Routes.detailsCategoryScreen);
              },
              child: Row(
                children: [
                  Text('See All', style: TextStyles.font16blackRugular),
                  Gap(10.w),
                  SvgPicture.asset("assets/svgs/see_all_icon.svg"),
                ],
              ),
            ),
          ],
        ),
        Gap(20.h),
        SizedBox(
          height: 175.h,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: products.length,
            itemBuilder: (context, index) {
              final product = products[index];
              return GestureDetector(
                onTap: () {
                  // هنا هتبعت اسم الصنف مثلا product.name
                  context.pushNamed(
                    Routes.detailsCategoryScreen,
                    arguments: product.name,
                  );
                },
                child: Container(
                  width: 150.w,
                  margin: EdgeInsets.only(right: 15.w),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.r),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.03),
                        spreadRadius: 1,
                        blurRadius: 6,
                        offset: Offset(2, 2),
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                          child: Container(
                            height: 100.h,
                            width: 120.w,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12.r),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(12.r),
                              child: CachedNetworkImage(
                                imageUrl: product.image,
                                fit: BoxFit.cover,
                                placeholder: (context, url) => const Center(
                                    child: CircularProgressIndicator()),
                                errorWidget: (context, url, error) =>
                                    const Icon(Icons.error),
                              ),
                            ),
                          ),
                        ),
                        Gap(15.h),
                        Text(product.name,
                            style: TextStyles.font18DarkBold),
                        Gap(3.h),
                        Row(
                          children: [
                            Text("Starting",
                                style: TextStyles.font14GrayRegular),
                            const Spacer(),
                            Text(
                              '\$${product.price.toStringAsFixed(0)}',
                              style: TextStyles.font16lightDarkRugular,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    ),
  ),
);
  }
}