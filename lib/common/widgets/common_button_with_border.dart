import 'package:eve_travel_app/app_imports/app_imports.dart';

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
        height: 44.h,
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