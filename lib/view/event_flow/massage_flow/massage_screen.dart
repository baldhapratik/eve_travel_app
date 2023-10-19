import 'package:eve_travel_app/app_imports/app_imports.dart';
class MassageScreen extends GetView<MassageController> {
  const MassageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.w),
        child: Column(children: [
          SizedBox(height: 50.h),
          Row(
            children: [
              Text(
                AppText.chats,
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20.sp),
              ),
              const Spacer(),
              Icon(Icons.search, size: 20.sp),
              SizedBox(
                width: 3.w,
              ),
            ],
          ),
          SizedBox(height: 1.h),
          Expanded(
            child: ScrollConfiguration(
              behavior: CustomScrollBehaviorWithoutGlow(),
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
                            color: AppColor.greyColor.withOpacity(0.2)),
                        child: Center(
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                CircleAvatar(
                                  maxRadius: 25.sp,
                                  child: const Image(
                                      image: AssetImage(
                                          'assets/images/Mask group.png')),
                                ),
                                SizedBox(
                                  width: 200.w,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text('Bachelor party',
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                              fontWeight: FontWeight.w600,
                                              fontSize: 15.sp)),
                                      SizedBox(
                                        height: 0.5.h,
                                      ),
                                      Text('Melissa: What time is it?',
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                              fontWeight: FontWeight.w400,
                                              fontSize: 12.sp)),
                                    ],
                                  ),
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text('09:11 AM',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 12.sp)),
                                    index == 0 || index == 2 || index == 1
                                        ? CircleAvatar(
                                            maxRadius: 13.sp,
                                            backgroundColor: AppColor.blueColor,
                                            child: Center(
                                                child: Text('2',
                                                    style: TextStyle(
                                                        fontSize: 13.sp,
                                                        color:
                                                            AppColor.whiteColor,
                                                        fontWeight:
                                                            FontWeight.w500))),
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
                  itemCount: 20),
            ),
          )
        ]),
      ),
    );
  }
}
