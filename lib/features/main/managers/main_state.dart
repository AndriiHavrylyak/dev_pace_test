part of 'main_bloc.dart';

class MainState extends Equatable {
  final List<String> listItems;


  const MainState({
    this.listItems = const [],
  });

  MainState copyWith({
    List<String>? listItems,
  }) {
    return MainState(
      listItems: listItems ?? this.listItems,
    );
  }

  @override
  List<Object?> get props => [
        listItems,
      ];
}
