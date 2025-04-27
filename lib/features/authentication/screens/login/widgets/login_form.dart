import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/text_strings.dart';

class TForm extends StatelessWidget {
  const TForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: TSizes.spaceBtwSections),
        child: Column(
          children: [
            TextFormField(
              decoration: InputDecoration(
                prefixIcon: Icon(Iconsax.direct_right),
                labelText: TTexts.email,
              ),
            ),
            SizedBox(height: TSizes.spaceBtwInputFields),
            TextFormField(
              decoration: InputDecoration(
                prefixIcon: Icon(Iconsax.password_check),
                labelText: TTexts.password,
                suffixIcon: Icon(Iconsax.eye_slash),
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
                    Checkbox(value: true, onChanged: (value) {}),
                    Text(TTexts.rememberMe),
                  ],
                ),

                //Forget Password
                TextButton(
                  onPressed: () {},
                  child: Text(TTexts.forgetPassword),
                ),
              ],
            ),
            SizedBox(height: TSizes.spaceBtwSections),

            //Sign In and Create Account Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
                child: Text(TTexts.signIn),
              ),
            ),
            SizedBox(height: TSizes.spaceBtwItems),

            SizedBox(
              width: double.infinity,
              child: OutlinedButton(
                onPressed: () {},
                child: Text(TTexts.createAccount),
              ),
            ),
          ],
        ),
      ),
    );
  }
}