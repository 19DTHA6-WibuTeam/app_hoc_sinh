import 'package:doan_chuyen_nganh/UI/student/account/Components/round_avatar.dart';
import 'package:doan_chuyen_nganh/UI/student/change_pass/change_pass_page.dart';
import 'package:doan_chuyen_nganh/UI/student/sign_in/student_login.dart';
import 'package:doan_chuyen_nganh/api/logout.dart';
import 'package:doan_chuyen_nganh/api/user.dart';
import 'package:doan_chuyen_nganh/manager/shared_preferences.dart';
import 'package:doan_chuyen_nganh/theme/colors.dart';
import 'package:doan_chuyen_nganh/theme/dimens.dart';
import 'package:doan_chuyen_nganh/theme/images.dart';
import 'package:doan_chuyen_nganh/widget/app_text_field.dart';
import 'package:doan_chuyen_nganh/widget/custom_dropdown_button.dart';
import 'package:doan_chuyen_nganh/widget/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class StudentAccount extends StatefulWidget {
  const StudentAccount({super.key});

  @override
  State<StudentAccount> createState() => _StudentAccountState();
}

class _StudentAccountState extends State<StudentAccount> {
  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((_) {
      _getData();
    });
  }

  Future<void> _getData() async {
    var user = await getUser(BaseSharedPreferences.getString('MaNguoiDung'),
        BaseSharedPreferences.getString('token'));
    _fullNameController.text = user?.user_fullname ?? '';
    _phoneNumberController.text = user?.user_phone_number ?? '';
    _addressController.text = user?.user_address ?? '';
    pickedDate.value = DateTime.parse("${user?.user_birthday} 00:00:00");
    gender.value = user?.user_gender ?? 0;
    if (gender.value == 1) {
      isFeMale.value = false;
    }
    avatar.value = user?.avatar ?? '';
  }

  RxInt gender = 0.obs;
  RxString avatar = "".obs;
  RxBool enabled = false.obs;
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final Rx<DateTime> pickedDate = DateTime.now().obs;
  List<String> genderList = ['Nữ', 'Nam'];
  RxBool isFeMale = true.obs;
  String? dropdownValue;

  @override
  Widget build(BuildContext context) {
    final double maxHeight = MediaQuery.of(context).size.height;
    final double maxWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SafeArea(
        child: (SingleChildScrollView(
          child: Column(
            children: [
              Obx(
                () => Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(
                      highlightColor: Colors.transparent,
                      splashColor: Colors.transparent,
                      icon: enabled.value
                          ? const Icon(
                              Icons.edit,
                              color: Colors.black,
                            )
                          : const Icon(
                              Icons.edit,
                              color: AppColors.dark,
                            ),
                      onPressed: () {
                        enabled.value = !enabled.value;
                      },
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: Dimens.PADDING_20,
                    right: Dimens.PADDING_20,
                    bottom: Dimens.PADDING_20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    avatar.value != ''
                        ? SizedBox(
                            height: Dimens.HEIGHT_200,
                            width: Dimens.WIDTH_200,
                            child: RoundAvatar(
                              imagePath: avatar.value,
                              leftPadding: Dimens.PADDING_20,
                              topPadding: Dimens.PADDING_20,
                              rightPadding: Dimens.PADDING_20,
                              bottomPadding: Dimens.PADDING_20,
                              radius: Dimens.RADIUS_30,
                              initAvatar: true,
                            ),
                          )
                        : SizedBox(
                            height: Dimens.HEIGHT_200,
                            width: Dimens.WIDTH_200,
                            child: RoundAvatar(
                              imagePath: Images.imageDefault1,
                              leftPadding: Dimens.PADDING_20,
                              topPadding: Dimens.PADDING_20,
                              rightPadding: Dimens.PADDING_20,
                              bottomPadding: Dimens.PADDING_20,
                              radius: Dimens.RADIUS_30,
                              initAvatar: false,
                            ),
                          ),
                    Obx(
                      () => AppTextField(
                        labelText: Dimens.Phone,
                        enabled: enabled.value,
                        obscureText: false,
                        controllerName: _phoneNumberController,
                      ),
                    ),
                    SizedBox(height: maxHeight * 0.02),
                    Obx(
                      () => AppTextField(
                        labelText: Dimens.Name,
                        enabled: enabled.value,
                        obscureText: false,
                        controllerName: _fullNameController,
                      ),
                    ),
                    SizedBox(height: maxHeight * 0.02),
                    Obx(
                      () => AppTextField(
                        labelText: Dimens.address,
                        enabled: enabled.value,
                        obscureText: false,
                        controllerName: _addressController,
                      ),
                    ),
                    SizedBox(height: maxHeight * 0.01),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          Dimens.birthday,
                          style: AppTextStyle.titleSmall.copyWith(fontSize: 13),
                        ),
                        Text(
                          Dimens.gender,
                          style: AppTextStyle.titleSmall.copyWith(fontSize: 13),
                        )
                      ],
                    ),
                    SizedBox(height: maxHeight * 0.01),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          height: Dimens.HEIGHT_55,
                          width: maxWidth * 0.5,
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
                                onPressed: enabled.value
                                    ? () {
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
                                      }
                                    : null,
                                child: Container(
                                  alignment: Alignment.centerLeft,
                                  child: Center(
                                    child: Text(
                                      DateFormat('dd/MM/yyyy')
                                          .format(pickedDate.value),
                                      style: enabled.value
                                          ? AppTextStyle.style(
                                              fontSize: 22,
                                              color:
                                                  Colors.black.withOpacity(0.8),
                                            )
                                          : AppTextStyle.titleSmall
                                              .copyWith(fontSize: 22),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        // SizedBox(
                        //   width: maxWidth * 0.35,
                        //   child: CustomDropdownButton(
                        //     itemsList: genderList,
                        //     hintText: isFeMale.value
                        //         ? genderList[0]
                        //         : genderList[1],
                        //     enabled: enabled.value,
                        //   ),
                        // ),
                        SizedBox(
                          width: maxWidth * 0.35,
                          child: Container(
                            decoration: BoxDecoration(
                              color: AppColors.lightgray,
                              borderRadius:
                                  BorderRadius.circular(Dimens.RADIUS_10),
                            ),
                            child: Padding(
                                padding: const EdgeInsets.only(
                                    left: Dimens.PADDING_20),
                                child: Obx(
                                  () => DropdownButtonHideUnderline(
                                    child: DropdownButton<String>(
                                      isExpanded: true,
                                      hint: Text(
                                        isFeMale.value
                                            ? genderList[0]
                                            : genderList[1],
                                        style: enabled.value
                                            ? AppTextStyle.style(
                                                color: Colors.black
                                                    .withOpacity(0.8),
                                              )
                                            : AppTextStyle.titleSmall,
                                      ),
                                      value: dropdownValue,
                                      elevation: 16,
                                      onChanged: enabled.value
                                          ? (String? newValue) {
                                              setState(() {
                                                dropdownValue = newValue!;
                                                print(dropdownValue);
                                              });
                                            }
                                          : null,
                                      items: genderList
                                          .map<DropdownMenuItem<String>>(
                                              (String value) {
                                        return DropdownMenuItem<String>(
                                          value: value,
                                          child: Text(
                                            value,
                                            style: enabled.value
                                                ? AppTextStyle.style(
                                                    color: Colors.black
                                                        .withOpacity(0.8),
                                                  )
                                                : AppTextStyle.titleSmall,
                                          ),
                                        );
                                      }).toList(),
                                    ),
                                  ),
                                )),
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: maxHeight * 0.02),
                    GestureDetector(
                        onTap: () {
                          Get.to(const ChangePassPage());
                        },
                        child: Container(
                          padding: const EdgeInsets.all(Dimens.PADDING_20),
                          decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.circular(Dimens.RADIUS_10),
                            color: AppColors.primary,
                          ),
                          child: const Center(
                              child: Text(
                            Dimens.changePass,
                            style: AppTextStyle.changePassText,
                          )),
                        )),
                    SizedBox(height: maxHeight * 0.02),
                    GestureDetector(
                        onTap: () {
                          _showDialog(context);
                        },
                        child: Container(
                          padding: const EdgeInsets.all(Dimens.PADDING_20),
                          decoration: BoxDecoration(
                            border: Border.all(
                                color: Theme.of(context).primaryColor),
                            borderRadius:
                                BorderRadius.circular(Dimens.RADIUS_10),
                            color: AppColors.white,
                          ),
                          child: const Center(
                              child: Text(
                            Dimens.signOut,
                            style: AppTextStyle.signOutText,
                          )),
                        )),
                  ],
                ),
              ),
            ],
          ),
        )),
      ),
    );
  }
}

void _showDialog(BuildContext context) {
  showDialog(
      context: context,
      builder: (BuildContext context) =>
          AlertDialog(title: const Text('Xác nhận thoát'), actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.pop(context, 'Cancel'),
              child: const Text('Không'),
            ),
            TextButton(
              onPressed: () async {
                dismissDialog() {
                  Get.back();
                }

                dismissDialog();
                await logout();
                Get.offAll(const StudentLoginScreen());
              },
              child: const Text('Có'),
            ),
          ]));
}
