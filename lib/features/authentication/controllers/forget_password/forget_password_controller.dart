import 'package:ecommerce_flutter/data/repositories/authentication/authentication_repository.dart';
import 'package:ecommerce_flutter/features/authentication/screens/password_configuration/reset_password.dart';
import 'package:ecommerce_flutter/utils/constants/image_strings.dart';
import 'package:ecommerce_flutter/utils/helpers/network_manager.dart';
import 'package:ecommerce_flutter/utils/popups/full_screen_loader.dart';
import 'package:ecommerce_flutter/utils/popups/loaders.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class ForgetPasswordController extends GetxController {
  static ForgetPasswordController get instance => Get.find();

  //Variables
  final email = TextEditingController();
  GlobalKey<FormState> forgetPasswordFormKey = GlobalKey<FormState>();

  //send password reset email
  sendPasswordResetEmail() async {
    try {
      //Form Validation
      if (!forgetPasswordFormKey.currentState!.validate()) {
        TFullScreenLoader.stopLoading();
        return;
      }

      /// Start loading
      TFullScreenLoader.openLoadingDialog(
        "Processing your request",
        TImages.acerlogo,
      );

      //internet conenction
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        TFullScreenLoader.stopLoading();
        return;
      }

      //send email to reset password
      await AuthenticationRepository.instance.sensPasswordResetEmail(
        email.text.trim(),
      );

      //remove loader
      TFullScreenLoader.stopLoading();

      //show sucess screen
      TLoaders.successSnackBar(
        title: "Email Sent",
        message: "Email Link sent to Reset your Password".tr,
      );

      //Redirect
      Get.to(() => ResetPasswordScreen(email: email.text.trim()));
    } catch (e) {
      //remove loader
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(title: "Oh Snap", message: e.toString());
      // throw "Something went wrong. Try Again";
    }
  }

  resendPasswordResetEmail(String email) async {
    try {
      /// Start loading
      TFullScreenLoader.openLoadingDialog(
        "Processing your request",
        TImages.acerlogo,
      );

      //internet conenction 
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        TFullScreenLoader.stopLoading();
        return;
      }

      //send email to reset password
      await AuthenticationRepository.instance.sensPasswordResetEmail(email);

      //remove loader
      TFullScreenLoader.stopLoading();

      //show sucess screen
      TLoaders.successSnackBar(
        title: "Email Sent",
        message: "Email Link sent to Reset your Password".tr,
      );
    } catch (e) {
      //remove loader
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(title: "Oh Snap", message: e.toString());
      // throw "Something went wrong. Try Again";
    }
  }
}
