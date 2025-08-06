
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food/core/helpers/extentions.dart';

import '../../../../core/routing/routers.dart';
import '../../../../core/theming/styles.dart';

class HaveAccountSignUp extends StatelessWidget {
  const HaveAccountSignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextButton(
            onPressed: () {
              context.pushNamed(Routes.loginScreen);
            },
            child: Padding(
              padding:  EdgeInsets.symmetric(horizontal: 20.w),
              child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    children: [
                      TextSpan(
                          text: ' have an account?   ',
                          style: TextStyles.font16GrayRegular
                      ),

                      TextSpan(
                          text: 'Login',
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