import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  TextEditingController searchController = TextEditingController();
  RxList filterList = [
    'Attending',
    'Maybe',
    'No',
  ].obs;
  RxInt selectIndex = 0.obs;
  RxString dropdownValue = 'First created'.obs;
}
