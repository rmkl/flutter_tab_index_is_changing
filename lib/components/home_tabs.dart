// Import flutter libraries
import 'package:flutter/material.dart';

// Import redux libraries
import 'package:redux/redux.dart';
import '../redux/app_state.dart';

// Import pages
import '../pages/page_one.dart';
import '../pages/page_two.dart';
import '../pages/page_three.dart';

enum TabPageType {
  tabOne,
  tabTwo,
  tabThree,
}

class TabPage {
  Widget title;
  Widget view;
  TabPageType type;

  TabPage({this.title, this.view, this.type});
}

class HomeTabs {
  TabBar bar;
  TabBarView barView;

  HomeTabs({final Store<AppState> store, final TickerProvider vsync}) {
    void _actionDispatcher(TabPageType type) {
      store.dispatch(type);
    }

    final List<TabPage> _tabPages = [
      new TabPage(
        title: new Tab(text: 'One'),
        view: new PageOne(store: store),
        type: TabPageType.tabOne,
      ),
      new TabPage(
        title: new Tab(text: 'Two'),
        view: new PageTwo(store: store),
        type: TabPageType.tabTwo,
      ),
      new TabPage(
        title: new Tab(text: 'Three'),
        view: new PageThree(store: store),
        type: TabPageType.tabThree,
      ),
    ];

    final TabController _controller = new TabController(
      initialIndex: store.state.tabPageType.index,
      length: 3,
      vsync: vsync,
    );

    // _controller.animation.addListener(() {
    //   _actionDispatcher(_tabPages[_controller.index].type);

    //   print('indexIsChanging: ' +
    //       _controller.indexIsChanging.toString() +
    //       ', ' +
    //       _controller.animation.status.toString() +
    //       ': ' +
    //       _controller.previousIndex.toString() +
    //       ' => ' +
    //       _controller.index.toString());
    // });

    // _controller.animation.addStatusListener((animationStatus) {
    //   _actionDispatcher(_tabPages[_controller.index].type);

    //   print('indexIsChanging: ' +
    //       _controller.indexIsChanging.toString() +
    //       ', ' +
    //       _controller.animation.status.toString() +
    //       ': ' +
    //       _controller.previousIndex.toString() +
    //       ' => ' +
    //       _controller.index.toString());
    // });

    _controller.addListener(() {
      _actionDispatcher(_tabPages[_controller.index].type);

      print('indexIsChanging: ' +
          _controller.indexIsChanging.toString() +
          ', ' +
          _controller.animation.status.toString() +
          ': ' +
          _controller.previousIndex.toString() +
          ' => ' +
          _controller.index.toString());
    });

    bar = new TabBar(
      tabs: _tabPages.map((TabPage tabPage) => tabPage.title).toList(),
      controller: _controller,
    );

    barView = new TabBarView(
      children: _tabPages.map((TabPage tabPage) => tabPage.view).toList(),
      controller: _controller,
    );
  }
}
