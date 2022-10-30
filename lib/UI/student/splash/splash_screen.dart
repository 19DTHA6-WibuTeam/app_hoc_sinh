import 'dart:async';

import 'package:doan_chuyen_nganh/UI/student/app_switch/app_switch.dart';
import 'package:doan_chuyen_nganh/UI/student/sign_in/student_login.dart';
import 'package:doan_chuyen_nganh/manager/shared_preferences.dart';
import 'package:doan_chuyen_nganh/theme/colors.dart';
import 'package:doan_chuyen_nganh/theme/dimens.dart';
import 'package:doan_chuyen_nganh/theme/images.dart';
import 'package:doan_chuyen_nganh/widget/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    startTimer();
  }

  startTimer() async {
    var duration = Duration(seconds: 2);
    return Timer(duration, route);
  }

  route() async {
    final userToken = await BaseSharedPreferences.getString('token');
    if (userToken.length > 0) {
      Get.to(const Student());
    } else
      Get.to(const StudentLoginScreen());
  }

  @override
  Widget build(BuildContext context) {
    final double maxWidth = MediaQuery.of(context).size.width;
    final double maxHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        width: maxWidth,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [AppColors.primaryLight, AppColors.primary]),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: maxHeight * 0.15,
            ),
            SizedBox(
                width: maxWidth * 0.8, child: Image.asset(Images.imageIntro4)),
            SizedBox(
              height: maxHeight * 0.05,
            ),
            Text(
              Dimens.continueLearn,
              style: AppTextStyle.style(
                  fontSize: Dimens.TEXT_SIZE_22, fontWeight: FontWeight.w600),
            ),
            SizedBox(
              height: maxHeight * 0.05,
            ),
            SizedBox(
                height: maxHeight * 0.1,
                child: LoadingAnimationWidget.discreteCircle(
                  color: AppColors.redPink,
                  secondRingColor: AppColors.dark,
                  thirdRingColor: AppColors.orange,
                  size: maxHeight * 0.1,
                )),
          ],
        ),
      ),
    );
  }
}
// class SplashScreen extends StatelessWidget {
//   const SplashScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final double maxWidth = MediaQuery.of(context).size.width;
//     final double maxHeight = MediaQuery.of(context).size.height;
//     return Container(
//       decoration: const BoxDecoration(
//         gradient: LinearGradient(
//             begin: Alignment.topLeft,
//             end: Alignment.bottomRight,
//             colors: [AppColors.primaryLight, AppColors.primary]),
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           SizedBox(
//             height: maxHeight * 0.15,
//           ),
//           SizedBox(
//               width: maxWidth * 0.8, child: Image.asset(Images.imageIntro4)),
//           SizedBox(
//             height: maxHeight * 0.1,
//           ),
//           Padding(
//             padding: const EdgeInsets.only(left: 20, right: 20),
//             child: ElevatedButton(
//               style: ElevatedButton.styleFrom(
//                   minimumSize: Size(maxWidth * 0.8, maxHeight * 0.1),
//                   primary: AppColors.redPink,
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(Dimens.RADIUS_10),
//                   )),
//               child: Center(
//                 child: Text(
//                   Dimens.SignInContinue,
//                   style: AppTextStyle.style(
//                       fontSize: Dimens.TEXT_SIZE_22,
//                       fontWeight: FontWeight.w600),
//                 ),
//               ),
//               onPressed: () async {
//                 final userToken =
//                     await BaseSharedPreferences.getString('token');
//                 if (userToken.length > 0) {
//                   Get.to(const Student());
//                 } else
//                   Get.to(const StudentLoginScreen());
//               },
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }
