import 'package:flutter/material.dart';
import 'package:flutter_riverpod/src/provider.dart';
import 'package:stack_smart_home/providers/home_screen_providers.dart';
import 'package:stack_smart_home/utils/color.dart';
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
    return FutureBuilder<String>(
      builder: (context, snapshot) {
        if (snapshot.hasData && snapshot.data != null) {
          return Text(
            snapshot.data ?? "",
            style: bold.size36.primaryColor,
          );
        }
        return const CircularProgressIndicator(
          color: BrandColor.accent,
        );
      },
      future: _homeScreenView.getTemperature(),
    );
  }
}
