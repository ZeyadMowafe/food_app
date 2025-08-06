import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class CircleOfIcon extends StatelessWidget {
  const CircleOfIcon({super.key, required this.color, required this.iconPath, required this.width, required this.height});
final Color color;
final String iconPath;
final int width;
final int height;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {

      },
      child: CircleAvatar(
                    radius: 22, // نصف القطر
                    backgroundColor: color, // لون الخلفية
                    child: Center(
                      child: SvgPicture.asset(
                        iconPath,
                        width: width.w,
                        
                        height: height.h,
                      ),
                    ),  
                  ),
    );
  }
}