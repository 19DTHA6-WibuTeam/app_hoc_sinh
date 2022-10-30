import 'package:doan_chuyen_nganh/UI/student/pay_info/pay_info.dart';
import 'package:doan_chuyen_nganh/UI/student/session/session_detail/session_detail.dart';
import 'package:doan_chuyen_nganh/theme/colors.dart';
import 'package:doan_chuyen_nganh/theme/dimens.dart';
import 'package:doan_chuyen_nganh/widget/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

class SessionChild extends StatefulWidget {
  const SessionChild({super.key});

  @override
  State<SessionChild> createState() => _SessionChildState();
}

class _SessionChildState extends State<SessionChild> {
  final List<Color> _colorsList = [AppColors.green, AppColors.redPink];
  final List<bool> _payList = [true, false, true];
  final List<String> _payListDetail = ["Đã duyệt", "Chưa duyệt"];
  @override
  Widget build(BuildContext context) {
    final double maxHeight = MediaQuery.of(context).size.height;
    final double maxWidth = MediaQuery.of(context).size.width;
    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: maxHeight * 0.01,
            ),
            for (int i = 0; i < 3; i++)
              GestureDetector(
                onTap: () {
                  if (_payList[i] == false) {
                    Get.to(const PayInfoScreen());
                  } else if (_payList[i] == true) {
                    Get.to(const SessionDetail());
                  }
                },
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: maxWidth * 0.05),
                  margin: EdgeInsets.only(
                      bottom: maxHeight * 0.01,
                      right: maxWidth * 0.02,
                      left: maxWidth * 0.02),
                  width: maxWidth,
                  height: maxHeight * 0.2,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(Dimens.RADIUS_15),
                      color: _payList[i] ? _colorsList[0] : _colorsList[1]),
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
                              Text(
                                "Ngày bắt đầu: ",
                                style: AppTextStyle.chooseText
                                    .copyWith(fontSize: maxWidth * 0.05),
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Text(
                                "24/10/2022",
                                style: AppTextStyle.chooseText
                                    .copyWith(fontSize: maxWidth * 0.05),
                              )
                            ],
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                "Thời gian học: ",
                                style: AppTextStyle.chooseText
                                    .copyWith(fontSize: maxWidth * 0.05),
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
                              Text(
                                "Gia sư: ",
                                style: AppTextStyle.chooseText
                                    .copyWith(fontSize: maxWidth * 0.05),
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Text(
                                "Nguyễn Văn A",
                                style: AppTextStyle.chooseText
                                    .copyWith(fontSize: maxWidth * 0.05),
                              )
                            ],
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                "Học phí: ",
                                style: AppTextStyle.chooseText
                                    .copyWith(fontSize: maxWidth * 0.05),
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Text(
                                "500.000 VNĐ",
                                style: AppTextStyle.chooseText
                                    .copyWith(fontSize: maxWidth * 0.05),
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
                          _payList[i]
                              ? RotatedBox(
                                  quarterTurns: 3,
                                  child: Text(
                                    _payListDetail[0],
                                    style: AppTextStyle.chooseText
                                        .copyWith(fontSize: maxWidth * 0.05),
                                  ),
                                )
                              : RotatedBox(
                                  quarterTurns: 3,
                                  child: Text(
                                    _payListDetail[1],
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
          ],
        ),
      ),
    ));
  }
}
