import 'package:curso_list/src/shared/constants/app_gradients.dart';
import 'package:flutter/material.dart';

class HomeButton extends StatelessWidget {
  final String text;
  final IconData? prefixIcon;
  final IconData? sufixIcon;
  final bool icon;
  final Function()? onTap;
  const HomeButton(
      {Key? key,
      required this.text,
      this.onTap,
      this.prefixIcon,
      this.sufixIcon,
      required this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 1),
      child: Container(
        width: 100,
        height: 40,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20)),
            gradient: AppGradients.purpleGradient),
        child: Material(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(20),
            bottomRight: Radius.circular(20),
          ),
          color: Colors.transparent,
          child: InkWell(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20)),
            onTap: onTap,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                icon == true
                    ? Icon(
                        prefixIcon,
                        color: Colors.white,
                      )
                    : SizedBox(),
                Text(
                  text,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
                icon == true
                    ? Icon(
                        sufixIcon,
                        color: Colors.white,
                      )
                    : SizedBox(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
