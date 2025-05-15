import 'package:ecommerce_flutter/common/widgets/layouts/grid_layout.dart';
import 'package:ecommerce_flutter/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:ecommerce_flutter/common/widgets/texts/section_heading.dart';
import 'package:flutter/material.dart';

import '../../../../../common/widgets/brands/brand_show_case.dart';
import '../../../../../utils/constants/image_strings.dart';
import '../../../../../utils/constants/sizes.dart';

class TCategoryTab extends StatelessWidget {
  const TCategoryTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      children: [
        Padding(
          padding: EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              //-------------------------------Brands-----------------------------------------------
              TBrandShowCase(
                images: [
                  TImages.productImage1,
                  TImages.productImage2,
                  TImages.productImage3,
                ],
              ),

              //-------------------------------Products-----------------------------------------------
              TSectionHeading(
                title: "You might like",
                showActionButton: true,
                onPressed: () {},
              ),
              SizedBox(height: TSizes.spaceBtwItems),

              TGridLayout(
                itemCount: 4,
                itemBuilder: (_, index) => TProductCardVertical(),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
