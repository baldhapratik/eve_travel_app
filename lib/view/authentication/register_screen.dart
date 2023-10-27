import 'package:eve_travel_app/app_imports/app_imports.dart';

class RegisterScreen extends GetView<RegisterController> {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
          child: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                AppText.welcomeToEve,
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20.sp),
              ),
              SizedBox(
                height: 23.h,
              ),
              Image(
                image: const AssetImage(AppImages.appLogo),
                height: 97.h,
                fit: BoxFit.fill,
                width: 97.w,
              ),
              SizedBox(
                height: 110.h,
              ),
              CustomButton(
                  onTap: () {
                    Get.toNamed(AppRoutes.createAccountScreen);
                  },
                  labelColor: AppColor.whiteColor,
                  buttonColor: AppColor.primaryColor,
                  labelName: AppText.createAnAccount),
              SizedBox(
                height: 12.h,
              ),
              CustomButtonWithBorder(
                  onTap: () {
                    Get.toNamed(AppRoutes.signInScreen);
                  },
                  child: Text(
                    AppText.signIn,
                    style: TextStyle(
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w600,
                        color: AppColor.primaryColor),
                  )),
              SizedBox(
                height: 32.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Expanded(
                    child: Divider(
                      color: AppColor.greyColor,
                      height: 1,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text(
                      AppText.or,
                      style: TextStyle(
                          fontSize: 10.sp,
                          fontWeight: FontWeight.w500,
                          color: AppColor.greyColor),
                    ),
                  ),
                  const Expanded(
                    child: Divider(
                      color: AppColor.greyColor,
                      height: 1,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 32.h,
              ),
              CustomButtonWithBorder(borderColor: AppColor.greyColor,
                  onTap: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 12.w),
                        child: Image(
                          image: const AssetImage(AppImages.appleImg),
                          fit: BoxFit.fill,
                          height: 24.h,
                          width: 24.w,
                        ),
                      ),
                      Expanded(
                        child: Text(
                          AppText.continueWithApple,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: AppColor.blackColor,
                              fontSize: 15.sp,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                      SizedBox(
                        width: 10.w,
                      ),
                    ],
                  )),
              SizedBox(
                height: 12.h,
              ),
              CustomButtonWithBorder(borderColor: AppColor.greyColor,
                  onTap: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 12.w),
                        child: Image(
                          image: const AssetImage(AppImages.facebookImg),
                          fit: BoxFit.fill,
                          height: 24.h,
                          width: 24.w,
                        ),
                      ),
                      Expanded(
                        child: SizedBox(
                          width: 20.w,
                          child: Center(
                            child: Text(
                              AppText.continueWithFacebook,
                              style: TextStyle(
                                  color: AppColor.blackColor,
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10.w,
                      ),
                    ],
                  )),
              SizedBox(
                height: 12.h,
              ),
              CustomButtonWithBorder(borderColor: AppColor.greyColor,
                  onTap: () {
                    Get.toNamed(AppRoutes.mainScreen);
                  },
                  child: Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 12.w),
                        child: Image(
                          image: const AssetImage(AppImages.googleImg),
                          fit: BoxFit.fill,
                          height: 24.h,
                          width: 24.w,
                        ),
                      ),
                      Expanded(
                        child: Text(
                          textAlign: TextAlign.center,
                          AppText.continueWithGoogle,
                          style: TextStyle(
                              color: AppColor.blackColor,
                              fontSize: 15.sp,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                      SizedBox(
                        width: 10.w,
                      ),
                    ],
                  )),
            ],
          ),
        ),
      )),
    );
  }
}
