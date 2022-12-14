import 'package:doan_chuyen_nganh/UI/tutor_detail/components/custom_dropdown_row.dart';
import 'package:doan_chuyen_nganh/UI/tutor_detail/components/custom_row.dart';
import 'package:doan_chuyen_nganh/api/user.dart';
import 'package:doan_chuyen_nganh/manager/shared_preferences.dart';
import 'package:doan_chuyen_nganh/models/user.dart';
import 'package:doan_chuyen_nganh/theme/colors.dart';
import 'package:doan_chuyen_nganh/theme/dimens.dart';
import 'package:doan_chuyen_nganh/theme/images.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

import 'package:get/get.dart';

class TutorDetail extends StatefulWidget {
  int tutorId;
  TutorDetail({super.key, required this.tutorId});

  @override
  State<TutorDetail> createState() => _TutorDetailState();
}

class _TutorDetailState extends State<TutorDetail> {
  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((_) {
      _getData();
    });
  }

  var isLoaded = false;
  List<User> tutorList = [];
  int index = 0;
  Future<void> _getData() async {
    tutorList = (await getTutorList(BaseSharedPreferences.getString('token')))!;
    for (int i = 0; i < tutorList.length; i++) {
      if (tutorList[i].user_id == widget.tutorId) {
        index = i;
        break;
      }
    }
    setState(() {
      isLoaded = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    final double maxHeight = MediaQuery.of(context).size.height;
    final double maxWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
              child: isLoaded
                  ? Column(
                      children: [
                        Stack(
                          alignment: Alignment.topLeft,
                          children: [
                            tutorList[index].avatar != null
                                ? ClipRRect(
                                    child: FittedBox(
                                        fit: BoxFit.fill,
                                        child: Image.network(
                                            tutorList[index].avatar!)),
                                  )
                                : ClipRRect(
                                    child: FittedBox(
                                        fit: BoxFit.fill,
                                        child:
                                            Image.asset(Images.imageDefault)),
                                  ),
                            Padding(
                                padding: const EdgeInsets.only(
                                    left: Dimens.PADDING_10,
                                    bottom: Dimens.PADDING_10),
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
                          title: 'Th??ng tin',
                          componentsList: [
                            CustomRowComponent(
                                title: 'H??? t??n',
                                value: tutorList[index].user_fullname),
                            CustomRowComponent(
                                title: 'Ng??y sinh',
                                value: tutorList[index].user_birthday!),
                            CustomRowComponent(
                                title: 'Gi???i t??nh',
                                value: tutorList[index].user_gender == 1
                                    ? "Nam"
                                    : "N???"),
                            CustomRowComponent(
                                title: 'Tu???i',
                                value: (DateTime.now().year -
                                        int.parse(tutorList[index]
                                            .user_birthday!
                                            .substring(0, 4)))
                                    .toString()),
                          ],
                          initiallyExpanded: true,
                        ),
                        CustomDropdownRow(
                          title: 'Li??n h???',
                          componentsList: [
                            CustomRowComponent(
                                title: '?????a ch???',
                                value: tutorList[index].user_address),
                            CustomRowComponent(
                                title: 'S??? ??i???n tho???i',
                                value: tutorList[index].user_phone_number),
                            CustomRowComponent(
                                title: 'Email',
                                value: tutorList[index].user_email),
                          ],
                        ),
                      ],
                    )
                  : SizedBox(
                      width: maxWidth,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(height: maxHeight * 0.3),
                          const CircularProgressIndicator(),
                        ],
                      ),
                    ))),
    );
  }
}
