import 'package:redux/redux.dart';
import 'package:todo_redux_app/actions/actions.dart';

final loadingReducer = combineReducers([
  new TypedReducer<bool, TodoNotLoadedAction>(_setLoaded)
]);

bool _setLoaded(bool state, TodoNotLoadedAction action){
  return false;
}