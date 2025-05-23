import 'package:ecommerce_flutter/features/authentication/screens/login/login.dart';
import 'package:ecommerce_flutter/features/authentication/screens/onboarding/onboarding.dart';
import 'package:ecommerce_flutter/utils/exceptions/firebase_auth_exceptions.dart';
import 'package:ecommerce_flutter/utils/exceptions/firebase_exceptions.dart';
import 'package:ecommerce_flutter/utils/exceptions/format_exceptions.dart';
import 'package:ecommerce_flutter/utils/exceptions/platform_exceptions.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  final deviceStrorage = GetStorage();
  final _auth = FirebaseAuth.instance;

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
  Future<UserCredential> registerWithEmailAndPassword(
    String email,
    String password,
  ) async {
    try {
      final userCredential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      
      print("✅ Firebase Auth Response:");
      print("User UID: ${userCredential.user?.uid}");
      print("Email: ${userCredential.user?.email}");
      print("Is Email Verified: ${userCredential.user?.emailVerified}");

      return userCredential;
    } on FirebaseAuthException catch (e) {
      throw TFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw TFormatException();
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw "Something went wrong. Try Again";
    }
  }

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
