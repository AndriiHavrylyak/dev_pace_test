part of 'main_bloc.dart';

abstract class MainEvent extends Equatable {
  const MainEvent();
}

class MainAddItemEvent extends MainEvent {
  @override
  List<Object> get props => [];
}

class MainRemoveItemEvent extends MainEvent {
  @override
  List<Object> get props => [];
}

