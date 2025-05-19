import 'package:ecommerce_flutter/common/widgets/products/cart/add_remove_button.dart';
import 'package:ecommerce_flutter/common/widgets/products/cart/cart_item.dart';
import 'package:ecommerce_flutter/common/widgets/texts/product_price_text.dart';
import 'package:flutter/material.dart';

import '../../../../../utils/constants/sizes.dart';

class TCartItems extends StatelessWidget {
  const TCartItems({super.key, this.showAddRemoveButtons = true});

  final bool showAddRemoveButtons;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      itemCount: 2,
      separatorBuilder: (_, __) => SizedBox(height: TSizes.spaceBtwSections),
      itemBuilder:
          (_, index) => Column(
            children: [
              //Cart Item------------------------------
              TCartItem(),
              if (showAddRemoveButtons) SizedBox(height: TSizes.spaceBtwItems),

              //Add Remove Button Row with total price-------------------------
              if (showAddRemoveButtons)
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        //Extra Space---------------------------
                        SizedBox(width: 70),

                        // Add Remove buttons-----------------------------------
                        TProductQuantityWithAddRemoveButton(),
                      ],
                    ),

                    TproductPriceText(price: "256"),
                  ],
                ),
            ],
          ),
    );
  }
}
