import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'tab_state_state.dart';

class TabStateCubit extends Cubit<int> {
  TabStateCubit() : super(0);

  void TabChange( int index) {
    emit(index);
  }
}
