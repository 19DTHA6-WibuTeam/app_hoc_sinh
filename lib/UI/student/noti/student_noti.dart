import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class StudentNoti extends StatefulWidget {
  const StudentNoti({super.key});

  @override
  State<StudentNoti> createState() => _StudentNotiState();
}

class _StudentNotiState extends State<StudentNoti> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text("student noti")),
    );
  }
}
