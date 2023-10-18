import 'package:eve_travel_app/app_imports/app_imports.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(HomeController());
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 4.w),
        child: Column(
          children: [
            SizedBox(height: 5.h),
            Row(
              children: [
                Text(
                  AppText.myEvents,
                  style:
                      TextStyle(fontWeight: FontWeight.w600, fontSize: 20.dp),
                ),
                const Spacer(),
                Image(
                  image: const AssetImage(AppImages.notificationImg),
                  width: 4.5.w,
                  color: AppColor.blackColor,
                  height: 2.5.h,
                  fit: BoxFit.fill,
                ),
                SizedBox(
                  width: 3.w,
                ),
                Image(
                  image: const AssetImage(AppImages.userAddImg),
                  color: AppColor.blackColor,
                  width: 4.5.w,
                  height: 2.h,
                  fit: BoxFit.fill,
                ),
              ],
            ),
            SizedBox(height: 2.h),
            CustomRoundShapeTextField(
                leadingIcon: Icon(Icons.search, size: 20.dp),
                controller: controller.searchController,
                hintText: AppText.search),
            SizedBox(height: 2.h),
            Row(
              children: [
                InkWell(
                  onTap: () {
                    Get.toNamed(AppRoutes.filterScreen);
                  },
                  child: Container(
                    height: 5.h,
                    width: 25.w,
                    decoration: BoxDecoration(
                        color: AppColor.darkBlueColor,
                        borderRadius: BorderRadius.circular(10)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Image(
                            image: const AssetImage(AppImages.filterImg),
                            height: 2.h),
                        const Center(
                          child: Text(
                            "Filters",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: AppColor.whiteColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  width: 1.w,
                ),
                Expanded(
                    child: SizedBox(
                  height: 5.h,
                  child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            if (controller.selectIndex.value != index) {
                              controller.selectIndex.value = index;
                            } else {
                              controller.selectIndex.value = -1;
                            }
                          },
                          child: Obx(
                            () => Container(
                                height: 5.h,
                                width: 25.w,
                                decoration: BoxDecoration(
                                    color: controller.selectIndex.value == index
                                        ? AppColor.darkBlueColor
                                        : AppColor.greyColor.withOpacity(0.4),
                                    borderRadius: BorderRadius.circular(10)),
                                child: Center(
                                    child: Text(
                                  controller.filterList[index],
                                  style: TextStyle(
                                      color:
                                          controller.selectIndex.value == index
                                              ? AppColor.whiteColor
                                              : AppColor.blackColor),
                                ))),
                          ),
                        );
                      },
                      separatorBuilder: (context, index) {
                        return SizedBox(
                          width: 2.w,
                        );
                      },
                      itemCount: controller.filterList.length),
                )),
              ],
            ),
            SizedBox(height: 2.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '243 events',
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 15.dp,
                      color: AppColor.blackColor),
                ),
                Row(
                  children: [
                    Text(AppText.sortBy,
                        style: TextStyle(
                            color: AppColor.blackColor,
                            fontSize: 13.dp,
                            fontWeight: FontWeight.w400)),
                    SizedBox(
                      width: 1.w,
                    ),
                    Obx(
                      () => DropdownButton<String>(
                        hint: const Text('Sort by'),
                        value: controller.dropdownValue.value,
                        icon: const Icon(Icons.arrow_drop_down_sharp),
                        iconSize: 24,
                        elevation: 16,
                        style: const TextStyle(color: Colors.deepPurple),
                        underline: Container(
                          height: 2,
                          // color: Colors.deepPurpleAccent,
                        ),
                        onChanged: (String? newValue) {
                          if (newValue != null) {
                            controller.dropdownValue.value = newValue;
                          }
                        },
                        items: <String>[
                          'First created',
                          'First updated',
                          'Last updated',
                          'Last created'
                        ].map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value,
                                style: TextStyle(
                                    color: AppColor.blackColor,
                                    fontSize: 13.dp,
                                    fontWeight: FontWeight.w400)),
                          );
                        }).toList(),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 1.h),
            Expanded(
              child: ListView.separated(
                  padding: EdgeInsets.symmetric(vertical: 1.h),
                  itemBuilder: (context, index) {
                    return CustomProductContainer(
                      friendsInterested: '3 friends interested',
                      friendsImages: const [
                        'assets/images/Mask group.png',
                        'assets/images/Mask group-1.png',
                        'assets/images/Mask group-2.png',
                      ],
                      productImage: 'assets/images/dummy.png',
                      dateTime: '31 October, 3 pm',
                      productName:
                          'MIAMI Halloween Party Cruise - Pier Pressure BlackPearlYacht',
                      location: 'Paperfish, Brickell, Miami, FL',
                      productPrice: r'$50',
                      onTapContainer: () {
                        print('onTapContainer');
                      },
                      onTapChat: () {
                        print('onTapChat');
                      },
                    );
                  },
                  separatorBuilder: (context, index) => SizedBox(height: 3.h),
                  itemCount: 10),
            )
          ],
        ),
      ),
    );
  }
}
