import 'package:todo_redux_app/models/app_state.dart';
import 'loading_reducer.dart';

AppState appReducer(AppState state, action){

  return new AppState(
    isLoading: loadingReducer(state.isLoading, action)
  );

}