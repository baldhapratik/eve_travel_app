import 'package:eve_travel_app/app_imports/app_imports.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {super.key,
      required this.onTap,
      required this.labelColor,
      required this.buttonColor,
      required this.labelName,
      this.borderRadius});

  final void Function() onTap;
  final String labelName;
  final Color buttonColor;
  final Color labelColor;
  final double? borderRadius;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: 45.h,
        decoration: BoxDecoration(
          // border: Border.all(
          //   color: AppColor.primaryColor,
          // ),
          color: buttonColor,
          borderRadius: BorderRadius.circular(borderRadius ?? 10),
        ),
        child: Center(
          child: Text(
            labelName,
            style: TextStyle(
                fontWeight: FontWeight.w600,
                color: labelColor,
                fontSize: 15.sp),
          ),
        ),
      ),
    );
  }
}
