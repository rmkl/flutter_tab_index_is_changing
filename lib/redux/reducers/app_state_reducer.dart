// Import redux libraries
import '../app_state.dart';
import 'tab_page_type_reducer.dart';

AppState appStateReducer(AppState state, dynamic action) {
  // Set app state parameters, must match the reducer return values
  return new AppState(
    tabPageType: tabPageTypeReducer(state.tabPageType, action),
  );
}
