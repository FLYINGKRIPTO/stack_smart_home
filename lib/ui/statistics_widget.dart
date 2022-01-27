import 'package:flutter/material.dart';
import 'package:stack_smart_home/entities/bar_detail.dart';
import 'package:stack_smart_home/utils/color.dart';
import 'package:stack_smart_home/utils/costants.dart';
import 'package:stack_smart_home/utils/space.dart';

import 'common_widget.dart';

class StatisticsWidget extends StatelessWidget {
  StatisticsWidget({Key? key}) : super(key: key);

  List<BarDetail> items = [
    BarDetail(40, 0, Colors.white),
    BarDetail(3, 22, BrandColor.barColor),
    BarDetail(2, 40, Colors.white),
    BarDetail(17, 0, BrandColor.barColor),
    BarDetail(3, 40, Colors.white),
    BarDetail(2, 20, BrandColor.barColor),
    BarDetail(13, 12, Colors.white),
    BarDetail(3, 43, BrandColor.barColor),
    BarDetail(29, 9, Colors.white),
    BarDetail(44, 1, BrandColor.barColor),
    BarDetail(3, 2, Colors.white),
    BarDetail(33, 12, BrandColor.barColor),
    BarDetail(32, 43, Colors.white),
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: Column(
        children: [
          cardHeadingWidget(name: StringConstants.electricity),
          verticalSpace(16.0),
          Expanded(
            child: ListView.separated(
              separatorBuilder: (context, b) => const SizedBox(
                width: 20,
              ),
              itemCount: items.length,
              physics: const NeverScrollableScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return bar(
                    top: items[index].top,
                    bottom: items[index].bottom,
                    color: items[index].color);
              },
            ),
          ),
          verticalSpace(16.0),
        ],
      ),
    );
  }

  Widget bar(
      {required double top, required double bottom, required Color color}) {
    return Container(
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(16.0),
      ),
      width: 6,
      margin: EdgeInsets.only(bottom: bottom, top: top),
    );
  }
}

