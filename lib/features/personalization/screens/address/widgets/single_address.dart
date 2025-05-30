import 'package:ecommerce_flutter/utils/constants/colors.dart';
import 'package:ecommerce_flutter/utils/constants/sizes.dart';
import 'package:ecommerce_flutter/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../common/widgets/custom_shapes/containers/rounded_container.dart';

class TSingleAddress extends StatelessWidget {
  const TSingleAddress({super.key, required this.selectedAddress});

  final bool selectedAddress;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return TRoundedContainer(
      padding: EdgeInsets.all(TSizes.md),
      width: double.infinity,
      showBorder: true,
      backgroundColor:
          selectedAddress
              ? TColors.primary.withOpacity(0.5)
              : Colors.transparent,
      borderColor:
          selectedAddress
              ? Colors.transparent
              : dark
              ? TColors.darkerGrey
              : TColors.grey,

      margin: EdgeInsets.only(bottom: TSizes.spaceBtwItems),
      child: Stack(
        children: [
          Positioned(
            right: 5,
            top: 0,
            child: Icon(
              selectedAddress ? Iconsax.tick_circle5 : null,
              color:
                  selectedAddress
                      ? dark
                          ? TColors.light
                          : TColors.dark.withOpacity(0.6)
                      : null,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "John Doe",
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              SizedBox(height: TSizes.sm / 2),

              Text(
                "(+91) 123 456 7890",
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              SizedBox(height: TSizes.sm / 2),

              Text("6868 Address add, nice good, 55785, USA", softWrap: true),
              SizedBox(height: TSizes.sm / 2),
            ],
          ),
        ],
      ),
    );
  }
}
