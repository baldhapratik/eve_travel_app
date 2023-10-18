import 'package:get/get.dart';
import '../../../controller/event_controller/home_flow_controller/FilterScreenController.dart';

class FilterScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => FilterScreenController());
  }
}
