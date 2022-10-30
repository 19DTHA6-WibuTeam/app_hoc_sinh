import 'package:doan_chuyen_nganh/UI/student/pay_info/pay_info.dart';
import 'package:doan_chuyen_nganh/UI/student/session/session_detail/session_detail.dart';
import 'package:doan_chuyen_nganh/UI/student/session/session_home/session_child_0.dart';
import 'package:doan_chuyen_nganh/UI/student/session/session_home/session_child_1.dart';
import 'package:doan_chuyen_nganh/UI/student/session/session_home/session_child_all.dart';
import 'package:doan_chuyen_nganh/theme/colors.dart';
import 'package:doan_chuyen_nganh/theme/dimens.dart';
import 'package:doan_chuyen_nganh/widget/text_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StudentSeesion extends StatefulWidget {
  const StudentSeesion({super.key});

  @override
  State<StudentSeesion> createState() => _StudentSeesionState();
}

class _StudentSeesionState extends State<StudentSeesion> {
  final List<Color> _colorsList = [AppColors.green, AppColors.redPink];
  final List<bool> _payList = [true, false, true];
  final List<String> _payListDetail = ["Đã thanh toán", "Chưa thanh toán"];
  @override
  Widget build(BuildContext context) {
    return const SafeArea(
        child: DefaultTabController(
      length: 3,
      child: Scaffold(
          backgroundColor: AppColors.white,
          appBar: TabBar(
            physics: BouncingScrollPhysics(),
            isScrollable: true,
            indicatorColor: AppColors.primary,
            labelColor: AppColors.primary,
            unselectedLabelColor: AppColors.black,
            indicatorSize: TabBarIndicatorSize.label,
            tabs: [
              Tab(text: "Tất cả"),
              Tab(text: "Đã duyệt"),
              Tab(text: " Chưa duyệt"),
            ],
          ),
          body: TabBarView(
            physics: BouncingScrollPhysics(),
            children: [
              SessionChild(),
              SessionChild1(),
              SessionChild0(),
            ],
          )),
    ));
  }
}
