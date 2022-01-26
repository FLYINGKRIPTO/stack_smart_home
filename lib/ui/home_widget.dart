import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:stack_smart_home/ui/temperature_widget.dart';
import 'package:stack_smart_home/utils/app_utils.dart';
import 'package:stack_smart_home/utils/color.dart';
import 'package:stack_smart_home/utils/costants.dart';
import 'package:stack_smart_home/utils/space.dart';
import 'package:stack_smart_home/utils/textstyle.dart';

import 'card_widget.dart';

class HomeWidget extends StatelessWidget {
  const HomeWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _greetingSection(),
          _roomSectionGridView(),
          _statisticsSection()
        ],
      ),
    );
  }

  Widget _greetingSection() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            verticalSpace(60.0),
            Text(
              AppUtils.getGreetingMessage(),
              style: regular.size20,
            ),
            verticalSpace(2.0),
            Text(
              StringConstants.userName,
              style: bold.size30,
            ),
          ],
        ),
        Column(
          children: [
            verticalSpace(60.0),
            SizedBox(
              width: 48,
              height: 48,
              child: Stack(
                children: [
                  Container(
                    child: const Icon(
                      Icons.add,
                      color: BrandColor.white,
                      size: 36,
                    ),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        border: Border.all(color: BrandColor.white)),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _roomSectionGridView() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        verticalSpace(32.0),
        Text(StringConstants.livingRoom, style: regular.size20,),
        GridView(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, crossAxisSpacing: 16.0, mainAxisSpacing: 16.0),
          shrinkWrap: true,
          children: [
            CardWidget(
              childWidget: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    StringConstants.homeTemperature,
                    style: regular.size20.primaryColor,
                  ),
                  verticalSpace(16.0),
                  const TemperatureWidget(),
                ],
              ),
              isTransparent: false,
            ),
            CardWidget(
              childWidget: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        StringConstants.plugWall,
                        style: regular.size20,
                      ),
                      const Icon(Icons.keyboard_arrow_right_sharp,
                          color: BrandColor.white),
                    ],
                  )
                ],
              ),
            ),
            /// Music player
            CardWidget(
              childWidget: Container(

              ),
            ),
            CardWidget(
              childWidget: Container(),
            ),
          ],
        ),
      ],
    );
  }

  Widget _statisticsSection() {
    return Container();
  }
}
