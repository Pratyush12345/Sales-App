import 'package:flutter/cupertino.dart';
import 'package:pozitive/Core/Model/site_list_model.dart';

class SiteListProvider extends ChangeNotifier {
  List<SiteListModel> _siteListProvider = [];

  List<SiteListModel> get siteListProvider => _siteListProvider;

  set siteListProvider(List<SiteListModel> value) {
    _siteListProvider = value;
    notifyListeners();
  }
}
