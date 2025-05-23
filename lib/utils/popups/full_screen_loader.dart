import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ecommerce_flutter/utils/constants/colors.dart';
import 'package:ecommerce_flutter/utils/helpers/helper_functions.dart';

/// A utility class for managing full-screen loading dialog
class TFullScreenLoader {
  /// Open a full-screen loading dialog with a given text and animation
  static void openLoadingDialog(String text, String animation) {
    showDialog(
      context: Get.overlayContext!,
      barrierDismissible: false,
      builder:
          (_) => PopScope(
            canPop: false,
            child: Scaffold(
              backgroundColor:
                  THelperFunctions.isDarkMode(Get.context!)
                      ? TColors.dark
                      : TColors.white,
              body: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Simple loading indicator instead of problematic animation
                    SizedBox(
                      width: 60,
                      height: 60,
                      child: CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(
                          THelperFunctions.isDarkMode(Get.context!)
                              ? TColors.white
                              : TColors.primary,
                        ),
                        strokeWidth: 4,
                      ),
                    ),
                    const SizedBox(height: 32),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 32),
                      child: Text(
                        text,
                        textAlign: TextAlign.center,
                        style: Theme.of(
                          Get.context!,
                        ).textTheme.bodyMedium?.copyWith(
                          color:
                              THelperFunctions.isDarkMode(Get.context!)
                                  ? TColors.white
                                  : TColors.dark,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
    );
  }

  /// Stop the currently open loading dialog
  static void stopLoading() {
    if (Get.isDialogOpen ?? false) {
      Navigator.of(Get.overlayContext!).pop();
    }
  }
}
