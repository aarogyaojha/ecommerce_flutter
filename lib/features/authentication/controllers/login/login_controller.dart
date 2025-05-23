import 'package:ecommerce_flutter/data/repositories/authentication/authentication_repository.dart';
import 'package:ecommerce_flutter/features/personalization/controllers/user_controller.dart';
import 'package:ecommerce_flutter/utils/constants/image_strings.dart';
import 'package:ecommerce_flutter/utils/helpers/network_manager.dart';
import 'package:ecommerce_flutter/utils/popups/full_screen_loader.dart';
import 'package:ecommerce_flutter/utils/popups/loaders.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class LoginController extends GetxController {
  //variables
  final rememberMe = false.obs;
  final hidePassword = true.obs;

  final localStorage = GetStorage();

  final email = TextEditingController();
  final password = TextEditingController();

  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();

  final userController = Get.put(UserController());

  @override
  void onInit() {
    email.text = localStorage.read("REMEMBER_ME_EMAIL");
    password.text = localStorage.read("REMEMBER_ME_PASSWORD");
    super.onInit();
  }

  //Email and password sign In
  Future<void> emailAndPasswordSignIn() async {
    try {
      TFullScreenLoader.openLoadingDialog("Loggin You In", TImages.creditCard);

      //check internet connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        TFullScreenLoader.stopLoading();
        return;
      }

      //Form validation
      if (!loginFormKey.currentState!.validate()) {
        TFullScreenLoader.stopLoading();
        return;
      }

      // save data if remember me is selected
      if (rememberMe.value) {
        localStorage.write("REMEMBER_ME_EMAIL", email.text.trim());
        localStorage.write("REMEMBER_ME_PASSWORD", password.text.trim());
      }

      //login user using email and password
      final userCredentials = await AuthenticationRepository.instance
          .loginWithEmailAndPassword(email.text.trim(), password.text.trim());

      // remove loader
      TFullScreenLoader.stopLoading();

      //Redirect
      AuthenticationRepository.instance.screenRedirect();
    } catch (e) {
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(title: "Oh Snap!", message: e.toString());
    }
  }

  //Google sign in authentication
  Future<void> googleSignIn() async {
    try {
      TFullScreenLoader.openLoadingDialog("Logging You In", TImages.acerlogo);

      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        TFullScreenLoader.stopLoading();
        return;
      }

      //Google Sign In
      final userCredentials =
          await AuthenticationRepository.instance.signInWithGoogle();

      //save user record
      await userController.saveUserRecord(userCredentials);

      // Remove loader
      TFullScreenLoader.stopLoading();

      // Redirect
      AuthenticationRepository.instance.screenRedirect();
    } catch (e) {
      // Remove loader
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(title: "Oh Snap!", message: e.toString());
    }
  }
}
