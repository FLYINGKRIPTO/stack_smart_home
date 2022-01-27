import 'package:stack_smart_home/data/home_repo.dart';
import 'dart:async';
import 'package:rxdart/rxdart.dart';


class ProdHomeRepo extends HomeRepo {

  late BehaviorSubject<int> _currrentTemp;

  ProdHomeRepo(){
    init();
  }

  @override
  dispose() {
    // TODO: implement dispose
    throw UnimplementedError();
  }

  @override
  Future<int> getTemperature() async {
    // This is just a mock value which can be replaced with actual logic later on
    return Future.delayed(const Duration(milliseconds: 100), () => 24);
  }

  @override
  init() {
    _currrentTemp = BehaviorSubject.seeded(23);
  }

  @override
  Stream<int> getCurrentTemperature() {
   return _currrentTemp;
  }

  @override
  Future<bool> changeTemperature(int temp) {
    _currrentTemp.value = temp;
    return Future.value(true);
  }

  @override
  StreamController<int> getCurrentTemperatureStream() {
    return _currrentTemp;
  }
}

