import 'package:flutter_bloc/flutter_bloc.dart';

class ExpandedPlotCubit extends Cubit<Set<int>> {
  ExpandedPlotCubit() : super({});

  void toggle(int index) {
    final current = Set<int>.from(state);
    if (current.contains(index)) {
      current.remove(index);
    } else {
      current.add(index);
    }
    emit(current);
  }
}
