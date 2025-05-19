import 'package:ecommerce_flutter/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:ecommerce_flutter/utils/constants/colors.dart';
import 'package:ecommerce_flutter/utils/constants/sizes.dart';
import 'package:ecommerce_flutter/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class TOrderListItems extends StatelessWidget {
  const TOrderListItems({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return ListView.separated(
      shrinkWrap: true,
      itemCount: 4,
      separatorBuilder: (_, __) => SizedBox(height: TSizes.spaceBtwItems),
      itemBuilder:
          (_, index) => TRoundedContainer(
            padding: EdgeInsets.all(TSizes.md),
            showBorder: true,
            backgroundColor: dark ? TColors.dark : TColors.light,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                //Row 1-----------------------------------------------------
                Row(
                  children: [
                    //1-Icon ------------
                    Icon(Iconsax.ship),
                    SizedBox(width: TSizes.spaceBtwItems / 2),

                    //Status and Date ---------------------
                    Expanded(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Processing",
                            style: Theme.of(context).textTheme.bodyLarge!.apply(
                              color: TColors.primary,
                              fontSizeDelta: 1,
                            ),
                          ),
                          Text(
                            "07 Nov 2024",
                            style: Theme.of(context).textTheme.headlineSmall,
                          ),
                        ],
                      ),
                    ),

                    //arrow icon ----------------
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Iconsax.arrow_right_34, size: TSizes.iconSm),
                    ),
                  ],
                ),

                SizedBox(height: TSizes.spaceBtwItems),

                //Row 2-----------------------------------------------------
                Row(
                  children: [
                    Expanded(
                      child: Row(
                        children: [
                          //1-Icon ------------
                          Icon(Iconsax.tag),
                          SizedBox(width: TSizes.spaceBtwItems / 2),

                          //Status and Date ---------------------
                          Expanded(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Order",
                                  style:
                                      Theme.of(context).textTheme.labelMedium,
                                ),
                                Text(
                                  "[#1367F]",
                                  style:
                                      Theme.of(context).textTheme.titleMedium,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),

                    Expanded(
                      child: Row(
                        children: [
                          //1-Icon ------------
                          Icon(Iconsax.calendar),
                          SizedBox(width: TSizes.spaceBtwItems / 2),

                          //Status and Date ---------------------
                          Expanded(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Shipping Data",
                                  style:
                                      Theme.of(context).textTheme.labelMedium,
                                ),
                                Text(
                                  "03 Feb 2025",
                                  style:
                                      Theme.of(context).textTheme.titleMedium,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
    );
  }
}
