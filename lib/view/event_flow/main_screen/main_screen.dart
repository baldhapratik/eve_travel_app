import 'package:eve_travel_app/app_imports/app_imports.dart';

class MainScreen extends GetView<GlobalController> {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Obx(() => controller.screens[controller.selectedIndex.value]),
        bottomNavigationBar: SafeArea(
          child: Container(
            decoration: BoxDecoration(
              color: AppColor.whiteColor,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  blurRadius: 2.0,
                  spreadRadius: 1.0,
                  offset: const Offset(0, -1),
                ),
              ],
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 15.h),
              child: Obx(
                () => Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      CustomBottomIcon(
                        iconColor: controller.selectedIndex.value == 0
                            ? AppColor.primaryColor
                            : AppColor.greyColor,
                        onTap: () {
                          controller.selectedIndex.value = 0;
                        },
                        image: AppImages.homeImg,
                      ),
                      CustomBottomIcon(
                        iconColor: controller.selectedIndex.value == 1
                            ? AppColor.primaryColor
                            : AppColor.greyColor,
                        onTap: () {
                          controller.selectedIndex.value = 1;
                        },
                        image: AppImages.createImg,
                      ),
                      CustomBottomIcon(
                        iconColor: controller.selectedIndex.value == 2
                            ? AppColor.primaryColor
                            : AppColor.greyColor,
                        image: AppImages.massageImg,
                        onTap: () {
                          controller.selectedIndex.value = 2;
                        },
                      ),
                      CustomBottomIcon(
                        iconColor: controller.selectedIndex.value == 3
                            ? AppColor.primaryColor
                            : AppColor.greyColor,
                        image: AppImages.profileImg,
                        onTap: () {
                          controller.selectedIndex.value = 3;
                        },
                      ),
                    ]),
              ),
            ),
          ),
        ));
  }
}

class CustomBottomIcon extends StatelessWidget {
  final String image;
  final GestureTapCallback? onTap;
  final Color iconColor;

  const CustomBottomIcon(
      {super.key,
      required this.image,
      required this.onTap,
      required this.iconColor});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 2.h),
        child: InkWell(
          onTap: onTap,
          child: Image(
            color: iconColor,
            image: AssetImage(image),
            height: 24.h,
            width: 24.w,
            fit: BoxFit.fill,
          ),
        ));
  }
}
