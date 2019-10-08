import '../actions/main_action.dart';
import '../states/counterState.dart';

CounterState mainReducer(CounterState state, dynamic action) {
  if (action == MainAction.Increase) {
    return CounterState(state.count + 1);
  }
  return state;
}