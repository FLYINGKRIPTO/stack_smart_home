import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:stack_smart_home/providers/home_screen_providers.dart';
import 'package:stack_smart_home/ui/meter_widget.dart';
import 'package:stack_smart_home/ui/view/home_view.dart';
import 'package:stack_smart_home/utils/color.dart';
import 'package:stack_smart_home/utils/costants.dart';
import 'package:stack_smart_home/utils/extensions.dart';
import 'package:stack_smart_home/utils/space.dart';
import 'package:stack_smart_home/utils/textstyle.dart';

import 'common_widget.dart';

class RoomBottomSheet extends StatelessWidget {
  final Widget? child;

  const RoomBottomSheet({Key? key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          showModalBottomSheet(
            context: context,
            builder: (context) {
              return SizedBox(
                  height: MediaQuery.of(context).size.height * 0.9,
                  child: const BottomSheetWidget());
            },
            isScrollControlled: true,
            backgroundColor: Colors.transparent,
          );
        },
        child: child);
  }
}

class BottomSheetWidget extends StatefulWidget {
  const BottomSheetWidget({Key? key}) : super(key: key);

  @override
  State<BottomSheetWidget> createState() => _BottomSheetWidgetState();
}

class _BottomSheetWidgetState extends State<BottomSheetWidget> {
  late HomeScreenView _homeScreenView;

  @override
  void initState() {
    _homeScreenView = context.read(homeScreenViewProvider);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.vertical(
        top: Radius.circular(20),
      ),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16.0),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(20),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  width: 36,
                  height: 5,
                  decoration: BoxDecoration(
                      color: BrandColor.grey.halfOpacity,
                      borderRadius:
                          const BorderRadius.all(Radius.circular(64))),
                ),
              ),
              verticalSpace(12.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        StringConstants.livingRoom,
                        style: bold.size26.primaryColor,
                      ),
                      Text(
                        StringConstants.homeTemperature,
                        style: regular.size16.primaryColor,
                      )
                    ],
                  ),
                  Consumer(
                    builder: (context, watch, child) {
                      AsyncValue<bool> value =
                          watch(getCurrentToggleValueStream);
                      return value.when(
                          data: (value) {
                            return CupertinoSwitch(
                              value: value,
                              activeColor: BrandColor.accent,
                              onChanged: (value) {
                                _homeScreenView.toggleHomeTemp(value);
                              },
                            );
                          },
                          loading: () => const CircularProgressIndicator(
                                color: BrandColor.accent,
                              ),
                          error: (error, stacktrace) {
                            return const Text("Error");
                          });
                    },
                  ),
                ],
              ),
              verticalSpace(12.0),
              const Center(child: MeterWidget()),
              verticalSpace(24.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  currentStateWidget(
                      heading: StringConstants.currentTemp,
                      icon: Icons.arrow_drop_up_outlined,
                      value: "24 ",
                      symbol: StringConstants.degreeCelcius),
                  currentStateWidget(
                      heading: StringConstants.currentHumidity,
                      icon: Icons.arrow_drop_down_outlined,
                      value: "54",
                      symbol: "%",
                      allignEnd: true),
                ],
              ),
              verticalSpace(16.0),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  featureBox(featureName: FEATURE_TYPE.heating, value: "24"),
                  featureBox(featureName: FEATURE_TYPE.cooling, value: "24"),
                  featureBox(featureName: FEATURE_TYPE.airwave, value: "24"),
                ],
              ),
              verticalSpace(16.0),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Flexible(
                      flex: 1,
                      child: appliances(
                          appliances: APPLIANCES.fan, status: "off")),
                  horizontalSpace(12.0),
                  Flexible(
                      flex: 1,
                      child: appliances(
                          appliances: APPLIANCES.cooler, status: "off"))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget currentStateWidget({
    required String heading,
    required IconData icon,
    required String value,
    required String symbol,
    bool allignEnd = false,
  }) {
    return Column(
      crossAxisAlignment:
          allignEnd ? CrossAxisAlignment.end : CrossAxisAlignment.start,
      children: [
        Text(
          heading,
          style: regular.size16.colorGrey,
        ),
        verticalSpace(8.0),
        Row(
          children: [
            Icon(
              icon,
              color: BrandColor.grey,
            ),
            horizontalSpace(4.0),
            Text(value),
            Text(symbol)
          ],
        )
      ],
    );
  }

  Widget featureBox({
    required FEATURE_TYPE featureName,
    required String value,
  }) {
    return SizedBox(
      height: 100,
      width: 100,
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16.0),
            color: "#F5F5F6".fromHexToColor()),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  Text(featureName.title),
                  horizontalSpace(4.0),
                  dot(color: featureName.color),
                ],
              ),
              verticalSpace(12.0),
              temperatureTextWidget(temperature: "24"),
            ],
          ),
        ),
      ),
    );
  }

  Widget appliances({required APPLIANCES appliances, required status}) {
    return Container(
      padding: const EdgeInsets.all(4.0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.0),
          color: "#F5F5F6".fromHexToColor()),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          children: [
            Flexible(
              flex: 1,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    appliances.title,
                    style: regular.size16.primaryColor,
                  ),
                  verticalSpace(2.0),
                  Text(
                    status,
                    style: medium.size32.primaryColor,
                  ),
                ],
              ),
            ),
            Flexible(
              flex: 1,
              child: Image.asset(
                appliances.iconAsset,
                fit: BoxFit.cover,
                width: 30,
                height: 30,
                color: BrandColor.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
