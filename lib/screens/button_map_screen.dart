import 'package:flutter/material.dart';
import 'package:vallet_app/screens/bottom_navigation.dart';
import 'package:vallet_app/navigationbar/tab_item.dart';
import 'package:vallet_app/navigationbar/tab_navigator.dart';

class StaticNavigationBar extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => AppState();
}

class AppState extends State<StaticNavigationBar> {
  var _currentTab = TabItem.OtoparkBul;
  final _navigatorKeys = {
    TabItem.OtoparkBul: GlobalKey<NavigatorState>(),
    TabItem.OdemeYap: GlobalKey<NavigatorState>(),
    TabItem.Hesabim: GlobalKey<NavigatorState>(),
  };

  void _selectTab(TabItem tabItem) {
    if (tabItem == _currentTab) {
      // pop to first route
      _navigatorKeys[tabItem]!.currentState!.popUntil((route) => route.isFirst);
    } else {
      setState(() => _currentTab = tabItem);
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        final isFirstRouteInCurrentTab =
        !await _navigatorKeys[_currentTab]!.currentState!.maybePop();
        if (isFirstRouteInCurrentTab) {
          // if not on the 'main' tab
          if (_currentTab != TabItem.OtoparkBul) {
            // select 'main' tab
            _selectTab(TabItem.OtoparkBul);
            // back button handled by app
            return false;
          }
        }
        // let system handle back button if we're on the first route
        return isFirstRouteInCurrentTab;
      },
      child: Scaffold(
        body: Stack(children: <Widget>[
          _buildOffstageNavigator(TabItem.OtoparkBul),
          _buildOffstageNavigator(TabItem.OdemeYap),
          _buildOffstageNavigator(TabItem.Hesabim),
        ]),
        bottomNavigationBar: BottomNavigation(
          currentTab: _currentTab,
          onSelectTab: _selectTab,
        ),
      ),
    );
  }

  Widget _buildOffstageNavigator(TabItem tabItem) {
    return Offstage(
      offstage: _currentTab != tabItem,
      child: TabNavigator(
        navigatorKey: _navigatorKeys[tabItem],
        tabItem: tabItem,
      ),
    );
  }
}
