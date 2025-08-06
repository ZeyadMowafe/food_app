import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food/features/sign_up/ui/widget/already_have_account.dart';
import 'package:food/features/sign_up/ui/widget/sign_in_bloc_listener.dart';
import 'package:food/features/sign_up/ui/widget/sign_up_form.dart';

import 'package:gap/gap.dart';

import '../../../core/theming/styles.dart';
import '../../../core/widgets/app_text_buttom.dart';
import '../../login/logic/login_cubit.dart';
import '../logic/sign_up_cubit.dart';


class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff181C2E),
      body: Stack(
        children: [
          Positioned(
            left: 0,
            child: SvgPicture.asset(
              'assets/svgs/Ellipse 1005.svg',
              width: 200.w,
              height: 200.h,
            ),
          ),
          Positioned(
            right: 10.w,
            child: SvgPicture.asset(
              'assets/svgs/Vector 142.svg',
              width: 400.w,
              height: 400.h,
            ),
          ),
          Positioned.fill(
            top: MediaQuery.of(context).size.height * 0.30,
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20.r),
                topRight: Radius.circular(20.r),
              ),
              child: Container(
                color: Colors.white,
                padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 30.h),
                child: SingleChildScrollView(
                  child: Column(
                    children: [

                      SignupForm(),

                      AppTextButton(buttonText: 'Sign Up', textStyle: TextStyles.font16WhiteMedium, onPressed: () => validateThenDoLogin(context),),
                      Gap(10.h),
                      HaveAccountSignUp(),
                      SignupBlocListener()


                    ],
                  ),
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: EdgeInsets.only(top: 120.h),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Sign Up',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Gap(5.h),
                  Text(
                    'Please sign up to get started',
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
  void validateThenDoLogin(BuildContext context) {
    if (context.read<SignupCubit>().formKey.currentState!.validate()) {
      context.read<SignupCubit>().emitSignupStates();
    }
  }

}
