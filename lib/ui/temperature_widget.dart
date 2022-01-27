import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/src/provider.dart';
import 'package:stack_smart_home/providers/home_screen_providers.dart';
import 'package:stack_smart_home/utils/color.dart';
import 'package:stack_smart_home/utils/space.dart';
import 'package:stack_smart_home/utils/textstyle.dart';
import 'package:stack_smart_home/view/home_view.dart';

class TemperatureWidget extends StatefulWidget {
  const TemperatureWidget({Key? key}) : super(key: key);

  @override
  _TemperatureWidgetState createState() => _TemperatureWidgetState();
}

class _TemperatureWidgetState extends State<TemperatureWidget> {
  late HomeScreenView _homeScreenView;

  @override
  void initState() {
    _homeScreenView = context.read(homeScreenViewProvider);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        FutureBuilder<String>(
          builder: (context, snapshot) {
            if (snapshot.hasData && snapshot.data != null) {
              return Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    snapshot.data ?? "",
                    style: bold.size40.primaryColor,
                  ),
                  horizontalSpace(8.0),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 4.0),
                    child: Text(
                      snapshot.hasData? "°C": "",
                      style: regular.size24.primaryColor,
                    ),
                  ),
                ],
              );
            }
            return const CircularProgressIndicator(
              color: BrandColor.accent,
            );
          },
          future: _homeScreenView.getTemperature(),
        ),
        verticalSpace(24.0),
        CupertinoSwitch(
          value: _homeScreenView.homeTemperatureToggle,
          activeColor: BrandColor.accent,
          onChanged: (value){
            setState(() {
              _homeScreenView.setHomeTemperatureToggle(value);
            });
          },
        ),
      ],
    );
  }
}
