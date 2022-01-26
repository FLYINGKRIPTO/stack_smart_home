
import 'dart:async';

import 'package:stack_smart_home/data/home_repo.dart';
import 'package:stack_smart_home/usecase/base_use_case.dart';

class GetTemperatureUseCase extends BaseUseCase<String, int>{
  final HomeRepo _homeRepo;

  GetTemperatureUseCase(this._homeRepo);

  @override
  FutureOr<String> execute([int? params]) {
    // Do whatever operation you need to do here with params
    // We can also send params in the below function getTemperature
    // after processing
     return _homeRepo.getTemperature();
  }
}