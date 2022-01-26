import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:stack_smart_home/data/home_repo.dart';
import 'package:stack_smart_home/data/prod_home_repo.dart';
import 'package:stack_smart_home/usecase/get_temperature_usecase.dart';
import 'package:stack_smart_home/view/home_view.dart';

final homeRepoProvider = Provider<HomeRepo>((ref) {
  return ProdHomeRepo();
});

final getTemperatureUseCaseProvider = Provider<GetTemperatureUseCase>((ref) {
  return GetTemperatureUseCase(ref.watch(homeRepoProvider));
});

final homeScreenViewProvider = Provider<HomeScreenView>((ref) {
  return HomeScreenView(
      ref.watch(getTemperatureUseCaseProvider)
  );
});