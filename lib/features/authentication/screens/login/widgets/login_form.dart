import 'package:ecommerce_flutter/features/authentication/controllers/login/login_controller.dart';
import 'package:ecommerce_flutter/features/authentication/screens/signup/signup.dart';
import 'package:ecommerce_flutter/navigation_menu.dart';
import 'package:ecommerce_flutter/utils/validators/validation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/text_strings.dart';
import '../../password_configuration/forget_password.dart';

class TForm extends StatelessWidget {
  const TForm({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());
    return Form(
      key: controller.loginFormKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: TSizes.spaceBtwSections),
        child: Column(
          children: [
            TextFormField(
              controller: controller.email,
              validator: (value) => TValidator.validateEmail(value),
              decoration: InputDecoration(
                prefixIcon: Icon(Iconsax.direct_right),
                labelText: TTexts.email,
              ),
            ),
            SizedBox(height: TSizes.spaceBtwInputFields),

            Obx(
              () => TextFormField(
                controller: controller.password,
                validator: (value) => TValidator.validatePassword(value),
                obscureText: controller.hidePassword.value,
                expands: false,
                decoration: InputDecoration(
                  labelText: TTexts.password,
                  prefixIcon: Icon(Iconsax.password_check),
                  suffixIcon: IconButton(
                    icon: Icon(
                      controller.hidePassword.value
                          ? Iconsax.eye_slash
                          : Iconsax.eye,
                    ),
                    onPressed:
                        () =>
                            controller.hidePassword.value =
                                !controller.hidePassword.value,
                  ),
                ),
              ),
            ),
            SizedBox(height: TSizes.spaceBtwInputFields / 2),

            //Remeber me & Forget Password
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //Remeber Me
                Row(
                  children: [
                    Obx(
                      () => Checkbox(
                        value: controller.rememberMe.value,
                        onChanged:
                            (value) =>
                                controller.rememberMe.value =
                                    !controller.rememberMe.value,
                      ),
                    ),
                    Text(TTexts.rememberMe),
                  ],
                ),

                //Forget Password
                TextButton(
                  onPressed: () {
                    Get.to(() => ForgetPasswordScreen());
                  },
                  child: Text(TTexts.forgetPassword),
                ),
              ],
            ),
            SizedBox(height: TSizes.spaceBtwSections),

            //Sign In and Create Account Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => controller.emailAndPasswordSignIn(),
                child: Text(TTexts.signIn),
              ),
            ),
            SizedBox(height: TSizes.spaceBtwItems),

            SizedBox(
              width: double.infinity,
              child: OutlinedButton(
                onPressed: () {
                  Get.to(SignupScreen());
                },
                child: Text(TTexts.createAccount),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
