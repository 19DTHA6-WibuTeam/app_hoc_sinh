import 'package:doan_chuyen_nganh/UI/student/app_switch/app_switch.dart';
import 'package:doan_chuyen_nganh/UI/student/sign_up/sign_up_screen.dart';
import 'package:doan_chuyen_nganh/theme/colors.dart';
import 'package:doan_chuyen_nganh/theme/dimens.dart';
import 'package:doan_chuyen_nganh/theme/images.dart';
import 'package:doan_chuyen_nganh/widget/app_text_field.dart';
import 'package:doan_chuyen_nganh/widget/app_text_filed_pass.dart';
import 'package:doan_chuyen_nganh/widget/text_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../sign_in_first_screen.dart';

class StudentLoginScreen extends StatefulWidget {
  const StudentLoginScreen({Key? key}) : super(key: key);

  @override
  State<StudentLoginScreen> createState() => _StudentLoginScreenState();
}

class _StudentLoginScreenState extends State<StudentLoginScreen> {
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: AppColors.white,
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
                    Positioned(
                        top: MediaQuery.of(context).size.height * 0.05,
                        child: IconButton(
                          icon:
                              const Icon(Icons.arrow_back, color: Colors.white),
                          onPressed: () {
                            Get.offAll(const SignInFirstScreen());
                          },
                        )),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: Dimens.PADDING_10, bottom: Dimens.PADDING_10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            Dimens.welcomeStudent,
                            style: AppTextStyle.style(
                                fontSize: Dimens.TEXT_SIZE_22,
                                fontWeight: FontWeight.w600),
                          ),
                          Text(
                            Dimens.SignInContinue,
                            style: AppTextStyle.style(
                                fontSize: Dimens.TEXT_SIZE_20,
                                color: Colors.white.withOpacity(0.65),
                                fontWeight: FontWeight.w300),
                          )
                        ],
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
                  child: Column(
                    children: [
                      AppTextField(
                        labelText: Dimens.Phone,
                        obscureText: false,
                        controllerName: _phoneController,
                      ),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.02),
                      AppTextFieldPass(
                        labelText: Dimens.Password,
                        controllerName: _passwordController,
                      ),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.05),
                      SizedBox(
                        height: Dimens.HEIGHT_55,
                        //padding: const EdgeInsets.fromLTRB(12, 8, 12, 16),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              primary: AppColors.primary,
                              shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.circular(Dimens.RADIUS_10),
                              )),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(Dimens.SignIn,
                                  style: AppTextStyle.style(
                                      fontSize: Dimens.TEXT_SIZE_20,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold)),
                            ],
                          ),
                          onPressed: () => {Get.offAll(const Student())},
                        ),
                      ),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.04),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            Dimens.NotAccount,
                            style: AppTextStyle.style(
                                fontSize: Dimens.TEXT_SIZE_14,
                                color: AppColors.black,
                                fontWeight: FontWeight.normal),
                          ),
                          GestureDetector(
                            onTap: () => {Get.to(const SignUpScreen())},
                            child: Text(
                              Dimens.SignUp,
                              style: AppTextStyle.style(
                                  color: AppColors.primary.withOpacity(0.8),
                                  fontSize: Dimens.TEXT_SIZE_14),
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.02),
                      Container(
                        margin: EdgeInsets.symmetric(
                            vertical:
                                MediaQuery.of(context).size.height * 0.02),
                        width: MediaQuery.of(context).size.width * 0.8,
                        child: Row(
                          children: const <Widget>[
                            Expanded(
                              child: Divider(
                                color: AppColors.dark,
                                height: 1.5,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: Dimens.PADDING_10),
                              child: Text(
                                "OR",
                                style: TextStyle(
                                  color: AppColors.primary,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            Expanded(
                              child: Divider(
                                color: AppColors.dark,
                                height: 1.5,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: Dimens.HEIGHT_55,
                        //padding: const EdgeInsets.fromLTRB(12, 8, 12, 16),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              primary: AppColors.primary,
                              shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.circular(Dimens.RADIUS_10),
                              )),
                          child: Stack(
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.all(Dimens.PADDING_10),
                                child: Image.asset(Images.iconGoogle,
                                    width: Dimens.ICON_SIZE_32),
                              ),
                              Center(
                                child: Text(
                                  Dimens.SignInWithGG,
                                  style: AppTextStyle.style(
                                      fontSize: Dimens.TEXT_SIZE_18,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                            ],
                          ),
                          onPressed: () => {},
                        ),
                      ),
                    ],
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
