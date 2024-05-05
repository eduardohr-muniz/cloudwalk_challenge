import 'package:cloudwalk_package/cloudwalk_package.dart';
import 'package:flutter/material.dart';

class Toast implements IToast {
  final BuildContext context;
  Toast._(this.context);

  factory Toast.of(BuildContext context) {
    return Toast._(context);
  }
  late final Toastification? toast;

  @override
  void showError(String message, {String? label, Alignment? alignment, Duration? duration}) => _showMessage(
        label: label ?? "Error",
        message: message,
        color: context.color.errorColor,
        alignment: alignment,
        duration: duration,
        icon: Icon(
          Icons.close,
          color: context.color.errorColor,
        ),
      );

  @override
  void showInfo(String message, {String? label, Alignment? alignment, Duration? duration}) => _showMessage(
        label: label ?? "Info",
        message: message,
        duration: duration,
        color: context.color.tertiaryColor,
        alignment: alignment,
        icon: Icon(
          Icons.info_outline,
          color: context.color.tertiaryColor,
        ),
      );

  @override
  void showSucess(String message, {String? label, Alignment? alignment, Duration? duration}) => _showMessage(
        label: label ?? "Sucess",
        message: message,
        duration: duration,
        color: context.color.primaryColor,
        alignment: alignment,
        icon: Icon(Icons.check_circle_outline_rounded, color: context.color.primaryColor),
      );
  @override
  void showCustom(String message, {String? label, Color? color, Widget? icon, Alignment? alignment, Duration? duration}) => _showMessage(
        label: label ?? "Custom",
        duration: duration,
        message: message,
        color: color ?? Colors.black,
        alignment: alignment,
        icon: icon ?? const Icon(Icons.info_outline, color: Colors.black),
      );

  Duration calculeDuration(String message) {
    final int lenght = message.split(" ").length;
    final int miliseconds = lenght * 400;
    if (miliseconds < 4000) return const Duration(seconds: 4);
    return Duration(milliseconds: miliseconds);
  }

  void _showMessage(
      {required String label,
      required String message,
      required Color color,
      Widget? icon,
      Color? backGroundColor,
      Alignment? alignment,
      Duration? duration}) {
    toastification.show(
        context: context,
        title: Text(label),
        style: ToastificationStyle.flatColored,
        autoCloseDuration: duration ?? calculeDuration(message),
        backgroundColor: backGroundColor ?? context.color.onPrimaryBG,
        primaryColor: color,
        foregroundColor: context.color.primaryText,
        borderRadius: BorderRadius.circular(12),
        dragToClose: true,
        alignment: alignment ?? Alignment.topRight,
        showProgressBar: true,
        boxShadow: [],
        description: Text(message),
        closeButtonShowType: CloseButtonShowType.always,
        icon: icon,
        pauseOnHover: true,
        applyBlurEffect: true,
        progressBarTheme: ProgressIndicatorThemeData(
          color: color,
          linearTrackColor: Colors.grey.shade600,
        ));
  }
}
