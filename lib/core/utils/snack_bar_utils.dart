import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../features/authentication/presentation/view/login_page.dart';
import 'constants.dart';

class SnackBarUtils {
  static void showLoginSnackBar() {
    Get.snackbar(
      'Login required',
      'Please login to get your diagnosis results',
      duration: const Duration(seconds: 10),
      snackPosition: SnackPosition.TOP,
      margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
      icon: const Icon(Icons.error_outline, color: Colors.red),
      mainButton: TextButton(
        onPressed: () => Get.to(() => const LoginPage()),
        child: const Text(
          'Login',
          style: TextStyle(color: kPrimaryColor, fontSize: 18),
        ),
      ),
    );
  }
}
