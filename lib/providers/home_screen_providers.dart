import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:stack_smart_home/data/home_repo.dart';
import 'package:stack_smart_home/data/prod_home_repo.dart';
import 'package:stack_smart_home/usecase/change_home_temp_toggle_usecase.dart';
import 'package:stack_smart_home/usecase/change_temperature_usecase.dart';
import 'package:stack_smart_home/usecase/get_current_temperature_usecase.dart';
import 'package:stack_smart_home/usecase/get_temperature_usecase.dart';
import 'package:stack_smart_home/usecase/get_toggle_home_temperature_usecase.dart';
import 'package:stack_smart_home/view/home_view.dart';
import 'dart:math';

final homeRepoProvider = Provider<HomeRepo>((ref) {
  return ProdHomeRepo();
});

final getTemperatureUseCaseProvider = Provider<GetTemperatureUseCase>((ref) {
  return GetTemperatureUseCase(ref.watch(homeRepoProvider));
});

final changeTemperatureUseCaseProvider =
    Provider<ChangeTemperatureUsecase>((ref) {
  return ChangeTemperatureUsecase(ref.watch(homeRepoProvider));
});
final homeScreenViewProvider = Provider<HomeScreenView>((ref) {
  return HomeScreenView(
      ref.watch(getTemperatureUseCaseProvider),
      ref.watch(changeTemperatureUseCaseProvider),
      ref.watch(toggleHomeTempUseCaseProvider));
});

final getCurrentTemperatureStreamUsecaseProvider =
    Provider<GetCurrentTemperatureStreamUseCase>((ref) {
  return GetCurrentTemperatureStreamUseCase(ref.watch(homeRepoProvider));
});

final getCurrentTemperatureStreamProviderd = StreamProvider<int>((ref) {
  return ref.watch(getCurrentTemperatureStreamUsecaseProvider).execute().stream;
});

final getToggleHomeTempStreamUseCaseProvider =
    Provider<GetToggleHomeTempValueUseCase>((ref) {
  return GetToggleHomeTempValueUseCase(ref.watch(homeRepoProvider));
});

final getCurrentToggleValueStream = StreamProvider<bool>((ref) {
  return ref.watch(getToggleHomeTempStreamUseCaseProvider).execute().stream;
});

final toggleHomeTempUseCaseProvider =
    Provider<ToggleHomeTemperatureUseCase>((ref) {
  return ToggleHomeTemperatureUseCase(ref.watch(homeRepoProvider));
});
