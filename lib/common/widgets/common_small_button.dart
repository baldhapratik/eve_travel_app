import 'package:eve_travel_app/app_imports/app_imports.dart';


class CustomSmallButton extends StatelessWidget {
  const CustomSmallButton({
    super.key,
    required this.onTap,
    required this.image,
  });

  final void Function() onTap;
  final String image;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
          width: 43.w,
          height: 43.h,
          // padding: EdgeInsets.symmetric(horizontal: 0.5.w,vertical: 0.5.h),
          decoration: BoxDecoration(
            // border: Border.all(
            //   color: AppColor.primaryColor,
            // ),
            border: Border.all(color: AppColor.greyColor, width: 1),
            borderRadius: BorderRadius.circular(5),
          ),
          child: Padding(
            padding:  EdgeInsets.symmetric(vertical: 8.h,horizontal: 8.w),
            child: Image(
              image: AssetImage(image),
              fit: BoxFit.fill,
            ),
          )),
    );
  }
}
