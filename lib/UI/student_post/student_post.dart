import 'package:doan_chuyen_nganh/UI/app_switch/app_switch.dart';
import 'package:doan_chuyen_nganh/api/session.dart';
import 'package:doan_chuyen_nganh/api/subject.dart';
import 'package:doan_chuyen_nganh/api/user.dart';
import 'package:doan_chuyen_nganh/manager/shared_preferences.dart';
import 'package:doan_chuyen_nganh/models/time&subject.dart';
import 'package:doan_chuyen_nganh/theme/colors.dart';
import 'package:doan_chuyen_nganh/theme/dimens.dart';
import 'package:doan_chuyen_nganh/widget/app_text_field.dart';
import 'package:doan_chuyen_nganh/widget/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class StudentPost extends StatefulWidget {
  const StudentPost({super.key});

  @override
  State<StudentPost> createState() => _StudentPostState();
}

class _StudentPostState extends State<StudentPost> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _noteController = TextEditingController();
  final TextEditingController _classController = TextEditingController();
  final TextEditingController _weekController = TextEditingController();

  RxList<String> subjectList = [Dimens.chooseSubject].obs;
  RxString subjectValue = "".obs;
  RxList<String> sessionTimeList = [Dimens.chooseTime1].obs;
  RxString sessionTimeValue = "".obs;
  RxList<String> feeList = [Dimens.chooseFee].obs;
  RxString feeValue = "".obs;



  nvwue9oupjflvnbevy9p90ipkjbehu v4 
  2e.
    1c324c1\
     
     13v
     g  ư4rv
      a4/y
      


  @override
  void initState() {
    super.initState();
    subjectValue.value = subjectList[0];
    sessionTimeValue.value = sessionTimeList[0];
    feeValue.value = feeList[0];
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      await _getData();
    });
  }

  Future<void> _getData() async {
    var user = await getUser(BaseSharedPreferences.getString('MaNguoiDung'),
        BaseSharedPreferences.getString('token'));
    _nameController.text = user?.user_fullname ?? '';
    _phoneController.text = user?.user_phone_number ?? '';
    _addressController.text = user?.user_address ?? '';
    _noteController.text = "";


  Future<void> _getData() async {
    var user = await getUser(BaseSharedPreferences.getString('MaNguoiDung'),
        BaseSharedPreferences.getString('token'));
    _nameController.text = user?.user_fullname ?? '';
    _phoneController.text = user?.user_phone_number ?? '';
    _addressController.text = user?.user_address ?? '';
    _noteController.text = "";
cv

  Future<void> _getData() async {
    var user = await getUser(BaseSharedPreferences.getString('MaNguoiDung'),
        BaseSharedPreferences.getString('token'));
    _nameController.text = user?.user_fullname ?? '';
    _phoneController.text = user?.user_phone_number ?? '';
    _addressController.text = user?.user_address ?? '';
    _noteController.text = "";



  Future<void> _getData() async {
    var user = await getUser(BaseSharedPreferences.getString('MaNguoiDung'),
        BaseSharedPreferences.getString('token'));
    _nameController.text = user?.user_fullname ?? '';
    _phoneController.text = user?.user_phone_number ?? '';
    _addressController.text = user?.user_address ?? '';
    _noteController.text = "";

    List<MonHoc>? subjectListAPI = await getSubjectList();
    subjectList = [Dimens.chooseSubject].obs;
    for (int i = 0; i < subjectListAPI!.length; i++) {
      String subjectCode = subjectListAPI[i].maMonHoc.toString();
      String subjectName = subjectListAPI[i].tenMonHoc.toString();
      subjectList.add('$subjectCode.$subjectName');
    }

    List<CaHoc>? sessionTimeListAPI = await getSessionTimeList();
    sessionTimeList = [Dimens.chooseTime1].obs;
    for (int i = 0; i < sessionTimeListAPI!.length; i++) {
      String timeCode = sessionTimeListAPI[i].maCaHoc.toString();
      String startTime = sessionTimeListAPI[i].gioBatDau.toString();
      String endTime = sessionTimeListAPI[i].gioKetThuc.toString();
      sessionTimeList.add('$timeCode. $startTime-$endTime');
    }

    List<SoTienBuoiHoc>? feeListAPI = await getFeeList();
    feeList = [Dimens.chooseFee].obs;
    for (int i = 0; i < feeListAPI!.length; i++) {
      String fee = feeListAPI[i].soTien.toString();
      feeList.add('$fee VNĐ');
    }
    setState(() {});
  }

  List<String> timeList = [
    'Thứ 2',
    'Thứ 3',
    'Thứ 4',
    'Thứ 5',
    'Thứ 6',
    'Thứ 7',
    'Chủ Nhật'
  ];
  List<RxBool> timeCheckList = [
    false.obs,
    false.obs,
    false.obs,
    false.obs,
    false.obs,
    false.obs,
    false.obs,
  ];

  Rx<DateTime> startDate = DateTime.now().obs;

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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        Dimens.startDay,
                        style: AppTextStyle.titleSmall,
                      ),
                      Container(
                        height: maxHeight * 0.08,
                        width: maxWidth * 0.6,
                        padding: EdgeInsets.only(
                            top: maxHeight * 0.005, bottom: maxHeight * 0.005),
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
                                    minTime: DateTime.now()
                                        .subtract(const Duration(days: 365000)),
                                    maxTime: DateTime(3000), onConfirm: (date) {
                                  startDate.value = date;
                                },
                                    currentTime: DateTime.now(),
                                    locale: LocaleType.vi);
                              },
                              child: Center(
                                child: Text(
                                  DateFormat('dd/MM/yyyy')
                                      .format(startDate.value),
                                  style: AppTextStyle.titleSmall
                                      .copyWith(fontSize: 20),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: maxHeight * 0.01,
                  ),
                  AppTextField(
                    labelText: Dimens.chooseClass,
                    enabled: true,
                    obscureText: false,
                    controllerName: _classController,
                    keyboardType: TextInputType.number,
                  ),
                  SizedBox(
                    height: maxHeight * 0.01,
                  ),
                  AppTextField(
                    labelText: Dimens.week,
                    enabled: true,
                    obscureText: false,
                    controllerName: _weekController,
                    keyboardType: TextInputType.number,
                  ),
                  const Text(
                    Dimens.subject,
                    style: AppTextStyle.titleSmall,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: AppColors.lightgray,
                      borderRadius: BorderRadius.circular(Dimens.RADIUS_10),
                    ),
                    child: Obx(
                      () => Padding(
                        padding: const EdgeInsets.only(left: Dimens.PADDING_20),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<String>(
                            isExpanded: true,
                            hint: Text(Dimens.chooseTime1,
                                style: AppTextStyle.style(
                                  color: Colors.black.withOpacity(0.8),
                                )),
                            value: subjectValue.value,
                            elevation: 16,
                            onChanged: (String? newValue) {
                              subjectValue.value = newValue!;
                            },
                            items: subjectList
                                .map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value,
                                    style: AppTextStyle.style(
                                      color: Colors.black.withOpacity(0.8),
                                    )),
                              );
                            }).toList(),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: maxHeight * 0.01,
                  ),
                  const Text(
                    Dimens.fee,
                    style: AppTextStyle.titleSmall,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: AppColors.lightgray,
                      borderRadius: BorderRadius.circular(Dimens.RADIUS_10),
                    ),
                    child: Obx(
                      () => Padding(
                        padding: const EdgeInsets.only(left: Dimens.PADDING_20),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<String>(
                            isExpanded: true,
                            hint: Text(Dimens.chooseFee,
                                style: AppTextStyle.style(
                                  color: Colors.black.withOpacity(0.8),
                                )),
                            value: feeValue.value,
                            elevation: 16,
                            onChanged: (String? newValue) {
                              feeValue.value = newValue!;
                            },
                            items: feeList
                                .map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value,
                                    style: AppTextStyle.style(
                                      color: Colors.black.withOpacity(0.8),
                                    )),
                              );
                            }).toList(),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: maxHeight * 0.01,
                  ),
                  const Text(
                    Dimens.chooseTime,
                    style: AppTextStyle.titleSmall,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: AppColors.lightgray,
                      borderRadius: BorderRadius.circular(Dimens.RADIUS_10),
                    ),
                    child: Obx(
                      () => Padding(
                        padding: const EdgeInsets.only(left: Dimens.PADDING_20),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<String>(
                            isExpanded: true,
                            hint: Text(Dimens.chooseTime1,
                                style: AppTextStyle.style(
                                  color: Colors.black.withOpacity(0.8),
                                )),
                            value: sessionTimeValue.value,
                            elevation: 16,
                            onChanged: (String? newValue) {
                              sessionTimeValue.value = newValue!;
                            },
                            items: sessionTimeList
                                .map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value,
                                    style: AppTextStyle.style(
                                      color: Colors.black.withOpacity(0.8),
                                    )),
                              );
                            }).toList(),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const Text(
                    Dimens.learningDay,
                    style: AppTextStyle.titleSmall,
                  ),
                  for (int i = 0; i < timeList.length; i++)
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
                  SingleChildScrollView(
                    child: Container(
                      decoration: BoxDecoration(
                        color: AppColors.lightgray,
                        borderRadius: BorderRadius.circular(Dimens.RADIUS_10),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: Dimens.PADDING_20),
                        child: TextField(
                          controller: _noteController,
                          scrollPhysics: const NeverScrollableScrollPhysics(),
                          maxLines: null,
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            labelText: Dimens.note,
                            labelStyle: AppTextStyle.titleSmall,
                          ),
                          style: AppTextStyle.style(
                            color: Colors.black.withOpacity(0.8),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: maxHeight * 0.01,
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: maxHeight * 0.05),
                    child: SizedBox(
                      height: maxHeight * 0.07,
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
                              Text(Dimens.post,
                                  style: AppTextStyle.changePassText.copyWith(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                  )),
                            ],
                          ),
                          onPressed: () async {
                            _postHandler();
                          }),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      )),
    );
  }

  Future<void> _postHandler() async {
    String subject = subjectValue.value;
    subject = subject[0];

    String fee = feeValue.value;
    fee = fee.substring(0, fee.length - 4);

    String time = sessionTimeValue.value;
    time = time[0];

    String timeCheck = "";
    for (int i = 0; i < timeCheckList.length; i++) {
      if (timeCheckList[i].value == true) {
        String add = (i + 1).toString();
        timeCheck += '$add,';
      }
    }
    if (timeCheck == "") {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Bạn phải chọn ngày học!")));
    } else {
      timeCheck = timeCheck.substring(0, timeCheck.length - 1);
    }

    if (int.parse(_classController.text) > 12 ||
        int.parse(_classController.text) <= 0) {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text("Lớp phải thuộc 1-12")));
    } else if (int.parse(_weekController.text) < 4) {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text("Số tuần học phải >= 4")));
    } else if (fee[0] == 'G') {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Bạn phải chọn học phí!")));
    } else if (time == "K") {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Bạn phải chọn thời gian học!")));
    } else if (subject == "C") {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Bạn phải chọn môn học!")));
    } else {
      bool? success = await postSession(
        BaseSharedPreferences.getString('token'),
        subject,
        _classController.text,
        _nameController.text,
        _addressController.text,
        _phoneController.text,
        _weekController.text,
        fee,
        time,
        timeCheck,
        _noteController.text,
      );

      dismissDialog() {
        Get.back();
      }

      if (success == true) {
        showDialog(
            context: context,
            builder: (BuildContext context) => AlertDialog(
                    title: const Text(
                      Dimens.postDone,
                      style: TextStyle(fontSize: Dimens.TEXT_SIZE_14),
                    ),
                    actions: <Widget>[
                      TextButton(
                        onPressed: () {
                          dismissDialog();
                          Get.offAll(Student());
                        },
                        child: const Text('OK'),
                      ),
                    ]));
      } else {
        showDialog(
            context: context,
            builder: (BuildContext context) => AlertDialog(
                    title: const Text(
                      Dimens.postWrong,
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
