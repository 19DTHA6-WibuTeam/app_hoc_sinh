import 'package:doan_chuyen_nganh/theme/colors.dart';
import 'package:doan_chuyen_nganh/theme/dimens.dart';
import 'package:doan_chuyen_nganh/widget/app_text_field.dart';
import 'package:doan_chuyen_nganh/widget/custom_dropdown_button.dart';
import 'package:doan_chuyen_nganh/widget/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

class StudentPost extends StatefulWidget {
  const StudentPost({super.key});

  @override
  State<StudentPost> createState() => _StudentPostState();
}

final TextEditingController _nameController = TextEditingController();
final TextEditingController _addressController = TextEditingController();
final TextEditingController _phoneController = TextEditingController();
final TextEditingController _noteController = TextEditingController();

class _StudentPostState extends State<StudentPost> {
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
    List<String> classList = [
      '1',
      '2',
      '3',
      '4',
      '5',
      '6',
      '7',
      '8',
      '9',
      '10',
      '11',
      '12'
    ];
    List<String> subjectList = [
      'Toán',
      'Vật lý',
      'Hóa',
      'Tiếng Anh',
      'Văn',
      'Địa lý',
      'Lịch sử',
    ];
    List<String> sessionList = [
      '1',
      '2',
      '3',
      '4',
      '5',
      '6',
      '7',
    ];
    List<String> timeList = [
      '7:00 - 9:00',
      '9:00 - 11:00',
      '13:00 - 15:00',
      '15:00 - 17:00',
      '17:00 - 19:00',
      '19:00 - 21:00',
    ];
    List<RxBool> timeCheckList = [
      false.obs,
      false.obs,
      false.obs,
      false.obs,
      false.obs,
      false.obs,
    ];
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(
                  left: maxHeight * 0.005, top: maxHeight * 0.005),
              child: Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back_ios,
                        color: AppColors.black),
                    highlightColor: Colors.transparent,
                    splashColor: Colors.transparent,
                    onPressed: () {
                      Get.back();
                    },
                  ),
                  Text(
                    Dimens.findTutor,
                    style: AppTextStyle.titleLarge.copyWith(fontSize: 32),
                  )
                ],
              ),
            ),
            SizedBox(height: maxHeight * 0.03),
            Padding(
              padding: EdgeInsets.only(
                left: maxWidth * 0.05,
                right: maxWidth * 0.05,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    Dimens.pleasFillAll,
                    style: AppTextStyle.titleSmall
                        .copyWith(color: AppColors.redPink, fontSize: 13.5),
                  ),
                  const SizedBox(height: 5),
                  AppTextField(
                    labelText: Dimens.Name,
                    enabled: true,
                    obscureText: false,
                    controllerName: _nameController,
                  ),
                  SizedBox(
                    height: maxHeight * 0.01,
                  ),
                  AppTextField(
                    labelText: Dimens.address,
                    enabled: true,
                    obscureText: false,
                    controllerName: _addressController,
                  ),
                  SizedBox(
                    height: maxHeight * 0.01,
                  ),
                  AppTextField(
                    labelText: Dimens.Phone,
                    enabled: true,
                    obscureText: false,
                    controllerName: _phoneController,
                  ),
                  SizedBox(
                    height: maxHeight * 0.01,
                  ),
                  const Text(
                    Dimens.classRoom,
                    style: AppTextStyle.titleSmall,
                  ),
                  CustomDropdownButton(
                    itemsList: classList,
                    hintText: Dimens.chooseClass,
                    enabled: true,
                  ),
                  SizedBox(
                    height: maxHeight * 0.01,
                  ),
                  const Text(
                    Dimens.subject,
                    style: AppTextStyle.titleSmall,
                  ),
                  CustomDropdownButton(
                    itemsList: subjectList,
                    hintText: Dimens.chooseSubject,
                    enabled: true,
                  ),
                  SizedBox(
                    height: maxHeight * 0.01,
                  ),
                  const Text(
                    Dimens.session,
                    style: AppTextStyle.titleSmall,
                  ),
                  CustomDropdownButton(
                    itemsList: sessionList,
                    hintText: Dimens.chooseSession,
                    enabled: true,
                  ),
                  const Text(
                    Dimens.chooseTime,
                    style: AppTextStyle.titleSmall,
                  ),
                  for (int i = 0; i < 6; i++)
                    Obx(
                      () {
                        return Row(
                          children: [
                            Checkbox(
                                shape: const CircleBorder(),
                                value: timeCheckList[i].value,
                                activeColor: AppColors.black,
                                onChanged: (value) {
                                  timeCheckList[i].value = value!;
                                }),
                            Text(
                              timeList[i],
                              style: AppTextStyle.titleSmall,
                            ),
                          ],
                        );
                      },
                    ),
                  SizedBox(
                    height: maxHeight * 0.01,
                  ),
                  SizedBox(
                    height: maxHeight * 0.3,
                    child: AppTextField(
                      labelText: Dimens.note,
                      enabled: true,
                      obscureText: false,
                      controllerName: _noteController,
                    ),
                  ),
                  SizedBox(
                    height: maxHeight * 0.01,
                  ),
                ],
              ),
            ),
          ],
        ),
      )),
    );
  }

  Future<void> _getData() async {
    _nameController.text = "Wibu";
    _addressController.text = "Hutech";
    _phoneController.text = "123456789";
  }
}
