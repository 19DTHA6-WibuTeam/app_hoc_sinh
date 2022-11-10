import 'package:doan_chuyen_nganh/UI/sign_in/student_login.dart';
import 'package:doan_chuyen_nganh/api/register.dart';
import 'package:doan_chuyen_nganh/theme/colors.dart';
import 'package:doan_chuyen_nganh/theme/dimens.dart';
import 'package:doan_chuyen_nganh/theme/images.dart';
import 'package:doan_chuyen_nganh/widget/app_text_field.dart';
import 'package:doan_chuyen_nganh/widget/app_text_filed_pass.dart';
import 'package:doan_chuyen_nganh/widget/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passController = TextEditingController();
  final TextEditingController _rePassController = TextEditingController();
  List<String> genderList = ['Nữ', 'Nam'];
  String? dropdownValue;

  Rx<DateTime> pickedDate = DateTime.now().obs;
  @override
  Widget build(BuildContext context) {
    final double maxHeight = MediaQuery.of(context).size.height;
    final double maxWidth = MediaQuery.of(context).size.width;
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
                          Dimens.SignUpContinue,
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
                padding: const EdgeInsets.only(
                  left: Dimens.PADDING_20,
                  right: Dimens.PADDING_20,
                ),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(Dimens.RADIUS_15),
                    topLeft: Radius.circular(Dimens.RADIUS_15),
                  ),
                ),
                child: ListView(
                  physics: const ScrollPhysics(),
                  children: [
                    AppTextField(
                      labelText: Dimens.Name,
                      enabled: true,
                      obscureText: false,
                      controllerName: _nameController,
                    ),
                    const SizedBox(height: Dimens.HEIGHT_10),
                    AppTextField(
                      labelText: Dimens.address,
                      enabled: true,
                      obscureText: false,
                      controllerName: _addressController,
                    ),
                    const SizedBox(height: Dimens.HEIGHT_10),
                    AppTextField(
                      labelText: Dimens.Phone,
                      enabled: true,
                      obscureText: false,
                      controllerName: _phoneController,
                    ),
                    SizedBox(height: maxHeight * 0.005),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: Dimens.PADDING_5,
                        right: Dimens.PADDING_5,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            Dimens.birthday,
                            style:
                                AppTextStyle.titleSmall.copyWith(fontSize: 13),
                          ),
                          Text(
                            Dimens.gender,
                            style:
                                AppTextStyle.titleSmall.copyWith(fontSize: 13),
                          )
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: maxHeight * 0.08,
                          width: maxWidth * 0.52,
                          padding: EdgeInsets.only(
                              top: maxHeight * 0.005,
                              bottom: maxHeight * 0.005),
                          child: Container(
                            decoration: BoxDecoration(
                              color: AppColors.lightgray,
                              borderRadius:
                                  BorderRadius.circular(Dimens.RADIUS_10),
                            ),
                            child: Obx(
                              () => OutlinedButton(
                                style: OutlinedButton.styleFrom(
                                    side: const BorderSide(
                                        color: AppColors.transparent)),
                                onPressed: () {
                                  DatePicker.showDatePicker(context,
                                      showTitleActions: true,
                                      minTime: DateTime.now().subtract(
                                          const Duration(days: 365000)),
                                      maxTime: DateTime.now(),
                                      onConfirm: (date) {
                                    pickedDate.value = date;
                                  },
                                      currentTime: DateTime.now(),
                                      locale: LocaleType.vi);
                                },
                                child: Center(
                                  child: Text(
                                    DateFormat('dd/MM/yyyy')
                                        .format(pickedDate.value),
                                    style: AppTextStyle.titleSmall
                                        .copyWith(fontSize: 20),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                            height: maxHeight * 0.07,
                            width: maxWidth * 0.365,
                            child: Container(
                              decoration: BoxDecoration(
                                color: AppColors.lightgray,
                                borderRadius:
                                    BorderRadius.circular(Dimens.RADIUS_10),
                              ),
                              child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: Dimens.PADDING_20),
                                  child: DropdownButtonHideUnderline(
                                    child: DropdownButton<String>(
                                      isExpanded: true,
                                      hint: Text("Giới tính",
                                          style: AppTextStyle.style(
                                            color:
                                                Colors.black.withOpacity(0.8),
                                          )),
                                      value: dropdownValue,
                                      elevation: 16,
                                      onChanged: (String? newValue) {
                                        setState(() {
                                          dropdownValue = newValue!;
                                        });
                                      },
                                      items: genderList
                                          .map<DropdownMenuItem<String>>(
                                              (String value) {
                                        return DropdownMenuItem<String>(
                                          value: value,
                                          child: Text(value,
                                              style: AppTextStyle.style(
                                                color: Colors.black
                                                    .withOpacity(0.8),
                                              )),
                                        );
                                      }).toList(),
                                    ),
                                  )),
                            )),
                      ],
                    ),
                    SizedBox(height: maxHeight * 0.01),
                    AppTextField(
                      labelText: Dimens.Email,
                      enabled: true,
                      obscureText: false,
                      controllerName: _emailController,
                    ),
                    SizedBox(height: maxHeight * 0.01),
                    AppTextFieldPass(
                      labelText: Dimens.Password,
                      controllerName: _passController,
                    ),
                    const SizedBox(height: Dimens.HEIGHT_10),
                    AppTextFieldPass(
                      labelText: Dimens.rePass,
                      controllerName: _rePassController,
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.02),
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
                            Text(Dimens.SignUp,
                                style: AppTextStyle.style(
                                    fontSize: Dimens.TEXT_SIZE_20,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold)),
                          ],
                        ),
                        onPressed: () => {_signUpHandler()},
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          Dimens.YetAccount,
                          style: AppTextStyle.style(
                              fontSize: Dimens.TEXT_SIZE_14,
                              color: AppColors.black,
                              fontWeight: FontWeight.normal),
                        ),
                        GestureDetector(
                          onTap: () => {Get.back()},
                          child: Text(
                            Dimens.SignIn,
                            style: AppTextStyle.style(
                                color: AppColors.primary.withOpacity(0.8),
                                fontSize: Dimens.TEXT_SIZE_14),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: Dimens.HEIGHT_20),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _signUpHandler() async {
    if (_nameController.text.isEmpty ||
        _phoneController.text.isEmpty ||
        _addressController.text.isEmpty ||
        _passController.text.isEmpty) {
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Vui lòng nhập đầy đủ thông tin")));
    } else if (_passController.text.length < 6) {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Mật khẩu không thể ít hơn 6 ký tự")));
    } else if (_passController.text != _rePassController.text) {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Mật khẩu không trùng khớp")));
    } else {
      final birthday = pickedDate.value.toString().split(' ');
      String gender = "";
      if (dropdownValue == "Nữ") {
        gender = "0";
      } else {
        gender = "1";
      }
      bool? success = await fetchRegister(
          _nameController.text,
          _emailController.text,
          _passController.text,
          _addressController.text,
          birthday[0],
          gender,
          _phoneController.text);
      dismissDialog() {
        Get.back();
      }

      if (success == true) {
        showDialog(
            context: context,
            builder: (BuildContext context) => AlertDialog(
                    title: const Text(
                      Dimens.CreateDone,
                      style: TextStyle(fontSize: Dimens.TEXT_SIZE_14),
                    ),
                    content: const Text(
                      Dimens.SignInContinue,
                      style: TextStyle(fontSize: Dimens.TEXT_SIZE_14),
                    ),
                    actions: <Widget>[
                      TextButton(
                        onPressed: () {
                          dismissDialog();
                          Get.off(const StudentLoginScreen());
                        },
                        child: const Text('OK'),
                      ),
                    ]));
      } else {
        showDialog(
            context: context,
            builder: (BuildContext context) => AlertDialog(
                    title: const Text(
                      Dimens.createWrong,
                      style: TextStyle(fontSize: Dimens.TEXT_SIZE_14),
                    ),
                    actions: <Widget>[
                      TextButton(
                        onPressed: () {
                          dismissDialog();
                        },
                        child: const Text('Đóng'),
                      ),
                    ]));
      }
    }
  }
}
