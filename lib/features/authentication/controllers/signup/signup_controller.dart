import 'package:ecommerce_flutter/utils/constants/image_strings.dart';
import 'package:ecommerce_flutter/utils/helpers/network_manager.dart';
import 'package:ecommerce_flutter/utils/popups/full_screen_loader.dart';
import 'package:ecommerce_flutter/utils/popups/loaders.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class SignupController extends GetxController {
  static SignupController get instance => Get.find();

  //Variables
  final hidePassword = true.obs; //Observable for showing/hiding password
  final privacyPolicy = true.obs; //Observable for privacy policy acceptance
  //Controllers
  final email = TextEditingController();
  final lastName = TextEditingController();
  final userName = TextEditingController();
  final password = TextEditingController();
  final firstName = TextEditingController();
  final phoneNumber = TextEditingController();

  GlobalKey<FormState> signupFormKey =
      GlobalKey<FormState>(); //form key for form validatiion

  //--Signup
  Future<void> signup() async {
    try {
      //Start Loading
      TFullScreenLoader.openLoadingDialog(
        "We are processing your information ...",
        TImages.acerlogo,
      );

      // check internet connectivity
      final isConnected = await NetworkManager.instance.isConnected();

      if (!isConnected) return;

      // form validation
      if (signupFormKey.currentState!.validate()) return;

      // privacy policy check
      if (!privacyPolicy.value) {
        TLoaders.warningSnackBar(
          title: "Accept Privacy Policy",
          message:
              "In order to create an account you must read and accept Privacy Policy & Terms of Use",
        );
      }

      //register user in firebase auth and save user data in firebase

      //save authentication user data in firebase firestore

      //show sucess screen

      //move to verify email button
    } catch (e) {
      //show generic error to user
      TLoaders.errorSnackBar(title: "Oh Snap! ", message: e.toString());
    } finally {
      //remove loader
      TFullScreenLoader.stopLoading();
    }
  }
}
