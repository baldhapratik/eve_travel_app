import 'package:eve_travel_app/utils/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';

class CustomBackButton extends StatelessWidget {
  final GestureTapCallback? onTap;

  const CustomBackButton({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: onTap,
        child: Container(
          height: 1.h,
          width: 1.w,margin: EdgeInsets.symmetric(vertical: 1.5.h,horizontal: 2.w),
          decoration: const BoxDecoration(
              image:
                  DecorationImage(image: AssetImage(AppImages.backArrowImg),fit: BoxFit.fill)),
        ));
  }
}
