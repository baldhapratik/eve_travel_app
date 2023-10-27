import 'package:eve_travel_app/app_imports/app_imports.dart';
import 'package:eve_travel_app/model/get_event_model.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

class CustomEventDetailsScreen extends StatelessWidget {
  final EventData eventData;

  const CustomEventDetailsScreen({super.key, required this.eventData});

  @override
  Widget build(BuildContext context) {
    RxBool readMore = true.obs;
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
                    image: DecorationImage(
                        image: NetworkImage(eventData.image),
                        fit: BoxFit.fill)),
              ),
              SizedBox(
                height: 25.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    eventData.title,
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
                eventData.cost??'',
                style: TextStyle(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w600,
                    color: AppColor.orangeColor),
              ),
              SizedBox(
                height: 25.h,
              ),
              // Container(
              //   height: 70.h,
              //   padding: EdgeInsets.symmetric(horizontal: 10.w),
              //   decoration: BoxDecoration(
              //       color: AppColor.lightBlueColor,
              //       borderRadius: BorderRadius.circular(10)),
              //   child: Center(
              //     child: ListTile(
              //       leading: SizedBox(
              //         height: 20.h,
              //         width: 20.w,
              //         child: Padding(
              //           padding: EdgeInsets.only(top: 3.h),
              //           child: const Image(
              //             image: AssetImage(AppImages.clockImg),
              //             fit: BoxFit.fill,
              //           ),
              //         ),
              //       ),
              //       title: Text(
              //         'Saturday, 23 September 2023',
              //         style: TextStyle(
              //             fontWeight: FontWeight.w400, fontSize: 14.sp),
              //       ),
              //       subtitle: Row(
              //         children: [
              //           Text(
              //             '13:00 - 14:00',
              //             style: TextStyle(
              //                 fontWeight: FontWeight.w400, fontSize: 12.sp),
              //           ),
              //           SizedBox(
              //             width: 4.w,
              //           ),
              //           Text(
              //             'Los Angles Time',
              //             style: TextStyle(
              //                 fontWeight: FontWeight.w400, fontSize: 12.sp),
              //           ),
              //         ],
              //       ),
              //       trailing: Container(
              //           height: 32.h,
              //           width: 32.h,
              //           padding: EdgeInsets.symmetric(
              //               horizontal: 7.w, vertical: 7.h),
              //           decoration: const BoxDecoration(
              //               shape: BoxShape.circle,
              //               color: AppColor.primaryColor),
              //           child: const Image(
              //               image: AssetImage(AppImages.calenderImg))),
              //       contentPadding: EdgeInsets.zero,
              //     ),
              //   ),
              // ),

              Container(
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 13.h),
                decoration: BoxDecoration(
                    color: AppColor.lightBlueColor,
                    borderRadius: BorderRadius.circular(10)),
                child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 12.w,
                      ),
                      SizedBox(
                        height: 22.h,
                        width: 20.w,
                        child: Padding(
                          padding: EdgeInsets.only(top: 5.h),
                          child: const Image(
                            image: AssetImage(AppImages.clockImg),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 12.w,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        // mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            DateFormat('EEEE, d MMMM y')
                                .format(DateTime.parse(eventData.createdAt)),
                            style: TextStyle(
                                fontWeight: FontWeight.w400, fontSize: 14.sp),
                          ),
                          Text(
                            '${DateFormat('dd:MM:yyyy').format(DateTime.parse(eventData.startDate))} - ${DateFormat('dd:MM:yyyy').format(DateTime.parse(eventData.endDate))} ${eventData.address}',
                            style: TextStyle(
                                fontWeight: FontWeight.w400, fontSize: 12.sp),
                          ),
                        ],
                      ),
                      const Spacer(),
                      Padding(
                        padding: EdgeInsets.only(top: 3.h),
                        child: Container(
                            height: 35.h,
                            width: 32.h,
                            padding: EdgeInsets.symmetric(
                                horizontal: 7.w, vertical: 7.h),
                            decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: AppColor.primaryColor),
                            child: const Image(
                                image: AssetImage(AppImages.calenderImg))),
                      ),
                      SizedBox(
                        width: 12.w,
                      ),
                    ]),
              ),
              SizedBox(
                height: 25.h,
              ),
              Row(children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Hosting ${eventData.participant.where((element) => element.isHost).length.toString()}',
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
                  '${eventData.description} ${readMore.isTrue ? '...' : ''}',
                  maxLines: readMore.isTrue ? 3 : null,
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
                      eventData.address,
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 15.sp,
                          color: AppColor.blackColor),
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    Text(
                      '${eventData.latitude.toString()}  ${eventData.longitude.toString()}',
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
                        InkWell(
                          onTap: () {
                            openMap(eventData.latitude, eventData.longitude);
                          },
                          child: Text(
                            'Go to map',
                            style: TextStyle(
                                color: AppColor.primaryColor,
                                fontSize: 15.sp,
                                fontWeight: FontWeight.w600),
                          ),
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
                      eventData.typeOfEvent,
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
                      eventData.dressCode,
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

  void openMap(double latitude, double longitude) async {
    String googleUrl =
        'https://www.google.com/maps/search/?api=1&query=$latitude,$longitude';
    if (await canLaunch(googleUrl)) {
      await launch(googleUrl);
    } else {
      throw 'Could not open the map.';
    }
  }
}
