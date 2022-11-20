import 'package:cached_network_image/cached_network_image.dart';
import 'package:doan_chuyen_nganh/UI/account/controller/image_picker_controller.dart';
import 'package:doan_chuyen_nganh/widget/round_avatar.dart';
import 'package:doan_chuyen_nganh/UI/student_post/student_post.dart';
import 'package:doan_chuyen_nganh/UI/tutor_detail/tutor_detail.dart';
import 'package:doan_chuyen_nganh/api/user.dart';
import 'package:doan_chuyen_nganh/manager/shared_preferences.dart';
import 'package:doan_chuyen_nganh/models/user.dart';
import 'package:doan_chuyen_nganh/theme/colors.dart';
import 'package:doan_chuyen_nganh/theme/dimens.dart';
import 'package:doan_chuyen_nganh/theme/images.dart';
import 'package:doan_chuyen_nganh/widget/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';

class StudentHome extends StatefulWidget {
  const StudentHome({super.key});

  @override
  State<StudentHome> createState() => _StudentHomeState();
}

class _StudentHomeState extends State<StudentHome> {
  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((_) {
      _getData();
    });
  }

  String name = '';
  String avatar = '';
  final ProfileController controller = ProfileController();
  var isLoaded = false;
  List<User> tutorList = [];
  Future<void> _getData() async {
    tutorList = (await getTutorList(BaseSharedPreferences.getString('token')))!;
    var user = await getUser(BaseSharedPreferences.getString('MaNguoiDung'),
        BaseSharedPreferences.getString('token'));
    name = user!.user_fullname ?? Dimens.student;
    controller.imageURL = user.avatar ?? '';
    setState(() {
      isLoaded = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    final double mainWidth = MediaQuery.of(context).size.width;
    final double mainHeight = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
            child: Visibility(
          visible: isLoaded,
          replacement: SizedBox(
            width: mainWidth,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: mainHeight * 0.3),
                const CircularProgressIndicator(),
              ],
            ),
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            left: Dimens.PADDING_10,
                            top: Dimens.PADDING_20,
                            right: Dimens.PADDING_10,
                            bottom: Dimens.PADDING_20),
                        child: SizedBox(
                          height: mainWidth * 0.17,
                          width: mainWidth * 0.17,
                          child: Obx(() {
                            if (controller.isLoading.value) {
                              return const CircleAvatar(
                                backgroundImage:
                                    AssetImage(Images.imageDefault),
                                child: Center(
                                    child: CircularProgressIndicator(
                                  backgroundColor: Colors.white,
                                )),
                              );
                            } else {
                              if (controller.imageURL.length != 0) {
                                return CachedNetworkImage(
                                  imageUrl: controller.imageURL,
                                  fit: BoxFit.cover,
                                  imageBuilder: (context, imageProvider) =>
                                      CircleAvatar(
                                    backgroundColor: Colors.white,
                                    backgroundImage: imageProvider,
                                  ),
                                  placeholder: (context, url) =>
                                      const CircleAvatar(
                                    backgroundImage:
                                        AssetImage(Images.imageDefault),
                                    child: Center(
                                        child: CircularProgressIndicator(
                                      backgroundColor: Colors.white,
                                    )),
                                  ),
                                  errorWidget: (context, url, error) =>
                                      const Icon(Icons.error),
                                );
                              } else {
                                return const CircleAvatar(
                                  backgroundImage:
                                      AssetImage(Images.imageDefault),
                                );
                              }
                            }
                          }),
                        ),
                      ),
                      SizedBox(
                        child: Padding(
                          padding: const EdgeInsets.only(
                              //left: Dimens.PADDING_15,
                              top: Dimens.PADDING_20,
                              right: Dimens.PADDING_10,
                              bottom: Dimens.PADDING_10),
                          child: Container(
                            alignment: Alignment.center,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  Dimens.hello,
                                  style: AppTextStyle.titleLarge
                                      .copyWith(fontSize: mainWidth * 0.06),
                                ),
                                Text(
                                  name,
                                  style: AppTextStyle.titleSmall
                                      .copyWith(fontSize: mainWidth * 0.04),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  GestureDetector(
                    onTap: (() {
                      Get.to(const StudentPost());
                    }),
                    child: Padding(
                      padding: const EdgeInsets.only(
                          right: Dimens.PADDING_10,
                          top: Dimens.PADDING_20,
                          bottom: Dimens.PADDING_10),
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
                width: mainWidth,
                child: Container(
                  width: mainWidth * 0.9,
                  height: mainHeight * 0.8,
                  padding: EdgeInsets.symmetric(horizontal: mainWidth * 0.01),
                  child: GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              childAspectRatio: 0.75,
                              mainAxisSpacing: 5,
                              crossAxisSpacing: 5,
                              crossAxisCount: 2),
                      itemCount: tutorList.length,
                      itemBuilder: (BuildContext context, int index) {
                        return AnimationConfiguration.staggeredGrid(
                          columnCount: 2,
                          position: index,
                          child: ScaleAnimation(
                            child: FadeInAnimation(
                                delay: const Duration(milliseconds: 100),
                                child: Container(
                                  decoration:
                                      const BoxDecoration(color: Colors.white),
                                  padding: EdgeInsets.symmetric(
                                      horizontal: mainWidth * 0.02),
                                  child: GestureDetector(
                                    onTap: () {
                                      Get.to(TutorDetail(
                                        tutorId: tutorList[index].user_id,
                                      ));
                                    },
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        tutorList[index].avatar != null
                                            ? ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                                child: SizedBox(
                                                    width: mainWidth * 0.7,
                                                    height: mainHeight * 0.22,
                                                    child: FittedBox(
                                                        fit: BoxFit.fill,
                                                        child: Image.network(
                                                            tutorList[index]
                                                                .avatar!))),
                                              )
                                            : ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                                child: SizedBox(
                                                    width: mainWidth * 0.7,
                                                    height: mainHeight * 0.22,
                                                    child: FittedBox(
                                                        fit: BoxFit.fill,
                                                        child: Image.asset(Images
                                                            .imageDefault))),
                                              ),
                                        Padding(
                                            padding: const EdgeInsets.only(
                                                top: 5, right: 9),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  tutorList[index]
                                                      .user_fullname!,
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .titleLarge
                                                      ?.copyWith(
                                                          fontSize: 12.3,
                                                          fontWeight:
                                                              FontWeight.w500),
                                                ),
                                              ],
                                            )),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(top: 8.0),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Align(
                                                  alignment:
                                                      Alignment.centerLeft,
                                                  child: Text(
                                                    '${(DateTime.now().year - int.parse(tutorList[index].user_birthday!.substring(0, 4))).toString()} tuổi',
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .titleSmall
                                                        ?.copyWith(
                                                            fontSize: 12),
                                                  )),
                                              Container(
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              100),
                                                      border: Border.all(
                                                          width: 0.5,
                                                          color: const Color
                                                                  .fromARGB(
                                                              26, 0, 0, 0))),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            1.9),
                                                    child: tutorList[index]
                                                                .user_gender ==
                                                            1
                                                        ? const Icon(
                                                            Icons.male_rounded,
                                                            color: Colors.blue,
                                                            size: 18,
                                                          )
                                                        : const Icon(
                                                            Icons
                                                                .female_rounded,
                                                            color: Colors.pink,
                                                            size: 18,
                                                          ),
                                                  )),
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                )),
                          ),
                        );
                      }),
                ),
              ),
              const SizedBox(height: Dimens.HEIGHT_50),
            ],
          ),
        )),
      ),
    );
  }
}
