// Import flutter libraries
import 'package:flutter/material.dart';

// Import redux libraries
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';
import '../redux/app_state.dart';

class PageThree extends StatefulWidget {
  final Store<AppState> store;

  PageThree({Key key, this.store}) : super(key: key);

  @override
  _PageThreeState createState() => new _PageThreeState();
}

class _PageThreeState extends State<PageThree> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            new StoreConnector<AppState, String>(
              converter: (store) => store.state.tabPageType.toString(),
              builder: (context, tabPageTypeState) {
                return new Text(tabPageTypeState);
              },
            ),
          ],
        ),
      ),
    );
  }
}
