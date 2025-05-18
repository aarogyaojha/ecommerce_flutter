import 'package:ecommerce_flutter/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:ecommerce_flutter/common/widgets/products/ratings/rating_indicator.dart';
import 'package:ecommerce_flutter/utils/constants/colors.dart';
import 'package:ecommerce_flutter/utils/constants/image_strings.dart';
import 'package:ecommerce_flutter/utils/constants/sizes.dart';
import 'package:ecommerce_flutter/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

class UserReviewCard extends StatelessWidget {
  const UserReviewCard({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage(TImages.userProfileImage1),
                ),
                SizedBox(width: TSizes.spaceBtwItems),
                Text("John Doe", style: Theme.of(context).textTheme.titleLarge),
              ],
            ),
            IconButton(onPressed: () {}, icon: Icon(Icons.more_vert)),
          ],
        ),
        SizedBox(height: TSizes.spaceBtwItems),
        //Review
        Row(
          children: [
            TRatingBarIndicator(rating: 4),
            SizedBox(width: TSizes.spaceBtwItems),
            Text("01 Nov 2024", style: Theme.of(context).textTheme.bodyMedium),
          ],
        ),
        SizedBox(height: TSizes.spaceBtwItems),
        ReadMoreText(
          "Dolor exercitation officia aliqua consectetur mollit dolor. Labore exercitation tempor laboris ullamco est ad quis ea voluptate incididunt magna veniam. Proident ea non incididunt eu minim reprehenderit.",
          trimLines: 2,
          trimMode: TrimMode.Line,
          trimExpandedText: ' show less',
          trimCollapsedText: ' show more',
          moreStyle: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: TColors.primary,
          ),
          lessStyle: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: TColors.primary,
          ),
        ),

        SizedBox(height: TSizes.spaceBtwItems),

        //Company Review ----------------------------------
        TRoundedContainer(
          backgroundColor: dark ? TColors.darkerGrey : TColors.grey,
          child: Padding(
            padding: EdgeInsets.all(TSizes.md),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "A's Store",
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    Text(
                      "02 Nov 2024",
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ],
                ),
                SizedBox(height: TSizes.spaceBtwItems),
                ReadMoreText(
                  "Dolor exercitation officia aliqua consectetur mollit dolor. Labore exercitation tempor laboris ullamco est ad quis ea voluptate incididunt magna veniam. Proident ea non incididunt eu minim reprehenderit.",
                  trimLines: 2,
                  trimMode: TrimMode.Line,
                  trimExpandedText: ' show less',
                  trimCollapsedText: ' show more',
                  moreStyle: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: TColors.primary,
                  ),
                  lessStyle: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: TColors.primary,
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: TSizes.spaceBtwSections),
      ],
    );
  }
}
