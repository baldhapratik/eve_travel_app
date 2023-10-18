import 'package:eve_travel_app/utils/app_color.dart';
import 'package:eve_travel_app/utils/app_images.dart';
import 'package:eve_travel_app/utils/app_string.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';

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

  const CustomProductContainer(
      {super.key,
      required this.productImage,
      required this.dateTime,
      required this.productName,
      required this.location,
      required this.productPrice,
      this.friendsInterested,
      this.friendsImages,
      required this.onTapContainer,
      required this.onTapChat});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTapContainer,
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: AppColor.greyColor.withOpacity(0.5))),
        height: 43.h,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 5.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 2.h),
              Center(
                child: Container(
                  height: 20.h,
                  width: 80.w,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                          image: AssetImage(productImage), fit: BoxFit.fill)),
                ),
              ),
              SizedBox(height: 1.h),
              Text(
                dateTime,
                style: TextStyle(
                    fontSize: 12.dp,
                    color: AppColor.orangeColor,
                    fontWeight: FontWeight.w400),
              ),
              SizedBox(height: 0.5.h),
              Text(
                productName,
                style: TextStyle(
                    fontSize: 15.dp,
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
                        fontSize: 12.dp,
                        color: AppColor.greyColor,
                        fontWeight: FontWeight.w400),
                  ),
                  Text(
                    productPrice,
                    style: TextStyle(
                        fontSize: 13.dp,
                        color: AppColor.blackColor,
                        fontWeight: FontWeight.w600),
                  ),
                ],
              ),
              SizedBox(height: 1.h),
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
                        SizedBox(
                          height: 4.h,
                          child: const CircleAvatar(
                            child: Image(
                              image: AssetImage('assets/images/Mask group.png'),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 3.w),
                          child: SizedBox(
                            height: 4.h,
                            child: const CircleAvatar(
                              child: Image(
                                  image: AssetImage(
                                      'assets/images/Mask group-1.png')),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 6.w),
                          child: SizedBox(
                            height: 4.h,
                            child: const CircleAvatar(
                              child: Image(
                                  image: AssetImage(
                                      'assets/images/Mask group-2.png')),
                            ),
                          ),
                        ),
                      ],
                    ),
              Text(
                friendsInterested ?? '',
                style: TextStyle(
                  fontSize: 12.dp,
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
                      width: 10.w,
                      height: 3.h,
                    ),
                    Text(
                      AppText.chat,
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: AppColor.primaryColor,
                          fontSize: 15.dp),
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
