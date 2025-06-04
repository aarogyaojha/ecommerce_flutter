import 'package:ecommerce_flutter/features/personalization/controllers/user_controller.dart';
import 'package:ecommerce_flutter/utils/loaders/shimmer_effect.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../common/widgets/appbar/appbar.dart';
import '../../../../../common/widgets/products/cart/cart_menu_icon.dart';
import '../../../../../utils/constants/text_strings.dart';

class THomeAppBar extends StatelessWidget {
  const THomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UserController());
    return TAppBar(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            TTexts.homeAppbarTitle,
            style: Theme.of(
              context,
            ).textTheme.labelMedium!.apply(color: Colors.grey),
          ),
          Obx(() {
            if (controller.profileLoading.value) {
              return TShimmerEffect(width: 80, height: 15);
            } else {
              return Text(
                controller.user.value.fullName,
                style: Theme.of(
                  context,
                ).textTheme.headlineSmall!.apply(color: Colors.white),
              );
            }
          }),
        ],
      ),
      actions: [TCartCounterIcon(iconColor: Colors.white)],
    );
  }
}
