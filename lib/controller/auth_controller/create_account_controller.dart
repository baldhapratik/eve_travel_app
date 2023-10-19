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
}
