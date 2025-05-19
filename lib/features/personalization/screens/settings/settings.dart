import 'package:ecommerce_flutter/common/widgets/appbar/appbar.dart';
import 'package:ecommerce_flutter/common/widgets/custom_shapes/containers/primary_heade_container.dart';
import 'package:ecommerce_flutter/common/widgets/list_tiles/settings_menu_tile.dart';
import 'package:ecommerce_flutter/common/widgets/texts/section_heading.dart';
import 'package:ecommerce_flutter/features/personalization/screens/address/address.dart';
import 'package:ecommerce_flutter/features/shop/screens/order/order.dart';
import 'package:ecommerce_flutter/utils/constants/colors.dart';
import 'package:ecommerce_flutter/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../common/widgets/list_tiles/user_profile_tile.dart';
import '../profile/profile.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            //----------------------------Header-------------------
            TPrimaryHeaderContainer(
              child: Column(
                children: [
                  TAppBar(
                    title: Text(
                      "Account",
                      style: Theme.of(
                        context,
                      ).textTheme.headlineMedium!.apply(color: TColors.white),
                    ),
                  ),

                  //-------------------User profile card----------------------
                  TUserProfileTile(
                    onPressed: () => Get.to(() => ProfileScreen()),
                  ),
                  SizedBox(height: TSizes.spaceBtwSections),
                ],
              ),
            ),

            //------------------------------Body---------------------------
            Padding(
              padding: EdgeInsets.all(TSizes.defaultSpace),
              child: Column(
                children: [
                  TSectionHeading(title: "Account Settings"),
                  SizedBox(height: TSizes.spaceBtwItems),
                  TSettingsMenuTile(
                    onTap: () => Get.to(() => UserAddressScreen()),
                    icon: Iconsax.safe_home,
                    title: "My Address",
                    subTitle: "Set shopping delivery address",
                  ),
                  TSettingsMenuTile(
                    icon: Iconsax.shopping_cart,
                    title: "My Cart",
                    subTitle: "Add, remove products and move to checkout",
                  ),
                  TSettingsMenuTile(
                    onTap: () => Get.to(() => OrderScreen()),
                    icon: Iconsax.bag_tick,
                    title: "My Orders",
                    subTitle: "In Progress and Completed Orders",
                  ),
                  TSettingsMenuTile(
                    icon: Iconsax.bank,
                    title: "Bank Account",
                    subTitle: "Withdraw balance to registered Bank Account",
                  ),
                  TSettingsMenuTile(
                    icon: Iconsax.discount_shape,
                    title: "My Coupons",
                    subTitle: "List of all the discounted coupons",
                  ),
                  TSettingsMenuTile(
                    icon: Iconsax.notification,
                    title: "Notifications",
                    subTitle: "Set any kind of notification message",
                  ),
                  TSettingsMenuTile(
                    icon: Iconsax.security_card,
                    title: "Account Privacy",
                    subTitle: "Manage data usage and connected accounts",
                  ),

                  //------------------App Settings---------------------------------------
                  SizedBox(height: TSizes.spaceBtwSections),
                  TSectionHeading(title: "App Settings"),
                  SizedBox(height: TSizes.spaceBtwItems),
                  TSettingsMenuTile(
                    icon: Iconsax.document_upload,
                    title: "Load Data",
                    subTitle: "Upload data to your cloud firebase",
                  ),
                  TSettingsMenuTile(
                    icon: Iconsax.location,
                    title: "Geolocation",
                    subTitle: "Set recommendation based on location",
                    trailing: Switch(value: true, onChanged: (value) {}),
                  ),
                  TSettingsMenuTile(
                    icon: Iconsax.security_user,
                    title: "Safe Mode",
                    subTitle: "Search result is not safe for all ages",
                    trailing: Switch(value: false, onChanged: (value) {}),
                  ),
                  TSettingsMenuTile(
                    icon: Iconsax.image,
                    title: "HD Image quality",
                    subTitle: "Set image quality to be seen",
                    trailing: Switch(value: false, onChanged: (value) {}),
                  ),

                  //-----------------------Logout Button-----------------------------------------
                  SizedBox(height: TSizes.spaceBtwSections),
                  SizedBox(
                    width: double.infinity,
                    child: OutlinedButton(
                      onPressed: () {},
                      child: Text("Logout"),
                    ),
                  ),
                  SizedBox(height: TSizes.spaceBtwSections * 2.5),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
