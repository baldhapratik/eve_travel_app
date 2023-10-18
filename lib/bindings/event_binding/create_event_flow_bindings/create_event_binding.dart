import 'package:eve_travel_app/controller/event_controller/create_event_flow_controller/create_event_controller.dart';
import 'package:get/get.dart';

class CreateEventBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CreateEventController());
  }
}
