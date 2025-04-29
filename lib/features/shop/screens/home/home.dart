import 'package:ecommerce_flutter/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

import '../../../../common/widgets/custom_shapes/containers/primary_heade_container.dart';
import '../../../../common/widgets/custom_shapes/containers/search_container.dart';
import 'widgets/home_appbar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            //AppBAr
            TPrimaryHeaderContainer(
              child: Column(
                children: [
                  //AppBAr
                  THomeAppBar(),
                  SizedBox(height: TSizes.spaceBtwSections),
                  // SearchBar
                  TSearchContainer(text: 'Search in store'),
                  SizedBox(height: TSizes.spaceBtwSections),

                  //Categories
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
