import 'package:flutter/material.dart';
import 'package:pozitive/Core/AppConstact/appConstant.dart';
import 'package:pozitive/Core/Model/Api/profileIdModel.dart';
import 'package:pozitive/Core/Model/ApiResponse/add_quote_response.dart';
import 'package:pozitive/Core/Model/DashBoardModel.dart';
import 'package:pozitive/Core/Model/user.dart';
import 'package:pozitive/Core/Services/database.dart';
import 'package:pozitive/Core/ViewModel/baseModel.dart';
import 'package:pozitive/Core/enums/view_state.dart';
import 'package:pozitive/Util/Pref.dart';

import '../baseview.dart';

class HomePageViewModel extends BaseModel {
  Database database = getIt<DatabaseImplementation>();

  DashBoardModel dashBoardModel;

  void getDashBoardDetails() async {
    setState(ViewState.BUSY);
    User _user = await Prefs.getUser();
    final response = await database
        .getDashBoardDetails(ProfileId(accountId: _user.accountId));

    if (isNotError(response)) {
      dashBoardModel = response;
      print(response);
    } else {
      print("error");
    }
    setState(ViewState.IDLE);
  }

  void onAddQuoteButton(BuildContext context) async {
    setState(ViewState.BUSY);
    User _user = await Prefs.getUser();
    AddQuoteResponse response =
        await database.addQuote(ProfileId(accountId: _user.accountId));
    if (response.status == '1') {
      AppConstant.showSuccessToast(context, response.msg);
    } else {
      AppConstant.showFailToast(context, response.msg);
    }

    setState(ViewState.IDLE);
  }
}
