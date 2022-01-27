
import 'dart:async';

import 'package:stack_smart_home/data/home_repo.dart';
import 'package:stack_smart_home/usecase/base_use_case.dart';

class GetToggleHomeTempValueUseCase extends BaseUseCase<StreamController<bool>, bool>{
  final HomeRepo _homeRepo;

  GetToggleHomeTempValueUseCase(this._homeRepo);

  @override
  StreamController<bool> execute([bool? params]) {
    return _homeRepo.getToggleHomeTemperatureValue();
  }
}