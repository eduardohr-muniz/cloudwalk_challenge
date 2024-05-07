import 'package:flutter/material.dart';

class Errors implements Exception {
  final Object error;
  final String? message;

  Errors({
    required this.error,
    this.message,
  });

  @override
  String toString() => '$message';
}

class DataBadFormat extends Errors {
  DataBadFormat({required super.error}) : super(message: 'Ops, algo deu errado') {
    debugPrint('DataBadFormat: $error');
  }
}

class IpapiLimitError extends Errors {
  IpapiLimitError({required super.error}) : super(message: 'Ops, algo deu errado') {
    debugPrint('LimitExceeded: $error');
  }
}
