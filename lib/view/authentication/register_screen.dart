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
          padding: EdgeInsets.symmetric(horizontal: 4.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                AppText.welcomeToEve,
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20.dp),
              ),
              SizedBox(
                height: 3.h,
              ),
              Image(
                image: const AssetImage(AppImages.appLogo),
                height: 13.h,
                fit: BoxFit.fill,
                width: 27.w,
              ),
              SizedBox(
                height: 10.h,
              ),
              CustomButton(
                  onTap: () {
                    Get.toNamed(AppRoutes.createAccountScreen);
                  },
                  labelColor: AppColor.whiteColor,
                  buttonColor: AppColor.primaryColor,
                  labelName: AppText.createAnAccount),
              SizedBox(
                height: 2.h,
              ),
              CustomButtonWithBorder(
                  onTap: () {
                    Get.toNamed(AppRoutes.signInScreen);
                  },
                  child: Text(
                    AppText.signIn,
                    style: TextStyle(
                        fontSize: 15.dp,
                        fontWeight: FontWeight.w600,
                        color: AppColor.primaryColor),
                  )),
              SizedBox(
                height: 3.h,
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
                          fontSize: 10.dp,
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
                height: 3.h,
              ),
              CustomButtonWithBorder(
                  onTap: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 5.w),
                        child: Image(
                          image: const AssetImage(AppImages.appleImg),
                          fit: BoxFit.fill,
                          height: 3.h,
                          width: 6.5.w,
                        ),
                      ),
                      Expanded(
                        child: Text(
                          AppText.continueWithApple,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: AppColor.blackColor,
                              fontSize: 15.dp,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                      SizedBox(
                        width: 10.w,
                      ),
                    ],
                  )),
              SizedBox(
                height: 3.h,
              ),
              CustomButtonWithBorder(
                  onTap: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 5.w),
                        child: Image(
                          image: const AssetImage(AppImages.facebookImg),
                          fit: BoxFit.fill,
                          height: 3.h,
                          width: 6.5.w,
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
                                  fontSize: 15.dp,
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
                height: 3.h,
              ),
              CustomButtonWithBorder(
                  onTap: () {},
                  child: Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 5.w),
                        child: Image(
                          image: const AssetImage(AppImages.googleImg),
                          fit: BoxFit.fill,
                          height: 3.h,
                          width: 6.5.w,
                        ),
                      ),
                      Expanded(
                        child: Text(
                          textAlign: TextAlign.center,
                          AppText.continueWithGoogle,
                          style: TextStyle(
                              color: AppColor.blackColor,
                              fontSize: 15.dp,
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
