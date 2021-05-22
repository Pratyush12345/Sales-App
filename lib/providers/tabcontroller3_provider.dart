import 'package:flutter/material.dart';

class TabController3Provider extends ChangeNotifier {
  List<bool> tabList = [
    true,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
  ];
  List<bool> get getTabListProvider => tabList;

  set setTabListProvider(int index) {
    tabList[index] = true;
    notifyListeners();
  }

  void resetTabListProvider() {
    tabList = [
      true,
      false,
      false,
      false,
      false,
      true,
      true,
      false,
    ];
    notifyListeners();
  }
}
