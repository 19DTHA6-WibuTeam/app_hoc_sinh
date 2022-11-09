import 'package:doan_chuyen_nganh/UI/student/calender/calender_detail/calender_detail.dart';
import 'package:doan_chuyen_nganh/api/calender.dart';
import 'package:doan_chuyen_nganh/api/subject.dart';
import 'package:doan_chuyen_nganh/manager/shared_preferences.dart';
import 'package:doan_chuyen_nganh/models/calender.dart';
import 'package:doan_chuyen_nganh/models/time&subject.dart';
import 'package:doan_chuyen_nganh/theme/colors.dart';
import 'package:doan_chuyen_nganh/theme/dimens.dart';
import 'package:doan_chuyen_nganh/theme/images.dart';
import 'package:doan_chuyen_nganh/widget/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
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
  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((_) {
      _getData();
    });
  }

  List<CalenderData> calenderList = [];
  //List<String> sessionTimeList = [];
  var isLoaded = false;
  Future<void> _getData() async {
    calenderList = (await getCalender(
        BaseSharedPreferences.getString('MaNguoiDung'),
        BaseSharedPreferences.getString('token')))!;
    for (int i = 0; i < calenderList.length; i++) {
      if (_selectedDay.value.weekday == calenderList[i].maThu) {
        isInit.value = true;
        break;
      } else {
        isInit.value = false;
      }
    }
    setState(() {
      isLoaded = true;
    });
  }

  RxString chooseDay =
      DateFormat.yMMMMd().format(DateTime.now()).toString().obs;
  final Rx<DateTime> _selectedDay = DateTime.now().obs;
  final Rx<DateTime> _focusedDay = DateTime.now().obs;

  final RxBool isInit = false.obs;
  final CalendarFormat _format = CalendarFormat.week;
  @override
  Widget build(BuildContext context) {
    var subTimeCodeToString = [];
    for (int i = 0; i < calenderList.length; i++) {
      String startTime = calenderList[i].gioBatDau.toString();
      var startSub = startTime.substring(0, 5);
      String endTime = calenderList[i].gioKetThuc.toString();
      var endSub = endTime.substring(0, 5);
      subTimeCodeToString.add('$startSub-$endSub');
    }

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
                for (int i = 0; i < calenderList.length; i++) {
                  if (_selectedDay.value.weekday == calenderList[i].maThu) {
                    isInit.value = false;
                    isInit.value = true;
                    break;
                  } else {
                    isInit.value = false;
                  }
                }
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
          Visibility(
            visible: isLoaded,
            replacement: SizedBox(
              width: maxWidth,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: maxHeight * 0.3),
                  const CircularProgressIndicator(),
                ],
              ),
            ),
            child: Obx(() => isInit.value
                ? Expanded(
                    child: ListView.builder(
                    itemBuilder: (_, index) {
                      return calenderList[index].maThu ==
                              _selectedDay.value.weekday
                          ? GestureDetector(
                              onTap: () {
                                Get.to(CalenderDetail(
                                  sessionId: calenderList[index].maKhoaHoc!,
                                  learningDay: DateFormat('dd/MM/yyyy')
                                      .format(_selectedDay.value)
                                      .toString(),
                                  dayId: calenderList[index].maThu!,
                                ));
                              },
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: maxWidth * 0.05),
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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Text(
                                          calenderList[index].tenMonHoc!,
                                          style: AppTextStyle.chooseText
                                              .copyWith(
                                                  fontSize: maxWidth * 0.07,
                                                  fontWeight: FontWeight.bold,
                                                  color: AppColors.white),
                                        ),
                                        Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
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
                                              subTimeCodeToString[index],
                                              style: AppTextStyle.chooseText
                                                  .copyWith(
                                                      fontSize:
                                                          maxWidth * 0.05),
                                            )
                                          ],
                                        ),
                                        Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
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
                                                  calenderList[index].diaChi!,
                                                  style: AppTextStyle.chooseText
                                                      .copyWith(
                                                          fontSize:
                                                              maxWidth * 0.04),
                                                  overflow:
                                                      TextOverflow.visible,
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
                                                .copyWith(
                                                    fontSize: maxWidth * 0.05),
                                          ),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            )
                          : SizedBox();
                    },
                    itemCount: calenderList.length,
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
                  )),
          )
        ],
      ),
    ));
  }
}
