import 'package:eve_travel_app/app_imports/app_imports.dart';

class ProfileScreen extends GetView<HomeController> {
  const ProfileScreen({super.key});

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
                AppText.profile,
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20.dp),
              ),
              const Spacer(),
              Image(
                image: const AssetImage(AppImages.settingImg),
                width: 4.5.w,
                color: AppColor.blackColor,
                height: 2.5.h,
                fit: BoxFit.fill,
              ),
              SizedBox(
                width: 3.w,
              ),
            ],
          ),
          SizedBox(height: 1.h),
          Container(
              height: 10.h,
              width: 20.w,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                    image: AssetImage(
                        'assets/images/Mask group.png'),
                    fit: BoxFit.fill),
              )),
          SizedBox(
            height: 1.h,
          ),
          Text(
            'Laura Henry',
            style: TextStyle(fontSize: 20.dp, fontWeight: FontWeight.w600),
          ),
          SizedBox(
            height: 1.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '@laura_henry123',
                style: TextStyle(
                    fontSize: 15.dp,
                    fontWeight: FontWeight.w400,
                    color: AppColor.blackColor),
              ),
              SizedBox(
                width: 2.w,
              ),
              Container(
                height: 0.5.h,
                width: 1.w,
                decoration: const BoxDecoration(color: AppColor.greyColor),
              ),
              SizedBox(
                width: 2.w,
              ),
              Text(
                'Miami, FL',
                style: TextStyle(
                    fontSize: 15.dp,
                    fontWeight: FontWeight.w400,
                    color: AppColor.greyColor),
              ),
            ],
          ),
          SizedBox(
            height: 2.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  Text(
                    AppText.followers,
                    style: TextStyle(
                        color: AppColor.greyColor,
                        fontSize: 15.dp,
                        fontWeight: FontWeight.w400),
                  ),
                  SizedBox(
                    height: 0.3.h,
                  ),
                  Text(
                    '36',
                    style: TextStyle(
                        color: AppColor.blackColor,
                        fontSize: 15.dp,
                        fontWeight: FontWeight.w600),
                  ),
                ],
              ),
              SizedBox(
                height: 7.h,
                child: VerticalDivider(
                  color: AppColor.greyColor,
                  thickness: 1,
                  width: 3.w,
                  indent: 8,
                  endIndent: 8,
                ),
              ),
              Column(
                children: [
                  Text(
                    AppText.following,
                    style: TextStyle(
                        color: AppColor.greyColor,
                        fontSize: 15.dp,
                        fontWeight: FontWeight.w400),
                  ),
                  SizedBox(
                    height: 0.3.h,
                  ),
                  Text(
                    '54',
                    style: TextStyle(
                        color: AppColor.blackColor,
                        fontSize: 15.dp,
                        fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(
            height: 2.h,
          ),
          Obx(
            () => Container(
              decoration: BoxDecoration(
                  color: AppColor.greyColor.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(20)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  InkWell(
                    onTap: () => _onTabTapped(0),
                    child: Container(
                      width: 45.w,
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          color: controller.selectIndex.value == 0
                              ? AppColor.darkBlueColor
                              : Colors.transparent,
                          borderRadius: BorderRadius.circular(20)),
                      child: Center(
                        child: Text(
                          AppText.yourEvents,
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
                      width: 45.w,
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          color: controller.selectIndex.value == 1
                              ? AppColor.darkBlueColor
                              : Colors.transparent,
                          borderRadius: BorderRadius.circular(20)),
                      child: Center(
                        child: Text(
                          AppText.eventsHistory,
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
          SizedBox(
            height: 2.h,
          ),
          CustomRoundShapeTextField(
              leadingIcon: Icon(Icons.search, size: 20.dp),
              controller: controller.searchController,
              hintText: AppText.search),
          SizedBox(
            height: 2.h,
          ),
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
          Obx(
            () => controller.selectIndex.value == 0
                ? Expanded(
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
                            onTapContainer: () {},
                            onTapChat: () {},
                          );
                        },
                        separatorBuilder: (context, index) {
                          return SizedBox(
                            height: 1.h,
                          );
                        },
                        itemCount: 2),
                  )
                : Expanded(
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
                            productImage: 'assets/images/dummy1.png',
                            dateTime: '31 October, 3 pm',
                            productName:
                                'MIAMI Halloween Party Cruise - Pier Pressure BlackPearlYacht',
                            location: 'Paperfish, Brickell, Miami, FL',
                            productPrice: r'$50',
                            onTapContainer: () {},
                            onTapChat: () {},
                          );
                        },
                        separatorBuilder: (context, index) {
                          return SizedBox(
                            height: 1.h,
                          );
                        },
                        itemCount: 10),
                  ),
          ),
        ]),
      ),
    );
  }

  void _onTabTapped(int index) {
    controller.selectIndex.value = index;
  }
}
