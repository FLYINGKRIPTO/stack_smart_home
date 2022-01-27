import 'package:flutter/material.dart';
import 'package:stack_smart_home/utils/color.dart';
import 'package:stack_smart_home/utils/costants.dart';
import 'package:stack_smart_home/utils/space.dart';
import 'package:stack_smart_home/utils/textstyle.dart';

Widget temperatureTextWidget(
    {required String temperature, bool center = false}) {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.baseline,
    textBaseline: TextBaseline.alphabetic,
    mainAxisAlignment:
        center ? MainAxisAlignment.center : MainAxisAlignment.start,
    children: [
      Text(
        temperature,
        style: bold.size36.primaryColor,
      ),
      horizontalSpace(4.0),
      Text(
        StringConstants.degreeCelcius,
        style: medium.size16.primaryColor,
      )
    ],
  );
}

Widget temperatureTextWidget2(
    {required String temperature, bool center = false}) {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.baseline,
    textBaseline: TextBaseline.alphabetic,
    mainAxisAlignment:
        center ? MainAxisAlignment.center : MainAxisAlignment.start,
    children: [
      Text(
        temperature,
        style: regular.size14.colorGrey,
      ),
      horizontalSpace(4.0),
      Text(
        StringConstants.degreeCelcius,
        style: regular.size10.colorGrey,
      )
    ],
  );
}

Widget dot({required Color color}) {
  return Container(
    width: 5,
    height: 5,
    decoration: BoxDecoration(shape: BoxShape.circle, color: color),
  );
}

Widget cardHeadingWidget({required String name, VoidCallback? onPressed}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(
        name,
        style: regular.size20,
      ),
      GestureDetector(
          onTap: () => onPressed,
          child: const Icon(Icons.keyboard_arrow_right_sharp, color: BrandColor.white)),
    ],
  );
}
