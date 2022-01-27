import 'package:stack_smart_home/usecase/get_temperature_usecase.dart';

class HomeScreenView {
  final GetTemperatureUseCase _getTemperatureUseCase;
  bool _homeTemperatureToggle = false;
  bool get homeTemperatureToggle => _homeTemperatureToggle;

  HomeScreenView(this._getTemperatureUseCase);

  Future<String> getTemperature() async {
    return await _getTemperatureUseCase.execute();
  }

  setHomeTemperatureToggle(bool value){
    _homeTemperatureToggle = value;
  }

}