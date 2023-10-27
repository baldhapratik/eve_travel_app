import 'dart:developer';

import 'package:eve_travel_app/app_imports/app_imports.dart';

class GlobalController extends GetxController {
  PageController pageController = PageController();
  RxString token = ''.obs;
  RxString id = ''.obs;
  final List screens = [
    const HomeScreen(),
    const CreateEventScreen(),
    const MassageScreen(),
    const ProfileScreen(),
  ];
  RxInt selectedIndex = 0.obs;
  RxList bottomIcons = [
    'assets/images/home.png',
    'assets/images/create.png',
    'assets/images/massage.png',
    'assets/images/profile.png',
  ].obs;

  @override
  void onInit() {
    if (getStorage.read('token') != null) {
      token.value = getStorage.read('token');
    }
    if (getStorage.read('id') != null) {
      token.value = getStorage.read('id');
    }
    super.onInit();
  }
}
