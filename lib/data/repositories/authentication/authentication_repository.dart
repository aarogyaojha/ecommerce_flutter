import 'package:ecommerce_flutter/features/authentication/screens/login/login.dart';
import 'package:ecommerce_flutter/features/authentication/screens/onboarding/onboarding.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  final deviceStrorage = GetStorage();

  @override
  void onReady() {
    FlutterNativeSplash.remove();
    screenRedirect();
  }

  //Function to show relevant screen
  screenRedirect() async {
    //Local Storage ------------
    deviceStrorage.writeIfNull('IsFirstTime', true);
    deviceStrorage.read('IsFirstTime') != true
        ? Get.offAll(() => LoginScreen())
        : Get.offAll(OnboardingScreen());
  }

  // ---------------------------Email and Password Sign In --------------------------------

  // [Email Authentication] - Sign In---------------------------
  // [Email Authentication] -Register--------------------------
  // [ReAuthenticate] - ReAuthenticate User---------------------------
  // [Email Verification] -Mail Verification--------------------------
  // [Email Authentication] -Forgot Password--------------------------

  // ---------------------------Federated Identity and Social Sign In  --------------------------------

  // [Google Authentication] - Google---------------------------
  // [Facebook Authentication] -Facebook--------------------------

  // ---------------------------./end Federated Identity and Social Sign In  --------------------------------

  // [logout user] - Valid for any auth---------------------------
  // [Delete user] -Remove user auth and firestore account--------------------------
}
