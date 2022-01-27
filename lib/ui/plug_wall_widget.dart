import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stack_smart_home/entities/plug_wall_item.dart';
import 'package:stack_smart_home/utils/color.dart';
import 'package:stack_smart_home/utils/costants.dart';
import 'package:stack_smart_home/utils/space.dart';
import 'package:stack_smart_home/utils/textstyle.dart';

class PlugWallWidget extends StatefulWidget {
  const PlugWallWidget({Key? key}) : super(key: key);

  @override
  _PlugWallWidgetState createState() => _PlugWallWidgetState();
}

class _PlugWallWidgetState extends State<PlugWallWidget> {
  bool _toggle = false;

  final List<PlugWallItem> plugWallItems = [
    PlugWallItem("Macbook Pro", true),
    PlugWallItem("Home Pod", false),
    PlugWallItem("PlayStation 5", true),
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 180,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
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
              ),
              ListView.builder(
                itemCount: plugWallItems.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  final item = plugWallItems[index];
                  return Column(
                    children: [
                      Row(
                        children: [
                          Container(
                            width: 5,
                            height: 5,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: item.value
                                    ? BrandColor.white
                                    : BrandColor.white.halfOpacity),
                          ),
                          horizontalSpace(12.0),
                          Text(
                            item.name,
                            style: regular.size12,
                          ),
                        ],
                      ),
                      verticalSpace(8.0),
                    ],
                  );
                },
              ),
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
