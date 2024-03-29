import 'package:doan_chuyen_nganh/UI/app_switch/app_switch.dart';
import 'package:doan_chuyen_nganh/UI/app_switch/app_switch1.dart';
import 'package:doan_chuyen_nganh/UI/pay_info/pay_info.dart';
import 'package:doan_chuyen_nganh/api/session.dart';
import 'package:doan_chuyen_nganh/api/subject.dart';
import 'package:doan_chuyen_nganh/main.dart';
import 'package:doan_chuyen_nganh/manager/shared_preferences.dart';
import 'package:doan_chuyen_nganh/models/session.dart';
import 'package:doan_chuyen_nganh/models/time&subject.dart';
import 'package:doan_chuyen_nganh/theme/colors.dart';
import 'package:doan_chuyen_nganh/theme/dimens.dart';
import 'package:doan_chuyen_nganh/widget/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';

class SessionChild01Detail extends StatefulWidget {
  SessionChild01Detail({super.key, required this.sessionId});

  int sessionId;

  @override
  State<SessionChild01Detail> createState() => _SessionChild01DetailState();
}

class _SessionChild01DetailState extends State<SessionChild01Detail> {
  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((_) {
      _getData();
    });
  }

  List<Datum> sessionList = [];
  int index = 0;
  List<String> subjectList = [];
  List<String> sessionTimeList = [];
  var isLoaded = false;
  Future<void> _getData() async {
    sessionList = (await getSessionList(
        BaseSharedPreferences.getString('MaNguoiDung'),
        BaseSharedPreferences.getString('token')))!;

    List<MonHoc>? subjectListAPI = await getSubjectList();
    for (int i = 0; i < subjectListAPI!.length; i++) {
      String subjectName = subjectListAPI[i].tenMonHoc.toString();
      subjectList.add(subjectName);
    }

    List<CaHoc>? sessionTimeListAPI = await getSessionTimeList();
    for (int i = 0; i < sessionTimeListAPI!.length; i++) {
      String startTime = sessionTimeListAPI[i].gioBatDau.toString();
      var startSub = startTime.substring(0, 5);
      String endTime = sessionTimeListAPI[i].gioKetThuc.toString();
      var endSub = endTime.substring(0, 5);
      sessionTimeList.add('$startSub-$endSub');
    }

    for (int i = 0; i < sessionList.length; i++) {
      if (sessionList[i].maKhoaHoc == widget.sessionId) {
        index = i;
        break;
      }
    }
    setState(() {
      isLoaded = true;
    });
  }

  final List<String> _payListDetail = [
    "Chờ duyệt",
    "Chờ gia sư",
    "Đang học",
    "Đã hoàn thành"
  ];
  @override
  Widget build(BuildContext context) {
    var subTimeCodeToString = [];
    var subTittle = [];
    for (int i = 0; i < sessionList.length; i++) {
      subTimeCodeToString
          .add(sessionTimeList[(sessionList[i].thoiKhoaBieu![0].maCaHoc! - 1)]);
    }
    for (int i = 0; i < sessionList.length; i++) {
      subTittle.add(_payListDetail[(sessionList[i].tinhTrang!)]);
    }
    final double maxHeight = MediaQuery.of(context).size.height;
    final double maxWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: isLoaded
            ? SizedBox(
                height: maxHeight * 0.971,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: maxWidth * 0.05),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(top: maxHeight * 0.005),
                            child: Row(
                              children: [
                                IconButton(
                                  icon: const Icon(Icons.arrow_back_ios,
                                      color: AppColors.black),
                                  highlightColor: Colors.transparent,
                                  splashColor: Colors.transparent,
                                  onPressed: () {
                                    Get.back();
                                  },
                                ),
                                Text(
                                  Dimens.sessionDetail,
                                  style: AppTextStyle.titleLarge
                                      .copyWith(fontSize: 32),
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            height: maxHeight * 0.01,
                          ),
                          Row(
                            children: [
                              const Text(Dimens.sessionId,
                                  style: AppTextStyle.calenderDetailBoldText),
                              const SizedBox(
                                width: Dimens.WIDTH_5,
                              ),
                              Text(
                                "#${sessionList[index].maKhoaHoc.toString()}",
                                style: AppTextStyle.calenderDetailDarkText,
                              )
                            ],
                          ),
                          SizedBox(
                            height: maxHeight * 0.01,
                          ),
                          Row(
                            children: [
                              const Text(Dimens.subject,
                                  style: AppTextStyle.calenderDetailBoldText),
                              const SizedBox(
                                width: Dimens.WIDTH_5,
                              ),
                              Text(
                                sessionList[index].tenMonHoc!,
                                style: AppTextStyle.calenderDetailDarkText,
                              )
                            ],
                          ),
                          SizedBox(
                            height: maxHeight * 0.01,
                          ),
                          Row(
                            children: [
                              const Text(Dimens.classRoom,
                                  style: AppTextStyle.calenderDetailBoldText),
                              const SizedBox(
                                width: Dimens.WIDTH_5,
                              ),
                              Text(
                                sessionList[index].khoiLop!.toString(),
                                style: AppTextStyle.calenderDetailDarkText,
                              )
                            ],
                          ),
                          SizedBox(
                            height: maxHeight * 0.01,
                          ),
                          Row(
                            children: [
                              const Text(Dimens.inputDay,
                                  style: AppTextStyle.calenderDetailBoldText),
                              const SizedBox(
                                width: Dimens.WIDTH_5,
                              ),
                              Text(
                                DateFormat('dd/MM/yyyy').format(
                                    sessionList[index].ngayDangKy ??
                                        DateTime.now()),
                                style: AppTextStyle.calenderDetailDarkText,
                              )
                            ],
                          ),
                          SizedBox(
                            height: maxHeight * 0.01,
                          ),
                          Row(
                            children: [
                              const Text(Dimens.startDay,
                                  style: AppTextStyle.calenderDetailBoldText),
                              const SizedBox(
                                width: Dimens.WIDTH_5,
                              ),
                              Text(
                                sessionList[index].ngayBatDau != null
                                    ? DateFormat('dd/MM/yyyy').format(
                                        sessionList[index].ngayBatDau ??
                                            DateTime.now())
                                    : "Chưa bắt đầu!",
                                style: AppTextStyle.calenderDetailDarkText,
                              )
                            ],
                          ),
                          SizedBox(
                            height: maxHeight * 0.01,
                          ),
                          Row(
                            children: [
                              const Text(Dimens.learningTime,
                                  style: AppTextStyle.calenderDetailBoldText),
                              const SizedBox(
                                width: Dimens.WIDTH_5,
                              ),
                              Text(
                                subTimeCodeToString[index],
                                style: AppTextStyle.calenderDetailDarkText,
                              )
                            ],
                          ),
                          SizedBox(
                            height: maxHeight * 0.01,
                          ),
                          Row(
                            children: [
                              const Text(Dimens.learningDay,
                                  style: AppTextStyle.calenderDetailBoldText),
                              const SizedBox(
                                width: Dimens.WIDTH_5,
                              ),
                              Text(
                                sessionList[index].thoiKhoaBieuTomTat?.tenThu ??
                                    "",
                                style: AppTextStyle.calenderDetailDarkText,
                              )
                            ],
                          ),
                          SizedBox(
                            height: maxHeight * 0.01,
                          ),
                          const Text(Dimens.learningPlace,
                              style: AppTextStyle.calenderDetailBoldText),
                          SizedBox(
                            height: maxHeight * 0.01,
                          ),
                          Text(sessionList[index].diaChi!,
                              style: AppTextStyle.calenderDetailBoldText),
                          SizedBox(
                            height: maxHeight * 0.01,
                          ),
                          Row(
                            children: [
                              const Text(Dimens.tutor,
                                  style: AppTextStyle.calenderDetailBoldText),
                              const SizedBox(
                                width: Dimens.WIDTH_5,
                              ),
                              Text(
                                sessionList[index].maGiaSu != null
                                    ? sessionList[index].maGiaSu.toString()
                                    : "Đang chờ",
                                style: AppTextStyle.calenderDetailDarkText,
                              )
                            ],
                          ),
                          SizedBox(
                            height: maxHeight * 0.01,
                          ),
                          Row(
                            children: [
                              const Text("${Dimens.chooseFee}: ",
                                  style: AppTextStyle.calenderDetailBoldText),
                              const SizedBox(
                                width: Dimens.WIDTH_5,
                              ),
                              Text(
                                "${numberWithDot(sessionList[index].soTien.toString())} VNĐ",
                                style: AppTextStyle.calenderDetailBoldText,
                              ),
                              const SizedBox(
                                width: Dimens.WIDTH_10,
                              ),
                              IconButton(
                                  onPressed: () {
                                    showDialog(
                                        context: context,
                                        builder: (newContext) {
                                          return const PayInfoScreen();
                                        });
                                  },
                                  icon: const Icon(
                                    Icons.info_outlined,
                                    color: AppColors.redPink,
                                  ))
                            ],
                          ),
                          SizedBox(
                            height: maxHeight * 0.01,
                          ),
                          Row(
                            children: [
                              const Text(Dimens.status,
                                  style: AppTextStyle.calenderDetailBoldText),
                              const SizedBox(
                                width: Dimens.WIDTH_5,
                              ),
                              Text(
                                subTittle[index],
                                style: AppTextStyle.calenderDetailDarkText,
                              )
                            ],
                          ),
                          SizedBox(
                            height: maxHeight * 0.01,
                          ),
                          const Text("${Dimens.note}: ",
                              style: AppTextStyle.calenderDetailBoldText),
                          Text(
                            sessionList[index].ghiChu != null
                                ? sessionList[index].ghiChu.toString()
                                : "Không",
                            style: AppTextStyle.calenderDetailBoldText,
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 0),
                      child: GestureDetector(
                          onTap: () async {
                            _dismissDialog() {
                              Get.back();
                            }

                            showDialog(
                                context: context,
                                builder: (newContext) {
                                  return AlertDialog(
                                    title: Text('Thông báo'),
                                    content: Text('Xác nhận hủy đăng ký?'),
                                    actions: <Widget>[
                                      TextButton(
                                        onPressed: () {
                                          _dismissDialog();
                                          setState(() {});
                                        },
                                        child: Text('Không'),
                                      ),
                                      TextButton(
                                        onPressed: () async {
                                          bool isDeleted = await deleteSession(
                                              BaseSharedPreferences.getString(
                                                  'token'),
                                              widget.sessionId);
                                          _dismissDialog();
                                          Get.offAll(Student1());
                                        },
                                        child: Text('Có'),
                                      ),
                                    ],
                                  );
                                });
                          },
                          child: Container(
                            padding: const EdgeInsets.all(Dimens.PADDING_20),
                            color: AppColors.redPink,
                            child: const Center(
                                child: Text(
                              Dimens.deleteSession,
                              style: AppTextStyle.changePassText,
                            )),
                          )),
                    ),
                  ],
                ),
              )
            : SizedBox(
                width: maxWidth,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: maxHeight * 0.3),
                    const CircularProgressIndicator(),
                  ],
                ),
              ),
      )),
    );
  }
}
