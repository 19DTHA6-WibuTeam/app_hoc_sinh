import 'package:doan_chuyen_nganh/UI/student/home/Components/gender_icon.dart';
import 'package:doan_chuyen_nganh/UI/student/tutor_detail/tutor_detail.dart';
import 'package:doan_chuyen_nganh/theme/images.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TutorCard_Grid extends StatefulWidget {
  int listIndex;
  String avatar;
  String name;
  String gender;
  String subject;
  int age;
  int tutorId;

  TutorCard_Grid(
      {Key? key,
      required this.listIndex,
      required this.avatar,
      required this.gender,
      required this.name,
      required this.subject,
      required this.age,
      required this.tutorId})
      : super(key: key);

  @override
  State<TutorCard_Grid> createState() => _TutorCard_GridState();
}

class _TutorCard_GridState extends State<TutorCard_Grid> {
  @override
  Widget build(BuildContext context) {
    final double maxHeight = MediaQuery.of(context).size.height;
    final double maxWidth = MediaQuery.of(context).size.width;

    return Container(
      decoration: const BoxDecoration(color: Colors.white),
      padding: EdgeInsets.symmetric(horizontal: maxWidth * 0.02),
      child: GestureDetector(
        onTap: () {
          Get.to(TutorDetail(
            tutorId: widget.tutorId,
          ));
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: SizedBox(
                  width: maxWidth * 0.7,
                  height: maxHeight * 0.22,
                  child: FittedBox(
                      fit: BoxFit.fill, child: Image.asset(widget.avatar))),
            ),
            Padding(
                padding: const EdgeInsets.only(top: 5, right: 9),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      widget.name,
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          fontSize: 12.3, fontWeight: FontWeight.w500),
                    ),
                    // GenderIcon(gender: "Male"),
                  ],
                )),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            widget.subject,
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall
                                ?.copyWith(
                                    fontSize: 12,
                                    color: const Color(0xFF000000)),
                          )),
                      Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            '${widget.age} tuổi',
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall
                                ?.copyWith(fontSize: 12),
                          ))
                    ],
                  ),
                  GenderIcon(gender: widget.gender),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
