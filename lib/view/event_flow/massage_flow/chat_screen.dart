import 'package:eve_travel_app/app_imports/app_imports.dart';

class ChatScreen extends GetView<ChatScreenController> {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: const Color(0xFFF4F4F4),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColor.primaryColor,
        leading: CustomBackButton(
          onTap: () {
            Get.back();
          },
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Bachelor party',
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15.dp),
            ),
            Text(
              '3 members',
              style: TextStyle(fontWeight: FontWeight.w400, fontSize: 10.dp),
            ),
          ],
        ),
        actions: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 2.5.h, horizontal: 3.w),
            child: Image(
              image: const AssetImage(AppImages.userAddImg),
              color: AppColor.whiteColor,
              fit: BoxFit.fill,
              width: 5.w,
            ),
          ),
          SizedBox(
            width: 1.w,
          ),
        ],
      ),
      body: Column(children: [
        SizedBox(
          height: 0.1.h,
        ),
        Container(
          height: 5.h,
          decoration: const BoxDecoration(color: AppColor.primaryColor),
          child: Row(
            children: [
              SizedBox(
                width: 4.w,
              ),
              Icon(Icons.location_on_outlined,
                  color: AppColor.whiteColor, size: 20.dp),
              SizedBox(
                width: 1.w,
              ),
              Text(
                'Rishtedar, Miami, FL',
                style: TextStyle(
                    color: AppColor.whiteColor,
                    fontSize: 15.dp,
                    fontWeight: FontWeight.w400),
              ),
              const Spacer(),
              Text(
                'Dinner /Drinks',
                style: TextStyle(
                    color: AppColor.whiteColor.withOpacity(0.8),
                    fontSize: 15.dp,
                    fontWeight: FontWeight.w400),
              ),
              SizedBox(
                width: 3.w,
              ),
            ],
          ),
        ),
        SizedBox(
          height: 1.h,
        ),
        Text(
          'Today',
          style: TextStyle(
              fontWeight: FontWeight.w400,
              color: AppColor.greyColor,
              fontSize: 15.dp),
        ),
        SizedBox(
          height: 1.h,
        ),
        Expanded(
          child: Obx(
            () => ListView.separated(
              reverse: false,
              controller: controller.scrollController,
              scrollDirection: Axis.vertical,
              itemBuilder: (context, index) {
                final chatMessage = controller.chatList[index];
                return Row(
                  mainAxisAlignment: chatMessage.isMe
                      ? MainAxisAlignment.end
                      : MainAxisAlignment.start,
                  children: [
                    if (!chatMessage.isMe) ...[
                      SizedBox(
                        width: 2.w,
                      ),
                      const CircleAvatar(
                        backgroundImage:
                            AssetImage('assets/images/Mask group-1.png'),
                      ),
                      SizedBox(width: 2.w),
                    ],
                    Container(
                      constraints: BoxConstraints(maxWidth: 80.w),
                      decoration: BoxDecoration(
                        color: chatMessage.isMe
                            ? AppColor.darkBlueColor
                            : AppColor.lightBlueColor,
                        borderRadius: chatMessage.isMe
                            ? const BorderRadius.only(
                                topLeft: Radius.circular(12.0),
                                bottomLeft: Radius.circular(12.0),
                                bottomRight: Radius.circular(12.0),
                              )
                            : const BorderRadius.only(
                                topRight: Radius.circular(12.0),
                                bottomLeft: Radius.circular(12.0),
                                bottomRight: Radius.circular(12.0),
                              ),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 3.w, vertical: 2.h),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            !chatMessage.isMe
                                ? Padding(
                                  padding: EdgeInsets.only(bottom: 0.5.h),
                                  child: Text(
                                      chatMessage.sender ?? '',
                                      style: TextStyle(
                                        fontSize: 13.dp,
                                        fontWeight: FontWeight.w600,
                                        color: AppColor.blueColor,
                                      ),
                                    ),
                                )
                                : const SizedBox(),
                            Text(
                              chatMessage.massage,
                              style: TextStyle(
                                fontSize: 13.dp,
                                fontWeight: FontWeight.w400,
                                color: chatMessage.isMe
                                    ? AppColor.whiteColor
                                    : AppColor.blackColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    if (chatMessage.isMe) ...[
                      SizedBox(width: 2.w),
                      const CircleAvatar(
                        backgroundImage:
                            AssetImage('assets/images/Mask group.png'),
                      ),
                      SizedBox(
                        width: 2.w,
                      ),
                    ],
                  ],
                );
              },
              separatorBuilder: (context, index) => SizedBox(height: 2.h),
              itemCount: controller.chatList.length,
            ),
          ),
        ),
        SizedBox(
          height: 10.h,
          child: Column(children: [
            Divider(
              height: 1.h,
              thickness: 1,
              color: AppColor.greyColor.withOpacity(0.2),
            ),
            Expanded(
              child: Center(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 4.w),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: controller.searchController,
                          decoration: InputDecoration(
                            fillColor: AppColor.whiteColor,
                            filled: true,
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 20, vertical: 0.5.h),
                            hintText: 'And what about the nightlife? Any ideas',
                            hintStyle: TextStyle(
                                fontSize: 13.dp, color: AppColor.blackColor),
                            border: const OutlineInputBorder(
                                borderSide: BorderSide.none),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 2.w,
                      ),
                      InkWell(
                        onTap: () {
                          controller.scrollController.animateTo(
                            controller
                                .scrollController.position.maxScrollExtent,
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeOut,
                          );
                          FocusScope.of(context).unfocus();
                          controller.chatList.add(ChatModel(
                              isMe: true,
                              massage: controller.searchController.text));
                          controller.searchController.clear();
                        },
                        onDoubleTap: () {
                          controller.scrollController.animateTo(
                            controller
                                .scrollController.position.maxScrollExtent,
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeOut,
                          );
                          FocusScope.of(context).unfocus();
                          controller.chatList.add(ChatModel(
                              sender: 'Wanesa Briks ',
                              isMe: false,
                              massage: controller.searchController.text));
                          controller.searchController.clear();
                        },
                        child: Image(
                          image: const AssetImage(AppImages.sendImg),
                          height: 3.h,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            )
          ]),
        )
      ]),
    );
  }
}
