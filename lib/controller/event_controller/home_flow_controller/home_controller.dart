import 'package:eve_travel_app/app_imports/app_imports.dart';
import 'package:eve_travel_app/model/get_event_model.dart';

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
  RxString startDate = ''.obs;
  RxString endDate = ''.obs;
  RxList<String> selectedCategoryIndices = <String>[].obs;
  RxList<String> selectedMoodIndices = <String>[].obs;
  RxList<String> selectedBudgetIndices = <String>[].obs;
  RxBool switchValue = false.obs;

  getEventApiCall() async {
    try {
      loading.value = true;
      GetEventModel response = await networkRepository.getEvent(
        eventData: {
          "date": null,
          "typeOfEvent": selectedCategoryIndices,
          "dressCode": selectedMoodIndices,
          "price": switchValue.isTrue ? "Free" : "",
          "search": "",
          "startDate": startDate.value,
          "endDate": endDate.value
        },
      );
      loading.value = false;

      if (response.status == 200) {
        eventList.value = response.data;
      }
    } on Exception catch (e) {
      loading.value = false;
      debugPrint(e.toString());
    }
  }

  @override
  void onInit() {
    getEventApiCall();
    super.onInit();
  }

  final List<String> categories = [
    'Dinner /Drinks',
    'Concert',
    'Party',
    'Festival',
    'Conference',
    'Seminar',
    'Expo',
    'Masterclass',
    'Workshop',
  ];

  final List<String> mood = [
    'Casual',
    'Business Casual',
    'Semi-Formal',
    'Formal / Black Tie',
  ];

  final List<String> budget = [
    'Anytime',
    'Today',
    'Tomorrow',
    'This Week',
    'This Weekend',
  ];

  Future<void> refreshData() async {
    getEventApiCall();
  }
}
