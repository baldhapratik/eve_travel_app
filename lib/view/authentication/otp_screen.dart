import 'package:eve_travel_app/app_imports/app_imports.dart';

class OtpScreen extends GetView<OtpController> {
  OtpScreen({
    super.key,
  });

  late Timer _timer;
  final RxInt _start = 30.obs;

  void _startTimer() {
    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(oneSec, (timer) {
      if (_start.value == 0) {
        _timer.cancel();
      } else {
        _start.value--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final arguments = Get.arguments as Map<String, dynamic>;
    bool? verify = arguments['verify'] ?? false;
    String? email = arguments['email'] ?? '';
    if (getStorage.read('email') != null) {
      email = getStorage.read('email');
    }
    _startTimer();

    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            Get.back();
          },
          child: const Icon(
            Icons.arrow_back,
            color: AppColor.blackColor,
            size: 20,
          ),
        ),
        elevation: 0,
        backgroundColor: AppColor.whiteColor,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 20.h,
                ),
                Text(
                  AppText.enterOtp,
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: AppColor.blackColor,
                      fontSize: 20.sp),
                ),
                SizedBox(
                  height: 5.h,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 3.w),
                  child: Text(
                    AppText.pleaseEnterDigitOTPSendToEmail,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontWeight: FontWeight.w400,
                        color: AppColor.greyColor,
                        fontSize: 15.sp),
                  ),
                ),
                Text(email ?? "",
                    style: TextStyle(
                        fontWeight: FontWeight.w400,
                        color: AppColor.greyColor,
                        fontSize: 15.sp)),
                SizedBox(
                  height: 32.h,
                ),
                Pinput(
                  onChanged: (value) {
                    if (controller.pinPutController.length == 4) {
                      controller.otpSubmit.value = true;
                    } else {
                      controller.otpSubmit.value = false;
                    }
                  },
                  onSubmitted: (value) {
                    controller.otpSubmit.value = true;
                  },
                  androidSmsAutofillMethod: AndroidSmsAutofillMethod.none,
                  controller: controller.pinPutController,
                ),
                SizedBox(
                  height: 15.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Obx(() => _start.value != 0
                        ? Text(
                            "Resend OTP in ${_start.value} s",
                            style: TextStyle(
                              color: AppColor.blackColor,
                              fontSize: 16.sp,
                            ),
                          )
                        : InkWell(
                            onTap: () async {
                              await controller.resendApiCall(
                                  context, email ?? '');
                              _start.value = 30;
                              _startTimer();
                              controller.pinPutController.clear();
                            },
                            child: Text(
                              'Resend OTP',
                              style: TextStyle(
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.w500,
                                  color: AppColor.primaryColor),
                            ),
                          )),
                  ],
                ),
                SizedBox(
                  height: 30.h,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4),
                  child: Obx(
                    () => CustomButton(
                      onTap: () async {
                        FocusScope.of(context).unfocus();
                        if (controller.otpSubmit.isTrue) {
                          OtpModel response = await networkRepository
                              .otpVerification(context, {
                            "email": email,
                            "otp": controller.pinPutController.text
                          });
                          if (response.status == 200 ||
                              response.status == 201) {
                            getStorage.write('isLogin', 'true');
                            // customToast(response.message);
                            customSnackBar(AppText.success, AppColor.greenColor,
                                response.message);

                            if (verify == true) {
                              Get.offAllNamed(AppRoutes.resetPasswordScreen,
                                  arguments: {'email': email});
                            } else {
                              Get.offAllNamed(AppRoutes.mainScreen);
                            }
                          }
                        }
                      },
                      labelColor: controller.otpSubmit.isTrue
                          ? AppColor.whiteColor
                          : AppColor.blackColor.withOpacity(0.4),
                      buttonColor: controller.otpSubmit.isTrue
                          ? AppColor.primaryColor
                          : AppColor.greyColor.withOpacity(0.2),
                      labelName: AppText.submit,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
