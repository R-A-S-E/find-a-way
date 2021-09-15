import 'package:animated_card/animated_card.dart';
import 'package:curso_list/src/shared/constants/app_images.dart';
import 'package:flutter/material.dart';

class LogoSplashWidget extends StatelessWidget {
  const LogoSplashWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.topCenter,
      children: [
        AnimatedCard(
          direction: AnimatedCardDirection.top,
          child: Container(
            alignment: Alignment.center,
            child: Image.asset(
              AppImages.bata,
              height: 350,
              width: 350,
            ),
          ),
        ),
        AnimatedCard(
          child: Container(
            alignment: Alignment.center,
            child: Image.asset(
              AppImages.logoWhite,
              height: 150,
              width: 150,
            ),
          ),
        )
      ],
    );
  }
}
