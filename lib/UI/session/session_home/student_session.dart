import 'package:doan_chuyen_nganh/UI/session/session_home/session_child_0.dart';
import 'package:doan_chuyen_nganh/UI/session/session_home/session_child_1.dart';
import 'package:doan_chuyen_nganh/UI/session/session_home/session_child_2.dart';
import 'package:doan_chuyen_nganh/UI/session/session_home/session_child_3.dart';
import 'package:doan_chuyen_nganh/theme/colors.dart';
import 'package:flutter/material.dart';

class StudentSeesion extends StatefulWidget {
  const StudentSeesion({super.key});

  @override
  State<StudentSeesion> createState() => _StudentSeesionState();
}

class _StudentSeesionState extends State<StudentSeesion> {
  @override
  Widget build(BuildContext context) {
    return const SafeArea(
        child: DefaultTabController(
      length: 4,
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
              Tab(text: "Đang học"),
              Tab(text: "Chờ gia sư"),
              Tab(text: "Chờ duyệt"),
              Tab(text: "Đã hoàn thành"),
            ],
          ),
          body: TabBarView(
            physics: BouncingScrollPhysics(),
            children: [
              SessionChild2(),
              SessionChild1(),
              SessionChild0(),
              SessionChild3(),
            ],
          )),
    ));
  }
}
