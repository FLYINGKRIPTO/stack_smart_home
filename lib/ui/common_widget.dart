import 'package:flutter/material.dart';
import 'package:stack_smart_home/utils/space.dart';
import 'package:stack_smart_home/utils/textstyle.dart';

Widget temperatureTextWidget({required String temperature,bool center = false}) {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.baseline,
    textBaseline: TextBaseline.alphabetic,
    mainAxisAlignment: center ? MainAxisAlignment.center: MainAxisAlignment.start,
    children: [
      Text(
        temperature,
        style: bold.size36.primaryColor,
      ),
      horizontalSpace(4.0),
      Text(
        "°C",
        style: medium.size16.primaryColor,
      )
    ],
  );
}