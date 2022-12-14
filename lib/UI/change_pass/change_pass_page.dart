import 'package:doan_chuyen_nganh/UI/sign_in/student_login.dart';
import 'package:doan_chuyen_nganh/api/logout.dart';
import 'package:doan_chuyen_nganh/api/user.dart';
import 'package:doan_chuyen_nganh/manager/shared_preferences.dart';
import 'package:doan_chuyen_nganh/theme/colors.dart';
import 'package:doan_chuyen_nganh/theme/dimens.dart';
import 'package:doan_chuyen_nganh/widget/app_text_filed_pass.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:get/get.dart';

import '../../../widget/text_style.dart';

class ChangePassPage extends StatefulWidget {
  const ChangePassPage({super.key});

  @override
  State<ChangePassPage> createState() => _ChangePassPageState();
}

final TextEditingController _oldPasswordController = TextEditingController();
final TextEditingController _newPasswordController = TextEditingController();
final TextEditingController _repeatPasswordController = TextEditingController();

class _ChangePassPageState extends State<ChangePassPage> {
  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      await _getData();
    });
  }

  @override
  Widget build(BuildContext context) {
    final double maxHeight = MediaQuery.of(context).size.height;
    final double maxWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(
                  left: maxHeight * 0.005, top: maxHeight * 0.005),
              child: IconButton(
                icon: const Icon(Icons.arrow_back_ios, color: AppColors.black),
                highlightColor: Colors.transparent,
                splashColor: Colors.transparent,
                onPressed: () {
                  Get.back();
                },
              ),
            ),
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Padding(
                padding: EdgeInsets.only(
                    left: maxWidth * 0.05, top: maxHeight * 0.08),
                child: Text(
                  Dimens.change,
                  style: AppTextStyle.titleLarge.copyWith(fontSize: 45),
                  textAlign: TextAlign.left,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    left: maxWidth * 0.05, bottom: maxHeight * 0.08),
                child: Text(
                  Dimens.Password,
                  style: AppTextStyle.titleLarge.copyWith(fontSize: 45),
                  textAlign: TextAlign.left,
                ),
              ),
            ]),
            Padding(
              padding: EdgeInsets.only(
                  left: maxWidth * 0.045,
                  right: maxWidth * 0.045,
                  bottom: maxHeight * 0.01),
              child: AppTextFieldPass(
                controllerName: _oldPasswordController,
                labelText: Dimens.oldPass,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  left: maxWidth * 0.045,
                  right: maxWidth * 0.045,
                  bottom: maxHeight * 0.01),
              child: AppTextFieldPass(
                controllerName: _newPasswordController,
                labelText: Dimens.newPass,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  left: maxWidth * 0.045,
                  right: maxWidth * 0.045,
                  bottom: maxHeight * 0.01),
              child: AppTextFieldPass(
                controllerName: _repeatPasswordController,
                labelText: Dimens.rePass,
              ),
            ),
            const SizedBox(
              height: Dimens.HEIGHT_20,
            ),
            GestureDetector(
                onTap: () {
                  _changePassHandler();
                },
                child: Padding(
                  padding: EdgeInsets.only(
                      left: maxWidth * 0.045,
                      right: maxWidth * 0.045,
                      bottom: maxHeight * 0.01),
                  child: Container(
                    padding: const EdgeInsets.all(Dimens.PADDING_20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(Dimens.RADIUS_10),
                      color: AppColors.primary,
                    ),
                    child: const Center(
                        child: Text(
                      Dimens.changePass,
                      style: AppTextStyle.changePassText,
                    )),
                  ),
                )),
          ],
        ),
      )),
    );
  }

  Future<void> _getData() async {
    _oldPasswordController.text = "";
    _newPasswordController.text = "";
    _repeatPasswordController.text = "";
  }

  Future<void> _changePassHandler() async {
    if (_oldPasswordController.text.isEmpty ||
        _newPasswordController.text.isEmpty ||
        _repeatPasswordController.text.isEmpty) {
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Vui l??ng nh???p ?????y ????? th??ng tin")));
    } else if (_oldPasswordController.text == _newPasswordController.text) {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("M???t kh???u c?? gi???ng m???t kh???u m???i")));
    } else if (_newPasswordController.text != _repeatPasswordController.text) {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("M???t kh???u kh??ng tr??ng kh???p")));
    } else {
      showDialog(
          context: context,
          builder: (BuildContext context) => AlertDialog(
                  title: const Text('X??c nh???n ?????i m???t kh???u?'),
                  actions: <Widget>[
                    TextButton(
                      onPressed: () => Navigator.pop(context, 'Cancel'),
                      child: const Text('Kh??ng'),
                    ),
                    TextButton(
                      onPressed: () async {
                        bool isChanged = await changePassword(
                            BaseSharedPreferences.getString('token'),
                            _oldPasswordController.text,
                            _newPasswordController.text);
                        if (isChanged == true) {
                          showDialog(
                              context: context,
                              builder: (BuildContext context) => AlertDialog(
                                      title: const Text(
                                          '?????i m???t kh???u th??nh c??ng! Vui l??ng ????ng nh???p l???i'),
                                      actions: <Widget>[
                                        TextButton(
                                          onPressed: () async {
                                            dismissDialog() {
                                              Get.back();
                                            }

                                            dismissDialog();
                                            await logout();
                                            Get.offAll(
                                                const StudentLoginScreen());
                                          },
                                          child: const Text('OK'),
                                        ),
                                      ]));
                        } else {
                          showDialog(
                              context: context,
                              builder: (BuildContext context) => AlertDialog(
                                      title: const Text(
                                          'M???t kh???u c?? kh??ng ch??nh x??c!'),
                                      actions: <Widget>[
                                        TextButton(
                                          onPressed: () {
                                            Get.back();
                                            Get.back();
                                          },
                                          child: const Text('OK'),
                                        ),
                                      ]));
                        }
                      },
                      child: const Text('C??'),
                    ),
                  ]));
    }
  }
}
