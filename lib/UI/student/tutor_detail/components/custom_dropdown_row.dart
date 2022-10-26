import 'package:doan_chuyen_nganh/theme/colors.dart';
import 'package:flutter/material.dart';

class CustomDropdownRow extends StatefulWidget {
  String title;
  List<Widget> componentsList;
  bool initiallyExpanded;

  CustomDropdownRow({
    Key? key,
    required this.title,
    required this.componentsList,
    this.initiallyExpanded = false,
  }) : super(key: key);

  @override
  State<CustomDropdownRow> createState() => _CustomDropdownRowState();
}

class _CustomDropdownRowState extends State<CustomDropdownRow> {
  @override
  Widget build(BuildContext context) {
    final double maxWidth = MediaQuery.of(context).size.width;

    String title = widget.title;
    List<Widget> componentsList = widget.componentsList;
    bool initiallyExpanded = widget.initiallyExpanded;

    return ExpansionTile(
      title: Text(
        title,
        style: const TextStyle(
          fontSize: 17,
          fontFamily: "SF Pro Display",
          fontWeight: FontWeight.w600,
        ),
      ),
      initiallyExpanded: initiallyExpanded,
      tilePadding: EdgeInsets.symmetric(horizontal: maxWidth * 0.048),
      textColor: AppColors.primary,
      collapsedTextColor: Colors.black,
      iconColor: AppColors.primary,
      collapsedIconColor: const Color(0xFFC8C7CC),
      children: componentsList,
    );
  }
}
