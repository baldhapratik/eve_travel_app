import 'dart:convert';
import 'dart:developer';
import 'package:eve_travel_app/app_imports/app_imports.dart';
import 'package:eve_travel_app/model/login_model.dart';
// import 'package:http/http.dart' as http;

class HttpHelper {
  // getUserApi() async {
  //   var request = http.MultipartRequest(
  //     'GET',
  //     Uri.parse('${Urls().baseUrl}${Urls().users}?page=$page'),
  //   );
  //   var response = await http.Response.fromStream(await request.send());
  //
  //   if (response.statusCode == 200) {
  //     return GetUserModel.fromJson(jsonDecode(response.body));
  //   } else {
  //     debugPrint(response.statusCode.toString());
  //   }
  // }

  // Future<LoginModel?> signUp(
  //     {required String email, required String password}) async {
  //   var request = http.post(Uri.parse('http://192.168.29.22:6000/user/login'),
  //       body: {"email": 'test@mailinator.com', "password": 'Test@321'});
  //   request.headers['Content-Type'] = 'application/json';
  //   request.fields
  //       .addAll({"email": 'test@mailinator.com', "password": 'Test@321'});
  //   var response = await http.Response.fromStream(await request.send());
  //   debugger();
  //   if (response.statusCode == 200 || response.statusCode == 201) {
  //     return LoginModel.fromJson(jsonDecode(response.body));
  //   } else {
  //     return null;
  //   }
  // }
}
