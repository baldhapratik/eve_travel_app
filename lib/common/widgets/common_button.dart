import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.onTap,
    required this.labelColor,
    required this.buttonColor,
    required this.labelName,
  });
  final void Function() onTap;
  final String labelName;
  final Color buttonColor;
  final Color labelColor;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: 5.5.h,
        decoration: BoxDecoration(
          // border: Border.all(
          //   color: AppColor.primaryColor,
          // ),
          color: buttonColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Text(
            labelName,
            style: TextStyle(fontWeight: FontWeight.w600,color: labelColor,fontSize: 15.dp),
          ),
        ),
      ),
    );
  }
}