import 'dart:ui';

import 'package:flutter/material.dart';

import 'color.dart';

enum FEATURE_TYPE {
  heating,
  cooling,
  airwave,
}

extension FeatureName on FEATURE_TYPE {
  String get title {
    switch(this){
      case FEATURE_TYPE.heating:
        return "Heating";
      case FEATURE_TYPE.cooling:
        return "Cooling";
      case FEATURE_TYPE.airwave:
        return "Airwave";
    }
  }
}

extension FeatureColor on FEATURE_TYPE {
  Color? get color {
    switch(this){
      case FEATURE_TYPE.heating:
        return BrandColor.accent;
      case FEATURE_TYPE.cooling:
        return Colors.blue;
      case FEATURE_TYPE.airwave:
        return null;
    }
  }
}

enum APPLIANCES {
  fan,
  cooler
}

extension ApplianceIcons on APPLIANCES {
  String get iconAsset {
    switch(this){
      case APPLIANCES.fan:
        return "assets/png/fan.png";
      case APPLIANCES.cooler:
        return "assets/png/frost.png";
    }
  }
}

extension ApplianceTitle on APPLIANCES {
  String get title {
    switch(this){
      case APPLIANCES.fan:
        return "Fan";
      case APPLIANCES.cooler:
        return "Cooler";
    }
  }
}
