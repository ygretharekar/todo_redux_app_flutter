import 'package:redux/redux.dart';
import 'package:todo_redux_app/actions/actions.dart';
import 'package:todo_redux_app/models/models.dart';

AppTab _activeTabReducer(AppTab activeTab, UpdateTabAction action){
  return action.newTab;
}

final Reducer<AppTab> tabReducer = combineReducers([
  new TypedReducer<AppTab, UpdateTabAction>(_activeTabReducer)
]);