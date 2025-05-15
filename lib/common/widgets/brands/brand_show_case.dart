import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/helpers/helper_functions.dart';
import '../custom_shapes/containers/rounded_container.dart';
import 't_brand_card.dart';

class TBrandShowCase extends StatelessWidget {
  const TBrandShowCase({super.key, required this.images});

  final List<String> images;

  @override
  Widget build(BuildContext context) {
    return TRoundedContainer(
      showBorder: true,
      borderColor: TColors.darkGrey,
      backgroundColor: Colors.transparent,
      padding: EdgeInsets.all(TSizes.md),
      margin: EdgeInsets.only(bottom: TSizes.spaceBtwItems),
      child: Column(
        children: [
          //-------------------------------Brands with product count-----------------------------------------------
          TBrandCard(showborder: false),
          SizedBox(height: TSizes.spaceBtwItems),
          //-------------------------------Brand top 3 product img-----------------------------------------------
          Row(
            children:
                images
                    .map((image) => brandTopProductImageWidget(image, context))
                    .toList(),
          ),
        ],
      ),
    );
  }

  Widget brandTopProductImageWidget(String image, context) {
    return Expanded(
      child: TRoundedContainer(
        height: 100,
        padding: EdgeInsets.all(TSizes.md),
        margin: EdgeInsets.only(right: TSizes.sm),
        backgroundColor:
            THelperFunctions.isDarkMode(context)
                ? TColors.darkerGrey
                : TColors.light,
        child: Image(image: AssetImage(image), fit: BoxFit.contain),
      ),
    );
  }
}
