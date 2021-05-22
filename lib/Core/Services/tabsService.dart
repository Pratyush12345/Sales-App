import 'package:flutter/material.dart';

class TabService {
  final int startingTabCount = 10;
  List<Tab> tabs = List<Tab>();
  List<Widget> generalWidgets = List<Widget>();
  TabController tabController;

  //  TabController getTabController() {
  //   return TabController(length: tabs.length, vsync: this);
  // }

  Tab getTab(int widgetNumber) {
    return Tab(
      text: "$widgetNumber",
    );
  }

  Widget getWidget(int widgetNumber) {
    return Center(
      child: Text("Widget nr: $widgetNumber"),
    );
  }

  List<Tab> getTabs(int count) {
    tabs.clear();
    for (int i = 0; i < count; i++) {
      tabs.add(getTab(i));
    }
    return tabs;
  }

  List<Widget> getWidgets() {
    generalWidgets.clear();
    for (int i = 0; i < tabs.length; i++) {
      generalWidgets.add(getWidget(i));
    }
    return generalWidgets;
  }

  void addAnotherTab() {
    tabs = getTabs(tabs.length + 1);
    tabController.index = 0;
    // tabController = getTabController();
  }

  void removeTab() {
    tabs = getTabs(tabs.length - 1);
    tabController.index = 0;
    // tabController = getTabController();
  }
}
