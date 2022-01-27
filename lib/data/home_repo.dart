import 'dart:async';

import 'package:stack_smart_home/common/base_repo.dart';

abstract class HomeRepo extends BaseRepo{
  Future<int> getTemperature();

  Future<bool> changeTemperature(int temp);

  StreamController<int> getCurrentTemperatureStream();

  StreamController<bool> getToggleHomeTemperatureValue();

  Future<bool> changeHomeTempToggle(bool value);
}