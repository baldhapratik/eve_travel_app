import 'package:eve_travel_app/app_imports/app_imports.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class CustomEventDetailsScreen extends StatelessWidget {
  CustomEventDetailsScreen({super.key});

  late GoogleMapController mapController;
  RxBool readMore = true.obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: SizedBox(
          height: 60.h,
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 15.w),
            child: Row(children: [
              SizedBox(
                width: 50.w,
                height: 45.h,
                child: CustomButtonWithBorder(
                    borderColor: AppColor.greyColor.withOpacity(0.2),
                    onTap: () {},
                    child: Text(
                      AppText.no,
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 15.sp,
                          color: AppColor.primaryColor),
                    )),
              ),
              SizedBox(
                width: 10.w,
              ),
              SizedBox(
                width: 140.w,
                height: 45.h,
                child: CustomButton(
                    onTap: () {},
                    labelColor: AppColor.blueColor,
                    buttonColor: AppColor.primaryColor.withOpacity(0.2),
                    labelName: AppText.maybe),
              ),
              SizedBox(
                width: 10.w,
              ),
              SizedBox(
                width: 140.w,
                height: 45.h,
                child: CustomButton(
                    borderRadius: 5,
                    onTap: () {},
                    labelColor: AppColor.whiteColor,
                    buttonColor: AppColor.primaryColor,
                    labelName: AppText.attend),
              ),
            ]),
          ),
        ),
        appBar: AppBar(
          elevation: 0,
          backgroundColor: AppColor.whiteColor,
          leading: CustomBackButton(
            color: AppColor.blackColor,
            onTap: () {
              Get.back();
            },
          ),
          centerTitle: true,
          title: Text(AppText.event,
              style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 20.sp,
                  color: AppColor.blackColor)),
          actions: [
            SizedBox(
              width: 15.w,
            ),
            Image(
                image: const AssetImage(AppImages.notificationImg),
                height: 20.h,
                width: 20.w),
            SizedBox(
              width: 10.w,
            ),
            Icon(
              Icons.more_vert,
              color: AppColor.blackColor,
              size: 25.sp,
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.w),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Container(
                height: 200.h,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: const DecorationImage(
                        image: AssetImage('assets/images/dummyItem.png'),
                        fit: BoxFit.fill)),
              ),
              SizedBox(
                height: 25.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Sushimaking Class',
                    style:
                        TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                      height: 24.h,
                      width: 24.w,
                      child: const Image(
                        image: AssetImage(AppImages.notificationImg),
                        color: AppColor.greyColor,
                      ))
                ],
              ),
              Text(
                r'$155',
                style: TextStyle(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w600,
                    color: AppColor.orangeColor),
              ),
              SizedBox(
                height: 25.h,
              ),
              Container(
                height: 70.h,
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                decoration: BoxDecoration(
                    color: AppColor.lightBlueColor,
                    borderRadius: BorderRadius.circular(10)),
                child: Center(
                  child: ListTile(
                    leading: SizedBox(
                      height: 20.h,
                      width: 20.w,
                      child: Padding(
                        padding: EdgeInsets.only(top: 3.h),
                        child: const Image(
                          image: AssetImage(AppImages.clockImg),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    title: Text(
                      'Saturday, 23 September 2023',
                      style: TextStyle(
                          fontWeight: FontWeight.w400, fontSize: 14.sp),
                    ),
                    subtitle: Row(
                      children: [
                        Text(
                          '13:00 - 14:00',
                          style: TextStyle(
                              fontWeight: FontWeight.w400, fontSize: 12.sp),
                        ),
                        SizedBox(
                          width: 4.w,
                        ),
                        Text(
                          'Los Angles Time',
                          style: TextStyle(
                              fontWeight: FontWeight.w400, fontSize: 12.sp),
                        ),
                      ],
                    ),
                    trailing: Container(
                        height: 32.h,
                        width: 32.h,
                        padding: EdgeInsets.symmetric(
                            horizontal: 7.w, vertical: 7.h),
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppColor.primaryColor),
                        child: const Image(
                            image: AssetImage(AppImages.calenderImg))),
                    contentPadding: EdgeInsets.zero,
                  ),
                ),
              ),
              // SizedBox(
              //   height: 45.h,
              //   child: ListView.separated(
              //     scrollDirection: Axis.horizontal,
              //     itemBuilder: (context, index) {
              //       return Container(
              //         height: 30.0,
              //         padding:
              //             EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
              //         decoration: BoxDecoration(
              //           borderRadius: BorderRadius.circular(40.0),
              //           border: Border.all(
              //             color: AppColor.greyColor,
              //             width: 1,
              //           ),
              //         ),
              //         child: Center(
              //           child: Text(
              //             'Dinner / Drinks',
              //             style: TextStyle(
              //               fontWeight: FontWeight.w600,
              //               color: AppColor.blackColor.withOpacity(0.8),
              //               fontSize: 13.sp,
              //             ),
              //           ),
              //         ),
              //       );
              //     },
              //     itemCount: 5,
              //     separatorBuilder: (BuildContext context, int index) =>
              //         SizedBox(width: 8.w),
              //   ),
              // ),
              // SizedBox(
              //   height: 20.h,
              // ),
              // ListTile(
              //   leading: Container(
              //     height: 40.h,
              //     width: 40.w,
              //     decoration: BoxDecoration(
              //         borderRadius: BorderRadius.circular(10),
              //         color: AppColor.whiteColor,
              //         boxShadow: [
              //           BoxShadow(
              //             blurRadius: 12,
              //             spreadRadius: 0,
              //             color: AppColor.greyColor.withOpacity(0.2),
              //             offset: const Offset(0, 4),
              //           )
              //         ]),
              //     child: Container(
              //       height: 20.h,
              //       width: 20.w,
              //       padding:
              //           EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
              //       child: const Image(
              //         image: AssetImage(AppImages.calenderClockImg),
              //       ),
              //     ),
              //   ),
              //   title: Text(
              //     'Sat, 23 Sep 2023 • 13:00 - 14:00 PM',
              //     style:
              //         TextStyle(fontSize: 13.sp, fontWeight: FontWeight.w600),
              //   ),
              //   subtitle: Text(
              //     'Make a calendar reminder',
              //     style: TextStyle(
              //         fontWeight: FontWeight.w400,
              //         color: AppColor.greyColor,
              //         fontSize: 11.sp),
              //   ),
              // ),
              // SizedBox(
              //   height: 20.h,
              // ),
              // ListTile(
              //   leading: Container(
              //     height: 40.h,
              //     width: 40.w,
              //     decoration: BoxDecoration(
              //         borderRadius: BorderRadius.circular(10),
              //         color: AppColor.whiteColor,
              //         boxShadow: [
              //           BoxShadow(
              //             blurRadius: 12,
              //             spreadRadius: 0,
              //             color: AppColor.greyColor.withOpacity(0.2),
              //             offset: const Offset(0, 4),
              //           )
              //         ]),
              //     child: Container(
              //       height: 20.h,
              //       width: 20.w,
              //       padding:
              //           EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
              //       child: const Image(
              //         image: AssetImage(AppImages.mapImg),
              //       ),
              //     ),
              //   ),
              //   title: Text(
              //     'Rishtedar, Miami, USA',
              //     style:
              //         TextStyle(fontSize: 13.sp, fontWeight: FontWeight.w600),
              //   ),
              //   subtitle: Text(
              //     'Open in the map',
              //     style: TextStyle(
              //         fontWeight: FontWeight.w400,
              //         color: AppColor.greyColor,
              //         fontSize: 11.sp),
              //   ),
              // ),
              // SizedBox(
              //   height: 20.h,
              // ),
              // ListTile(
              //   leading: Container(
              //     height: 40.h,
              //     width: 40.w,
              //     decoration: BoxDecoration(
              //         borderRadius: BorderRadius.circular(10),
              //         color: AppColor.whiteColor,
              //         boxShadow: [
              //           BoxShadow(
              //             blurRadius: 12,
              //             spreadRadius: 0,
              //             color: AppColor.greyColor.withOpacity(0.2),
              //             offset: const Offset(0, 4),
              //           )
              //         ]),
              //     child: Container(
              //       height: 20.h,
              //       width: 20.w,
              //       padding:
              //           EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
              //       child: const Image(
              //         image: AssetImage(AppImages.joinGroupImg),
              //       ),
              //     ),
              //   ),
              //   title: Text(
              //     'Join group chat',
              //     style:
              //         TextStyle(fontSize: 13.sp, fontWeight: FontWeight.w600),
              //   ),
              //   subtitle: Text(
              //     'Make a calendar reminder',
              //     style: TextStyle(
              //         fontWeight: FontWeight.w400,
              //         color: AppColor.greyColor,
              //         fontSize: 11.sp),
              //   ),
              // ),
              SizedBox(
                height: 25.h,
              ),
              Row(children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Hosting (1)',
                      style: TextStyle(
                          fontWeight: FontWeight.w600, fontSize: 15.sp),
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    CircleAvatar(
                      maxRadius: 20.sp,
                      child: const Image(
                          image: AssetImage('assets/images/Mask group.png')),
                    ),
                  ],
                ),
                SizedBox(
                  width: 100.w,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Going (3)',
                      style: TextStyle(
                          fontWeight: FontWeight.w600, fontSize: 15.sp),
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    Row(
                      children: [
                        Stack(
                          children: [
                            CircleAvatar(
                              maxRadius: 20.sp,
                              child: const Image(
                                image:
                                    AssetImage('assets/images/Mask group.png'),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 20.w),
                              child: CircleAvatar(
                                maxRadius: 20.sp,
                                child: const Image(
                                    image: AssetImage(
                                        'assets/images/Mask group-1.png')),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 40.w),
                              child: CircleAvatar(
                                maxRadius: 20.sp,
                                child: const Image(
                                    image: AssetImage(
                                        'assets/images/Mask group-2.png')),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ]),
              SizedBox(
                height: 25.h,
              ),
              Text(
                'About event',
                style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: 25.h,
              ),
              Obx(
                () => Text(
                  '👋 Welcome to Sushimaking Class dolor sit amet!!! Tincidunt arcu tellus nisl in in nisl lobortis. Venenatis in aenean tortor natoque tincidunt donec amet. Dictum at lobortis ornare justo nulla morbi malesuada sit. Fringilla arcu faucibus elementum sociis'
                  '${readMore.isTrue ? '...' : 'Welcome to Sushimaking Class dolor sit amet!!! Tincidunt arcu tellus nisl in in nisl lobortis. Venenatis in aenean.'}',
                  style:
                      TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w600),
                ),
              ),
              SizedBox(
                height: 5.h,
              ),
              InkWell(
                onTap: () {
                  readMore.value = !readMore.value;
                },
                child: Obx(
                  () => Text(
                    readMore.isTrue ? 'Read more' : 'Read less',
                    style: TextStyle(
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w600,
                        color: AppColor.primaryColor),
                  ),
                ),
              ),
              SizedBox(
                height: 25.h,
              ),
              Container(
                height: 210.h,
                width: double.infinity,
                padding: EdgeInsets.only(
                    top: 90.h, bottom: 10.h, right: 20.w, left: 20.w),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    image: const DecorationImage(
                        image: AssetImage('assets/images/image 2370.png'),
                        fit: BoxFit.fill)),
                child: Container(
                  decoration: BoxDecoration(
                      color: AppColor.lightGreyColor,
                      borderRadius: BorderRadius.circular(10)),
                  child: Column(children: [
                    SizedBox(
                      height: 12.h,
                    ),
                    Text(
                      'Rishtedar',
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 15.sp,
                          color: AppColor.blackColor),
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    Text(
                      '232 NW 24th St, Miami, FL 33127, USA',
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 13.sp,
                          color: AppColor.blackColor),
                    ),
                    SizedBox(
                      height: 12.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Go to map',
                          style: TextStyle(
                              color: AppColor.primaryColor,
                              fontSize: 15.sp,
                              fontWeight: FontWeight.w600),
                        ),
                        Icon(
                          Icons.arrow_forward,
                          color: AppColor.primaryColor,
                          size: 18.sp,
                        )
                      ],
                    )
                  ]),
                ),
              ),
              SizedBox(
                height: 25.h,
              ),
              Text(
                'Details',
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15.sp),
              ),
              SizedBox(
                height: 10.h,
              ),
              Container(
                height: 110.h,
                decoration: BoxDecoration(
                    color: AppColor.lightBlueColor,
                    borderRadius: BorderRadius.circular(10)),
                child: Column(children: [
                  ListTile(
                    leading: SizedBox(
                      height: 20.h,
                      width: 20.w,
                      child: Padding(
                        padding: EdgeInsets.only(top: 3.h),
                        child: const Image(
                          image: AssetImage(AppImages.starImg),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    title: Text(
                      'Type of event',
                      style: TextStyle(
                          fontSize: 15.sp, fontWeight: FontWeight.w600),
                    ),
                    trailing: Text(
                      'Dinner /Drinks',
                      style: TextStyle(
                          fontWeight: FontWeight.w400, fontSize: 15.sp),
                    ),
                  ),
                  ListTile(
                    leading: SizedBox(
                      height: 20.h,
                      width: 20.w,
                      child: Padding(
                        padding: EdgeInsets.only(top: 3.h),
                        child: const Image(
                          image: AssetImage(AppImages.bowtieImg),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    title: Text(
                      'Dress code',
                      style: TextStyle(
                          fontSize: 15.sp, fontWeight: FontWeight.w600),
                    ),
                    trailing: Text(
                      'Not specified',
                      style: TextStyle(
                          fontWeight: FontWeight.w400, fontSize: 15.sp),
                    ),
                  ),
                ]),
              ),
              SizedBox(
                height: 10.h,
              )
            ]),
          ),
        ));
  }
}
