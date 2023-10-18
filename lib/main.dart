import 'package:eve_travel_app/routes/app_pages.dart';
import 'package:eve_travel_app/routes/app_routes.dart';
import 'package:eve_travel_app/utils/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:get/get.dart';

void main() {
  return runApp(FlutterSizer(
    builder: (p0, p1, p2) {
      return GetMaterialApp(
        theme: ThemeData(
          fontFamily: 'Saira',
          scaffoldBackgroundColor: AppColor.whiteColor,
        ),
        debugShowCheckedModeBanner: false,
        getPages: AppPages.pages,
        initialRoute: AppRoutes.registerScreen,
      );
    },
  ));
}
