import 'package:stack_smart_home/data/home_repo.dart';
import 'dart:async';
import 'package:rxdart/rxdart.dart';


class ProdHomeRepo extends HomeRepo {

  late BehaviorSubject<int> _currentTemp;
  late BehaviorSubject<bool> _currentToggleValue;

  ProdHomeRepo(){
    init();
  }

  @override
  dispose() {
   _currentTemp.close();
   _currentToggleValue.close();
  }

  @override
  Future<int> getTemperature() async {
    // This is just a mock value which can be replaced with actual logic later on
    return Future.delayed(const Duration(milliseconds: 100), () => 24);
  }

  @override
  init() {
    _currentTemp = BehaviorSubject.seeded(23);
    _currentToggleValue = BehaviorSubject.seeded(true);
  }

  @override
  Future<bool> changeTemperature(int temp) {
    _currentTemp.value = temp;
    return Future.value(true);
  }

  @override
  StreamController<int> getCurrentTemperatureStream() {
    return _currentTemp;
  }

  @override
  StreamController<bool> getToggleHomeTemperatureValue() {
    return _currentToggleValue;
  }

  @override
  Future<bool> changeHomeTempToggle(bool value) {
    _currentToggleValue.value = value;
    return Future.value(true);
  }
}

