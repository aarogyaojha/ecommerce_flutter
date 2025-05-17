import 'package:ecommerce_flutter/common/widgets/texts/section_heading.dart';
import 'package:ecommerce_flutter/features/shop/screens/product_details/widgets/bottom_add_to_cart_widget.dart';
import 'package:ecommerce_flutter/features/shop/screens/product_details/widgets/product_attributes.dart';
import 'package:ecommerce_flutter/features/shop/screens/product_details/widgets/product_meta_data.dart';
import 'package:ecommerce_flutter/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:readmore/readmore.dart';

import 'widgets/product_detail_image_slider.dart';
import 'widgets/rating_share_widget.dart';

class ProductDetail extends StatelessWidget {
  const ProductDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: TBottomAddToCartWidget(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            //----------------------Product Image Slider-------------------------
            TProductImageSlider(),

            //-----------------------Product Details------------------------
            Padding(
              padding: EdgeInsets.only(
                right: TSizes.defaultSpace,
                left: TSizes.defaultSpace,
                bottom: TSizes.defaultSpace,
              ),
              child: Column(
                children: [
                  // ---------------Rating and Share---------------
                  TRatingAndShare(),

                  // ---------------Price , Title, Stock and Brand ---------------
                  TProductMetaData(),

                  // ---------------Attributes---------------
                  TProductAttributes(),
                  SizedBox(height: TSizes.spaceBtwSections),

                  // ---------------Checkout Button---------------
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Text("Checkout"),
                    ),
                  ),
                  SizedBox(height: TSizes.spaceBtwSections),

                  // ---------------Desc---------------
                  TSectionHeading(title: "Description"),
                  SizedBox(height: TSizes.spaceBtwItems),
                  ReadMoreText(
                    "Dolore proident aliquip ea eu elit id nulla excepteur voluptate commodo veniam. Proident elit aute non et consectetur ut nostrud commodo aliquip laboris non sit Lorem. Dolor aliqua do aliqua est voluptate fugiat labore duis ullamco aute incididunt. Aute ex nostrud exercitation do in labore enim eu pariatur eu.",
                    trimLines: 2,
                    trimMode: TrimMode.Line,
                    trimCollapsedText: " Show More",
                    trimExpandedText: " Show Less",
                    moreStyle: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w800,
                    ),
                    lessStyle: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w800,
                    ),
                  ),

                  // ---------------Reviews ---------------
                  Divider(),
                  SizedBox(height: TSizes.spaceBtwItems),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TSectionHeading(title: "Reviews(199)", onPressed: () {}),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(Iconsax.arrow_right_3),
                      ),
                    ],
                  ),

                  SizedBox(height: TSizes.spaceBtwSections),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
