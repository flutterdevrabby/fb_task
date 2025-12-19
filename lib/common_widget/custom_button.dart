import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../const/text_stye.dart';


class CustomButton extends StatelessWidget {
  final String buttonName;
  final VoidCallback? onPressed;
  final double? height;

  final double? width;
  final double? borderRadius;
  final Color? color;
  final TextStyle? textStyle;
  final EdgeInsetsGeometry? padding;
  const CustomButton({
    required this.buttonName,
    required this.onPressed,
    this.height,
    this.width,
    this.borderRadius,
    this.color,
    this.textStyle,
    this.padding,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(borderRadius ?? 10.r),
      ),
      padding:
          padding ?? EdgeInsets.symmetric(horizontal: 10.w, vertical: 16.h),
      onPressed: onPressed,
      color: color ?? Color(0xFF0096FC),
      minWidth: width ?? 1.sw,
      height: height ?? 50.h,
      child: Text(
        buttonName,
        style: textStyle ?? TextFontStyle.headLine18CFFFFFFW700,
      ),
    );
  }
}
