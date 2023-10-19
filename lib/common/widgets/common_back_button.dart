import 'package:eve_travel_app/app_imports/app_imports.dart';

class CustomBackButton extends StatelessWidget {
  final GestureTapCallback? onTap;

  const CustomBackButton({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: onTap,
        child: Container(
          height: 24.h,
          width: 24.w,margin: EdgeInsets.symmetric(vertical: 7.h,horizontal: 9.w),
          decoration: const BoxDecoration(
              image:
                  DecorationImage(image: AssetImage(AppImages.backArrowImg),fit: BoxFit.fill)),
        ));
  }
}
