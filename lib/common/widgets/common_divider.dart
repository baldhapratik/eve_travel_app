import 'package:eve_travel_app/app_imports/app_imports.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Divider(
      height: 1.h,
      thickness: 1,
      color: AppColor.greyColor.withOpacity(0.2),
    );
  }
}
