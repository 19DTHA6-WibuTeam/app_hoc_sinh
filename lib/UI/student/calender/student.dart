import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class StudentCalender extends StatefulWidget {
  const StudentCalender({super.key});

  @override
  State<StudentCalender> createState() => _StudentCalenderState();
}

class _StudentCalenderState extends State<StudentCalender> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text("Student Calender")),
    );
  }
}
