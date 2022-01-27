import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:stack_smart_home/utils/color.dart';
import 'package:stack_smart_home/utils/costants.dart';
import 'package:stack_smart_home/utils/space.dart';
import 'package:stack_smart_home/utils/textstyle.dart';

class SmartTvWidget extends StatefulWidget {
  const SmartTvWidget({Key? key}) : super(key: key);

  @override
  _SmartTvWidgetState createState() => _SmartTvWidgetState();
}

class _SmartTvWidgetState extends State<SmartTvWidget> {
  bool _toggle = false;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    StringConstants.smartTv,
                    style: regular.size20,
                  ),
                  const Icon(Icons.keyboard_arrow_right_sharp,
                      color: BrandColor.white),
                ],
              ),
              verticalSpace(4.0),
              Text(
                "Samsung UA55 4AC",
                style:
                    regular.size12.copyWith(color: "#E3E0E0".fromHexToColor()),
              )
            ],
          ),
          CupertinoSwitch(
            value: _toggle,
            activeColor: BrandColor.accent,
            trackColor: "#B3AFAC".fromHexToColor(),
            onChanged: (value) {
              setState(() {
                _toggle = value;
              });
            },
          )
        ],
      ),
    );
  }
}
