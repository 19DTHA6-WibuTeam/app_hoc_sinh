import 'package:doan_chuyen_nganh/UI/student/sign_in/student_login.dart';
import 'package:doan_chuyen_nganh/UI/tutor/sign_in/tutor_login.dart';
import 'package:doan_chuyen_nganh/theme/colors.dart';
import 'package:doan_chuyen_nganh/theme/dimens.dart';
import 'package:doan_chuyen_nganh/theme/images.dart';
import 'package:doan_chuyen_nganh/widget/text_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignInFirstScreen extends StatefulWidget {
  const SignInFirstScreen({Key? key}) : super(key: key);

  @override
  State<SignInFirstScreen> createState() => _SignInFirstScreenState();
}

class _SignInFirstScreenState extends State<SignInFirstScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [AppColors.primaryLight, AppColors.primary]),
          ),
          child: Expanded(
            child: Column(
              children: [
                Stack(
                  alignment: Alignment.bottomLeft,
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.35,
                      child: Image.asset(Images.imageSplash),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: Dimens.PADDING_10, bottom: Dimens.PADDING_10),
                      child: Text(
                        Dimens.Welcome,
                        style: AppTextStyle.style(
                            fontSize: Dimens.TEXT_SIZE_40,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  ],
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.65,
                  padding: const EdgeInsets.all(Dimens.PADDING_20),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(Dimens.RADIUS_38),
                      topLeft: Radius.circular(Dimens.RADIUS_38),
                    ),
                  ),
                  child: Expanded(
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            Dimens.youAre,
                            style: AppTextStyle.style(
                                fontSize: Dimens.TEXT_SIZE_32,
                                fontWeight: FontWeight.w600,
                                color: AppColors.dark),
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.1,
                        ),
                        Container(
                          height: MediaQuery.of(context).size.height * 0.15,
                          padding: const EdgeInsets.fromLTRB(12, 8, 12, 16),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                primary: AppColors.primary,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(16.0),
                                )),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Text(Dimens.student,
                                    style: AppTextStyle.chooseText),
                              ],
                            ),
                            onPressed: () =>
                                {Get.to(const StudentLoginScreen())},
                          ),
                        ),
                        Text(
                          Dimens.Or,
                          style: AppTextStyle.style(
                              fontSize: Dimens.TEXT_SIZE_22,
                              fontWeight: FontWeight.w600,
                              color: AppColors.dark),
                        ),
                        Container(
                          height: MediaQuery.of(context).size.height * 0.15,
                          padding: const EdgeInsets.fromLTRB(12, 8, 12, 16),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                primary: AppColors.primary,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(16.0),
                                )),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Text(Dimens.tutor,
                                    style: AppTextStyle.chooseText),
                              ],
                            ),
                            onPressed: () => {Get.to(const TutorLoginScreen())},
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
