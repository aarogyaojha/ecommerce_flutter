import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/image_strings.dart';
import '../images/circular_image.dart';

class TUserProfileTile extends StatelessWidget {
  const TUserProfileTile({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: TCircularImage(image: TImages.user, width: 50, height: 50),
      title: Text(
        "Aarogya Ojha",
        style: Theme.of(
          context,
        ).textTheme.headlineSmall!.apply(color: TColors.white),
      ),
      subtitle: Text(
        "aarogya@gmail.com",
        style: Theme.of(
          context,
        ).textTheme.bodyMedium!.apply(color: TColors.white),
      ),
      trailing: IconButton(
        onPressed: () {},
        icon: Icon(Iconsax.edit, color: TColors.white),
      ),
    );
  }
}
