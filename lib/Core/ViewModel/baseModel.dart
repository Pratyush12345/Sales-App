import 'package:flutter/widgets.dart';
import 'package:pozitive/Core/Model/apiError.dart';
import 'package:pozitive/Core/Services/navigation_service.dart';
import 'package:pozitive/Core/enums/view_state.dart';

import '../baseview.dart';

class BaseModel extends ChangeNotifier {
  final navigationService = getIt<NavigationService>();

  ViewState _state = ViewState.IDLE;
  ViewState get state => _state;

  ApiError error;

  /// Returns true when a request did not return an error.
  bool get success => error == null;

  void setState(ViewState viewState) {
    _state = viewState;
    notifyListeners();
  }

  bool isNotError(dynamic response) {
    if (response is ApiError) {
      error = response;
      return false;
    } else {
      return true;
    }
  }
}
