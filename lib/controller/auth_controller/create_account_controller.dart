import 'package:eve_travel_app/app_imports/app_imports.dart';

class CreateAccountController extends GetxController {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  RxBool rememberMe = true.obs;
  final createAccountFormKey = GlobalKey<FormState>();
  RxBool validate = false.obs;
  RxBool showPassword = true.obs;

  String? nameValidation(String value) {
    if (value.isEmpty) {
      return AppText.pleaseEnterAnUserName;
    }
    return null;
  }

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

  String? cityValidation(String value) {
    if (value.isEmpty) {
      return AppText.pleaseEnterCity;
    }
    return null;
  }

  validateLoginField() {
    validate.value = emailValidation(emailController.value.text) == null &&
        nameValidation(nameController.value.text) == null &&
        cityValidation(cityController.value.text) == null &&
        passwordValidation(passwordController.value.text) == null;
  }

  signUpApiCall(BuildContext context) async {
    SignUpModel response = await networkRepository.userSignUp(context, {
      'name': nameController.text,
      'email': emailController.text.trim(),
      'password': passwordController.text,
      'city': cityController.text
    });
    if (response.status == 200) {
      Get.toNamed(AppRoutes.otpScreen,
          arguments: {'verify': false, 'email': emailController.text.trim()});
      getStorage.write('email', emailController.text.trim());
      getStorage.write('token', response.data.token ?? '');
      getStorage.write('id', response.data.response.id ?? '');
      NetworkDioHttp.setDynamicHeader(endPoint: Urls.baseUrl);

      emailController.clear();
      passwordController.clear();
      cityController.clear();
    }
  }
}
