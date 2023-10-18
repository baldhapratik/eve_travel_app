import 'package:eve_travel_app/controller/event_controller/massage_flow_controller/massage_controller.dart';
import 'package:get/get.dart';

class MassageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MassageController());
  }
}
