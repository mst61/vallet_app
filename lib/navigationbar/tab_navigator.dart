import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vallet_app/screens/my_account_page.dart';
import 'package:vallet_app/screens/parking_places_page.dart';
import 'package:vallet_app/screens/scan_options_page.dart';
import 'package:vallet_app/navigationbar/tab_item.dart';

class TabNavigatorRoutes {
  static const String root = '/';
  static const String detail = '/detail';
}

class TabNavigator extends StatelessWidget {
  TabNavigator({required this.navigatorKey, required this.tabItem});
  final GlobalKey<NavigatorState>? navigatorKey;
  final TabItem tabItem;


  Map<String, WidgetBuilder> _routeBuilders(BuildContext context,
      {dynamic item}) {
    return {
      TabNavigatorRoutes.root: (context) => _buildRootWidget(context),
      TabNavigatorRoutes.detail: (context) => _buildDetailWidget(context, item)
    };
  }

  Widget _buildRootWidget(BuildContext context) {
    if (tabItem == TabItem.OtoparkBul) {
      return new ParkingPlacesPage();
    } else if (tabItem == TabItem.OdemeYap) {
      return new ScanOptionsPage();
    } else if (tabItem == TabItem.Hesabim) {
      return new MyAccount();
    }
    return ParkingPlacesPage();
  }
  Widget _buildDetailWidget(BuildContext context, dynamic item) {
    // if (item is StringFlixVideoExpandItem) {
    //   return new ExpandVideoScreen(item);
    // }
    return Container();
  }

  @override
  Widget build(BuildContext context) {
    final routeBuilders = _routeBuilders(context);
    return Navigator(
      key: navigatorKey,
      initialRoute: TabNavigatorRoutes.root,
      onGenerateRoute: (routeSettings) {
        return CupertinoPageRoute(
          builder: (context) => routeBuilders[routeSettings.name!]!(context),
        );
      },
    );
  }

}

