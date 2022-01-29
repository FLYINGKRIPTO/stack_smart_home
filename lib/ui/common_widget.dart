import 'package:flutter/material.dart';
import 'package:stack_smart_home/utils/color.dart';
import 'package:stack_smart_home/utils/costants.dart';
import 'package:stack_smart_home/utils/textstyle.dart';

Widget temperatureTextWidget(
    {required String temperature, bool center = false}) {
  return RichText(
    text: TextSpan(
      text: temperature,
      style: bold.size36.primaryColor,
      children: <TextSpan>[
        TextSpan(
            text: StringConstants.degreeCelcius,
            style: medium.size16.primaryColor),
      ],
    ),
  );
}

Widget meterTemperatureTextWidget(
    {required String temperature}) {
  return
    RichText(
      text: TextSpan(
        text: temperature,
        style: regular.size14.colorGrey,
        children: <TextSpan>[
          TextSpan(
              text: StringConstants.degreeCelcius,
              style: regular.size10.colorGrey),
        ],
      ),
    );
}

Widget dot({required Color? color}) {
  return Container(
    width: 5,
    height: 5,
    decoration: BoxDecoration(
        shape: BoxShape.circle, color: color ?? BrandColor.white),
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
          child: const Icon(Icons.keyboard_arrow_right_sharp,
              color: BrandColor.white)),
    ],
  );
}
