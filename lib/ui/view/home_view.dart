import 'dart:math';

import 'package:stack_smart_home/usecase/toggle_home_temp_toggle_usecase.dart';
import 'package:stack_smart_home/usecase/change_temperature_usecase.dart';

class HomeScreenView {
  final ChangeTemperatureUseCase _changeTemperatureUsecase;
  final ToggleHomeTemperatureUseCase _toggleHomeTemperatureUseCase;

  HomeScreenView( this._changeTemperatureUsecase,
      this._toggleHomeTemperatureUseCase);

  Future<bool> changeTemperature() async {
    final _random = Random();
    final number = 14 + _random.nextInt(14);
    return await _changeTemperatureUsecase.execute(number);
  }

  Future<bool> toggleHomeTemp(bool value) async {
    return await _toggleHomeTemperatureUseCase.execute(value);
  }
}
