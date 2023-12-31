import 'package:eve_travel_app/app_imports/app_imports.dart';
import 'package:intl/intl.dart';

class ProfileScreen extends GetView<ProfileController> {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ProfileController());
    return Scaffold(
        body: Obx(
      () => controller.loading.isFalse
          ? Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.w),
              child: Column(children: [
                SizedBox(height: 50.h),
                Row(
                  children: [
                    Text(
                      AppText.profile,
                      style: TextStyle(
                          fontWeight: FontWeight.w600, fontSize: 20.sp),
                    ),
                    const Spacer(),
                    InkWell(
                        onTap: () {
                          Get.toNamed(AppRoutes.registerScreen);
                          getStorage.erase();
                        },
                        child: const Icon(Icons.logout)),
                    SizedBox(
                      width: 10.w,
                    ),
                    Image(
                      image: const AssetImage(AppImages.settingImg),
                      width: 24.w,
                      color: AppColor.blackColor,
                      height: 24.h,
                      fit: BoxFit.fill,
                    ),
                    SizedBox(
                      width: 3.w,
                    ),
                  ],
                ),
                Obx(
                  () => controller.profileData.isNotEmpty
                      ? Expanded(
                          child: RefreshIndicator(
                            onRefresh: () async {
                              await controller.getBothApi();
                            },
                            child: SingleChildScrollView(
                              scrollDirection: Axis.vertical,
                              physics: const AlwaysScrollableScrollPhysics(),
                              child: Column(
                                children: [
                                  SizedBox(height: 24.h),
                                  Container(
                                      height: 80.h,
                                      width: 80.w,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        image: DecorationImage(
                                            image: NetworkImage(controller
                                                    .profileData[0].image ??
                                                'https://cdn-icons-png.flaticon.com/512/3135/3135715.png'),
                                            fit: BoxFit.fill),
                                      )),
                                  SizedBox(
                                    height: 12.h,
                                  ),
                                  Text(
                                    controller.profileData[0].name ??
                                        'Not Available',
                                    style: TextStyle(
                                        fontSize: 20.sp,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  SizedBox(
                                    height: 8.h,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        controller.profileData[0].email ?? '',
                                        style: TextStyle(
                                            fontSize: 15.sp,
                                            fontWeight: FontWeight.w400,
                                            color: AppColor.blackColor),
                                      ),
                                      SizedBox(
                                        width: 2.w,
                                      ),
                                      Container(
                                        height: 0.5.h,
                                        width: 1.w,
                                        decoration: const BoxDecoration(
                                            color: AppColor.greyColor),
                                      ),
                                      SizedBox(
                                        width: 2.w,
                                      ),
                                      Text(
                                        controller.profileData[0].city ?? '',
                                        style: TextStyle(
                                            fontSize: 15.sp,
                                            fontWeight: FontWeight.w400,
                                            color: AppColor.greyColor),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 24.h,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      InkWell(
                                        onTap: () {
                                          Get.toNamed(AppRoutes.followersScreen,
                                              arguments: controller
                                                  .profileData[0].followers);
                                        },
                                        child: Column(
                                          children: [
                                            Text(
                                              AppText.followers,
                                              style: TextStyle(
                                                  color: AppColor.greyColor,
                                                  fontSize: 15.sp,
                                                  fontWeight: FontWeight.w400),
                                            ),
                                            SizedBox(
                                              height: 0.3.h,
                                            ),
                                            Text(
                                              controller
                                                  .profileData[0].followers
                                                  .toString(),
                                              style: TextStyle(
                                                  color: AppColor.blackColor,
                                                  fontSize: 15.sp,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: 50.h,
                                        child: VerticalDivider(
                                          color: AppColor.greyColor,
                                          thickness: 1,
                                          width: 30.w,
                                          indent: 8,
                                          endIndent: 8,
                                        ),
                                      ),
                                      InkWell(
                                        onTap: () {
                                          Get.toNamed(AppRoutes.followingScreen,
                                              arguments: controller
                                                  .profileData[0].following);
                                        },
                                        child: Column(
                                          children: [
                                            Text(
                                              AppText.following,
                                              style: TextStyle(
                                                  color: AppColor.greyColor,
                                                  fontSize: 15.sp,
                                                  fontWeight: FontWeight.w400),
                                            ),
                                            SizedBox(
                                              height: 0.3.h,
                                            ),
                                            Text(
                                              controller
                                                  .profileData[0].following
                                                  .toString(),
                                              style: TextStyle(
                                                  color: AppColor.blackColor,
                                                  fontSize: 15.sp,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 18.h,
                                  ),
                                  Obx(
                                    () => Container(
                                      height: 50.h,
                                      decoration: BoxDecoration(
                                          color: AppColor.greyColor
                                              .withOpacity(0.2),
                                          boxShadow: const [
                                            BoxShadow(
                                                color: AppColor.whiteColor)
                                          ],
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        mainAxisSize: MainAxisSize.max,
                                        // Add this line to ensure the Row takes up the available space
                                        children: [
                                          InkWell(
                                            onTap: () => _onTabTapped(0),
                                            child: Container(
                                              width: 176.w,
                                              padding: const EdgeInsets.all(10),
                                              decoration: BoxDecoration(
                                                  color: controller.selectIndex
                                                              .value ==
                                                          0
                                                      ? AppColor.darkBlueColor
                                                      : Colors.transparent,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          20)),
                                              child: Center(
                                                child: Text(
                                                  AppText.yourEvents,
                                                  style: TextStyle(
                                                    color: controller
                                                                .selectIndex
                                                                .value ==
                                                            0
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
                                                  color: controller.selectIndex
                                                              .value ==
                                                          1
                                                      ? AppColor.darkBlueColor
                                                      : Colors.transparent,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          20)),
                                              child: Center(
                                                child: Text(
                                                  AppText.eventsHistory,
                                                  style: TextStyle(
                                                      color: controller
                                                                  .selectIndex
                                                                  .value ==
                                                              1
                                                          ? AppColor.whiteColor
                                                          : AppColor
                                                              .blackColor),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20.h,
                                  ),
                                  CustomRoundShapeTextField(
                                      leadingIcon:
                                          Icon(Icons.search, size: 25.sp),
                                      controller: controller.searchController,
                                      hintText: AppText.search),
                                  SizedBox(
                                    height: 12.h,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Obx(
                                        () => Text(
                                          '${controller.selectIndex.value == 0 ? controller.profileEventData.length : controller.profileEventHistoryData.length} events',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w600,
                                              fontSize: 15.sp,
                                              color: AppColor.blackColor),
                                        ),
                                      ),
                                      Row(
                                        children: [
                                          Text(AppText.sortBy,
                                              style: TextStyle(
                                                  color: AppColor.blackColor,
                                                  fontSize: 13.sp,
                                                  fontWeight: FontWeight.w400)),
                                          SizedBox(
                                            width: 1.w,
                                          ),
                                          Obx(
                                            () => DropdownButton<String>(
                                              hint: const Text(AppText.sortBy),
                                              value: controller
                                                  .dropdownValue.value,
                                              icon: const Icon(
                                                  Icons.arrow_drop_down_sharp),
                                              iconSize: 24,
                                              elevation: 16,
                                              style: const TextStyle(
                                                  color: Colors.deepPurple),
                                              underline: Container(
                                                height: 2,
                                                // color: Colors.deepPurpleAccent,
                                              ),
                                              onChanged: (String? newValue) {
                                                if (newValue != null) {
                                                  controller.dropdownValue
                                                      .value = newValue;
                                                }
                                              },
                                              items: <String>[
                                                'First created',
                                                'First updated',
                                                'Last updated',
                                                'Last created'
                                              ].map<DropdownMenuItem<String>>(
                                                  (String value) {
                                                return DropdownMenuItem<String>(
                                                  value: value,
                                                  child: Text(value,
                                                      style: TextStyle(
                                                          color: AppColor
                                                              .blackColor,
                                                          fontSize: 13.sp,
                                                          fontWeight:
                                                              FontWeight.w400)),
                                                );
                                              }).toList(),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  Obx(() => controller.listLoading.isFalse
                                      ? controller.selectIndex.value == 0
                                          ? controller
                                                  .profileEventData.isNotEmpty
                                              ? ListView.separated(
                                                  physics:
                                                      const NeverScrollableScrollPhysics(),
                                                  shrinkWrap: true,
                                                  padding: EdgeInsets.symmetric(
                                                      vertical: 12.h),
                                                  itemBuilder:
                                                      (context, index) {
                                                    return InkWell(
                                                      child:
                                                          CustomProductContainer(
                                                        friendsInterested:
                                                            '3 friends interested',
                                                        friendsImages: const [
                                                          'assets/images/Mask group.png',
                                                          'assets/images/Mask group-1.png',
                                                          'assets/images/Mask group-2.png',
                                                        ],
                                                        productImage: controller
                                                            .profileEventData[
                                                                index]
                                                            .image,
                                                        dateTime:
                                                            '${DateFormat('dd-MM-yyyy').format(DateTime.parse(controller.profileEventData[index].startDate))} - ${DateFormat('dd-MM-yyyy').format(DateTime.parse(controller.profileEventData[index].endDate))}',
                                                        productName: controller
                                                            .profileEventData[
                                                                index]
                                                            .title,
                                                        location: controller
                                                            .profileEventData[
                                                                index]
                                                            .address,
                                                        productPrice: controller
                                                            .profileEventData[
                                                                index]
                                                            .cost,
                                                        onTapContainer: () {},
                                                        onTapChat: () {},
                                                        onTapNotification:
                                                            () {},
                                                        onTapShare: () {},
                                                      ),
                                                    );
                                                  },
                                                  separatorBuilder:
                                                      (context, index) {
                                                    return SizedBox(
                                                      height: 12.h,
                                                    );
                                                  },
                                                  itemCount: controller
                                                      .profileEventData.length)
                                              : Padding(
                                                  padding: EdgeInsets.only(
                                                      top: 100.h),
                                                  child: Text(
                                                    'No Data',
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        fontSize: 17.sp),
                                                  ),
                                                )
                                          : controller.profileEventHistoryData
                                                  .isNotEmpty
                                              ? ListView.separated(
                                                  physics:
                                                      const NeverScrollableScrollPhysics(),
                                                  shrinkWrap: true,
                                                  padding: EdgeInsets.symmetric(
                                                      vertical: 12.h),
                                                  itemBuilder:
                                                      (context, index) {
                                                    return CustomProductContainer(
                                                      friendsInterested:
                                                          '3 friends interested',
                                                      friendsImages: const [
                                                        'assets/images/Mask group.png',
                                                        'assets/images/Mask group-1.png',
                                                        'assets/images/Mask group-2.png',
                                                      ],
                                                      productImage: controller
                                                          .profileEventHistoryData[
                                                              index]
                                                          .image,
                                                      dateTime:
                                                          '31 October, 3 pm',
                                                      productName: controller
                                                          .profileEventHistoryData[
                                                              index]
                                                          .title,
                                                      location: controller
                                                          .profileEventHistoryData[
                                                              index]
                                                          .address,
                                                      productPrice: controller
                                                          .profileEventHistoryData[
                                                              index]
                                                          .cost,
                                                      onTapContainer: () {},
                                                      onTapChat: () {},
                                                      onTapNotification: () {},
                                                      onTapShare: () {},
                                                    );
                                                  },
                                                  separatorBuilder:
                                                      (context, index) {
                                                    return SizedBox(
                                                      height: 12.h,
                                                    );
                                                  },
                                                  itemCount: controller
                                                      .profileEventHistoryData
                                                      .length)
                                              : Padding(
                                                  padding: EdgeInsets.only(
                                                      top: 100.h),
                                                  child: Text(
                                                    'No Data',
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        fontSize: 17.sp),
                                                  ),
                                                )
                                      : Padding(
                                          padding: EdgeInsets.only(top: 20.h),
                                          child: const Center(
                                              child: CustomLoadingAnimation()),
                                        ))
                                ],
                              ),
                            ),
                          ),
                        )
                      : const SizedBox(),
                )
              ]),
            )
          : const Center(child: CustomLoadingAnimation()),
    ));
  }

  void _onTabTapped(int index) {
    controller.selectIndex.value = index;
  }
}
