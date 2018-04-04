// Import flutter libraries
import 'package:flutter/material.dart';

// Import redux libraries
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';
import '../redux/app_state.dart';

// Import components
import '../components/home_tabs.dart';

class AnimatedHomeFab extends AnimatedWidget {
  final FloatingActionButton floatingActionButton;

  AnimatedHomeFab(
      {Key key, Animation<double> animation, this.floatingActionButton})
      : super(key: key, listenable: animation);

  Widget build(BuildContext context) {
    final Animation<double> animation = listenable;

    return new SlideTransition(
      position: new Tween<Offset>(
        begin: const Offset(2.0, 0.0),
        end: Offset.zero,
      )
          .animate(animation),
      child: floatingActionButton,
    );
  }
}

class HomeFab extends StatefulWidget {
  final Store<AppState> store;

  HomeFab({Key key, this.store}) : super(key: key);

  @override
  _HomeFabState createState() => new _HomeFabState();
}

class _HomeFabState extends State<HomeFab>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation<double> animation;

  initState() {
    super.initState();
    controller = new AnimationController(
        duration: const Duration(milliseconds: 250), vsync: this);
    animation = new CurvedAnimation(parent: controller, curve: Curves.easeIn);

    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    FloatingActionButton floatingActionButton = new FloatingActionButton(
      onPressed: () {},
      tooltip: 'FAB',
      child: new Icon(Icons.apps),
    );

    return new StoreConnector<AppState, TabPageType>(
      converter: (store) => store.state.tabPageType,
      builder: (context, tabPageTypeState) {
        if (tabPageTypeState == TabPageType.tabThree) {
          controller.reverse();
        } else {
          controller.forward();
        }
        return new AnimatedHomeFab(
          animation: animation,
          floatingActionButton: floatingActionButton,
        );
      },
    );
  }

  dispose() {
    controller.dispose();
    super.dispose();
  }
}
