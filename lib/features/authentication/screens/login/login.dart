import 'package:ecommerce_flutter/common/styles/spacing_styles.dart';
import 'package:ecommerce_flutter/utils/constants/sizes.dart';
import 'package:ecommerce_flutter/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';

import '../../../../common/widgets/login_signup/form_divider.dart';
import '../../../../common/widgets/login_signup/social_buttons.dart';
import 'widgets/login_form.dart';
import 'widgets/login_header.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: TSpacingStyles.paddingWithAppBarHeight,
          child: Column(
            children: [
              //logo title and subtitle
              TLoginHeader(),

              //Form
              TForm(),

              //Divider
              TFormDivider(dividerText: TTexts.orSignInWith),

              SizedBox(height: TSizes.spaceBtwSections),

              //Footer
              TSocialButtons(),
            ],
          ),
        ),
      ),
    );
  }
}