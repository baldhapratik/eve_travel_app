import 'package:eve_travel_app/app_imports/app_imports.dart';

class ForgetPasswordScreen extends GetView<ForgetPasswordController> {
  const ForgetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: CustomBackButton(
            color: AppColor.blackColor,
            onTap: () {
              Get.back();
            },),
          elevation: 0,
          backgroundColor: AppColor.whiteColor,
        ),
        body: SafeArea(
            child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.w),
                child: SingleChildScrollView(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 20.h,
                        ),
                        Text(
                          AppText.forgetPassword,
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              color: AppColor.blackColor,
                              fontSize: 20.sp),
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        Text(
                          AppText.enterYourEvent,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              color: AppColor.greyColor,
                              fontSize: 15.sp),
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
                            final emailRegExp = RegExp(
                                r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$');
                            if (!emailRegExp.hasMatch(value)) {
                              return AppText.pleaseEnterAValidEmailAddress;
                            }
                            return null;
                          },
                          controller: controller.emailController,
                          hintText: AppText.emailAddress,
                        ),
                        SizedBox(
                          height: 30.h,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 4.w),
                          child: Obx(
                                () =>
                                CustomButton(
                                    onTap: () {
                                      FocusScope.of(context).unfocus();
                                      if (controller.validate.isTrue) {
                                        controller.forgetApiCall(context);
                                      }
                                    },
                                    labelColor: controller.validate.value
                                        ? AppColor.whiteColor
                                        : AppColor.blackColor.withOpacity(0.4),
                                    buttonColor: controller.validate.value
                                        ? AppColor.primaryColor
                                        : AppColor.greyColor.withOpacity(0.2),
                                    labelName: AppText.submit),
                          ),
                        ),
                      ]),
                ))));
  }
}
