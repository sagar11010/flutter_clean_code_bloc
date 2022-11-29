import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:clean_code_structure/shared/constants/colors.dart';

class CustomProgressDialog extends StatelessWidget {
  const CustomProgressDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200.w,
      height: 200.h,
      decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.5),
          borderRadius: BorderRadius.all(Radius.circular(10.h))),
      child: Center(
        child: SizedBox(
          height: 100.h,
          width: 100.w,
          child: CircularProgressIndicator(
            strokeWidth: 8.w,
            valueColor: const AlwaysStoppedAnimation<Color>(AppColors.primaryColor),
          ),
        ),
      ),
    );
  }
}
