import 'package:flutter/cupertino.dart';
import 'package:eve_travel_app/app_imports/app_imports.dart';

class FilterScreen extends GetView<FilterScreenController> {
  const FilterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: CustomBackButton(
          onTap: () {
            Get.back();
          },
        ),
        centerTitle: true,
        backgroundColor: AppColor.primaryColor,
        title: Text(
          AppText.filters,
          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 20.sp,
            color: AppColor.whiteColor,
          ),
        ),
        actions: [
          Center(
            child: GestureDetector(
              onTap: () {
                controller.selectedCategoryIndices.clear();
                controller.selectedMoodIndices.clear();
                controller.selectedBudgetIndices.clear();
              },
              child: Text(
                AppText.clearAll,
                style: TextStyle(
                  fontSize: 15.sp,
                  color: AppColor.whiteColor,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
          SizedBox(
            width: 15.w,
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.w),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          SizedBox(
            height: 20.h,
          ),
          Text(
            AppText.typeOfEvent,
            style: TextStyle(
                fontWeight: FontWeight.w600,
                color: AppColor.blackColor,
                fontSize: 15.sp),
          ),
          SizedBox(
            height: 12.h,
          ),
          Obx(
            () => Wrap(
              spacing: 8.w,
              runSpacing: 8.w,
              children: controller.categories.asMap().entries.map(
                (entry) {
                  final index = entry.key;
                  final category = entry.value;
                  final isSelected = controller.selectedCategoryIndices
                      .contains(controller.categories[index]);

                  return GestureDetector(
                    onTap: () {
                      if (isSelected) {
                        controller.selectedCategoryIndices
                            .remove(controller.categories[index]);
                      } else {
                        controller.selectedCategoryIndices
                            .add(controller.categories[index]);
                      }
                    },
                    child: Container(
                      height: 33.h,
                      decoration: BoxDecoration(
                        boxShadow: isSelected
                            ? [
                                BoxShadow(
                                  color: AppColor.greyColor.withOpacity(0.5),
                                  blurRadius: 0,
                                  spreadRadius: 0.1,
                                  offset: const Offset(0, 0),
                                ),
                              ]
                            : [],
                        borderRadius: BorderRadius.circular(10),
                        color: isSelected
                            ? AppColor.darkBlueColor
                            : AppColor.greyColor.withOpacity(0.2),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 12.w, vertical: 6.h),
                        child: Text(
                          category,
                          style: TextStyle(
                              color: isSelected
                                  ? AppColor.whiteColor
                                  : AppColor.blackColor,
                              fontSize: 15.sp,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                    ),
                  );
                },
              ).toList(),
            ),
          ),
          SizedBox(
            height: 24.h,
          ),
          Text(
            AppText.dressCode,
            style: TextStyle(
                fontWeight: FontWeight.w600,
                color: AppColor.blackColor,
                fontSize: 15.sp),
          ),
          SizedBox(
            height: 12.h,
          ),
          Obx(
            () => Wrap(
              spacing: 8.w,
              runSpacing: 8.w,
              children: controller.mood.asMap().entries.map(
                (entry) {
                  final index = entry.key;
                  final category = entry.value;
                  final isSelected = controller.selectedMoodIndices
                      .contains(controller.mood[index]);

                  return GestureDetector(
                    onTap: () {
                      if (isSelected) {
                        controller.selectedMoodIndices
                            .remove(controller.mood[index]);
                      } else {
                        controller.selectedMoodIndices
                            .add(controller.mood[index]);
                      }
                    },
                    child: Container(
                      height: 33.h,

                      decoration: BoxDecoration(
                        boxShadow: isSelected
                            ? [
                                BoxShadow(
                                  color: AppColor.greyColor.withOpacity(0.5),
                                  blurRadius: 0,
                                  spreadRadius: 0.1,
                                  offset: const Offset(0, 0),
                                ),
                              ]
                            : [],
                        borderRadius: BorderRadius.circular(10),
                        color: isSelected
                            ? AppColor.darkBlueColor
                            : AppColor.greyColor.withOpacity(0.2),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 12.w, vertical: 6.h),
                        child: Text(
                          category,
                          style: TextStyle(
                              color: isSelected
                                  ? AppColor.whiteColor
                                  : AppColor.blackColor,
                              fontSize: 15.sp,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                    ),
                  );
                },
              ).toList(),
            ),
          ),
          SizedBox(
            height: 24.h,
          ),
          Text(
            AppText.price,
            style: TextStyle(
                fontWeight: FontWeight.w600,
                color: AppColor.blackColor,
                fontSize: 15.sp),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(AppText.onlyFREEEvents,
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 15.sp,
                      color: AppColor.blackColor)),
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
            height: 24.h,
          ),
          Text(
            AppText.date,
            style: TextStyle(
                fontWeight: FontWeight.w600,
                color: AppColor.blackColor,
                fontSize: 15.sp),
          ),
          SizedBox(
            height: 12.h,
          ),
          Obx(
            () => Wrap(
              spacing: 8.w,
              runSpacing: 8.w,
              children: controller.budget.asMap().entries.map(
                (entry) {
                  final index = entry.key;
                  final category = entry.value;
                  final isSelected = controller.selectedBudgetIndices
                      .contains(controller.budget[index]);

                  return GestureDetector(
                    onTap: () {
                      if (isSelected) {
                        controller.selectedBudgetIndices
                            .remove(controller.budget[index]);
                      } else {
                        controller.selectedBudgetIndices
                            .add(controller.budget[index]);
                      }
                    },
                    child: Container(
                      height: 33.h,

                      decoration: BoxDecoration(
                        boxShadow: isSelected
                            ? [
                                BoxShadow(
                                  color: AppColor.greyColor.withOpacity(0.5),
                                  blurRadius: 0,
                                  spreadRadius: 0.1,
                                  offset: const Offset(0, 0),
                                ),
                              ]
                            : [],
                        borderRadius: BorderRadius.circular(10),
                        color: isSelected
                            ? AppColor.darkBlueColor
                            : AppColor.greyColor.withOpacity(0.2),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 12.w, vertical: 6.h),
                        child: Text(
                          category,
                          style: TextStyle(
                              color: isSelected
                                  ? AppColor.whiteColor
                                  : AppColor.blackColor,
                              fontSize: 15.sp,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                    ),
                  );
                },
              ).toList(),
            ),
          ),
          SizedBox(
            height: 12.h,
          ),
          Text(
            AppText.chooseADate,
            style: TextStyle(
                fontWeight: FontWeight.w600,
                color: AppColor.blueColor,
                fontSize: 15.sp),
          ),
          SizedBox(
            height: 1.h,
          ),
        ]),
      ),
    );
  }
}
