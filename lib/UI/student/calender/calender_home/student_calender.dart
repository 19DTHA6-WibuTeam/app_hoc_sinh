import 'package:doan_chuyen_nganh/UI/student/calender/calender_detail/calender_detail.dart';
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
import 'package:table_calendar/table_calendar.dart';

class StudentCalender extends StatefulWidget {
  const StudentCalender({super.key});

  @override
  State<StudentCalender> createState() => _StudentCalenderState();
}

class _StudentCalenderState extends State<StudentCalender> {
  RxString chooseDay =
      DateFormat.yMMMMd().format(DateTime.now()).toString().obs;
  final Rx<DateTime> _selectedDay = DateTime.now().obs;
  final Rx<DateTime> _focusedDay = DateTime.now().obs;
  RxList subjectList = [].obs;
  final RxBool _loading = true.obs;
  final CalendarFormat _format = CalendarFormat.week;
  @override
  Widget build(BuildContext context) {
    final double maxHeight = MediaQuery.of(context).size.height;
    final double maxWidth = MediaQuery.of(context).size.width;
    return Scaffold(
        body: SafeArea(
      child: Column(
        children: [
          Center(
              child: Obx(
            () => Text(
              chooseDay.value,
              style: AppTextStyle.titleLarge,
            ),
          )),
          Obx(
            () => TableCalendar(
              firstDay: DateTime(1990),
              lastDay: DateTime(2050),
              focusedDay: _selectedDay.value,
              calendarFormat: _format,
              startingDayOfWeek: StartingDayOfWeek.sunday,
              daysOfWeekVisible: true,
              onDaySelected: ((selectedDay, focusedDay) {
                _focusedDay.value = selectedDay;
                _selectedDay.value = selectedDay;
                chooseDay.value =
                    DateFormat.yMMMMd().format(selectedDay).toString();
                _loading.value = !_loading.value;
              }),
              calendarStyle: const CalendarStyle(
                  isTodayHighlighted: true,
                  selectedDecoration: BoxDecoration(
                      color: AppColors.primary, shape: BoxShape.circle),
                  selectedTextStyle: TextStyle(color: AppColors.white)),
              selectedDayPredicate: ((day) {
                return isSameDay(_selectedDay.value, day);
              }),
              headerStyle: const HeaderStyle(
                  formatButtonVisible: false,
                  titleCentered: true,
                  formatButtonShowsNext: true),
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
                      onTap: () {
                        Get.to(const CalenderDetail());
                      },
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
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  "Môn Học",
                                  style: AppTextStyle.chooseText.copyWith(
                                      fontSize: maxWidth * 0.07,
                                      fontWeight: FontWeight.bold,
                                      color: AppColors.white),
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
                                      width: maxWidth * 0.695,
                                      child: Align(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          "54 Đường 12D, Khu phố Chân Phúc Cẩm,Phường Long Thạnh Mỹ, Quận 9",
                                          style: AppTextStyle.chooseText
                                              .copyWith(
                                                  fontSize: maxWidth * 0.04),
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
                  height: maxHeight * 0.5,
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
