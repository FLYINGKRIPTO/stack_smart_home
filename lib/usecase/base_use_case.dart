import 'dart:async';

import 'package:equatable/equatable.dart';

// abstract class BaseUseCase<T, S> {
//   FutureOr<T> execute([S param]);
// }
abstract class BaseUseCase<Type, Params> {
  FutureOr<Type> execute([Params? params]);
}

class NoParams extends Equatable {
  @override
  List<Object> get props => [];
}