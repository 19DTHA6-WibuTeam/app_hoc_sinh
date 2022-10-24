import 'package:doan_chuyen_nganh/UI/student/home/Components/tutor_card.dart';
import 'package:doan_chuyen_nganh/UI/student/student_post/student_post.dart';
import 'package:doan_chuyen_nganh/theme/colors.dart';
import 'package:doan_chuyen_nganh/theme/dimens.dart';
import 'package:doan_chuyen_nganh/widget/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';

class StudentHome extends StatefulWidget {
  const StudentHome({super.key});

  @override
  State<StudentHome> createState() => _StudentHomeState();
}

class _StudentHomeState extends State<StudentHome> {
  final TextEditingController _searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final double mainWidth = MediaQuery.of(context).size.width;
    final double mainHeight = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
            child: Column(
          children: [
            Row(
              children: [
                SizedBox(
                  height: mainHeight * 0.1,
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: Dimens.PADDING_15,
                        top: Dimens.PADDING_20,
                        right: Dimens.PADDING_10,
                        bottom: Dimens.PADDING_10),
                    child: Container(
                      height: mainHeight * 0.06,
                      width: mainWidth * 0.7,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: const Color(0xFFEFEFF4),
                        borderRadius: BorderRadius.circular(Dimens.RADIUS_10),
                      ),
                      child: TextFormField(
                        controller: _searchController,
                        style: Theme.of(context).textTheme.titleMedium,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          prefixIcon: const Icon(
                            Icons.search,
                            color: Color(0xFF8A8A8F),
                          ),
                          hintText: Dimens.search,
                          hintStyle: Theme.of(context).textTheme.titleMedium,
                        ),
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: (() {
                    Get.to(const StudentPost());
                  }),
                  child: Padding(
                    padding: const EdgeInsets.only(
                        top: Dimens.PADDING_20, bottom: Dimens.PADDING_10),
                    child: Container(
                      width: mainWidth * 0.22,
                      height: mainHeight * 0.06,
                      decoration: BoxDecoration(
                          color: AppColors.primary,
                          borderRadius:
                              BorderRadius.circular(Dimens.RADIUS_10)),
                      child: Center(
                        child: Text(
                          "Đăng bài",
                          style: AppTextStyle.titleSmall.copyWith(
                              color: AppColors.white,
                              fontSize: mainWidth * 0.05),
                          overflow: TextOverflow.visible,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              //height: mainHeight * 0.8,
              width: mainWidth,
              child: StudentGridView(),
            )
          ],
        )),
      ),
    );
  }
}

class StudentGridView extends StatelessWidget {
  StudentGridView({Key? key}) : super(key: key);

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
                    child: TutorCard_Grid(listIndex: index),
                  ),
                ),
              );
            }),
      ),
    );
  }
}
