import 'package:doan_chuyen_nganh/UI/student/account/student_account.dart';
import 'package:doan_chuyen_nganh/UI/student/calender/calender_home/student_calender.dart';
import 'package:doan_chuyen_nganh/UI/student/home/student_home.dart';
import 'package:doan_chuyen_nganh/UI/student/session/session_home/student_session.dart';
import 'package:doan_chuyen_nganh/UI/student/student_post/student_post.dart';
import 'package:doan_chuyen_nganh/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class Student extends StatefulWidget {
  const Student({Key? key}) : super(key: key);

  @override
  _StudentState createState() => _StudentState();
}

class _StudentState extends State<Student> {
  int _bottomNavIndex = 0;

  final List<Widget> _widgetOptions = const <Widget>[
    StudentHome(),
    StudentCalender(),
    StudentSeesion(),
    StudentAccount()
  ];

  void reRender() {
    setState(() async {
      //navigateTo(context, const PageSwitch._internal());
    });
  }

  void _onItemTapped(int index) {
    setState(() {
      _bottomNavIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: _widgetOptions.elementAt(_bottomNavIndex)),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedFontSize: 12.0,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Trang chủ',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list_alt_rounded),
            label: 'Lịch học',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.local_activity),
            label: 'Khóa học',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Tài khoản',
          ),
        ],
        currentIndex: _bottomNavIndex,
        unselectedItemColor: const Color(0xFFDADADA),
        selectedItemColor: AppColors.primary,
        onTap: _onItemTapped,
      ),
    );
  }
}
