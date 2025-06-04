import 'package:ecommerce_flutter/app.dart';
import 'package:ecommerce_flutter/features/personalization/controllers/user_controller.dart';
import 'package:ecommerce_flutter/utils/constants/sizes.dart';
import 'package:ecommerce_flutter/utils/constants/text_strings.dart';
import 'package:ecommerce_flutter/utils/validators/validation.dart';
import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:iconsax/iconsax.dart';

class ReAuthenticateUserLoginForm extends StatelessWidget {
  const ReAuthenticateUserLoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;

    return Scaffold(
      appBar: AppBar(title: Text("Re Authenticate User")),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(TSizes.defaultSpace),
          child: Form(
            key: controller.reAuthFormKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //email
                TextFormField(
                  controller: controller.verifyEmail,
                  validator: TValidator.validateEmail,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Iconsax.direct_right),
                    labelText: TTexts.email,
                  ),
                ),
                SizedBox(height: TSizes.spaceBtwInputFields),

                //Password
                Obx(
                  () => TextFormField(
                    obscureText: controller.hidePassword.value,
                    controller: controller.verifyPassword,
                    validator:
                        (value) =>
                            TValidator.validateEmptyText("Passworrd", value),
                    decoration: InputDecoration(
                      labelText: TTexts.password,
                      prefixIcon: Icon(Iconsax.password_check),
                      suffixIcon: IconButton(
                        onPressed:
                            () =>
                                controller.hidePassword.value =
                                    !controller.hidePassword.value,
                        icon: Icon(Iconsax.eye_slash),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: TSizes.spaceBtwSections),
                //login Button
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(onPressed: ()=>controller.reAuthenticateEmailAndPasswordUser(), child: Text("Verify")),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
