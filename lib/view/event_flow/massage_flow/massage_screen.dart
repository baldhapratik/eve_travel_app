import 'package:eve_travel_app/app_imports/app_imports.dart';

class MassageScreen extends GetView<MassageController> {
  const MassageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(MassageController());

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          AppText.chats,
          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20.sp),
        ),
        actions: [
          Icon(Icons.search, size: 25.sp),
          SizedBox(
            width: 18.w,
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
        child: Obx(
          () => controller.loading.isFalse
              ? controller.chatUser.isNotEmpty
                  ? ScrollConfiguration(
                      behavior: CustomScrollBehaviorWithoutGlow(),
                      child: RefreshIndicator(
                        onRefresh: () => controller.getRoom(),
                        child: ListView.separated(
                            padding: EdgeInsets.symmetric(vertical: 1.h),
                            itemBuilder: (context, index) {
                              return InkWell(
                                onTap: () {
                                  Get.toNamed(AppRoutes.chatScreen);
                                },
                                child: Container(
                                  height: 76.h,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color:
                                          AppColor.greyColor.withOpacity(0.2)),
                                  child: Center(
                                    child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Container(
                                            height: 45.h,
                                            width: 45.w,
                                            decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                image: DecorationImage(
                                                    image: NetworkImage(controller
                                                            .chatUser[index]
                                                            .eventData!
                                                            .isNotEmpty
                                                        ? controller
                                                            .chatUser[index]
                                                            .eventData![0]
                                                            .image
                                                        : 'https://media.istockphoto.com/id/546763388/photo/the-perfect-vantage-point.jpg?s=170667a&w=0&k=20&c=KcEe8bcUUAheYpdzIJ52Tk2N4ZY3OAtFRBjFCqI7Aq8='),
                                                    fit: BoxFit.fill)),
                                          ),
                                          SizedBox(
                                            width: 200.w,
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text(
                                                    controller
                                                            .chatUser[index]
                                                            .eventData![0]
                                                            .title ??
                                                        '',
                                                    maxLines: 1,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        fontSize: 15.sp)),
                                                SizedBox(
                                                  height: 0.5.h,
                                                ),
                                                Text(
                                                    controller
                                                            .chatUser[index]
                                                            .eventData![0]
                                                            .address ??
                                                        '',
                                                    maxLines: 1,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        fontSize: 12.sp)),
                                              ],
                                            ),
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.end,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              Text('09:11 AM',
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      fontSize: 12.sp)),
                                              index == 0 ||
                                                      index == 2 ||
                                                      index == 1
                                                  ? CircleAvatar(
                                                      maxRadius: 13.sp,
                                                      backgroundColor:
                                                          AppColor.blueColor,
                                                      child: Center(
                                                          child: Text('2',
                                                              style: TextStyle(
                                                                  fontSize:
                                                                      13.sp,
                                                                  color: AppColor
                                                                      .whiteColor,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500))),
                                                    )
                                                  : SizedBox(
                                                      height: 15.h,
                                                    )
                                            ],
                                          ),
                                        ]),
                                  ),
                                ),
                              );
                            },
                            separatorBuilder: (context, index) {
                              return SizedBox(
                                height: 8.h,
                              );
                            },
                            itemCount: controller.chatUser.length),
                      ),
                    )
                  : Center(
                      child: Text(
                        AppText.noChatsFound,
                        style: TextStyle(
                            fontSize: 15.sp,
                            color: AppColor.blackColor,
                            fontWeight: FontWeight.w600),
                      ),
                    )
              : const Center(child: CustomLoadingAnimation()),
        ),
      ),
    );
  }
}
