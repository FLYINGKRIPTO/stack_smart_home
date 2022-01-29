import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:stack_smart_home/data/home_repo.dart';
import 'package:stack_smart_home/data/prod_home_repo.dart';
import 'package:stack_smart_home/ui/view/home_view.dart';
import 'package:stack_smart_home/usecase/change_home_temp_toggle_usecase.dart';
import 'package:stack_smart_home/usecase/change_temperature_usecase.dart';
import 'package:stack_smart_home/usecase/get_current_temperature_usecase.dart';
import 'package:stack_smart_home/usecase/get_toggle_home_temperature_usecase.dart';

final homeRepoProvider = Provider<HomeRepo>((ref) {
  return ProdHomeRepo();
});

final changeTemperatureUseCaseProvider =
    Provider<ChangeTemperatureUseCase>((ref) {
  return ChangeTemperatureUseCase(ref.watch(homeRepoProvider));
});
final homeScreenViewProvider = Provider<HomeScreenView>((ref) {
  return HomeScreenView(
      ref.watch(changeTemperatureUseCaseProvider),
      ref.watch(toggleHomeTempUseCaseProvider));
});

final getCurrentTemperatureStreamUseCaseProvider =
    Provider<GetCurrentTemperatureStreamUseCase>((ref) {
  return GetCurrentTemperatureStreamUseCase(ref.watch(homeRepoProvider));
});

final getCurrentTemperatureStreamProvider = StreamProvider<int>((ref) {
  return ref.watch(getCurrentTemperatureStreamUseCaseProvider).execute().stream;
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
