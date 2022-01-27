import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
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
        Consumer(
          builder: (context, watch, child) {
            AsyncValue<int> value = watch(getCurrentTemperatureStreamProviderd);
            return value.when(data: (value) {
              return Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    "$value",
                    style: bold.size40.primaryColor,
                  ),
                  horizontalSpace(8.0),
                  GestureDetector(
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 4.0),
                      child: Text(
                        "°C",
                        style: regular.size24.primaryColor,
                      ),
                    ),
                    onTap: (){
                      _homeScreenView.changeTemperature();
                    },
                  ),
                ],
              );
            }, loading: () =>
            const CircularProgressIndicator(
              color: BrandColor.accent,
            ), error: (error, stacktrace) {
              return const Text("Error");
            });
          },
        ),
        verticalSpace(24.0),
        Consumer(
          builder: (context, watch, child) {
            AsyncValue<bool> value = watch(getCurrentToggleValueStream);
            return value.when(data: (value) {
              return CupertinoSwitch(
                value: value,
                activeColor: BrandColor.accent,
                onChanged: (value) {
                  _homeScreenView.toggleHomeTemp(value);
                },
              );
            }, loading: () =>
            const CircularProgressIndicator(
              color: BrandColor.accent,
            ), error: (error, stacktrace) {
              return const Text("Error");
            });
          },
        ),

      ],
    );
  }
}
