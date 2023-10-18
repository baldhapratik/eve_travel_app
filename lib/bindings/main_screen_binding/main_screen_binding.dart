import 'package:eve_travel_app/controller/global_controller/global_controller.dart';
import 'package:get/get.dart';

class MainScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(GlobalController());
  }
}
