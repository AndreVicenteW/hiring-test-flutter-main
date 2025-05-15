import 'package:equatable/equatable.dart';

abstract class BaseCubitState extends Equatable {}

class InitialState extends BaseCubitState {
  @override
  List<Object> get props => [];
}

class LoadingState extends BaseCubitState {
  @override
  List<Object> get props => [];
}

class SuccessState<T> extends BaseCubitState {
  final T data;

  SuccessState(this.data);

  @override
  List<T> get props => [data];
}

class ErrorState extends BaseCubitState {
  final String message;

  ErrorState(this.message);

  @override
  List<Object> get props => [message];
}
