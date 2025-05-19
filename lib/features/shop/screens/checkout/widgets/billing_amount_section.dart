import 'package:ecommerce_flutter/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class TBillingAmountSection extends StatelessWidget {
  const TBillingAmountSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Subtotal ------------------------
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Subtotal", style: Theme.of(context).textTheme.bodyMedium),
            Text("\$256", style: Theme.of(context).textTheme.bodyMedium),
          ],
        ),
        SizedBox(height: TSizes.spaceBtwItems / 2),

        // Shipping Fees --------------------
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Tax Fee", style: Theme.of(context).textTheme.bodyMedium),
            Text("\$6.0", style: Theme.of(context).textTheme.labelLarge),
          ],
        ),
        SizedBox(height: TSizes.spaceBtwItems / 2),

        //Tax Fee -----------------------
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Shipping Fees",
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            Text("\$6.0", style: Theme.of(context).textTheme.labelLarge),
          ],
        ),
        SizedBox(height: TSizes.spaceBtwItems / 2),

        //Order Total -----------------------
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Order Total", style: Theme.of(context).textTheme.bodyMedium),
            Text("\$6.0", style: Theme.of(context).textTheme.titleMedium),
          ],
        ),
        SizedBox(height: TSizes.spaceBtwItems / 2),
      ],
    );
  }
}