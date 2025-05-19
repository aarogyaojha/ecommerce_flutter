import 'package:ecommerce_flutter/common/widgets/appbar/appbar.dart';
import 'package:ecommerce_flutter/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:ecommerce_flutter/common/widgets/products/cart/coupon_code.dart';
import 'package:ecommerce_flutter/common/widgets/sucess_screen/sucess_screen.dart';
import 'package:ecommerce_flutter/features/shop/screens/cart/widgets/cart_items.dart';
import 'package:ecommerce_flutter/features/shop/screens/checkout/widgets/billing_address_section.dart';
import 'package:ecommerce_flutter/features/shop/screens/checkout/widgets/billing_amount_section.dart';
import 'package:ecommerce_flutter/features/shop/screens/checkout/widgets/billing_payment_section.dart';
import 'package:ecommerce_flutter/navigation_menu.dart';
import 'package:ecommerce_flutter/utils/constants/colors.dart';
import 'package:ecommerce_flutter/utils/constants/image_strings.dart';
import 'package:ecommerce_flutter/utils/constants/sizes.dart';
import 'package:ecommerce_flutter/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Scaffold(
      appBar: TAppBar(
        showBackArrow: true,
        title: Text(
          "Order Review",
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              //Items in Cart------------------------
              TCartItems(showAddRemoveButtons: false),
              SizedBox(height: TSizes.spaceBtwSections),

              //Coupons textfield----------------------
              TCouponCode(),
              SizedBox(height: TSizes.spaceBtwSections),

              // Billing Sections-------------------------
              TRoundedContainer(
                showBorder: true,
                backgroundColor: dark ? TColors.black : TColors.white,
                padding: EdgeInsets.all(TSizes.md),
                child: Column(
                  children: [
                    //Pricing------------------
                    TBillingAmountSection(),
                    SizedBox(height: TSizes.spaceBtwItems),

                    //Divider------------------
                    Divider(),
                    SizedBox(height: TSizes.spaceBtwItems),

                    //Payment Methods----------
                    TBillingPaymentSection(),
                    SizedBox(height: TSizes.spaceBtwItems),

                    //Address -----------------
                    TBillingAddressSection(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: ElevatedButton(
          onPressed:
              () => Get.to(
                () => SucessScreen(
                  image: TImages.successfulPaymentIcon,
                  title: 'Payment Sucess!',
                  subitle: 'Your Item will be shipped soon !',
                  onPressed: () => Get.offAll(() => NavigationMenu()),
                ),
              ),
          child: Text("Checkout \$256"),
        ),
      ),
    );
  }
}
