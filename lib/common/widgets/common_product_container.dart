import 'package:eve_travel_app/app_imports/app_imports.dart';

class CustomProductContainer extends StatelessWidget {
  final String productImage;
  final String dateTime;
  final String productName;
  final String location;
  final String productPrice;
  final String? friendsInterested;
  final List? friendsImages;
  final GestureTapCallback? onTapContainer;
  final GestureTapCallback? onTapChat;
  final GestureTapCallback? onTapNotification;
  final GestureTapCallback? onTapShare;

  const CustomProductContainer({
    super.key,
    required this.productImage,
    required this.dateTime,
    required this.productName,
    required this.location,
    required this.productPrice,
    this.friendsInterested,
    this.friendsImages,
    required this.onTapContainer,
    required this.onTapNotification,
    required this.onTapShare,
    required this.onTapChat,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTapContainer,
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: AppColor.greyColor.withOpacity(0.5))),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                height: 200.h,
                width: 320.w,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                        image: AssetImage(productImage), fit: BoxFit.fill)),
                child: Padding(
                  padding: EdgeInsets.only(right: 15.w, top: 10.h),
                  child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        InkWell(
                          onTap: onTapNotification,
                          child: Container(
                            height: 35.h,
                            width: 35.w,
                            decoration: BoxDecoration(
                                color: AppColor.blackColor.withOpacity(0.3),
                                shape: BoxShape.circle),
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 9.w, vertical: 9.w),
                              child: const Image(
                                image: AssetImage(AppImages.notificationImg),
                                color: AppColor.whiteColor,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 8.w,
                        ),
                        InkWell(
                          onTap: onTapShare,
                          child: Container(
                            height: 32.h,
                            width: 32.w,
                            decoration: BoxDecoration(
                                color: AppColor.blackColor.withOpacity(0.3),
                                shape: BoxShape.circle),
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 7.w, vertical: 7.w),
                              child: const Image(
                                image: AssetImage(AppImages.shareImg),
                                color: AppColor.whiteColor,
                              ),
                            ),
                          ),
                        ),
                      ]),
                ),
              ),
              SizedBox(height: 5.h),
              Text(
                dateTime,
                style: TextStyle(
                    fontSize: 12.sp,
                    color: AppColor.orangeColor,
                    fontWeight: FontWeight.w400),
              ),
              SizedBox(height: 4.h),
              Text(
                productName,
                style: TextStyle(
                    fontSize: 15.sp,
                    color: AppColor.blackColor,
                    fontWeight: FontWeight.w600),
              ),
              SizedBox(height: 0.5.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    location,
                    style: TextStyle(
                        fontSize: 12.sp,
                        color: AppColor.greyColor,
                        fontWeight: FontWeight.w400),
                  ),
                  Text(
                    productPrice,
                    style: TextStyle(
                        fontSize: 13.sp,
                        color: AppColor.blackColor,
                        fontWeight: FontWeight.w600),
                  ),
                ],
              ),
              SizedBox(height: 4.h),
              // friendsImages != null
              //     ? SizedBox(
              //         height: 5.h,
              //         child: ListView.builder(
              //           shrinkWrap: true,
              //           scrollDirection: Axis.horizontal,
              //           itemCount: friendsImages!.length,
              //           itemBuilder: (BuildContext context, int index) {
              //             return Padding(
              //               padding:
              //                   EdgeInsets.only(left: index == 0 ? 0 : 3.w),
              //               child: SizedBox(
              //                 height: 4.h,
              //                 child: CircleAvatar(
              //                   child: Image.asset(friendsImages![index]),
              //                 ),
              //               ),
              //             );
              //           },
              //         ),
              //       )
              //     : const SizedBox(),
              Row(
                children: [
                  Stack(
                    children: [
                      CircleAvatar(
                        maxRadius: 10.sp,
                        child: const Image(
                          image: AssetImage('assets/images/Mask group.png'),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 7.w),
                        child: CircleAvatar(
                          maxRadius: 10.sp,
                          child: const Image(
                              image:
                                  AssetImage('assets/images/Mask group-1.png')),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 9.w),
                        child: CircleAvatar(
                          maxRadius: 10.sp,
                          child: const Image(
                              image:
                                  AssetImage('assets/images/Mask group-2.png')),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 3.w,
                  ),
                  Text(
                    friendsInterested ?? '',
                    style: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w500,
                      color: AppColor.blackColor,
                      height: 16 / 12,
                    ),
                    textAlign: TextAlign.left,
                  ),
                  const Spacer(),
                  InkWell(
                    onTap: onTapChat,
                    child: Row(
                      children: [
                        Image(
                          image: const AssetImage(AppImages.chatImg),
                          width: 20.w,
                          height: 20.h,
                        ),
                        SizedBox(
                          width: 6.w,
                        ),
                        Text(
                          AppText.chat,
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              color: AppColor.primaryColor,
                              fontSize: 15.sp),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              // friendsInterested!.isNotEmpty ?
              // Row(
              //   children: [
              //     friendsInterested!.length == 2 ?
              //     Stack(
              //       children: [
              //         SizedBox(
              //           height: 4.h,
              //           child: const CircleAvatar(
              //             child: Image(
              //               image: AssetImage('assets/images/Mask group.png'),
              //             ),
              //           ),
              //         ),
              //         Padding(
              //           padding: EdgeInsets.only(left: 3.w),
              //           child: SizedBox(
              //             height: 4.h,
              //             child: const CircleAvatar(
              //               child: Image(
              //                   image: AssetImage(
              //                       'assets/images/Mask group-1.png')),
              //             ),
              //           ),
              //         ),
              //         Padding(
              //           padding: EdgeInsets.only(left: 6.w),
              //           child: SizedBox(
              //             height: 4.h,
              //             child: const CircleAvatar(
              //               child: Image(
              //                   image: AssetImage(
              //                       'assets/images/Mask group-2.png')),
              //             ),
              //           ),
              //         ),
              //       ],
              //     ):friendsInterested!.length == 1?
              //     Stack(
              //       children: [
              //         SizedBox(
              //           height: 4.h,
              //           child: const CircleAvatar(
              //             child: Image(
              //               image: AssetImage('assets/images/Mask group.png'),
              //             ),
              //           ),
              //         ),
              //         Padding(
              //           padding: EdgeInsets.only(left: 3.w),
              //           child: SizedBox(
              //             height: 4.h,
              //             child: const CircleAvatar(
              //               child: Image(
              //                   image: AssetImage(
              //                       'assets/images/Mask group-1.png')),
              //             ),
              //           ),
              //         ),
              //       ],
              //     )
              //   ],
              // ) : const SizedBox(),
              // SizedBox(height: 2.h),
            ],
          ),
        ),
      ),
    );
  }
}
