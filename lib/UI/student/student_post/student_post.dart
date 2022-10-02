import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class StudentPost extends StatefulWidget {
  const StudentPost({super.key});

  @override
  State<StudentPost> createState() => _StudentPostState();
}

class _StudentPostState extends State<StudentPost> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text("Student Post")),
    );
  }
}
