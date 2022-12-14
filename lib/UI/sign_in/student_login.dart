import 'package:doan_chuyen_nganh/UI/app_switch/app_switch.dart';
import 'package:doan_chuyen_nganh/UI/sign_up/sign_up_screen.dart';
import 'package:doan_chuyen_nganh/api/login.dart';
import 'package:doan_chuyen_nganh/models/user.dart';
import 'package:doan_chuyen_nganh/theme/colors.dart';
import 'package:doan_chuyen_nganh/theme/dimens.dart';
import 'package:doan_chuyen_nganh/theme/images.dart';
import 'package:doan_chuyen_nganh/widget/app_text_field.dart';
import 'package:doan_chuyen_nganh/widget/app_text_filed_pass.dart';
import 'package:doan_chuyen_nganh/widget/text_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StudentLoginScreen extends StatefulWidget {
  const StudentLoginScreen({Key? key}) : super(key: key);

  @override
  State<StudentLoginScreen> createState() => _StudentLoginScreenState();
}

class _StudentLoginScreenState extends State<StudentLoginScreen> {
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

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
                    topRight: Radius.circular(Dimens.RADIUS_15),
                    topLeft: Radius.circular(Dimens.RADIUS_15),
                  ),
                ),
                child: Column(
                  children: [
                    AppTextField(
                      labelText: Dimens.Email,
                      enabled: true,
                      obscureText: false,
                      controllerName: _emailController,
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                    AppTextFieldPass(
                      labelText: Dimens.Password,
                      controllerName: _passwordController,
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.05),
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
                          onPressed: () async {
                            User? user = await fetchLogin(_emailController.text,
                                _passwordController.text);
                            if (user != null) {
                              saveLogin(user);
                              print(user.user_email);
                              Get.offAll(Student());
                            } else
                              print("something wrong");
                          }),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.04),
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
                          onTap: () {
                            Get.to(const SignUpScreen());
                          },
                          child: Text(
                            Dimens.SignUp,
                            style: AppTextStyle.style(
                                color: AppColors.primary.withOpacity(0.8),
                                fontSize: Dimens.TEXT_SIZE_14),
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
