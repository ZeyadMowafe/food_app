
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food/core/helpers/extentions.dart';

import '../../../../core/routing/routers.dart';
import '../../../../core/theming/styles.dart';

class HaveAccountSection extends StatelessWidget {
  const HaveAccountSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextButton(
            onPressed: () {
              context.pushNamed(Routes.signUpScreen);
            },
            child: Padding(
              padding:  EdgeInsets.symmetric(horizontal: 20.w),
              child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    children: [
                      TextSpan(
                          text: 'Don\'t have an account?   ',
                          style: TextStyles.font16GrayRegular
                      ),

                      TextSpan(
                          text: 'Sign Up',
                          style: TextStyles.font16OrangeBold
                      ),
                    ],
                  )

              ),
            )
        ),
      ],
    );
  }
}