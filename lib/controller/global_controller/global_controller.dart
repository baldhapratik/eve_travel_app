import 'package:eve_travel_app/view/event_flow/create_event_screen_flow/create_event_screen.dart';
import 'package:eve_travel_app/view/event_flow/home_screen_flow/home_screen.dart';
import 'package:eve_travel_app/view/event_flow/massage_flow/massage_screen.dart';
import 'package:eve_travel_app/view/event_flow/profile_flow/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GlobalController extends GetxController {
  PageController pageController=PageController();
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
}
