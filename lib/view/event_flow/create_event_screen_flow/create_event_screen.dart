import 'package:dotted_border/dotted_border.dart';
import 'package:eve_travel_app/app_imports/app_imports.dart';
import 'package:flutter/cupertino.dart';

class CreateEventScreen extends GetView<CreateEventController> {
  const CreateEventScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(CreateEventController());
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColor.whiteColor,
        title: Text(AppText.newEvent,
            style: TextStyle(
                fontSize: 20.sp,
                color: AppColor.blackColor,
                fontWeight: FontWeight.w600)),
        automaticallyImplyLeading: false,
        actions: [
          Center(
            child: Text(
              AppText.save,
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 15.sp,
                color: AppColor.blueColor,
              ),
            ),
          ),
          SizedBox(
            width: 20.w,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.w),
          child: Column(
            children: [
            SizedBox(
            height: 20.h,
          ),
          DottedBorder(
            borderType: BorderType.RRect,color: AppColor.primaryColor,
            radius: const Radius.circular(12),strokeCap: StrokeCap.butt,
            padding: const EdgeInsets.all(6),
            child:   SizedBox(
              height: 100.h,
              width: double.infinity,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Image(
                      image: const AssetImage(AppImages.cameraImg),
                      height: 40.h,
                      width: 40.w,
                    ),
                    Text(
                      AppText.uploadScreenshot,
                      style: TextStyle(
                          color: AppColor.greyColor,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w400),
                    ),
                  ]),
            ),
          ),
          SizedBox(
          height: 28.h,
        ),
        CustomTextField(
            controller: controller.title, hintText: AppText.title),
        SizedBox(
          height: 20.h,
        ),
        CustomTextField(
            controller: controller.description,
            hintText: AppText.description),
        SizedBox(
          height: 20.h,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image(
                image: const AssetImage(AppImages.clockImg),
                width: 20.w,
                height: 20.h),
            SizedBox(
              width: 12.w,
            ),
            Text(AppText.allDay,
                style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 15.sp,
                    color: AppColor.blackColor)),
            const Spacer(),
            Obx(
                  () =>
                  CupertinoSwitch(
                    trackColor: AppColor.greyColor.withOpacity(0.2),
                    activeColor: AppColor.primaryColor,
                    value: controller.switchValue.value,
                    onChanged: (value) {
                      controller.switchValue.value = value;
                    },
                  ),
            ),
          ],
        ),
        SizedBox(
          height: 13.h,
        ),
        ListView.separated(
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return Row(
                children: [
                  Text(
                    'Sun, 10 Sep',
                    style: TextStyle(
                        fontWeight: FontWeight.w400, fontSize: 15.sp),
                  ),
                  const Spacer(),
                  Text(
                    '13:00',
                    style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 15.sp,
                        color: AppColor.blueColor),
                  ),
                ],
              );
            },
            separatorBuilder: (context, index) {
              return SizedBox(
                height: 12.h,
              );
            },
            itemCount: 2),
        const CommonDividerWithSizedBox(),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(top: 5.h),
              child: Image(
                  image: const AssetImage(AppImages.locationImg),
                  height: 20.h,
                  width: 20.w,
                  fit: BoxFit.fill),
            ),
            SizedBox(
              width: 12.w,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Rishtedar',
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 15.sp,
                        color: AppColor.blackColor)),
                Text(
                  '232 NW 24th St, Miami, FL 33127, USA',
                  style: TextStyle(
                      color: AppColor.blackColor,
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w400),
                ),
              ],
            )
          ],
        ),
        const CommonDividerWithSizedBox(),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(top: 3.h),
              child: Image(
                  image: const AssetImage(AppImages.starImg),
                  height: 20.h,
                  width: 20.w,
                  fit: BoxFit.fill),
            ),
            SizedBox(
              width: 12.w,
            ),
            Text('Type of event',
                style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 15.sp,
                    color: AppColor.blackColor)),
            const Spacer(),
            Text('Dinner /Drinks',
                style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 15.sp,
                    color: AppColor.blackColor)),
            SizedBox(
              width: 8.w,
            ),
            Icon(
              Icons.arrow_forward_ios_outlined,
              size: 15.sp,
            ),
          ],
        ),
        const CommonDividerWithSizedBox(),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(top: 3.h),
              child: Image(
                  image: const AssetImage(AppImages.dollarImg),
                  height: 20.h,
                  width: 20.w,
                  fit: BoxFit.fill),
            ),
            SizedBox(
              width: 12.w,
            ),
            Text('Cost',
                style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 15.sp,
                    color: AppColor.blackColor)),
            const Spacer(),
            Text('Not specified',
                style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 15.sp,
                    color: AppColor.blackColor)),
          ],
        ),
        const CommonDividerWithSizedBox(),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(top: 3.h),
              child: Image(
                  image: const AssetImage(AppImages.bowtieImg),
                  height: 20.h,
                  width: 20.w,
                  fit: BoxFit.fill),
            ),
            SizedBox(
              width: 12.w,
            ),
            Text('Dress code',
                style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 15.sp,
                    color: AppColor.blackColor)),
            const Spacer(),
            Text('Not specified',
                style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 15.sp,
                    color: AppColor.blackColor)),
          ],
        ),
        const CommonDividerWithSizedBox(),
        InkWell(
          onTap: () {
            Get.toNamed(AppRoutes.attendanceScreen);
          },
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.only(top: 3.h),
                child: Image(
                    image: const AssetImage(AppImages.userImg),
                    height: 20.h,
                    width: 20.w,
                    fit: BoxFit.fill),
              ),
              SizedBox(
                width: 12.w,
              ),
              Text('Participants',
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 15.sp,
                      color: AppColor.blackColor)),
              const Spacer(),
              Text('8',
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 15.sp,
                      color: AppColor.blackColor)),
              SizedBox(
                width: 8.w,
              ),
              Icon(
                Icons.arrow_forward_ios_outlined,
                size: 15.sp,
              )
            ],
          ),
        ),
        SizedBox(
          height: 20.h,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: 20.w,
            ),
            SizedBox(
              width: 12.w,
            ),
            Text('Can friends invite friends?',
                style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 15.sp,
                    color: AppColor.blackColor)),
            const Spacer(),
            Obx(
                  () =>
                  CupertinoSwitch(
                    trackColor: AppColor.greyColor.withOpacity(0.2),
                    activeColor: AppColor.primaryColor,
                    value: controller.friendSwitchValue.value,
                    onChanged: (value) {
                      controller.friendSwitchValue.value = value;
                    },
                  ),
            ),
          ],
        ),
        const CommonDividerWithSizedBox(),
        ],
      ),
    ),)
    );
  }
}

class CommonDividerWithSizedBox extends StatelessWidget {
  const CommonDividerWithSizedBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 20.h,
        ),
        Divider(
          height: 1.h,
          thickness: 1,
          color: AppColor.greyColor.withOpacity(0.2),
        ),
        SizedBox(
          height: 20.h,
        ),
      ],
    );
  }
}
