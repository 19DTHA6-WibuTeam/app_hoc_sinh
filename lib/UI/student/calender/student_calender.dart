import 'package:doan_chuyen_nganh/theme/colors.dart';
import 'package:doan_chuyen_nganh/theme/dimens.dart';
import 'package:doan_chuyen_nganh/theme/images.dart';
import 'package:doan_chuyen_nganh/widget/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:intl/intl.dart';

class StudentCalender extends StatefulWidget {
  const StudentCalender({super.key});

  @override
  State<StudentCalender> createState() => _StudentCalenderState();
}

class _StudentCalenderState extends State<StudentCalender> {
  RxString chooseDay =
      DateFormat.yMMMMd().format(DateTime.now()).toString().obs;
  DateTime _selectedDay = DateTime.now();
  RxList subjectList = [].obs;
  RxBool _loading = true.obs;
  @override
  Widget build(BuildContext context) {
    final double maxHeight = MediaQuery.of(context).size.height;
    final double maxWidth = MediaQuery.of(context).size.width;
    return Scaffold(
        body: SafeArea(
      child: Column(
        children: [
          SizedBox(
            height: maxHeight * 0.01,
          ),
          Center(
              child: Obx(
            () => Text(chooseDay.value,
                style: AppTextStyle.chooseText.copyWith(
                    color: AppColors.black,
                    fontSize: 24,
                    fontWeight: FontWeight.bold)),
          )),
          SizedBox(
            height: maxHeight * 0.02,
          ),
          Container(
            padding:
                EdgeInsets.only(left: maxWidth * 0.02, right: maxWidth * 0.02),
            child: DatePicker(
              DateTime.now(),
              height: maxHeight * 0.1,
              width: maxWidth * 0.15,
              initialSelectedDate: DateTime.now(),
              selectedTextColor: AppColors.white,
              selectionColor: AppColors.primary,
              dateTextStyle: AppTextStyle.primaryText.copyWith(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  color: AppColors.gray),
              onDateChange: (selectedDate) {
                chooseDay.value =
                    DateFormat.yMMMMd().format(selectedDate).toString();
                _selectedDay = selectedDate;
                _loading.value = !_loading.value;
              },
            ),
          ),
          SizedBox(
            height: maxHeight * 0.01,
          ),
          Obx(() => _loading.value
              ? Expanded(
                  child: ListView.builder(
                  itemBuilder: (_, context) {
                    return GestureDetector(
                      onTap: null,
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: maxWidth * 0.05),
                        margin: EdgeInsets.only(
                            bottom: maxHeight * 0.01,
                            right: maxWidth * 0.02,
                            left: maxWidth * 0.02),
                        width: maxWidth,
                        height: maxHeight * 0.2,
                        decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.circular(Dimens.RADIUS_15),
                            color: AppColors.primary),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: maxHeight * 0.01,
                                ),
                                Text(
                                  "Môn Học",
                                  style: AppTextStyle.chooseText.copyWith(
                                      fontSize: maxWidth * 0.07,
                                      fontWeight: FontWeight.bold,
                                      color: AppColors.white),
                                ),
                                SizedBox(
                                  height: maxHeight * 0.01,
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.access_time_rounded,
                                      color: AppColors.white,
                                      size: maxWidth * 0.05,
                                    ),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      "7:00 - 9:00",
                                      style: AppTextStyle.chooseText
                                          .copyWith(fontSize: maxWidth * 0.05),
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: maxHeight * 0.005,
                                ),
                                // Row(
                                //   crossAxisAlignment: CrossAxisAlignment.center,
                                //   children: [
                                //     Icon(
                                //       Icons.person,
                                //       color: AppColors.white,
                                //       size: maxWidth * 0.06,
                                //     ),
                                //     const SizedBox(
                                //       width: 5,
                                //     ),
                                //     Text(
                                //       "Tên gia sư",
                                //       style: AppTextStyle.chooseText
                                //           .copyWith(fontSize: maxWidth * 0.05),
                                //     ),
                                //   ],
                                // ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.location_on,
                                      color: AppColors.white,
                                      size: maxWidth * 0.05,
                                    ),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    SizedBox(
                                      height: maxHeight * 0.1,
                                      width: maxWidth * 0.695,
                                      child: Align(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          "54 Đường 12D, Khu phố Chân Phúc Cẩm, quận 9",
                                          style: AppTextStyle.chooseText
                                              .copyWith(
                                                  fontSize: maxWidth * 0.05),
                                          overflow: TextOverflow.visible,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Container(
                                  margin: EdgeInsets.symmetric(
                                      horizontal: maxWidth * 0.02),
                                  height: maxHeight * 0.15,
                                  width: 1,
                                  color: AppColors.white,
                                ),
                                RotatedBox(
                                  quarterTurns: 3,
                                  child: Text(
                                    "Chi tiết",
                                    style: AppTextStyle.chooseText
                                        .copyWith(fontSize: maxWidth * 0.05),
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                  itemCount: 4,
                ))
              : SizedBox(
                  height: maxHeight * 0.7,
                  child: Center(
                    child: Text(
                      "Không học nhưng cũng phải nghỉ ngơi và ôn tập nhé!!",
                      style: AppTextStyle.titleSmall.copyWith(
                          fontSize: maxWidth * 0.04, color: AppColors.black),
                    ),
                  ),
                ))
        ],
      ),
    ));
  }
}
