import 'package:ecommerce_flutter/common/widgets/texts/section_heading.dart';
import 'package:ecommerce_flutter/utils/constants/sizes.dart';
import 'package:ecommerce_flutter/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class TBillingAddressSection extends StatelessWidget {
  const TBillingAddressSection({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TSectionHeading(
          title: "Shipping Address",
          buttonTitle: "Change",
          showActionButton: true,
          onPressed: () {},
        ),
        Text("Coding With A", style: Theme.of(context).textTheme.bodyLarge),
        SizedBox(height: TSizes.spaceBtwItems / 2),
        Row(
          children: [
            Icon(Icons.phone, color: Colors.grey, size: 16),
            SizedBox(width: TSizes.spaceBtwItems),
            Text(
              "+91 123 456 7890",
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        ),
        SizedBox(height: TSizes.spaceBtwItems / 2),

        Row(
          children: [
            Icon(Icons.location_history, color: Colors.grey, size: 16),
            SizedBox(width: TSizes.spaceBtwItems),
            Text(
              "vdhdg gvhjdvjh, fshfgsh 4545,USA",
              style: Theme.of(context).textTheme.bodyMedium,
              softWrap: true,
            ),
          ],
        ),
      ],
    );
  }
}
