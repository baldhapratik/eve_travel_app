import 'package:eve_travel_app/utils/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';

class CustomRoundShapeTextField extends StatelessWidget {
  const CustomRoundShapeTextField({
    Key? key,
    this.hintText,
    required this.controller,
    this.validator,
    this.onChange,
    this.maxLength,
    this.leadingIcon,
  }) : super(key: key);

  final String? hintText;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final int? maxLength;
  final Icon? leadingIcon;
  final Function(String?)? onChange;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        border: Border.all(color: AppColor.greyColor.withOpacity(
            0.5)), // Change this to your desired border color
      ),
      child: TextFormField(
        textAlignVertical: TextAlignVertical.center,
        maxLines: maxLength ?? 1,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        validator: validator,
        onChanged: onChange,
        decoration: InputDecoration(
          isDense: true,
          contentPadding: EdgeInsets.symmetric(
              horizontal: 20, vertical: 0.5.h),
          hintText: hintText ?? '',
          hintStyle: const TextStyle(
            color: AppColor.greyColor,
            fontWeight: FontWeight.w400,
          ),
          border: InputBorder.none,
          counterText: '',
          prefixIcon: leadingIcon,
        ),
        controller: controller,
      ),
    );
  }
}
