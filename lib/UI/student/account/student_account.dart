import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class StudentAccount extends StatefulWidget {
  const StudentAccount({super.key});

  @override
  State<StudentAccount> createState() => _StudentAccountState();
}

class _StudentAccountState extends State<StudentAccount> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text("Student Account")),
    );
  }
}
