import 'package:ecommerce_flutter/common/widgets/login_signup/form_divider.dart';
import 'package:ecommerce_flutter/common/widgets/login_signup/social_buttons.dart';
import 'package:ecommerce_flutter/utils/constants/sizes.dart';
import 'package:ecommerce_flutter/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'verify_email.dart';
import 'widgets/signup_form.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //Title
              Text(
                TTexts.signupTitle,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              SizedBox(height: TSizes.spaceBtwItems),

              //SignupForm
              TSignupForm(),

              SizedBox(height: TSizes.spaceBtwSections),

              //SignUp Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Get.to(() => VerifyEmailScreen());
                  },
                  child: Text(TTexts.createAccount),
                ),
              ),
              SizedBox(height: TSizes.spaceBtwSections),

              //divider
              TFormDivider(dividerText: TTexts.orSignUpWith.capitalize!),
              SizedBox(height: TSizes.spaceBtwSections),

              //social buttons
              TSocialButtons(),
            ],
          ),
        ),
      ),
    );
  }
}
