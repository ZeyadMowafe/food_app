import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import '../../../../core/theming/colors.dart';
import '../../../../core/theming/styles.dart';


class RememberAndForgotSection extends StatelessWidget {
  const RememberAndForgotSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        RememberMeAndCheckbox(),

        ForgotPasswordButton(),
      ],
    );
  }

}
class RememberMeAndCheckbox extends StatefulWidget {
  const RememberMeAndCheckbox({super.key});

  @override
  State<RememberMeAndCheckbox> createState() => _RememberMeAndCheckboxState();
}

class _RememberMeAndCheckboxState extends State<RememberMeAndCheckbox> {
  bool _isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.r)),


          activeColor: ColorsManager.mainOrange,
          value: _isChecked,
          onChanged: (bool? value) {
            setState(() {
              _isChecked = value ?? false;
            });
          },
        ),
        Gap(2.w),
        Text(
          'Remember Me',
          style: TextStyles.font12GrayMedium,
        ),
      ],
    );
  }
}

class ForgotPasswordButton extends StatelessWidget {
  const ForgotPasswordButton({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {

      },
      child: Text(
        'Forgot Password?',
        style: TextStyle(
          color: ColorsManager.mainOrange,
          fontSize: 14.sp,
        ),
      ),
    );
  }
}
