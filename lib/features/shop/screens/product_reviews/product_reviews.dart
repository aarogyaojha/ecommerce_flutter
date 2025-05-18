import 'package:ecommerce_flutter/common/widgets/appbar/appbar.dart';
import 'package:ecommerce_flutter/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import '../../../../common/widgets/products/ratings/rating_indicator.dart';
import 'widgets/rating_progress_indicator.dart';

class ProductReviewsScreen extends StatelessWidget {
  const ProductReviewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //-------------------Appbar-------------------------
      appBar: TAppBar(title: Text("Reviews & Ratings"), showBackArrow: true),
      //----------------Body-----------------------------
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Esse esse et duis reprehenderit aliquip reprehenderit Lorem anim.",
              ),
              SizedBox(height: TSizes.spaceBtwItems),
              //Overall product ratings---------------------
              TOverallProductRating(),
              TRatingBarIndicator(rating: 3.5),
              Text("12,611", style: Theme.of(context).textTheme.bodySmall),
              SizedBox(height: TSizes.spaceBtwSections ),
            ],
          ),
        ),
      ),
    );
  }
}
