import 'package:get/get.dart';

class FilterScreenController extends GetxController {
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
  RxList<String> selectedCategoryIndices = <String>[].obs;
  RxList<String> selectedMoodIndices = <String>[].obs;
  RxList<String> selectedBudgetIndices = <String>[].obs;
  RxBool switchValue=false.obs;
}
