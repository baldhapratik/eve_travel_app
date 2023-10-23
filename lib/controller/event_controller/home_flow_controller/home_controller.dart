import 'package:eve_travel_app/model/get_event_model.dart';
import 'package:eve_travel_app/repository/network_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  RxBool loading = false.obs;
  TextEditingController searchController = TextEditingController();
  RxList filterList = [
    'Attending',
    'Maybe',
    'No',
  ].obs;
  RxList<EventData> eventList = <EventData>[].obs;
  RxInt selectIndex = 0.obs;
  RxString dropdownValue = 'First created'.obs;

  getEventApiCall() async {
    try {
      loading.value = true;
      GetEventModel response = await networkRepository.getEvent({
        "date": null,
        "typeOfEvent": "",
        "dressCode": "",
        "price": "",
        "search": "",
        "startDate": "2023-10-16T00:00:00.000+00:00",
        "endDate": "2023-10-27T00:00:00.000+00:00"
      });
      loading.value = false;

      if (response.status == 200) {
        eventList.value = response.data;
      }
    } on Exception catch (e) {
      debugPrint(e.toString());
    }
  }

  @override
  void onInit() {
    // getEventApiCall();
    super.onInit();
  }
}
