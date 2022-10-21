import 'package:doan_chuyen_nganh/theme/images.dart';
import 'package:flutter/material.dart';

class TutorCard_Grid extends StatefulWidget {
  int listIndex;

  TutorCard_Grid({
    Key? key,
    required this.listIndex,
  }) : super(key: key);

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
        onTap: () {},
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
                      fit: BoxFit.fill,
                      child: Image.asset(Images.imageDefault))),
            ),
            Padding(
                padding: const EdgeInsets.only(top: 5, right: 9),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Tutor Name",
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
                            "Subject",
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
                            '21 year olds',
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall
                                ?.copyWith(fontSize: 12),
                          ))
                    ],
                  ),
                  GenderIcon(gender: "Male"),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class GenderIcon extends StatefulWidget {
  String gender;

  GenderIcon({
    Key? key,
    required this.gender,
  }) : super(key: key);
  @override
  State<GenderIcon> createState() => _RenderGenderIconState();
}

class _RenderGenderIconState extends State<GenderIcon> {
  @override
  Widget build(BuildContext context) {
    String gender = widget.gender;

    return Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            border: Border.all(
                width: 0.5, color: const Color.fromARGB(26, 0, 0, 0))),
        child: Padding(
          padding: const EdgeInsets.all(1.9),
          child: gender == 'Male'
              ? const Icon(
                  Icons.male_rounded,
                  color: Colors.blue,
                  size: 18,
                )
              : const Icon(
                  Icons.female_rounded,
                  color: Colors.pink,
                  size: 18,
                ),
        ));
  }
}
