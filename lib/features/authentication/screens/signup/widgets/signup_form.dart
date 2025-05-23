import 'package:ecommerce_flutter/features/authentication/controllers/signup/signup_controller.dart';
import 'package:ecommerce_flutter/utils/validators/validation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/text_strings.dart';
import 'terms_and_conditions.dart';

class TSignupForm extends StatelessWidget {
  const TSignupForm({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignupController());

    return Form(
      key: controller.signupFormKey,
      child: Column(
        children: [
          Row(
            children: [
              //First Name ------------------------
              Expanded(
                child: TextFormField(
                  controller: controller.firstName,
                  validator:
                      (value) =>
                          TValidator.validateEmptyText("First Name", value),
                  expands: false,
                  decoration: InputDecoration(
                    labelText: TTexts.firstName,
                    prefixIcon: Icon(Iconsax.user),
                  ),
                ),
              ),
              SizedBox(width: TSizes.spaceBtwInputFields),

              //Last Name -------------------------------------
              Expanded(
                child: TextFormField(
                  controller: controller.lastName,
                  validator:
                      (value) =>
                          TValidator.validateEmptyText("Last Name", value),
                  expands: false,
                  decoration: InputDecoration(
                    labelText: TTexts.lastName,
                    prefixIcon: Icon(Iconsax.user),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: TSizes.spaceBtwInputFields),

          //Username-----------------------------------------
          TextFormField(
            controller: controller.userName,
            validator:
                (value) => TValidator.validateEmptyText("Username", value),
            expands: false,
            decoration: InputDecoration(
              labelText: TTexts.username,
              prefixIcon: Icon(Iconsax.user_edit),
            ),
          ),

          SizedBox(height: TSizes.spaceBtwInputFields),

          //Email-------------------------------------------
          TextFormField(
            controller: controller.email,
            validator: (value) => TValidator.validateEmail(value),
            expands: false,
            decoration: InputDecoration(
              labelText: TTexts.email,
              prefixIcon: Icon(Iconsax.direct),
            ),
          ),

          SizedBox(height: TSizes.spaceBtwInputFields),

          //Phone Number---------------------------------------
          TextFormField(
            controller: controller.phoneNumber,
            validator: (value) => TValidator.validatePhoneNumber(value),
            expands: false,
            decoration: InputDecoration(
              labelText: TTexts.phoneNo,
              prefixIcon: Icon(Iconsax.call),
            ),
          ),

          SizedBox(height: TSizes.spaceBtwInputFields),

          //Password-----------------------------------------------
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

          SizedBox(height: TSizes.spaceBtwInputFields),

          TTermsAndConditions(),
          SizedBox(height: TSizes.spaceBtwSections),

          //SignUp Button
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () => controller.signup(),
              child: Text(TTexts.createAccount),
            ),
          ),
          // SizedBox(
          //   width: double.infinity,
          //   child: ElevatedButton(
          //     onPressed: () => SignupController.instance.testFirebaseAuth(),
          //     child: Text(TTexts.createAccount),
          //   ),
          // ),
        ],
      ),
    );
  }
}
