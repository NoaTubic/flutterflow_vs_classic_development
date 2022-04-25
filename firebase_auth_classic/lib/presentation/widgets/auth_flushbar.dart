import 'package:another_flushbar/flushbar.dart';
import 'package:firebase_auth_classic/presentation/resources.dart';
import 'package:flutter/material.dart';

Flushbar showFlushbar({required String message}) {
  return Flushbar(
    message: message,
    duration: const Duration(milliseconds: DurationConstant.d3),
    borderRadius: BorderRadius.circular(AppSizes.s8),
    margin: const EdgeInsets.all(AppSizes.s20),
    backgroundColor: AppColors.primary.withOpacity(AppSizes.s0_5),
    icon: const Icon(
      Icons.error,
      color: AppColors.culture,
    ),
  );
}
