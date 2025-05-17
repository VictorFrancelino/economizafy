import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';

showAwesomeSnackbar({
  required BuildContext context,
  required String title,
  required String message,
  bool isError = false,
}) {
  ContentType snackBarType;
  if (isError) {
    snackBarType = ContentType.failure;
  } else {
    snackBarType = ContentType.success;
  }

  final snackBar = SnackBar(
    elevation: 0,
    behavior: SnackBarBehavior.floating,
    backgroundColor: Colors.transparent,
    content: AwesomeSnackbarContent(
      title: title,
      message: message,
      contentType: snackBarType,
    ),
  );

  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
