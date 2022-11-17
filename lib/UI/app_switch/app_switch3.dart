import 'package:doan_chuyen_nganh/UI/account/student_account.dart';
import 'package:doan_chuyen_nganh/UI/calender/calender_home/student_calender.dart';
import 'package:doan_chuyen_nganh/UI/home_page/student_home.dart';
import 'package:doan_chuyen_nganh/UI/session/session_home/student_session.dart';
import 'package:doan_chuyen_nganh/theme/colors.dart';
import 'package:flutter/material.dart';

class Tutor3 extends StatefulWidget {
  Tutor3({Key? key}) : super(key: key);

  @override
  _Tutor3State createState() => _Tutor3State();
}

class _Tutor3State extends State<Tutor3> {
  int _bottomNavIndex = 3;

  final List<Widget> _widgetOptions = const <Widget>[
    StudentHome(),
    StudentCalender(),
    StudentSeesion(),
    StudentAccount()
  ];

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
            label: 'Lịch dạy',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.local_activity),
            label: 'Lớp',
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
