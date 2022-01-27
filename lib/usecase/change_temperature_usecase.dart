
import 'dart:async';
import 'package:stack_smart_home/data/home_repo.dart';
import 'package:stack_smart_home/usecase/base_use_case.dart';

class ChangeTemperatureUsecase extends BaseUseCase<bool, int>{
  final HomeRepo _homeRepo;

  ChangeTemperatureUsecase(this._homeRepo);

  @override
  FutureOr<bool> execute([int? params]) {
     return _homeRepo.changeTemperature(params??24);
  }

}