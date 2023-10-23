import 'package:eve_travel_app/app_imports/app_imports.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    if (getStorage.read('isLogin') != null) {
      if (getStorage.read('isLogin') == 'true') {
        Get.toNamed(AppRoutes.mainScreen);
      }
    } else {
      Get.toNamed(AppRoutes.registerScreen);
    }
    return const Scaffold();
  }
}
