import 'package:ecommerce_flutter/common/widgets/appbar/appbar.dart';
import 'package:ecommerce_flutter/common/widgets/brands/t_brand_card.dart';
import 'package:ecommerce_flutter/common/widgets/layouts/grid_layout.dart';
import 'package:ecommerce_flutter/common/widgets/texts/section_heading.dart';
import 'package:ecommerce_flutter/features/shop/screens/brand/brand_products.dart';
import 'package:ecommerce_flutter/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AllBrandsScreen extends StatelessWidget {
  const AllBrandsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar(title: Text("Brand"), showBackArrow: true),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              //Heading ----------------------------------
              TSectionHeading(title: "Brands"),
              SizedBox(height: TSizes.spaceBtwItems),

              //Brands-------------------------------------
              TGridLayout(
                itemCount: 10,
                mainAxisExtent: 80,
                itemBuilder:
                    (context, index) => TBrandCard(
                      showborder: true,
                      onTap: () => Get.to(() => BrandProducts()),
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
