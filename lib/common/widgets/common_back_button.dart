import 'package:eve_travel_app/app_imports/app_imports.dart';

class CustomBackButton extends StatelessWidget {
  final GestureTapCallback? onTap;
  final Color? color;

  const CustomBackButton({super.key, required this.onTap, this.color});

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: onTap,
        child: Container(
          height: 24.h,
          width: 24.w,
          margin: EdgeInsets.symmetric(vertical: 13.h, horizontal: 9.w),
          decoration: BoxDecoration(
              image: DecorationImage(
            image: const AssetImage(AppImages.backArrowImg),
            fit: BoxFit.fill,
            colorFilter:
                ColorFilter.mode(color ?? Colors.transparent, BlendMode.srcIn),
          )),
        ));
  }
}
