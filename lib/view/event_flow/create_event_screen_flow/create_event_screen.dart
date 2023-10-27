import 'package:dotted_border/dotted_border.dart';
import 'package:eve_travel_app/app_imports/app_imports.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_google_places_sdk/flutter_google_places_sdk.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

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
            InkWell(
              onTap: () {
                FocusScope.of(context).unfocus();
                controller.addEventApiCall(context);
              },
              child: Center(
                child: Text(
                  AppText.createEvent,
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 15.sp,
                    color: AppColor.blueColor,
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 20.w,
            ),
          ],
        ),
        body: Obx(
          () => controller.loading.isFalse
              ? SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 20.h,
                        ),
                        Obx(
                          () => controller.file.value == null
                              ? InkWell(
                                  onTap: () {
                                    controller.pickImage();
                                  },
                                  child: DottedBorder(
                                    borderType: BorderType.RRect,
                                    color: AppColor.primaryColor,
                                    radius: const Radius.circular(12),
                                    strokeCap: StrokeCap.butt,
                                    padding: const EdgeInsets.all(6),
                                    child: SizedBox(
                                      height: 100.h,
                                      width: double.infinity,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Image(
                                            image: const AssetImage(
                                                AppImages.cameraImg),
                                            height: 40.h,
                                            width: 40.w,
                                          ),
                                          Text(
                                            AppText.uploadScreenshot,
                                            style: TextStyle(
                                              color: AppColor.greyColor,
                                              fontSize: 12.sp,
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                )
                              : InkWell(
                                  onTap: () {
                                    controller.pickImage();
                                  },
                                  child: controller.file.value != null
                                      ? Image.memory(
                                          controller.file.value!
                                              .readAsBytesSync(),
                                          height: 200.h,
                                          width: double.infinity,
                                          fit: BoxFit.fitHeight,
                                        )
                                      : Container(),
                                ),
                        ),

                        SizedBox(
                          height: 28.h,
                        ),
                        CustomTextField(
                            controller: controller.title,
                            hintText: AppText.title),
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
                              () => CupertinoSwitch(
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
                        // InkWell(
                        //   onTap: () {
                        //     controller.selectFromDate(context);
                        //   },
                        //   child: Obx(
                        //     () => Text(
                        //       controller.fromDateValue.isTrue
                        //           ? controller.formatDate(controller.fromDate!.value)
                        //           : 'Choose Start Date',
                        //       style: TextStyle(
                        //           fontWeight: FontWeight.w400, fontSize: 15.sp),
                        //     ),
                        //   ),
                        // ),
                        // SizedBox(
                        //   height: 13.h,
                        // ),
                        // InkWell(
                        //   onTap: () {
                        //     controller.selectToDate(context);
                        //   },
                        //   child: Obx(
                        //     () => Text(
                        //       controller.toDateValue.isTrue
                        //           ? controller.formatDate(controller.toDate!.value)
                        //           : 'Choose To Date',
                        //       style: TextStyle(
                        //           fontWeight: FontWeight.w400, fontSize: 15.sp),
                        //     ),
                        //   ),
                        // ),
                        Obx(
                          () => controller.switchValue.isFalse
                              ? controller.fromDate.isEmpty
                                  ? InkWell(
                                      onTap: () {
                                        dateDialogue(context);
                                      },
                                      child: Text(
                                        AppText.chooseAFromToDate,
                                        style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            color: AppColor.blueColor,
                                            fontSize: 15.sp),
                                      ),
                                    )
                                  : InkWell(
                                      onTap: () {
                                        dateDialogue(context);
                                      },
                                      child: Text(
                                        '${DateFormat('dd:MM:yyyy').format(DateTime.parse(controller.fromDate.value))} - ${DateFormat('dd:MM:yyyy').format(DateTime.parse(controller.toDate.value))}',
                                      ),
                                    )
                              : const SizedBox(),
                        ),

                        // SizedBox(
                        //   height: 13.h,
                        // ),
                        // ListView.separated(
                        //     shrinkWrap: true,
                        //     itemBuilder: (context, index) {
                        //       return Row(
                        //         children: [
                        //           Text(
                        //             'Sun, 10 Sep',
                        //             style: TextStyle(
                        //                 fontWeight: FontWeight.w400, fontSize: 15.sp),
                        //           ),
                        //           const Spacer(),
                        //           Text(
                        //             '13:00',
                        //             style: TextStyle(
                        //                 fontWeight: FontWeight.w400,
                        //                 fontSize: 15.sp,
                        //                 color: AppColor.blueColor),
                        //           ),
                        //         ],
                        //       );
                        //     },
                        //     separatorBuilder: (context, index) {
                        //       return SizedBox(
                        //         height: 12.h,
                        //       );
                        //     },
                        //     itemCount: 2),
                        const CommonDividerWithSizedBox(),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(top: 5.h),
                              child: Image(
                                  image:
                                      const AssetImage(AppImages.locationImg),
                                  height: 20.h,
                                  width: 20.w,
                                  fit: BoxFit.fill),
                            ),
                            SizedBox(
                              width: 12.w,
                            ),
                            // Expanded(
                            //   child: Padding(
                            //     padding: const EdgeInsets.all(20.0),
                            //     child: TypeAheadFormField<String>(
                            //       textFieldConfiguration:
                            //           const TextFieldConfiguration(
                            //         decoration: InputDecoration(
                            //           labelText: 'Select a fruit',
                            //           border: OutlineInputBorder(),
                            //         ),
                            //       ),
                            //       // suggestionsCallback: (pattern) async {
                            //       //   return await controller.autoCompleteSearch(value);
                            //       // },
                            //       itemBuilder: (context, String suggestion) {
                            //         return ListTile(
                            //           title: Text(suggestion),
                            //         );
                            //       },
                            //       onSuggestionSelected: (String suggestion) {
                            //         // Perform your action on suggestion selection
                            //       },
                            //       suggestionsCallback: (AutocompletePrediction pattern) {
                            //         return controller.predictions;
                            //       },
                            //     ),
                            //   ),
                            // ),

                            Expanded(
                              child: CustomTextField(
                                hintText: 'Add Location',
                                controller: controller.searchController,
                                onChange: (value) {
                                  if (value!.isNotEmpty) {
                                    controller.showLocation.value = true;
                                    controller.autoCompleteSearch(value);
                                  } else {
                                    controller.showLocation.value = false;
                                  }
                                },
                              ),
                            ),
                          ],
                        ),
                        controller.showLocation.isTrue
                            ? Column(
                                children: [
                                  SizedBox(
                                    height: 5.h,
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color: AppColor.greyColor),
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    height: 150.h,
                                    child: ListView.separated(
                                        itemBuilder: (context, index) {
                                          return ListTile(
                                            onTap: () {
                                              controller.searchController.text =
                                                  controller.predictions[index]
                                                      .fullText;
                                              controller.showLocation.value =
                                                  false;
                                            },
                                            title: Text(controller
                                                .predictions[index].fullText),
                                          );
                                        },
                                        separatorBuilder: (context, index) =>
                                            SizedBox(height: 1.h),
                                        itemCount:
                                            controller.predictions.length),
                                  ),
                                ],
                              )
                            : SizedBox(),
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
                            // Text('Dinner /Drinks',
                            //     style: TextStyle(
                            //         fontWeight: FontWeight.w400,
                            //         fontSize: 15.sp,
                            //         color: AppColor.blackColor)),
                            Obx(
                              () => DropdownButton<String>(
                                value: controller.selectedEvent.value,
                                onChanged: (String? newValue) {
                                  controller.selectedEvent.value = newValue!;
                                },
                                items: controller.categories
                                    .map<DropdownMenuItem<String>>(
                                        (String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  );
                                }).toList(),
                              ),
                            ),
                            SizedBox(
                              width: 8.w,
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
                            Text('Add Cost',
                                style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 15.sp,
                                    color: AppColor.blackColor)),
                            const Spacer(),
                            Obx(
                              () => CupertinoSwitch(
                                trackColor: AppColor.greyColor.withOpacity(0.2),
                                activeColor: AppColor.primaryColor,
                                value: controller.addValue.value,
                                onChanged: (value) {
                                  controller.addValue.value = value;
                                },
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 3.h,
                        ),
                        controller.addValue.isTrue
                            ? Padding(
                                padding: EdgeInsets.only(top: 10.h),
                                child: Row(
                                  children: [
                                    const Spacer(),
                                    SizedBox(
                                        width: 130.w,
                                        height: 30.h,
                                        child: TextField(
                                          keyboardType: TextInputType.number,
                                          controller:
                                              controller.priceController,
                                          decoration: const InputDecoration(
                                            hintText: 'Enter Amount',
                                          ),
                                        )),
                                  ],
                                ),
                              )
                            : const SizedBox(),
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
                            Obx(
                              () => DropdownButton<String>(
                                value: controller.selectedDress.value,
                                onChanged: (String? newValue) {
                                  controller.selectedDress.value = newValue!;
                                },
                                items: controller.dressCode
                                    .map<DropdownMenuItem<String>>(
                                        (String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  );
                                }).toList(),
                              ),
                            ),
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
                              () => CupertinoSwitch(
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
                        CustomTextField(
                          controller: controller.noteController,
                          hintText: 'Enter Note',
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                      ],
                    ),
                  ),
                )
              : Center(
                  child: SizedBox(
                      height: 40.h,
                      width: 40.w,
                      child: const Center(child: CustomLoadingAnimation())),
                ),
        ));
  }

  dateDialogue(BuildContext context) {
    DateRangePickerSelectionChangedArgs? arguments;
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          elevation: 0,
          contentPadding: EdgeInsets.symmetric(horizontal: 10.w),
          content: Padding(
            padding: EdgeInsets.only(top: 20.h),
            child: SizedBox(
              height: 400.h,
              width: 400.w,
              child: SfDateRangePicker(
                view: DateRangePickerView.month,
                selectionMode: DateRangePickerSelectionMode.range,
                onSelectionChanged: (DateRangePickerSelectionChangedArgs args) {
                  arguments = args;
                },
              ),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Get.back();
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                if (arguments!.value.endDate != null) {
                  controller.fromDate.value =
                      arguments!.value.startDate.toString();
                  controller.toDate.value = arguments!.value.endDate.toString();
                }
                Get.back();
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
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
