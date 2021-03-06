import 'package:curso_list/src/shared/constants/app_gradients.dart';
import 'package:flutter/material.dart';

class GradientButton extends StatelessWidget {
  final String text;
  final IconData? prefixIcon;
  final IconData? sufixIcon;
  final Function()? onTap;
  const GradientButton(
      {Key? key,
      required this.text,
      this.onTap,
      this.prefixIcon,
      this.sufixIcon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4.0),
          gradient: AppGradients.purpleGradient),
      child: Material(
        borderRadius: BorderRadius.circular(4.0),
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(4.0),
          onTap: onTap,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                prefixIcon,
                color: Colors.white,
              ),
              Text(
                text,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
              Icon(
                sufixIcon,
                color: Colors.white,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
