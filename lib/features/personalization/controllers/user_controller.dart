import 'package:ecommerce_flutter/data/repositories/authentication/authentication_repository.dart';
import 'package:ecommerce_flutter/data/repositories/user/user_repository.dart';
import 'package:ecommerce_flutter/features/authentication/screens/login/login.dart';
import 'package:ecommerce_flutter/features/personalization/models/user_model.dart';
import 'package:ecommerce_flutter/features/personalization/screens/profile/widgets/re_authenticate_user_login_form.dart';
import 'package:ecommerce_flutter/utils/constants/image_strings.dart';
import 'package:ecommerce_flutter/utils/constants/sizes.dart';
import 'package:ecommerce_flutter/utils/helpers/network_manager.dart';
import 'package:ecommerce_flutter/utils/popups/full_screen_loader.dart';
import 'package:ecommerce_flutter/utils/popups/loaders.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserController extends GetxController {
  static UserController get instance => Get.find();
  final profileLoading = false.obs;
  Rx<UserModel> user = UserModel.empty().obs;

  final hidePassword = false.obs;
  final verifyEmail = TextEditingController();
  final verifyPassword = TextEditingController();
  final userRepository = Get.put(UserRepository());
  GlobalKey<FormState> reAuthFormKey = GlobalKey<FormState>();

  @override
  void onInit() {
    super.onInit();
    fetchUserRecord();
  }

  Future<void> fetchUserRecord() async {
    try {
      profileLoading.value = true;
      final user = await userRepository.fetchUserDetails();
      this.user(user);
    } catch (e) {
      user(UserModel.empty());
    } finally {
      profileLoading.value = false;
    }
  }

  //save user record from any registration provider
  Future<void> saveUserRecord(UserCredential? userCredentials) async {
    try {
      if (userCredentials != null) {
        // convert name to first name and last name
        final nameParts = UserModel.nameParts(
          userCredentials.user!.displayName ?? "",
        );
        final username = UserModel.generateUsername(
          userCredentials.user!.displayName ?? "",
        );

        //Map Data
        final user = UserModel(
          id: userCredentials.user!.uid,
          firstName: nameParts[0],
          lastName: nameParts.length > 1 ? nameParts.sublist(1).join(" ") : "",
          username: username,
          email: userCredentials.user!.email ?? "",
          phoneNumber: userCredentials.user!.phoneNumber ?? "",
          profilePicture: userCredentials.user!.photoURL ?? "",
        );

        //Save user data
        await userRepository.saveUserRecord(user);
      }
    } catch (e) {
      TLoaders.warningSnackBar(
        title: "Data not Saved",
        message:
            "Something went wrong while saving your information. You can re-save in your profile",
      );
    }
  }

  void deleteAccountWarningPopup() {
    Get.defaultDialog(
      contentPadding: EdgeInsets.all(TSizes.md),
      title: "Delete Account",
      middleText:
          "Are you sure you want to delete your account permanently? This action is not revesible and all your data will be removed permanently",
      confirm: ElevatedButton(
        onPressed: () => deleteUserAccount(),
        style: ElevatedButton.styleFrom(),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: TSizes.lg),
          child: Text("Delete"),
        ),
      ),
      cancel: OutlinedButton(
        onPressed: () => Navigator.of(Get.overlayContext!).pop(),
        child: null,
      ),
    );
  }

  void deleteUserAccount() async {
    try {
      TFullScreenLoader.openLoadingDialog("Processing", TImages.acerlogo);

      //First re-authenticate user
      final auth = AuthenticationRepository.instance;
      final provider =
          auth.authUser!.providerData.map((e) => e.providerId).first;
      if (provider.isNotEmpty) {
        //verify with email
        if (provider == "google.com") {
          await auth.signInWithGoogle();
          await auth.deleteAccount();
          TFullScreenLoader.stopLoading();
          Get.offAll(() => LoginScreen());
        } else if (provider == "password") {
          TFullScreenLoader.stopLoading();
          Get.offAll(() => ReAuthenticateUserLoginForm());
        } 
      }
    } catch (e) {
      TFullScreenLoader.stopLoading();
      TLoaders.warningSnackBar(title: "Oh Snap!", message: e.toString());
    }
  }

  Future<void> reAuthenticateEmailAndPasswordUser() async {
    try {
      TFullScreenLoader.openLoadingDialog("Processing", TImages.acerlogo);

      //check internet
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        TFullScreenLoader.stopLoading();
        return;
      }

      if (!reAuthFormKey.currentState!.validate()) {
        TFullScreenLoader.stopLoading();
        return;
      }

      await AuthenticationRepository.instance
          .reAuthenticateWithEmailAndPassword(
            verifyEmail.text.trim(),
            verifyPassword.text.trim(),
          );
      await AuthenticationRepository.instance.deleteAccount();
      TFullScreenLoader.stopLoading();
      Get.offAll(() => LoginScreen());
    } catch (e) {
      TFullScreenLoader.stopLoading();
      TLoaders.warningSnackBar(title: "Oh Snap !", message: e.toString());
    }
  }
}
