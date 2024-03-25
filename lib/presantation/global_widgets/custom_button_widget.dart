

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../constants/app_colors.dart';

class CustomButtonWidget extends StatelessWidget {
  final String title;

  final bool isLoading;

  final Function() onTap;

  const CustomButtonWidget(
      {super.key,
      required this.title,
      required this.isLoading,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(24.0.r),
      onTap: () {
        onTap.call();
      },
      child: Container(
        // padding: EdgeInsets.symmetric(vertical: 10.0.h),
        height: 0.07.sh,

        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24.0.r),
          color: AppColors.primaryColor.withOpacity(0.3),
        ),
        child: isLoading
            ? Container(
                height: 0.06.sh,
                width: 0.06.sh,
                padding: const EdgeInsets.all(8),
                child:  CircularProgressIndicator(backgroundColor: AppColors.primaryColor.withOpacity(0.3)),
              )
            : Text(
                title,
                style: TextStyle(
                  fontSize: 14.0.sp,
                  color: AppColors.primaryColor,
                  fontWeight: FontWeight.w600,
                ),
              ),
      ),
    );
  }
}
