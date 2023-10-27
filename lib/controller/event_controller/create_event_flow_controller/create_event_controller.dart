import 'dart:developer';
import 'dart:io';
import 'package:eve_travel_app/app_imports/app_imports.dart';
import 'package:eve_travel_app/model/add_event_model.dart';
import 'package:eve_travel_app/model/image_upload_model.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter_google_places_sdk/flutter_google_places_sdk.dart';
import 'package:intl/intl.dart';

class CreateEventController extends GetxController {
  TextEditingController title = TextEditingController();
  TextEditingController description = TextEditingController();
  TextEditingController searchController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController noteController = TextEditingController();
  RxBool switchValue = false.obs;
  RxBool addValue = false.obs;
  RxBool friendSwitchValue = false.obs;
  RxBool imageUpload = false.obs;
  RxInt selectIndex = 0.obs;
  Rx<FilePickerResult>? filePicker;
  Rx<File?> file = Rx<File?>(null);
  RxBool loading = false.obs;
  RxString fromDate = ''.obs;
  RxString toDate = ''.obs;
  RxBool fromDateValue = false.obs;
  RxBool toDateValue = false.obs;
  RxList<AutocompletePrediction> predictions = <AutocompletePrediction>[].obs;
  RxBool showLocation = false.obs;

  String formatDate(DateTime dateTime) {
    final DateFormat formatter = DateFormat('E, d MMM');
    final String formatted = formatter.format(dateTime);
    return formatted;
  }

  void autoCompleteSearch(String value) async {
    final places =
        FlutterGooglePlacesSdk('AIzaSyDqkQWkdq5_6Dbkuxb474K3gUpaGRBruYM');
    final result = await places.findAutocompletePredictions(
      value,
    );
    predictions.value = result.predictions;
  }

  final RxList<String> categories = <String>[
    'Dinner /Drinks',
    'Concert',
    'Party',
    'Festival',
    'Conference',
    'Seminar',
    'Expo',
    'Masterclass',
    'Workshop',
  ].obs;
  RxString selectedEvent = 'Dinner /Drinks'.obs;

  final RxList<String> dressCode = [
    'Casual',
    'Business Casual',
    'Semi-Formal',
    'Formal / Black Tie',
  ].obs;
  RxString selectedDress = 'Casual'.obs;

  // Future<void> selectFromDate(BuildContext context) async {
  //   final DateTime? picked = await showDatePicker(
  //       context: context,
  //       initialDate: fromDate?.value ?? DateTime.now(),
  //       firstDate: DateTime(2015, 8),
  //       lastDate: DateTime(2101));
  //   if (picked != null) {
  //     if (fromDate == null) {
  //       fromDate = picked.obs;
  //     } else {
  //       fromDateValue.value = true;
  //       fromDate!.value = picked;
  //     }
  //   }
  // }

  // Future<void> selectToDate(BuildContext context) async {
  //   final DateTime? picked = await showDatePicker(
  //       context: context,
  //       initialDate: toDate?.value ?? DateTime.now(),
  //       firstDate: fromDate?.value ?? DateTime.now(),
  //       lastDate: DateTime(2101));
  //   if (picked != null) {
  //     if (toDate == null) {
  //       toDate = picked.obs;
  //     } else {
  //       toDateValue.value = true;
  //       toDate!.value = picked;
  //     }
  //   }
  // }

  pickImage() async {
    var result = await FilePicker.platform.pickFiles();
    if (result != null) {
      imageUpload.value = true;
      file.value = File(result.files.single.path!);
      debugPrint(file.value!.path);
    }
  }

  addEventApiCall(BuildContext context) async {
    if (title.text.isEmpty) {
      customSnackBar('Error', AppColor.redColor, 'Please enter title');
    } else if (description.text.isEmpty) {
      customSnackBar('Error', AppColor.redColor, 'Please enter description');
    } else if (noteController.text.isEmpty) {
      customSnackBar('Error', AppColor.redColor, 'Please enter note');
    } else if (file.value == null) {
      customSnackBar('Error', AppColor.redColor, 'Please select image');
    } else if (!switchValue.value && fromDate.isEmpty) {
      customSnackBar('Error', AppColor.redColor, 'Please select date');
    } else {
      loading.value = true;
      try {
        final DateTime t = DateTime.now();
        ImageUploadModel? imageUploadModel =
            await networkRepository.uploadImage(path: file.value!.path);
        if (imageUploadModel != null) {
          EventModel response = await networkRepository.addEvent(data: {
            "image": imageUploadModel.publicUrl,
            "title": title.text,
            "description": description.text,
            "isAllDay": switchValue.value,
            "startDate": switchValue.isFalse
                ? fromDate.value
                : DateTime(t.year, t.month, t.day).toString(),
            "endDate": switchValue.isFalse
                ? toDate.value
                : DateTime(t.year, t.month, t.day)
                    .add(const Duration(days: 1, milliseconds: -1))
                    .toString(),
            "latitude": 22.32222,
            "longitude": -60.515151,
            "address": searchController.text,
            "typeOfEvent": selectedEvent.value,
            if (addValue.isTrue) "cost": priceController.text,
            "dressCode": selectedDress.value,
            "participant": [
              "652f5c6faa2f86e4d7b4b612",
              "652f5c80aa2f86e4d7b4b615"
            ],
            "isFriendInvite": friendSwitchValue.value,
            "notes": noteController.text,
          });
          if (response.status == 200) {
            loading.value = false;

            customSnackBar('Success', AppColor.greenColor, response.message);
            networkRepository.addRoom(data: {'eventId': response.data.id});
            title.clear();
            description.clear();
            switchValue.value = false;
            selectedEvent.value = 'Dinner /Drinks';
            selectedDress.value = 'Casual';
            fromDate.value = '';
            toDate.value = '';
            fromDate.value = '';
            friendSwitchValue.value = false;
            noteController.clear();
            file.value = null;
            priceController.clear();
            fromDate.value = '';
            toDate.value = '';
            // customToast(response.message);
          } else {
            loading.value = false;
          }
        } else {
          loading.value = false;
          customSnackBar(
              'Error', AppColor.redColor, 'Please Enter Required Data');
        }
      } on Exception catch (e) {
        loading.value = false;
      }
    }
  }

// getEventParticipate() async {
//   GlobalController globalController = Get.find();
//   GetParticipateModel getParticipateModel = await networkRepository
//       .getEventParticipate(data: {"id": globalController.id.value});
// }
}
