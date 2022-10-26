import 'package:doan_chuyen_nganh/UI/student/home/Components/tutor_card.dart';
import 'package:doan_chuyen_nganh/theme/images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class StudentGridView extends StatelessWidget {
  StudentGridView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double mainWidth = MediaQuery.of(context).size.width;
    final double mainheight = MediaQuery.of(context).size.height;
    return SingleChildScrollView(
      child: Container(
        width: mainWidth * 0.9,
        height: mainheight * 0.8,
        padding: EdgeInsets.symmetric(horizontal: mainWidth * 0.01),
        child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                childAspectRatio: 0.75,
                mainAxisSpacing: 5,
                crossAxisSpacing: 5,
                crossAxisCount: 2),
            itemCount: 8,
            itemBuilder: (BuildContext context, int index) {
              return AnimationConfiguration.staggeredGrid(
                columnCount: 2,
                position: index,
                child: ScaleAnimation(
                  child: FadeInAnimation(
                    delay: const Duration(milliseconds: 100),
                    child: TutorCard_Grid(
                      listIndex: index,
                      age: 20,
                      avatar: Images.imageDefault,
                      subject: "Toán",
                      name: "Nguyễn Văn A",
                      gender: "Male",
                      tutorId: 1,
                    ),
                  ),
                ),
              );
            }),
      ),
    );
  }
}
