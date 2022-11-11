import 'package:doan_chuyen_nganh/theme/colors.dart';
import 'package:doan_chuyen_nganh/theme/images.dart';
import 'package:doan_chuyen_nganh/widget/text_style.dart';
import 'package:flutter/material.dart';

class PayInfoScreen extends StatelessWidget {
  const PayInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Dialog(
          insetPadding: const EdgeInsets.only(top: 100, bottom: 100),
          backgroundColor: AppColors.white,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
          child: Stack(children: [
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 10, top: 10),
                    child: Text(
                      'Thanh toán',
                      style: AppTextStyle.titleLarge,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 10, right: 10, top: 10, bottom: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: SizedBox(
                              child: FittedBox(
                                  fit: BoxFit.fill,
                                  child: Image.asset(Images.imageMinh))),
                        ),
                        const Text(
                            "Thanh toán qua mã QR hoặc liên lạc trực tiếp trung tâm:",
                            style: TextStyle(
                                fontSize: 18,
                                fontFamily: 'Open Sans',
                                fontWeight: FontWeight.bold)),
                        const Text(
                          '- Nội dung chuyển khoản: TTKH-Mã khóa học-Tên học sinh',
                          style: TextStyle(
                              fontSize: 15,
                              fontFamily: 'Open Sans',
                              fontStyle: FontStyle.italic),
                        ),
                        const Text(
                          '- Nếu thanh toán chuyển khoản vui lòng chụp màn hình chuyển khoản và gửi tới zalo 0902662247 để được hỗ trợ.',
                          style: TextStyle(
                              fontSize: 15,
                              fontFamily: 'Open Sans',
                              fontStyle: FontStyle.italic),
                        ),
                        const Text(
                          '- Liên lạc trực tiếp trung tâm tại Hutech Wibu Quận 9',
                          style: TextStyle(
                              fontSize: 15,
                              fontFamily: 'Open Sans',
                              fontStyle: FontStyle.italic),
                        ),
                        const Text(
                          '- Hotline: 0358125655',
                          style: TextStyle(
                              fontSize: 15,
                              fontFamily: 'Open Sans',
                              fontStyle: FontStyle.italic),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ])),
    );
  }
}
