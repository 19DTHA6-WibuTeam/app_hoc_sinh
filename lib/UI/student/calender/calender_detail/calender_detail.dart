import 'package:doan_chuyen_nganh/theme/colors.dart';
import 'package:doan_chuyen_nganh/theme/dimens.dart';
import 'package:doan_chuyen_nganh/widget/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

class CalenderDetail extends StatelessWidget {
  const CalenderDetail({super.key});

  @override
  Widget build(BuildContext context) {
    final double maxHeight = MediaQuery.of(context).size.height;
    final double maxWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding:
              EdgeInsets.only(left: maxWidth * 0.05, top: maxHeight * 0.005),
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
                      Dimens.calenderDetail,
                      style: AppTextStyle.titleLarge.copyWith(fontSize: 32),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: maxHeight * 0.01,
              ),
              Row(
                children: const [
                  Text(Dimens.subject,
                      style: AppTextStyle.calenderDetailBoldText),
                  SizedBox(
                    width: Dimens.WIDTH_5,
                  ),
                  Text(
                    "Toán",
                    style: AppTextStyle.calenderDetailDarkText,
                  )
                ],
              ),
              SizedBox(
                height: maxHeight * 0.01,
              ),
              Row(
                children: const [
                  Text(Dimens.learningDay,
                      style: AppTextStyle.calenderDetailBoldText),
                  SizedBox(
                    width: Dimens.WIDTH_5,
                  ),
                  Text(
                    "24/10/2022",
                    style: AppTextStyle.calenderDetailDarkText,
                  )
                ],
              ),
              SizedBox(
                height: maxHeight * 0.01,
              ),
              Row(
                children: const [
                  Text(Dimens.learningTime,
                      style: AppTextStyle.calenderDetailBoldText),
                  SizedBox(
                    width: Dimens.WIDTH_5,
                  ),
                  Text(
                    "7:00 - 9:00",
                    style: AppTextStyle.calenderDetailDarkText,
                  )
                ],
              ),
              SizedBox(
                height: maxHeight * 0.01,
              ),
              Row(
                children: const [
                  Text(Dimens.learningForm,
                      style: AppTextStyle.calenderDetailBoldText),
                  SizedBox(
                    width: Dimens.WIDTH_5,
                  ),
                  Text(
                    "Offline",
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
              Text(
                  "54 đường 12D khu phố Chân Phúc Cẩm, phường Long Thạnh Mỹ, Quận 9 Thành Phố Hồ Chí Minh",
                  style: AppTextStyle.calenderDetailBoldText),
              SizedBox(
                height: maxHeight * 0.01,
              ),
              Row(
                children: const [
                  Text(Dimens.tutor,
                      style: AppTextStyle.calenderDetailBoldText),
                  SizedBox(
                    width: Dimens.WIDTH_5,
                  ),
                  Text(
                    "Nguyễn Văn A",
                    style: AppTextStyle.calenderDetailBoldText,
                  )
                ],
              ),
              SizedBox(
                height: maxHeight * 0.01,
              ),
              Row(
                children: const [
                  Text(Dimens.learningFee,
                      style: AppTextStyle.calenderDetailBoldText),
                  SizedBox(
                    width: Dimens.WIDTH_5,
                  ),
                  Text(
                    "500.000 VNĐ",
                    style: AppTextStyle.calenderDetailBoldText,
                  )
                ],
              ),
              SizedBox(
                height: maxHeight * 0.01,
              ),
              const Text("${Dimens.note}: ",
                  style: AppTextStyle.calenderDetailBoldText),
              Text(
                "Học sinh yêu cầu lịch học dời thành 8:00 - 10:00 so với đăng ký",
                style: AppTextStyle.calenderDetailBoldText,
              )
            ],
          ),
        ),
      )),
    );
  }
}
