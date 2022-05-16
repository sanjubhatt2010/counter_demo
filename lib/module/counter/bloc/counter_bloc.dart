import 'package:counter_app/bloc/bloc.dart';
import 'package:counter_app/module/counter/view_model/counter_view_model.dart';

class CounterBloc extends Bloc<CounterViewModel> {
  @override
  CounterViewModel initDefaultValue() {
    return CounterViewModel(
      counter: 0,
    );
  }

  increseCounter() {
    state.counter += 1;
    emit(state);
  }

  decreseCounter() {
    state.counter -= 1;
    emit(state);
  }
}
