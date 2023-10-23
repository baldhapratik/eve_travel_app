import 'package:eve_travel_app/main.dart';
import 'package:eve_travel_app/model/sign_up_model.dart';
import 'package:eve_travel_app/repository/network_repository.dart';
import 'package:eve_travel_app/routes/app_routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../../utils/app_string.dart';

class CreateAccountController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  RxBool rememberMe = true.obs;
  final formKey = GlobalKey<FormState>();
  RxBool validate = false.obs;
  RxBool showPassword = false.obs;

  String? emailValidation(String value) {
    if (value == null || value.isEmpty) {
      return AppText.pleaseEnterAnEmailAddress;
    }
    final emailRegExp = RegExp(r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$');
    if (!emailRegExp.hasMatch(value)) {
      return AppText.pleaseEnterAValidEmailAddress;
    }
    return null;
  }

  String? passwordValidation(String value) {
    if (value == null || value.isEmpty) {
      return AppText.pleaseEnterAPassword;
    }
    return null;
  }

  String? cityValidation(String value) {
    if (value == null || value.isEmpty) {
      return AppText.pleaseEnterCity;
    }
    return null;
  }

  validateLoginField() {
    validate.value = emailValidation(emailController.value.text) == null &&
        cityValidation(cityController.value.text) == null &&
        passwordValidation(passwordController.value.text) == null;
  }

  signUpApiCall(BuildContext context) async {
    SignUpModel response = await networkRepository.userSignUp(context, {
      'email': emailController.text.trim(),
      'password': passwordController.text.trim(),
      'city': cityController.text
    });
    if (response.status == 200) {
      Get.toNamed(AppRoutes.otpScreen);
      getStorage.write('email', emailController.text.trim());
      // getStorage.write('token', response.data!.token??'');
    }
  }
}
