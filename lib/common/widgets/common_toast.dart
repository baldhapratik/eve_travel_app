import 'package:eve_travel_app/app_imports/app_imports.dart';

void customToast(String msg) {
  Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: AppColor.primaryColor,
      textColor: AppColor.whiteColor,
      fontSize: 15.sp);
}
