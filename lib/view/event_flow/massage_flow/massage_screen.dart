import 'package:eve_travel_app/app_imports/app_imports.dart';

class MassageScreen extends GetView<MassageController> {
  const MassageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 4.w),
        child: Column(children: [
          SizedBox(height: 5.h),
          Row(
            children: [
              Text(
                AppText.chats,
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20.dp),
              ),
              const Spacer(),
              Icon(Icons.search, size: 25.dp),
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
                        height: 10.h,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: AppColor.greyColor.withOpacity(0.2)),
                        child: Center(
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                const CircleAvatar(
                                  maxRadius: 30,
                                  child: Image(
                                      image: AssetImage(
                                          'assets/images/Mask group.png')),
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                      width: 50.w,
                                      child: Text('Bachelor party',
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                              fontWeight: FontWeight.w600,
                                              fontSize: 12.dp)),
                                    ),
                                    SizedBox(
                                      height: 0.5.h,
                                    ),
                                    SizedBox(
                                      width: 50.w,
                                      child: Text('Melissa: What time is it?',
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                              fontWeight: FontWeight.w400,
                                              fontSize: 12.dp)),
                                    ),
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text('09:11 AM',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 12.dp)),
                                    index == 0 || index == 2 || index == 1
                                        ? CircleAvatar(
                                            maxRadius: 13.dp,
                                            backgroundColor: AppColor.blueColor,
                                            child: Center(
                                                child: Text('2',
                                                    style: TextStyle(
                                                        fontSize: 13.dp,
                                                        color:
                                                            AppColor.whiteColor,
                                                        fontWeight:
                                                            FontWeight.w500))),
                                          )
                                        : const SizedBox()
                                  ],
                                ),
                              ]),
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return SizedBox(
                      height: 2.h,
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
