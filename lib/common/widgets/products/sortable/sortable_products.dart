import 'package:ecommerce_flutter/common/widgets/layouts/grid_layout.dart';
import 'package:ecommerce_flutter/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:ecommerce_flutter/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class TSortableProducts extends StatelessWidget {
  const TSortableProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //DropDown -------------------------------------------
        DropdownButtonFormField(
          decoration: InputDecoration(prefixIcon: Icon(Iconsax.sort)),
          items:
              [
                    "Name",
                    "Higher Price",
                    "Lower Price",
                    "Sale",
                    "Newest",
                    "Popularity",
                  ]
                  .map(
                    (option) =>
                        DropdownMenuItem(value: option, child: Text(option)),
                  )
                  .toList(),

          onChanged: (value) {},
        ),

        SizedBox(height: TSizes.spaceBtwSections),

        //Products ----------------------------------------
        TGridLayout(
          itemCount: 4,
          itemBuilder: (_, index) => TProductCardVertical(),
        ),
      ],
    );
  }
}
