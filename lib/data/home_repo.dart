import 'package:stack_smart_home/common/base_repo.dart';

abstract class HomeRepo extends BaseRepo{
  Future<String> getTemperature();
}