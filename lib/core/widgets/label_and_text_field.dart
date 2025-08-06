
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';



class LabelAndTextField extends StatelessWidget {
  const LabelAndTextField({
    super.key,
    required this.label,
    this.isPassword = false,
    this.hintText,


  });

  final String label;
  final bool isPassword;
  final String? hintText ;


  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label),
        Gap(5.h),

      ],
    );
  }
}