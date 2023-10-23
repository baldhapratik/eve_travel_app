import 'dart:async';
import 'dart:developer';

//
// import 'package:flutter/material.dart';
import 'package:eve_travel_app/app_imports/app_imports.dart';
import 'package:eve_travel_app/common/widgets/common_toast.dart';
import 'package:eve_travel_app/model/otp_model.dart';
import 'package:eve_travel_app/repository/network_repository.dart';

//
// class OtpScreen extends StatefulWidget {
//   const OtpScreen({Key? key}) : super(key: key);
//
//   @override
//   _OtpScreenState createState() => _OtpScreenState();
// }
//
// class _OtpScreenState extends State<OtpScreen> {
//   late Timer _timer;
//   int _start = 30;
//
//
//   void _startTimer() {
//     const oneSec = Duration(seconds: 1);
//     _timer = Timer.periodic(oneSec, (timer) {
//       if (_start == 0) {
//         setState(() {
//           _timer.cancel();
//         });
//       } else {
//         setState(() {
//           _start--;
//         });
//       }
//     });
//   }
//
//   @override
//   void dispose() {
//     _timer.cancel();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return ;
//   }
// }

class OtpScreen extends GetView<OtpController> {
  OtpScreen({super.key});

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
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 20.h,
                ),
                const Text(
                  AppText.enterOtp,
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: AppColor.blackColor,
                    fontSize: 20,
                  ),
                ),
                SizedBox(
                  height: 32.h,
                ),
                Pinput(
                  onChanged: (value) {
                    controller.pinPutController.length == 4
                        ? controller.otpSubmit.value = true
                        : controller.otpSubmit.value = false;

                    print(value);
                  },
                  onSubmitted: (value) {
                    controller.otpSubmit.value = true;
                  },
                  androidSmsAutofillMethod: AndroidSmsAutofillMethod.none,
                  controller: controller.pinPutController,
                ),
                SizedBox(
                  height: 10.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
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
                            onTap: () {
                              customToast('Send Otp Successfully');
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
                const SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4),
                  child: Obx(
                    () => CustomButton(
                      onTap: () async {
                        FocusScope.of(context).unfocus();
                        if (controller.otpSubmit.isTrue) {
                          String email = '';
                          if (getStorage.read('email') != null) {
                            email = getStorage.read('email');
                          }

                          OtpModel response = await networkRepository.reSendOTP(
                              context, {
                            "email": email,
                            "otp": controller.pinPutController.text
                          });
                          if (response.status == 200 ||
                              response.status == 201) {
                            getStorage.write('isLogin', 'true');
                            getStorage.write('token', response.data.id ?? '');
                            Get.offAllNamed(AppRoutes.mainScreen);
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
