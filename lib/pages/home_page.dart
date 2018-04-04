// Import flutter libraries
import 'package:flutter/material.dart';

// Import redux libraries
import 'package:redux/redux.dart';
import '../redux/app_state.dart';

// Import components
import '../components/home_fab.dart';
import '../components/home_tabs.dart';

class HomePage extends StatefulWidget {
  final Store<AppState> store;
  final String title;

  HomePage({Key key, this.store, this.title}) : super(key: key);

  @override
  _HomePageState createState() => new _HomePageState();
}

class _HomePageState extends State<HomePage>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    final HomeTabs homeTabs = new HomeTabs(store: widget.store, vsync: this);

    Scaffold scaffold = new Scaffold(
      drawer: new Drawer(),
      appBar: new AppBar(
        bottom: homeTabs.bar,
        title: new Text(widget.title),
      ),
      body: homeTabs.barView,
      floatingActionButton: new HomeFab(store: widget.store),
    );

    return scaffold;
  }
}
