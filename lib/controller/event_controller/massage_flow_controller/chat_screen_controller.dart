import 'package:eve_travel_app/app_imports/app_imports.dart';

class ChatScreenController extends GetxController {
  TextEditingController searchController = TextEditingController();
  RxList<ChatModel> chatList = <ChatModel>[].obs;
  final ScrollController scrollController = ScrollController();

  @override
  void onInit() {
    chatList.add(ChatModel(
        isMe: true,
        massage:
            'Okay, ladies, lets get started on planning the bachelorette party in Miami. Any ideas on where we should start?'));
    chatList.add(ChatModel(
        isMe: false,
        sender: 'Mia Harrison',
        massage:
            'Well, I was thinking we could start by looking at some fun activities to do during the day. Maybe a boat tour or a beach day?'));
    chatList.add(ChatModel(
        isMe: false,
        sender: 'Wanesa Briks',
        massage:
            'I love that idea! And we could also look into some spa packages for the bride-to-be and the rest of us to relax and pamper ourselves.'));
    super.onInit();
  }
}
