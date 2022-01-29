import 'package:flutter/material.dart';
import 'package:flutter_riverpod/all.dart';
import 'package:stack_smart_home/providers/home_screen_providers.dart';
import 'package:stack_smart_home/ui/common_widget.dart';
import 'package:stack_smart_home/ui/ticket_painter.dart';
import 'package:stack_smart_home/utils/costants.dart';
import 'package:stack_smart_home/utils/textstyle.dart';
import '../utils/color.dart';

class MeterWidget extends StatelessWidget {
  const MeterWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          left: 30,
          top: 30,
          right: 30,
          bottom: 30,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: meterTemperatureTextWidget(temperature: "14"),
              ),
              Container(
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: "#F9F9F9".fromHexToColor(),
                    boxShadow: const [
                      BoxShadow(
                        offset: Offset(2, 2),
                        blurRadius: 18,
                        color: Color.fromRGBO(0, 0, 0, 0.25),
                      ),
                    ]),
                height: 190,
                width: 190,
              ),
              Padding(
                padding: const EdgeInsets.only(left:  8.0),
                child: meterTemperatureTextWidget(temperature: "28"),
              ),
            ],
          ),
        ),
        Positioned(
          left: 45,
          top: 45,
          right: 45,
          bottom: 45,
          child: Container(
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  offset: Offset(2, 2),
                  blurRadius: 24,
                  color: Color.fromRGBO(0, 0, 0, 0.15),
                ),
              ],
            ),
            height: 120,
            width: 120,
            child: Center(
                child:
                Consumer(
                  builder: (context, watch, child) {
                    AsyncValue<int> value = watch(getCurrentTemperatureStreamProvider);
                    return value.when(data: (value) {
                      return temperatureTextWidget(temperature: "$value", center: true);
                    }, loading: () =>
                    const CircularProgressIndicator(
                      color: BrandColor.accent,
                    ), error: (error, stacktrace) {
                      return const Text("Error");
                    });
                  },
                ),

            ),
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
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(
                  Icons.arrow_drop_up,
                  color: BrandColor.primaryColor,
                  size: 32,
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
