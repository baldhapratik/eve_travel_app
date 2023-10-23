import 'package:eve_travel_app/app_imports/app_imports.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    this.hintText,
    required this.controller,
    this.validator,
    this.onChange,
    this.maxLength,
    this.leadingIcon,
    this.suffixIcon,
    this.obscureText,
  });

  final String? hintText;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final int? maxLength;
  final IconData? leadingIcon;
  final Widget? suffixIcon;
  final Function(String?)? onChange;
  final bool? obscureText;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        TextFormField(
          obscureText: obscureText != null ? obscureText! : false,
          textAlignVertical: TextAlignVertical.center,
          maxLines: maxLength ?? 1,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          validator: validator,
          onChanged: onChange,
          decoration: InputDecoration(
            constraints:
                maxLength != null ? null : BoxConstraints(maxHeight: 60.h),
            contentPadding:
                EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
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
            suffixIcon: suffixIcon,
          ),
          controller: controller,
        ),
      ],
    );
  }
}
