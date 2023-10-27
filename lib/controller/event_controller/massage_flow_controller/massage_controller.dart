import 'dart:developer';

import 'package:eve_travel_app/app_imports/app_imports.dart';
import 'package:eve_travel_app/model/get_room_model.dart';

class MassageController extends GetxController {
  TextEditingController searchController = TextEditingController();
  RxList<ChatModel> chatList = <ChatModel>[].obs;
  final ScrollController scrollController = ScrollController();
  RxList<RoomData> chatUser = <RoomData>[].obs;
  RxBool loading = false.obs;

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
    getRoom();
    super.onInit();
  }

  getRoom() async {
    loading.value=true;
    GetRoomModel getRoomModel = await networkRepository.getRoom(data: {});
    loading.value=false;
    chatUser.value = getRoomModel.data;
  }
}
