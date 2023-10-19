import 'package:eve_travel_app/app_imports/app_imports.dart';

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
        border: Border.all(
            color: AppColor.greyColor
                .withOpacity(0.5)),
      ),
      child: TextFormField(
        textAlignVertical: TextAlignVertical.center,
        maxLines: maxLength ?? 1,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        validator: validator,
        onChanged: onChange,
        decoration: InputDecoration(
          constraints:
          maxLength != null ? null : BoxConstraints(maxHeight: 60.h),
          isDense: true,
          contentPadding:
              EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
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
