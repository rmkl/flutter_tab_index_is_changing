// Import components
import '../../components/home_tabs.dart';

TabPageType tabPageTypeReducer(TabPageType tabPageType, dynamic action) {
  return action is TabPageType ? action : tabPageType;
}
