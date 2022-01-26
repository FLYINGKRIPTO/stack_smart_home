import 'package:stack_smart_home/data/home_repo.dart';

class ProdHomeRepo extends HomeRepo {
  @override
  dispose() {
    // TODO: implement dispose
    throw UnimplementedError();
  }

  @override
  Future<String> getTemperature() async {
    // This is just a mock value which can be replaced with actual logic later on
    return Future.delayed(const Duration(milliseconds: 100), () => "24");
  }

  @override
  init() {
    // TODO: implement init
    throw UnimplementedError();
  }
}
