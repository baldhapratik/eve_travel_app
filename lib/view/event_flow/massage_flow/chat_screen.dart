import 'package:eve_travel_app/app_imports/app_imports.dart';

class ChatScreen extends GetView<MassageController> {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F4F4),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColor.primaryColor,
        leading: CustomBackButton(color: AppColor.whiteColor,
          onTap: () {
            Get.back();
          },
        ),
        title: Row(
          children: [
            CircleAvatar(
              maxRadius: 20.sp,
              child: const Image(
                  image: AssetImage('assets/images/Mask group.png')),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Bachelor party',
                    style:
                        TextStyle(fontWeight: FontWeight.w600, fontSize: 15.sp),
                  ),
                  Text(
                    '3 members',
                    style:
                        TextStyle(fontWeight: FontWeight.w400, fontSize: 10.sp),
                  ),
                ],
              ),
            ),
          ],
        ),
        actions: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 3.w),
            child: Image(
              image: const AssetImage(AppImages.userAddImg),
              color: AppColor.whiteColor,
              fit: BoxFit.fill,
              width: 20.w,
              height: 20.h,
            ),
          ),
          SizedBox(
            width: 15.w,
          ),
        ],
      ),
      body: Column(children: [
        SizedBox(
          height: 1.h,
        ),
        Container(
          height: 34.h,
          decoration: const BoxDecoration(color: AppColor.primaryColor),
          child: Row(
            children: [
              SizedBox(
                width: 15.w,
              ),
              Icon(Icons.location_on_outlined,
                  color: AppColor.whiteColor, size: 20.sp),
              SizedBox(
                width: 4.w,
              ),
              Text(
                'Rishtedar, Miami, FL',
                style: TextStyle(
                    color: AppColor.whiteColor,
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w400),
              ),
              const Spacer(),
              Text(
                'Dinner /Drinks',
                style: TextStyle(
                    color: AppColor.whiteColor.withOpacity(0.8),
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w400),
              ),
              SizedBox(
                width: 15.w,
              ),
            ],
          ),
        ),
        SizedBox(
          height: 12.h,
        ),
        Text(
          'Today',
          style: TextStyle(
              fontWeight: FontWeight.w400,
              color: AppColor.greyColor,
              fontSize: 15.sp),
        ),
        SizedBox(
          height: 20.h,
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
                        width: 15.w,
                      ),
                      CircleAvatar(
                        maxRadius: 20.sp,
                        backgroundImage:
                            const AssetImage('assets/images/Mask group-1.png'),
                      ),
                      SizedBox(width: 10.w),
                    ],
                    Column(
                      crossAxisAlignment: chatMessage.isMe
                          ? CrossAxisAlignment.end
                          : CrossAxisAlignment.start,
                      mainAxisAlignment: chatMessage.isMe
                          ? MainAxisAlignment.end
                          : MainAxisAlignment.start,
                      children: [
                        Container(
                          constraints: BoxConstraints(maxWidth: 310.w),
                          decoration: BoxDecoration(
                            color: chatMessage.isMe
                                ? AppColor.darkBlueColor
                                : AppColor.lightBlueColor,
                            borderRadius: chatMessage.isMe
                                ? const BorderRadius.only(
                                    topLeft: Radius.circular(12.0),
                                    bottomLeft: Radius.circular(12.0),
                                    // bottomRight: Radius.circular(12.0),
                                    topRight: Radius.circular(12.0),
                                  )
                                : const BorderRadius.only(
                                    topRight: Radius.circular(12.0),
                                    // bottomLeft: Radius.circular(12.0),
                                    bottomRight: Radius.circular(12.0),
                                    topLeft: Radius.circular(12.0)),
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 15.w, vertical: 15.h),
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
                                            fontSize: 13.sp,
                                            fontWeight: FontWeight.w600,
                                            color: AppColor.blueColor,
                                          ),
                                        ),
                                      )
                                    : const SizedBox(),
                                Text(
                                  chatMessage.massage,
                                  style: TextStyle(
                                    fontSize: 15.sp,
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
                        Text(
                          '13:10 am',
                          style: TextStyle(
                            fontSize: 13.sp,
                            fontWeight: FontWeight.w400,
                            color: AppColor.greyColor,
                          ),
                        ),
                      ],
                    ),
                    if (chatMessage.isMe) ...[
                      SizedBox(width: 10.w),
                      const CircleAvatar(
                        backgroundImage:
                            AssetImage('assets/images/Mask group.png'),
                      ),
                      SizedBox(
                        width: 15.w,
                      ),
                    ],
                  ],
                );
              },
              separatorBuilder: (context, index) => SizedBox(height: 12.h),
              itemCount: controller.chatList.length,
            ),
          ),
        ),
        SizedBox(
          height: 94.h,
          child: Column(children: [
            Divider(
              height: 1.h,
              thickness: 1,
              color: AppColor.greyColor.withOpacity(0.2),
            ),
            Expanded(
              child: Center(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15.w),
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
                                fontSize: 13.sp, color: AppColor.blackColor),
                            border: const OutlineInputBorder(
                                borderSide: BorderSide.none),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10.w,
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
                          fit: BoxFit.fill,
                          height: 24.h,
                          width: 24.w,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            )
          ]),
        ),
      ]),
    );
  }
}
