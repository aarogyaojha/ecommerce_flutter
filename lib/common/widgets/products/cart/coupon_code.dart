import 'package:ecommerce_flutter/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:ecommerce_flutter/utils/constants/colors.dart';
import 'package:ecommerce_flutter/utils/constants/sizes.dart';
import 'package:ecommerce_flutter/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class TCouponCode extends StatelessWidget {
  const TCouponCode({super.key});


  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return TRoundedContainer(
      showBorder: true,
      backgroundColor: dark ? TColors.dark : TColors.white,
      padding: EdgeInsets.only(
        top: TSizes.sm,
        bottom: TSizes.sm,
        right: TSizes.sm,
        left: TSizes.md,
      ),
      child: Row(
        children: [
          Flexible(
            child: TextFormField(
              decoration: InputDecoration(
                hintText: "Have a Promo Code? Enter Here",
                focusedBorder: InputBorder.none,
                border: InputBorder.none,
                enabledBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
                errorBorder: InputBorder.none,
                focusedErrorBorder: InputBorder.none,
              ),
            ),
          ),

          //Button ----------------------------
          SizedBox(
            width: 80,

            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                foregroundColor:
                    dark
                        ? TColors.white.withOpacity(0.5)
                        : TColors.dark.withOpacity(0.5),

                backgroundColor: TColors.grey.withOpacity(0.2),
                side: BorderSide(color: TColors.grey.withOpacity(0.1)),
              ),
              onPressed: () {},
              child: Text("Apply "),
            ),
          ),
        ],
      ),
    );
  }
}
