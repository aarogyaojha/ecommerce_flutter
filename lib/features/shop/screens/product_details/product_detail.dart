import 'package:ecommerce_flutter/features/shop/screens/product_details/widgets/product_meta_data.dart';
import 'package:ecommerce_flutter/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

import 'widgets/product_detail_image_slider.dart';
import 'widgets/rating_share_widget.dart';

class ProductDetail extends StatelessWidget {
  const ProductDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  // ---------------Checkout Button---------------
                  // ---------------Desc---------------
                  // ---------------Checkout Button---------------
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
