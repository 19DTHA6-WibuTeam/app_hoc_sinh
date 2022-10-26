import 'package:doan_chuyen_nganh/UI/student/tutor_detail/components/custom_dropdown_row.dart';
import 'package:doan_chuyen_nganh/UI/student/tutor_detail/components/custom_row.dart';
import 'package:doan_chuyen_nganh/theme/colors.dart';
import 'package:doan_chuyen_nganh/theme/dimens.dart';
import 'package:doan_chuyen_nganh/theme/images.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class TutorDetail extends StatefulWidget {
  int tutorId;
  TutorDetail({super.key, required this.tutorId});

  @override
  State<TutorDetail> createState() => _TutorDetailState();
}

class _TutorDetailState extends State<TutorDetail> {
  @override
  Widget build(BuildContext context) {
    final double maxHeight = MediaQuery.of(context).size.height;
    final double maxWidth = MediaQuery.of(context).size.width;
    int tutorId = widget.tutorId;
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
              child: Column(
        children: [
          Stack(
            alignment: Alignment.topLeft,
            children: [
              ClipRRect(
                  child: FittedBox(
                fit: BoxFit.fill,
                child: Image.asset(Images.imageDefault),
              )),
              Padding(
                  padding: const EdgeInsets.only(
                      left: Dimens.PADDING_10, bottom: Dimens.PADDING_10),
                  child: IconButton(
                    icon: const Icon(
                      Icons.arrow_back,
                      color: AppColors.white,
                    ),
                    onPressed: () {
                      Get.back();
                    },
                  )),
            ],
          ),
          CustomDropdownRow(
            title: 'Thông tin',
            componentsList: [
              CustomRowComponent(title: 'Họ tên', value: "Nguyễn Văn A"),
              CustomRowComponent(
                  title: 'Ngày sinh',
                  value: DateFormat('dd/MM/yyyy').format(DateTime.now())),
              CustomRowComponent(title: 'Giới tính', value: "Nam"),
              CustomRowComponent(title: 'Tuổi', value: "20"),
            ],
            initiallyExpanded: true,
          ),
          CustomDropdownRow(
            title: 'Liên hệ',
            componentsList: [
              CustomRowComponent(
                  title: 'Địa chỉ', value: "54 đường 12D Long Thạnh Mỹ Quận 9"),
              CustomRowComponent(title: 'Số điện thoại', value: "0902xxxxxx"),
              CustomRowComponent(title: 'Email', value: "Wibu@gmail.com"),
            ],
          ),
          CustomDropdownRow(
            title: 'Kinh nghiệm',
            componentsList: [
              for (int i = 0; i < 3; i++)
                CustomRowComponent(
                    title: '2022', value: "Dạy Toán tại WibuHutech"),
            ],
          ),
        ],
      ))),
    );
  }
}
