import 'dart:async';

abstract class BaseUseCase<Type, Params> {
  FutureOr<Type> execute([Params? params]);
}
