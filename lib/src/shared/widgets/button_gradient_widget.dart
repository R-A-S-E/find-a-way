import 'package:curso_list/src/shared/constants/app_gradients.dart';
import 'package:flutter/material.dart';

class GradientButton extends StatelessWidget {
  final String text;
  final Function()? onTap;
  const GradientButton({Key? key, required this.text, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4.0),
          gradient: AppGradients.purpleGradient),
      height: 45,
      width: double.infinity,
      child: Material(
        borderRadius: BorderRadius.circular(4.0),
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(4.0),
          onTap: () {},
          child: Center(
              child: Text(
            text,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          )),
        ),
      ),
    );
  }
}
