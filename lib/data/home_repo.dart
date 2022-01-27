import 'dart:async';

import 'package:stack_smart_home/common/base_repo.dart';

abstract class HomeRepo extends BaseRepo{
  Future<int> getTemperature();

  Stream<int> getCurrentTemperature();

  Future<bool> changeTemperature(int temp);

  StreamController<int> getCurrentTemperatureStream();
}