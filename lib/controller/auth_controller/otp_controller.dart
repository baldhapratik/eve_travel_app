import 'package:eve_travel_app/app_imports/app_imports.dart';

class OtpController extends GetxController {
  final TextEditingController pinPutController = TextEditingController();
  final RxBool otpSubmit = false.obs;

  resendApiCall(BuildContext context, String email) async {
    OtpModel response = await networkRepository.resendOtp(context, {
      'email': email,
    });
    if (response.status == 200) {
      // customToast(response.message);
      customSnackBar(AppText.success, AppColor.greenColor,
          response.message);
      // Get.offNamed(AppRoutes.mainScreen);
    }
  }
}
