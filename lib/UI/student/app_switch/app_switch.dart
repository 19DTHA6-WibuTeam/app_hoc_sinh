import 'package:doan_chuyen_nganh/UI/student/account/student_account.dart';
import 'package:doan_chuyen_nganh/UI/student/calender/student.dart';
import 'package:doan_chuyen_nganh/UI/student/home/student_home.dart';
import 'package:doan_chuyen_nganh/UI/student/noti/student_noti.dart';
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
    StudentPost(),
    StudentNoti(),
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
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list_alt_rounded),
            label: 'Calender',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add),
            label: 'Post',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'Notifications',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Account',
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
