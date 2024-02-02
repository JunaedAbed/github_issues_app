import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:github_issues_app/core/errors/app_exceptions.dart';

mixin ErrorController {
  void handleError(error) {
    if (error is BadRequestException) {
      showSnackbar(message: error.message.toString(), isError: true);
    } else if (error is FetchDataException) {
      showSnackbar(message: error.message.toString(), isError: true);
    } else if (error is DataNotFoundException) {
      showSnackbar(message: error.message.toString(), isError: true);
    } else if (error is ApiNotRespondingException) {
      showSnackbar(message: 'Oops! It took longer to respond.', isError: true);
    } else if (error is UnauthorizedException) {
      showSnackbar(message: error.message.toString(), isError: true);
    }
  }

  void showSnackbar({required String message, bool isError = false}) {
    Get.snackbar(
      isError ? 'Error' : 'Success',
      message,
      backgroundColor: isError ? Colors.pink : Colors.blue,
      colorText: Colors.white,
      snackPosition: SnackPosition.BOTTOM,
    );
  }
}
