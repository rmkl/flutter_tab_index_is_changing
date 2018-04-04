// Import flutter libraries
import 'package:flutter/material.dart';

// Import redux libraries
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'redux/app_state.dart';
import 'redux/reducers/app_state_reducer.dart';

// Import pages
import 'pages/home_page.dart';

class TabIndexIsChanging extends StatelessWidget {
  final String appName;
  final store =
      new Store<AppState>(appStateReducer, initialState: new AppState());

  TabIndexIsChanging({Key key, this.appName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new StoreProvider<AppState>(
      // Pass the store to the StoreProvider. Any ancestor `StoreConnector`
      // Widgets will find and use this value as the `Store`.
      store: store,
      child: new MaterialApp(
        title: appName,
        theme: new ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: new HomePage(store: store, title: appName),
      ),
    );
  }
}
