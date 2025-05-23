import 'dart:convert';

import 'package:ecommerce_flutter/data/repositories/authentication/authentication_repository.dart';
import 'package:ecommerce_flutter/data/repositories/user/user_repository.dart';
import 'package:ecommerce_flutter/features/authentication/screens/signup/verify_email.dart';
import 'package:ecommerce_flutter/features/personalization/models/user_model.dart';
import 'package:ecommerce_flutter/utils/constants/image_strings.dart';
import 'package:ecommerce_flutter/utils/helpers/network_manager.dart';
import 'package:ecommerce_flutter/utils/popups/full_screen_loader.dart';
import 'package:ecommerce_flutter/utils/popups/loaders.dart';
import 'package:firebase_auth/firebase_auth.dart';
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

      if (!isConnected) {
        TLoaders.errorSnackBar(
          title: "No Internet",
          message: "Please check your internet connection",
        );
        return;
      }

      // form validation
     if (!signupFormKey.currentState!.validate()) {
        TLoaders.errorSnackBar(
          title: "Form Error",
          message: "Please fill all required fields correctly",
        );
        return;
      }

      // privacy policy check
      if (!privacyPolicy.value) {
        TLoaders.warningSnackBar(
          title: "Accept Privacy Policy",
          message:
              "In order to create an account you must read and accept Privacy Policy & Terms of Use",
        );
      }

      //register user in firebase auth and save user data in firebase
      final userCredential = await AuthenticationRepository.instance
          .registerWithEmailAndPassword(
            email.text.trim(),
            password.text.trim(),
          );
      //save authentication user data in firebase firestore
      final newUser = UserModel(
        id: userCredential.user!.uid,
        firstName: firstName.text.trim(),
        lastName: lastName.text.trim(),
        username: userName.text.trim(),
        email: email.text.trim(),
        phoneNumber: phoneNumber.text.trim(),
        profilePicture: "",
      );

      final userRepository = Get.put(UserRepository());
      await userRepository.saveUserRecord(newUser);

      //show sucess screen
      TLoaders.successSnackBar(
        title: "Congratulations",
        message: "Your account has been created! Verify email to continue",
      );

      //move to verify email button
      Get.to(() => VerifyEmailScreen());
    } catch (e) {
      print("❌ Signup Error: $e");

      // Provide more specific error messages
      String errorMessage = "Something went wrong. Please try again.";

      if (e.toString().contains('email-already-in-use')) {
        errorMessage =
            "This email is already registered. Please use a different email.";
      } else if (e.toString().contains('weak-password')) {
        errorMessage = "Password is too weak. Please use a stronger password.";
      } else if (e.toString().contains('invalid-email')) {
        errorMessage = "Please enter a valid email address.";
      } else if (e.toString().contains('network-request-failed')) {
        errorMessage = "Network error. Please check your internet connection.";
      }

      TLoaders.errorSnackBar(
        title: "Registration Failed",
        message: errorMessage,
      );
    }  finally {
      //remove loader
      TFullScreenLoader.stopLoading();
    }
  }
   @override
  void onClose() {
    email.dispose();
    lastName.dispose();
    userName.dispose();
    password.dispose();
    firstName.dispose();
    phoneNumber.dispose();
    super.onClose();
  }
}
