import 'package:ecommerce_flutter/utils/constants/colors.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              color: TColors.primary,
              padding: EdgeInsets.all(0),
              child: Stack(
                children: [
                  TCircularContainer(
                    backgroundColor: TColors.textWhite.withOpacity(0.1),
                  ),
                  TCircularContainer(
                    backgroundColor: TColors.textWhite.withOpacity(0.1),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}


