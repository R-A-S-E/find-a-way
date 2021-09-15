import 'package:curso_list/src/shared/constants/app_colors.dart';
import 'package:flutter/material.dart';

class StepNumberRegister extends StatelessWidget {
  final int step;
  const StepNumberRegister({Key? key, required this.step}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ballCorrect(),
        step >= 2 ? stripePurple() : stripe(),
        step >= 2 ? ballCorrect() : ballNumber('2'),
        step >= 3 ? stripePurple() : stripe(),
        step >= 3 ? ballCorrect() : ballNumber('3'),
        step >= 4 ? stripePurple() : stripe(),
        step >= 4 ? ballCorrect() : ballNumber('4'),
      ],
    );
  }

  Container stripe() {
    return Container(
      height: 2,
      width: 40,
      decoration: BoxDecoration(
        border: Border.all(
          color: AppColors.grey,
          width: 3,
        ),
      ),
    );
  }

  Container stripePurple() {
    return Container(
      height: 2,
      width: 40,
      decoration: BoxDecoration(
        border: Border.all(
          color: AppColors.wine,
          width: 3,
        ),
      ),
    );
  }

  Container ballNumber(String number) {
    return Container(
      height: 25,
      width: 25,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: AppColors.grey,
          width: 3,
        ),
      ),
      child: Center(
          child: Text(
        number,
        style: TextStyle(
          color: AppColors.grey,
        ),
      )),
    );
  }

  Container ballCorrect() {
    return Container(
      height: 25,
      width: 25,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: AppColors.wine,
      ),
      child: Center(
          child: Icon(
        Icons.done,
        size: 18,
        color: AppColors.white,
      )),
    );
  }
}
