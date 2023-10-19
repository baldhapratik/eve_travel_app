import 'package:eve_travel_app/app_imports/app_imports.dart';

class CreateAccountScreen extends GetView<CreateAccountController> {
  const CreateAccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            Get.back();
          },
          child: Icon(
            Icons.arrow_back,
            color: AppColor.blackColor,
            size: 20.sp,
          ),
        ),
        elevation: 0,
        backgroundColor: AppColor.whiteColor,
      ),
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.w),
        child: Form(
          key: controller.formKey,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: 20.h,
                ),
                Text(
                  AppText.createAccount,
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: AppColor.blackColor,
                      fontSize: 20.sp),
                ),
                SizedBox(
                  height: 8.h,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 3.w),
                  child: Text(
                    AppText.saveYourSpot,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontWeight: FontWeight.w400,
                        color: AppColor.greyColor,
                        fontSize: 15.sp),
                  ),
                ),
                SizedBox(
                  height: 32.h,
                ),
                CustomTextField(
                  onChange: (p0) {
                    controller.validateLoginField();
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return AppText.pleaseEnterAnEmailAddress;
                    }
                    final emailRegExp =
                        RegExp(r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$');
                    if (!emailRegExp.hasMatch(value)) {
                      return AppText.pleaseEnterAValidEmailAddress;
                    }
                    return null;
                  },
                  controller: controller.emailController,
                  hintText: AppText.emailAddress,
                ),
                SizedBox(
                  height: 20.h,
                ),
                CustomTextField(
                  onChange: (p0) {
                    controller.validateLoginField();
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return AppText.pleaseEnterAPassword;
                    }
                    return null;
                  },
                  controller: controller.passwordController,
                  hintText: AppText.password,
                ),
                SizedBox(
                  height: 20.h,
                ),
                CustomTextField(
                  onChange: (p0) {
                    controller.validateLoginField();
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return AppText.pleaseEnterCity;
                    }
                    return null;
                  },
                  controller: controller.cityController,
                  hintText: AppText.cityAddress,
                ),
                SizedBox(
                  height: 10.h,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 3.w,
                    ),
                    InkWell(
                      onTap: () {
                        controller.rememberMe.value =
                            !controller.rememberMe.value;
                      },
                      child: Obx(
                        () => Container(
                          height: 26.h,
                          width: 26.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: controller.rememberMe.isFalse
                                ? AppColor.primaryColor
                                : AppColor.whiteColor,
                            border: Border.all(
                              color: controller.rememberMe.isFalse
                                  ? AppColor.primaryColor
                                  : AppColor.greyColor,
                              width: 1.0,
                            ),
                          ),
                          child: controller.rememberMe.isFalse
                              ? const Icon(
                                  Icons.check,
                                  color: Colors.white,
                                )
                              : null,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 8.w,
                    ),
                    Text(
                      AppText.rememberMe,
                      style: TextStyle(
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w400,
                          color: AppColor.greyColor),
                    )
                  ],
                ),
                SizedBox(
                  height: 26.h,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 4.w),
                  child: Obx(
                    () => CustomButton(
                        onTap: () {
                          FocusScope.of(context).unfocus();
                          if (controller.formKey.currentState!.validate()) {
                            Get.offAllNamed(AppRoutes.mainScreen);
                          }
                        },
                        labelColor: controller.validate.value
                            ? AppColor.whiteColor
                            : AppColor.blackColor.withOpacity(0.4),
                        buttonColor: controller.validate.value
                            ? AppColor.primaryColor
                            : AppColor.greyColor.withOpacity(0.2),
                        labelName: AppText.createAnAccount),
                  ),
                ),
                SizedBox(
                  height: 40.h,
                ),
                Text(
                  AppText.orCreateAccountWith,
                  style:
                      TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w400),
                ),
                SizedBox(
                  height: 12.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomSmallButton(onTap: () {}, image: AppImages.appleImg),
                    SizedBox(
                      width: 12.w,
                    ),
                    CustomSmallButton(
                        onTap: () {}, image: AppImages.facebookImg),
                    SizedBox(
                      width: 12.w,
                    ),
                    CustomSmallButton(onTap: () {}, image: AppImages.googleImg),
                  ],
                ),
                SizedBox(
                  height: 78.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      AppText.alreadyHaveAnAccount,
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 15.sp,
                          color: AppColor.blackColor),
                    ),
                    SizedBox(
                      width: 3.w,
                    ),
                    InkWell(
                      onTap: () {
                        Get.toNamed(AppRoutes.signInScreen);
                      },
                      child: Text(
                        AppText.signIn,
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 15.sp,
                            color: AppColor.primaryColor),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20.h,
                ),
                Divider(
                  color: AppColor.greyColor.withOpacity(0.5),
                  height: 3,
                  thickness: 1,
                ),
                SizedBox(
                  height: 12.h,
                ),
                Text(
                  AppText.termsAndCondition,
                  style: TextStyle(fontSize: 13.sp, color: AppColor.greyColor),
                ),
                SizedBox(
                  height: 3.h,
                )
              ],
            ),
          ),
        ),
      )),
    );
  }
}
