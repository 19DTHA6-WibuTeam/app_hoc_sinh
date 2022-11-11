import 'package:doan_chuyen_nganh/UI/session/session_detail/session_child_01_detail.dart';
import 'package:doan_chuyen_nganh/api/session.dart';
import 'package:doan_chuyen_nganh/api/subject.dart';
import 'package:doan_chuyen_nganh/api/user.dart';
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

class SessionChild0 extends StatefulWidget {
  const SessionChild0({super.key});

  @override
  State<SessionChild0> createState() => _SessionChild0State();
}

class _SessionChild0State extends State<SessionChild0> {
  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((_) {
      _getData();
    });
  }

  List<Datum> sessionList = [];
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
    setState(() {
      isLoaded = true;
    });
  }

  final List<Color> _colorsList = [
    AppColors.redPink,
    AppColors.orange,
    AppColors.primary,
    AppColors.green
  ];
  final List<String> _payListDetail = [
    "Chờ duyệt",
    "Chờ gia sư",
    "Đang học",
    "Đã hoàn thành"
  ];
  @override
  Widget build(BuildContext context) {
    var subTimeCodeToString = [];
    List<Color> subColor = [];
    var subTittle = [];

    for (int i = 0; i < sessionList.length; i++) {
      subTimeCodeToString
          .add(sessionTimeList[(sessionList[i].thoiKhoaBieu![0].maCaHoc! - 1)]);
    }
    for (int i = 0; i < sessionList.length; i++) {
      subColor.add(_colorsList[(sessionList[i].tinhTrang!)]);
    }
    for (int i = 0; i < sessionList.length; i++) {
      subTittle.add(_payListDetail[(sessionList[i].tinhTrang!)]);
    }
    final double maxHeight = MediaQuery.of(context).size.height;
    final double maxWidth = MediaQuery.of(context).size.width;
    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
        child: Visibility(
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
          child: Column(
            children: [
              SizedBox(
                height: maxHeight * 0.01,
              ),
              for (int i = 0; i < sessionList.length; i++)
                sessionList[i].tinhTrang == 0
                    ? GestureDetector(
                        onTap: () {
                          Get.to(
                            SessionChild01Detail(
                              sessionId: sessionList[i].maKhoaHoc!,
                            ),
                          );
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
                              color: subColor[i]),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text(
                                    sessionList[i].tenMonHoc ?? "",
                                    style: AppTextStyle.chooseText.copyWith(
                                        fontSize: maxWidth * 0.07,
                                        fontWeight: FontWeight.bold,
                                        color: AppColors.white),
                                  ),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        "Ngày đăng ký: ",
                                        style: AppTextStyle.chooseText.copyWith(
                                            fontSize: maxWidth * 0.05),
                                      ),
                                      const SizedBox(
                                        width: 2,
                                      ),
                                      Text(
                                        DateFormat('dd/MM/yyyy').format(
                                            sessionList[i].ngayDangKy ??
                                                DateTime.now()),
                                        style: AppTextStyle.chooseText.copyWith(
                                            fontSize: maxWidth * 0.05),
                                      )
                                    ],
                                  ),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        "Thời gian học: ",
                                        style: AppTextStyle.chooseText.copyWith(
                                            fontSize: maxWidth * 0.05),
                                      ),
                                      const SizedBox(
                                        width: 2,
                                      ),
                                      Text(
                                        subTimeCodeToString[i],
                                        style: AppTextStyle.chooseText.copyWith(
                                            fontSize: maxWidth * 0.05),
                                      )
                                    ],
                                  ),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        "Học phí: ",
                                        style: AppTextStyle.chooseText.copyWith(
                                            fontSize: maxWidth * 0.05),
                                      ),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      Text(
                                        "${numberWithDot(sessionList[i].soTien.toString())} VNĐ",
                                        style: AppTextStyle.chooseText.copyWith(
                                            fontSize: maxWidth * 0.05),
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
                                      subTittle[i],
                                      style: AppTextStyle.chooseText
                                          .copyWith(fontSize: maxWidth * 0.05),
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      )
                    : SizedBox()
            ],
          ),
        ),
      ),
    ));
  }
}
