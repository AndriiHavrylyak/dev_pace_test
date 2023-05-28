import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/constants/titles.dart';

part 'main_event.dart';

part 'main_state.dart';

class MainBloc extends Bloc<MainEvent, MainState> {
  MainBloc() : super(const MainState()) {
    on<MainAddItemEvent>((event, emit) async {
      final currentList = List<String>.from(state.listItems);
      currentList.add('${Titles.item}${currentList.length + 1}');
      emit(state.copyWith(listItems: currentList));
    });

    on<MainRemoveItemEvent>((event, emit) async {
      final currentList = List<String>.from(state.listItems);
      if (currentList.isNotEmpty) {
        currentList.removeLast();
        emit(state.copyWith(listItems: currentList));
      }
    });
  }
}
