
import 'dart:async';
import 'package:stack_smart_home/data/home_repo.dart';
import 'package:stack_smart_home/usecase/base_use_case.dart';

class ToggleHomeTemperatureUseCase extends BaseUseCase<bool, bool>{
  final HomeRepo _homeRepo;

  ToggleHomeTemperatureUseCase(this._homeRepo);

  @override
  FutureOr<bool> execute([bool? params]) {
    return _homeRepo.changeHomeTempToggle(params ?? false);
  }

}