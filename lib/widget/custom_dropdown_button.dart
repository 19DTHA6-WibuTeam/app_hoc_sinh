import 'package:doan_chuyen_nganh/theme/colors.dart';
import 'package:doan_chuyen_nganh/theme/dimens.dart';
import 'package:doan_chuyen_nganh/widget/text_style.dart';
import 'package:flutter/material.dart';

class CustomDropdownButton extends StatefulWidget {
  List<String> itemsList;
  String hintText;
  bool enabled;

  CustomDropdownButton(
      {required this.itemsList, required this.hintText, required this.enabled});

  @override
  State<CustomDropdownButton> createState() => _CustomDropdownButtonState();
}

class _CustomDropdownButtonState extends State<CustomDropdownButton> {
  String? dropdownValue;

  @override
  Widget build(BuildContext context) {
    List<String> itemsList = widget.itemsList;
    String hintText = widget.hintText;
    bool enabled = widget.enabled;

    return Container(
      decoration: BoxDecoration(
        color: AppColors.lightgray,
        borderRadius: BorderRadius.circular(Dimens.RADIUS_10),
      ),
      child: Padding(
          padding: const EdgeInsets.only(left: Dimens.PADDING_20),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              isExpanded: true,
              hint: Text(
                hintText,
                style: enabled
                    ? AppTextStyle.style(
                        color: Colors.black.withOpacity(0.8),
                      )
                    : AppTextStyle.titleSmall,
              ),
              value: dropdownValue,
              elevation: 16,
              onChanged: enabled
                  ? (String? newValue) {
                      setState(() {
                        dropdownValue = newValue!;
                      });
                    }
                  : null,
              items: itemsList.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(
                    value,
                    style: enabled
                        ? AppTextStyle.style(
                            color: Colors.black.withOpacity(0.8),
                          )
                        : AppTextStyle.titleSmall,
                  ),
                );
              }).toList(),
            ),
          )),
    );
  }
}
