import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';

import '../../utils/app_color.dart';

class CustomButtonWithBorder extends StatelessWidget {
  const CustomButtonWithBorder({
    super.key,
    required this.onTap,
    required this.child,
  });
  final void Function() onTap;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: 5.5.h,
        decoration: BoxDecoration(
          border: Border.all(
            color: AppColor.primaryColor,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: child,
        ),
      ),
    );
  }
}