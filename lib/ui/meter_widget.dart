import 'dart:math';

import 'package:flutter/material.dart';
import 'package:stack_smart_home/ui/common_widget.dart';
import 'package:stack_smart_home/ui/ticket_painter.dart';
import 'package:stack_smart_home/utils/space.dart';
import 'package:stack_smart_home/utils/textstyle.dart';
import '../utils/color.dart';

class MeterWidget extends StatelessWidget {
  const MeterWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          left: 20,
          top: 20,
          right: 20,
          bottom: 20,
          child: Container(
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: "#F9F9F9".fromHexToColor(),
                boxShadow: const [
                  BoxShadow(
                    offset: Offset(2, 2),
                    blurRadius: 12,
                    color: Color.fromRGBO(0, 0, 0, 0.1),
                  ),
                ]),
            height: 160,
            width: 160,
          ),
        ),
        Positioned(
          left: 40,
          top: 40,
          right: 40,
          bottom: 40,
          child: Container(
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  offset: Offset(2, 2),
                  blurRadius: 12,
                  color: Color.fromRGBO(0, 0, 0, 0.1),
                ),
              ],
            ),
            height: 100,
            width: 100,
            child: Center(
                child: temperatureTextWidget(temperature: "24", center: true)),
          ),
        ),
        Center(
          child: Container(
            decoration: const BoxDecoration(
                shape: BoxShape.circle, color: Colors.transparent),
            height: 210,
            width: 210,
            child: CustomPaint(
              painter: TickPainter(),
            ),
          ),
        ),
        Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 12.0),
            child: Column(
              children: [
                const Icon(
                  Icons.arrow_drop_up,
                  color: BrandColor.primaryColor,
                ),
                Container(
                  width: 5,
                  height: 5,
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle, color: BrandColor.primaryColor),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
