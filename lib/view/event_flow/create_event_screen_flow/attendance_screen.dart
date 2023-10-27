import 'package:eve_travel_app/app_imports/app_imports.dart';
import 'package:eve_travel_app/common/widgets/common_cupertino_bottom_sheet.dart';

class AttendanceScreen extends GetView<CreateEventController> {
  const AttendanceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    controller.selectIndex.value = 0;
    return Scaffold(
      appBar: AppBar(
          backgroundColor: AppColor.primaryColor,
          leading: CustomBackButton(
            color: AppColor.whiteColor,
            onTap: () {
              Get.back();
            },
          ),
          centerTitle: true,
          actions: [
            InkWell(
              onTap: () {
                showCupertinoModalBottomSheet(context);
              },
              child: SizedBox(
                  width: 20.w,
                  height: 20.h,
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 13.h),
                    child: const Image(image: AssetImage(AppImages.sortImg)),
                  )),
            ),
            SizedBox(
              width: 10.w,
            )
          ],
          title: const Text('Attendance')),
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.w),
        child: Column(children: [
          SizedBox(
            height: 15.h,
          ),
          CustomRoundShapeTextField(
              leadingIcon: Icon(Icons.search, size: 20.sp),
              controller: controller.searchController,
              hintText: AppText.search),
          SizedBox(
            height: 25.h,
          ),
          Obx(
            () => Container(
              height: 40.h,
              decoration: BoxDecoration(
                  color: AppColor.greyColor.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(20)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  InkWell(
                    onTap: () => _onTabTapped(0),
                    child: Container(
                      width: 176.w,
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          color: controller.selectIndex.value == 0
                              ? AppColor.darkBlueColor
                              : Colors.transparent,
                          borderRadius: BorderRadius.circular(20)),
                      child: Center(
                        child: Text(
                          'Going (20)',
                          style: TextStyle(
                            color: controller.selectIndex.value == 0
                                ? AppColor.whiteColor
                                : AppColor.blackColor,
                          ),
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () => _onTabTapped(1),
                    child: Container(
                      width: 176.w,
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          color: controller.selectIndex.value == 1
                              ? AppColor.darkBlueColor
                              : Colors.transparent,
                          borderRadius: BorderRadius.circular(20)),
                      child: Center(
                        child: Text(
                          'Not going (5)',
                          style: TextStyle(
                              color: controller.selectIndex.value == 1
                                  ? AppColor.whiteColor
                                  : AppColor.blackColor),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
              child: Obx(
            () => controller.selectIndex.value == 0
                ? ListView.separated(
                    itemBuilder: (context, index) {
                      return ListTile(
                          leading: const Image(
                              image:
                                  AssetImage('assets/images/Mask group-1.png')),
                          title: Text(
                            'Laura Henry',
                            style: TextStyle(
                                color: AppColor.blackColor,
                                fontSize: 13.sp,
                                fontWeight: FontWeight.w600),
                          ),
                          subtitle: Text('23 Sep, 21:09',
                              style: TextStyle(
                                  color: AppColor.greyColor,
                                  fontSize: 13.sp,
                                  fontWeight: FontWeight.w600)),
                          trailing: index == 0
                              ? Container(
                                  height: 30.h,
                                  width: 60.w,
                                  decoration: BoxDecoration(
                                      color: AppColor.lightBlueColor,
                                      borderRadius:
                                          BorderRadius.circular(5.sp)),
                                  child: Center(
                                    child: Text(
                                      'Host',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 12.sp,
                                          color: AppColor.primaryColor),
                                    ),
                                  ),
                                )
                              : const SizedBox());
                    },
                    separatorBuilder: (context, index) =>
                        SizedBox(height: 20.h),
                    itemCount: 20)
                : ListView.separated(
                    itemBuilder: (context, index) {
                      return ListTile(
                        leading: const Image(
                            image: AssetImage('assets/images/Mask group.png')),
                        title: Text(
                          'Laura Henry',
                          style: TextStyle(
                              color: AppColor.blackColor,
                              fontSize: 13.sp,
                              fontWeight: FontWeight.w600),
                        ),
                        subtitle: Text('23 Sep, 21:09',
                            style: TextStyle(
                                color: AppColor.greyColor,
                                fontSize: 13.sp,
                                fontWeight: FontWeight.w600)),
                        // trailing: index == 0
                        //     ? Container(
                        //         height: 30.h,
                        //         width: 60.w,
                        //         decoration: BoxDecoration(
                        //             color: AppColor.lightBlueColor,
                        //             borderRadius:
                        //                 BorderRadius.circular(5.sp)),
                        //         child: Center(
                        //           child: Text(
                        //             'Host',
                        //             style: TextStyle(
                        //                 fontWeight: FontWeight.w500,
                        //                 fontSize: 12.sp,
                        //                 color: AppColor.primaryColor),
                        //           ),
                        //         ),
                        //       )
                        //     : const SizedBox()
                      );
                    },
                    separatorBuilder: (context, index) =>
                        SizedBox(height: 20.h),
                    itemCount: 5),
          ))
        ]),
      )),
    );
  }

  void _onTabTapped(int index) {
    controller.selectIndex.value = index;
  }
}
