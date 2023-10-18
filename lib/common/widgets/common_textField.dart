import 'package:eve_travel_app/utils/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    this.hintText,
    required this.controller,
    this.validator,
    this.onChange,
    this.maxLength,
    this.leadingIcon,
  });

  final String? hintText;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final int? maxLength;
  final IconData? leadingIcon;
  final Function(String?)? onChange;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        TextFormField(
          textAlignVertical: TextAlignVertical.center,
          maxLines: maxLength ?? 1,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          validator: validator,
          onChanged: onChange,
          decoration: InputDecoration(
            constraints:
                maxLength != null ? null : BoxConstraints(maxHeight: 80.h),
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            hintText: hintText ?? '',
            hintStyle: const TextStyle(
                color: AppColor.greyColor, fontWeight: FontWeight.w400),
            isDense: true,
            border: UnderlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: Colors.blue),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide:
                  const BorderSide(color: Color.fromARGB(255, 100, 141, 175)),
            ),
            counterText: '',
            prefixIcon: leadingIcon != null ? Icon(leadingIcon) : null,
          ),
          controller: controller,
        ),
      ],
    );
  }
}
