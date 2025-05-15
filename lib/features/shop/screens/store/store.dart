import 'package:ecommerce_flutter/common/widgets/appbar/appbar.dart';
import 'package:ecommerce_flutter/common/widgets/appbar/tabbar.dart';
import 'package:ecommerce_flutter/common/widgets/custom_shapes/containers/search_container.dart';
import 'package:ecommerce_flutter/common/widgets/layouts/grid_layout.dart';
import 'package:ecommerce_flutter/common/widgets/products/cart/cart_menu_icon.dart';
import 'package:ecommerce_flutter/common/widgets/texts/section_heading.dart';
import 'package:ecommerce_flutter/features/shop/screens/store/widgets/category_tab.dart';
import 'package:ecommerce_flutter/utils/constants/colors.dart';
import 'package:ecommerce_flutter/utils/constants/sizes.dart';
import 'package:ecommerce_flutter/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import '../../../../common/widgets/brands/t_brand_card.dart';

class StoreScreen extends StatelessWidget {
  const StoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: TAppBar(
          title: Text(
            "Store",
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          actions: [TCartCounterIcon(onPressed: () {})],
        ),
        body: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              SliverAppBar(
                pinned: true,
                floating: true,
                backgroundColor:
                    THelperFunctions.isDarkMode(context)
                        ? TColors.black
                        : TColors.white,
                expandedHeight: 440,
                automaticallyImplyLeading: false,
                flexibleSpace: Padding(
                  padding: EdgeInsets.all(TSizes.defaultSpace),
                  child: ListView(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    children: [
                      SizedBox(height: TSizes.spaceBtwItems),

                      //--------------------------------Search Bar----------------------------------------------
                      TSearchContainer(
                        text: "Search in Store",
                        showBorder: true,
                        showBackground: false,
                        padding: EdgeInsets.zero,
                      ),
                      SizedBox(height: TSizes.spaceBtwSections),

                      //-------------------------------Featured Brands-----------------------------------------------
                      TSectionHeading(
                        title: "Featured Brands",
                        showActionButton: true,
                        onPressed: () {},
                      ),
                      SizedBox(height: TSizes.spaceBtwItems / 2),

                      //-------------------------------Brands Grid-----------------------------------------------
                      TGridLayout(
                        mainAxisExtent: 80,
                        itemCount: 4,
                        itemBuilder: (_, index) {
                          return TBrandCard(showborder: true);
                        },
                      ),
                    ],
                  ),
                ),

                //-------------------------------Tabs-----------------------------------------------
                bottom: TTabbar(
                  tabs: [
                    Tab(child: Text("Sports")),
                    Tab(child: Text("Furniture")),
                    Tab(child: Text("Electronics")),
                    Tab(child: Text("Clothes")),
                    Tab(child: Text("Cosmetics")),
                  ],
                ),
              ),
            ];
          },
          //-------------------------------Body-----------------------------------------------
          body: TabBarView(
            children: [
              TCategoryTab(),
              TCategoryTab(),
              TCategoryTab(),
              TCategoryTab(),
              TCategoryTab(),
            ],
          ),
        ),
      ),
    );
  }
}
