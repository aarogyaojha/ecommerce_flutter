import 'package:ecommerce_flutter/common/widgets/appbar/appbar.dart';
import 'package:ecommerce_flutter/common/widgets/images/circular_image.dart';
import 'package:ecommerce_flutter/common/widgets/texts/section_heading.dart';
import 'package:ecommerce_flutter/utils/constants/image_strings.dart';
import 'package:ecommerce_flutter/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import 'widgets/profile_menu.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar(showBackArrow: true, title: Text("Profile")),
      //----------------Body-----------------------
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              //---------------Profile Picture--------------------
              SizedBox(
                width: double.infinity,
                child: Column(
                  children: [
                    TCircularImage(image: TImages.user, width: 80, height: 80),
                    TextButton(
                      onPressed: () {},
                      child: Text("Change Profile Picture"),
                    ),
                  ],
                ),
              ),

              //-------------------Details-----------------------------
              SizedBox(height: TSizes.spaceBtwItems / 2),
              Divider(),
              SizedBox(height: TSizes.spaceBtwItems),

              TSectionHeading(title: "Profile Information"),
              SizedBox(height: TSizes.spaceBtwItems),

              TProfileMenu(
                onPressed: () {},
                title: 'Name',
                value: 'Aarogya Ojha',
              ),
              TProfileMenu(
                onPressed: () {},
                title: 'Username',
                value: 'Aarogya_Ojha',
              ),

              SizedBox(height: TSizes.spaceBtwItems),
              Divider(),
              SizedBox(height: TSizes.spaceBtwItems),

              TSectionHeading(title: "Personal Information"),

              TProfileMenu(
                onPressed: () {},
                title: 'User ID',
                value: '32514',
                icon: Iconsax.copy,
              ),
              TProfileMenu(
                onPressed: () {},
                title: 'Email',
                value: 'aarogya@gmail.com',
              ),
              TProfileMenu(
                onPressed: () {},
                title: 'Phone Number',
                value: '+91 123 456 7890',
              ),
              TProfileMenu(onPressed: () {}, title: 'Gender', value: 'Male'),
              TProfileMenu(
                onPressed: () {},
                title: 'Date Of Birth',
                value: '25 July 2004',
              ),

              Divider(),
              SizedBox(height: TSizes.spaceBtwItems),

              Center(
                child: TextButton(
                  onPressed: () {},
                  child: Text(
                    "Close Account",
                    style: TextStyle(color: Colors.red),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
