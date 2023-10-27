import 'package:eve_travel_app/app_imports/app_imports.dart';
import 'package:eve_travel_app/model/get_profile_event_model.dart';
import 'package:eve_travel_app/model/profile_model.dart';

class ProfileController extends GetxController {
  RxInt selectIndex = 0.obs;
  final TextEditingController searchController = TextEditingController();
  RxString dropdownValue = 'First created'.obs;
  RxBool loading = false.obs;
  RxBool listLoading = false.obs;
  ProfileModel? profileModel;
  RxList<ProfileData> profileData = <ProfileData>[].obs;
  List<ProfileEventData> profileEventData = <ProfileEventData>[];
  List<ProfileEventData> profileEventHistoryData = <ProfileEventData>[];

  getProfileApiCall() async {
    try {
      loading.value = true;
      ProfileModel response = await networkRepository.getProfileData();
      loading.value = false;

      if (response.status == 200) {
        profileData.value = response.data!;
        // eventList.value = response.data;
      }
    } on Exception catch (e) {
      loading.value = false;
      debugPrint(e.toString());
    }
  }

  getEventApiCall() async {
    GlobalController globalController = Get.find();
    try {
      listLoading.value = true;
      GetProfileEventModel response = await networkRepository.getUserEvent(
          token: globalController.token.value);
      listLoading.value = false;

      if (response.status == 200) {
        profileEventData = response.data;
        // eventList.value = response.data;
      }
    } on Exception catch (e) {
      listLoading.value = false;
      debugPrint(e.toString());
    }
  }

  profileEventHistoryApiCall() async {
    GlobalController globalController = Get.find();
    try {
      listLoading.value = true;
      GetProfileEventModel response = await networkRepository
          .getUserEventHistory(token: globalController.token.value);
      listLoading.value = false;

      if (response.status == 200) {
        profileEventHistoryData = response.data;
        // eventList.value = response.data;
      }
    } on Exception catch (e) {
      listLoading.value = false;
      debugPrint(e.toString());
    }
  }
getBothApi(){
  getEventApiCall();
  profileEventHistoryApiCall();
}
  @override
  void onInit() {
    getProfileApiCall();
    getEventApiCall();
    profileEventHistoryApiCall();
    super.onInit();
  }
}
