import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../const/text_stye.dart';

class DropDownWidget extends StatelessWidget {
  final List<String> items;
  final String? selectedValue;
  final Function(String?) onChanged;
  const DropDownWidget({
    super.key,
    required this.items,
    this.selectedValue,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButton2<String>(
      isExpanded: true,
      hint: Text(
        'Select Mode',
        style: TextStyle(fontSize: 14, color: Theme.of(context).hintColor),
      ),
      items: items
          .map(
            (String item) => DropdownMenuItem<String>(
              value: item,
              child: Text(
                item,
                style: TextFontStyle.headLine16C082438W700.copyWith(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w300,
                ),
              ),
            ),
          )
          .toList(),
      value: selectedValue,
      onChanged: onChanged,
      buttonStyleData: ButtonStyleData(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        height: 50.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.r),
          border: Border.all(color: Color(0xFFB9C6D6), width: 1.w),
        ),
      ),
      menuItemStyleData: MenuItemStyleData(height: 40.h),
    );
  }
}
