import 'package:eve_travel_app/app_imports/app_imports.dart';

class CreateEventController extends GetxController {
  TextEditingController title = TextEditingController();
  TextEditingController description = TextEditingController();
  TextEditingController searchController = TextEditingController();
  RxBool switchValue=false.obs;
  RxBool friendSwitchValue=false.obs;
  RxInt selectIndex=0.obs;
}
