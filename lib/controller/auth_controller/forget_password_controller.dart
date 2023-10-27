import 'package:eve_travel_app/app_imports/app_imports.dart';

class ForgetPasswordController extends GetxController {
  TextEditingController emailController = TextEditingController();
  RxBool validate = false.obs;

  String? emailValidation(String value) {
    if (value.isEmpty) {
      return AppText.pleaseEnterAnEmailAddress;
    }
    final emailRegExp = RegExp(r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$');
    if (!emailRegExp.hasMatch(value)) {
      return AppText.pleaseEnterAValidEmailAddress;
    }
    return null;
  }

  validateLoginField() {
    validate.value = emailValidation(emailController.value.text) == null;
  }

  forgetApiCall(BuildContext context) async {
    ForgetPasswordModel response =
        await networkRepository.forgetPassword(context, {
      'email': emailController.text.trim(),
    });
    if (response.status == 200) {
      getStorage.write('email', emailController.text.trim());
      // getStorage.write('token', response.data!.token ?? '');
      Get.toNamed(AppRoutes.otpScreen,
          arguments: {'email': emailController.text.trim(), 'verify': true});
    }
  }
}
