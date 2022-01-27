

import 'dart:async';

import 'package:stack_smart_home/data/home_repo.dart';
import 'package:stack_smart_home/usecase/base_use_case.dart';

class GetCurrentTemperatureStreamUseCase extends BaseUseCase<StreamController<int>, void>{
  final HomeRepo _homeRepo;

  GetCurrentTemperatureStreamUseCase(this._homeRepo);

  @override
  StreamController<int> execute([void params]) {
    return _homeRepo.getCurrentTemperatureStream();
  }

}