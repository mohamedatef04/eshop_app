import 'package:eshop_app/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:toastification/toastification.dart';

void showToastificationBar({
  required BuildContext context,
  required String message,
  required String title,
  required ToastificationType type,
  required Color color,
  required IconData icon,
}) {
  toastification.show(
    context: context, // optional if you use ToastificationWrapper
    type: type,
    style: ToastificationStyle.fillColored,
    autoCloseDuration: const Duration(seconds: 4),
    title: Text(
      title,
      style: AppTextStyles.bold18(context).copyWith(color: Colors.white),
    ),
    description: Text(
      message,
      style: AppTextStyles.regular16(context).copyWith(color: Colors.white),
    ),
    alignment: Alignment.bottomCenter,
    direction: TextDirection.ltr,
    animationDuration: const Duration(milliseconds: 300),
    icon: Icon(icon, size: 28, color: Colors.white),
    showIcon: true,
    primaryColor: color,
    backgroundColor: color,
    foregroundColor: Colors.white,
    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
    margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
    borderRadius: BorderRadius.circular(16),
    boxShadow: const [
      BoxShadow(
        color: Color(0x1F000000),
        blurRadius: 16,
        offset: Offset(0, 8),
        spreadRadius: 0,
      ),
    ],
    showProgressBar: true,
    closeButton: const ToastCloseButton(
      showType: CloseButtonShowType.onHover,
    ),
    closeOnClick: false,
    pauseOnHover: true,
    dragToClose: true,
    applyBlurEffect: true,
    callbacks: const ToastificationCallbacks(),
  );
}
