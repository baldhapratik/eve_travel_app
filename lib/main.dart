import 'package:eve_travel_app/app_imports/app_imports.dart';

GetStorage getStorage = GetStorage();

Future<void> main() async {
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(390, 844),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return GetMaterialApp(
          theme: ThemeData(
            fontFamily: 'Saira',
            scaffoldBackgroundColor: AppColor.whiteColor,
          ),
          debugShowCheckedModeBanner: false,
          getPages: AppPages.pages,
          initialRoute: getStorage.read('isLogin') != null &&
                  getStorage.read('isLogin') == 'true'
              ? AppRoutes.mainScreen
              : AppRoutes.registerScreen,
        );
      },
    );
  }
}
