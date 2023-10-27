import 'dart:developer';

import 'package:eve_travel_app/app_imports/app_imports.dart';

class LoginController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  RxBool rememberMe = true.obs;
  RxBool validate = false.obs;
  RxBool showPassword = true.obs;
  final loginFormKey = GlobalKey<FormState>();

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

  String? passwordValidation(String value) {
    if (value.isEmpty) {
      return AppText.pleaseEnterAPassword;
    }
    return null;
  }

  validateLoginField() {
    validate.value = emailValidation(emailController.value.text) == null &&
        passwordValidation(passwordController.value.text) == null;
  }

  loginApiCall(BuildContext context) async {
    LoginModel response = await networkRepository.userLogin(context, {
      'email': emailController.text.trim(),
      'password': passwordController.text.trim(),
    });
    if (response.status == 200) {
      getStorage.write('isLogin', 'true');
      getStorage.write('token', response.data!.token ?? '');
      getStorage.write('id', response.data!.response!.sId ?? '');
      NetworkDioHttp.setDynamicHeader(endPoint: Urls.baseUrl);
      customSnackBar(AppText.success, AppColor.greenColor,
          response.message??'Login Success');
      Get.offNamed(AppRoutes.mainScreen);
    }
  }
}