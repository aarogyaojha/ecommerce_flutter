import 'package:flutter/material.dart';

import 'widgets/product_detail_image_slider.dart';

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
          ],
        ),
      ),
    );
  }
}
