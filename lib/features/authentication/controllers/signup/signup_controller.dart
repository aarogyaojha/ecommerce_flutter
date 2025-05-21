import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class SignupController extends GetxController {
  static SignupController get instance => Get.find();

  //Variables

  //Controllers
  final email = TextEditingController();
  final lastName = TextEditingController();
  final userName = TextEditingController();
  final password = TextEditingController();
  final firstName = TextEditingController();
  final phoneNumber = TextEditingController();

  GlobalKey<FormState> signupFormKey = GlobalKey<FormState>(); //form key for form validatiion

  //--Signup
  Future<void> signup() async {
    try {
      //Start Loading
      TFull

      // check internet connectivity

      // form validation

      // privacy policy check

      //register user in firebase auth and save user data in firebase

      //save authentication user data in firebase firestore

      //show sucess screen

      //move to verify email button
    } catch (e) {
      //show generic error to user
    } finally {
      //remove loader
    }
  }
}
