import 'package:flutter/material.dart';
import 'package:vallet_app/navigationbar/tab_item.dart';

class BottomNavigation extends StatelessWidget {
  BottomNavigation({required this.currentTab, required this.onSelectTab});
  final TabItem currentTab;
  final ValueChanged<TabItem> onSelectTab;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      selectedItemColor: Color.fromRGBO(0, 83, 131, 1),
      unselectedItemColor: Color.fromRGBO(199, 197, 197, 1.0),
      type: BottomNavigationBarType.fixed,
      items: [
        _buildItem(TabItem.OtoparkBul),
        _buildItem(TabItem.OdemeYap),
        _buildItem(TabItem.Hesabim),
      ],
      onTap: (index) => onSelectTab(
        TabItem.values[index],
      ),
      currentIndex: currentTab.index,

    );
  }

  BottomNavigationBarItem _buildItem(TabItem tabItem) {
    return BottomNavigationBarItem(
      icon: Icon(categories[tabItem],
      ),
      label: tabName[tabItem],
    );
  }


}
