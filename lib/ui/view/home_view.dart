import 'dart:math';

import 'package:stack_smart_home/usecase/change_home_temp_toggle_usecase.dart';
import 'package:stack_smart_home/usecase/change_temperature_usecase.dart';
import 'package:stack_smart_home/usecase/get_temperature_usecase.dart';

class HomeScreenView {
  final GetTemperatureUseCase _getTemperatureUseCase;
  final ChangeTemperatureUsecase _changeTemperatureUsecase;
  final ToggleHomeTemperatureUseCase _toggleHomeTemperatureUseCase;
  bool _homeTemperatureToggle = false;

  bool get homeTemperatureToggle => _homeTemperatureToggle;

  HomeScreenView(this._getTemperatureUseCase, this._changeTemperatureUsecase,
      this._toggleHomeTemperatureUseCase);

  Future<int> getTemperature() async {
    return await _getTemperatureUseCase.execute();
  }

  Future<bool> changeTemperature() async {
    final _random = Random();
    final number = 14 + _random.nextInt(14);
    return await _changeTemperatureUsecase.execute(number);
  }

  setHomeTemperatureToggle(bool value) {
    _homeTemperatureToggle = value;
  }

  Future<bool> toggleHomeTemp(bool value) async {
    return await _toggleHomeTemperatureUseCase.execute(value);
  }
}
