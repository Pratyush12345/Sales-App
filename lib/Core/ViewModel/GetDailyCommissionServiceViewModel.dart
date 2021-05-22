import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:pozitive/Core/AppConstact/appConstant.dart';
import 'package:pozitive/Core/Model/Api/GetDailyCommissionCredential.dart';
import 'package:pozitive/Core/Model/GetDailyCommissonDetailModel.dart';
import 'package:pozitive/Core/Model/response_model.dart';

import 'package:pozitive/Core/Services/database.dart';
import 'package:pozitive/Core/ViewModel/baseModel.dart';
import 'package:pozitive/Core/enums/view_state.dart';

GetIt getIt = GetIt.instance;

class GetDailyCommissionViewModel extends BaseModel {
  Database database = getIt<DatabaseImplementation>();

  List<LstGetDailycommission> lstGetDailycommission = [];

  Future getDailyCommissionDetail(
      GetDailyCommissionCredential getDailyCommissionCredential) async {
    assert(getDailyCommissionCredential != null);
    // TODO: Apply validation here or somewhere else?

    print('acountId ===${getDailyCommissionCredential.accountId}');

    setState(ViewState.BUSY);

    final response = await database
        .getDailyCommissionDetailList(getDailyCommissionCredential);

    if (isNotError(response)) {
      lstGetDailycommission = response;
      print(response);
    } else {
      print("error");
    }

    setState(ViewState.IDLE);
  }

  void getDailyCommission(String accountID, BuildContext context) async {
    setState(ViewState.BUSY);
    ResponseMessage responseMessage = await database
        .getDailyCommissionDetailList(GetDailyCommissionCredential(
      accountId: accountID,
    ));
    if (responseMessage.status == 1) {
      AppConstant.showSuccessToast(context, responseMessage.msg);
    } else {
      AppConstant.showFailToast(context, responseMessage.msg);
    }
    setState(ViewState.IDLE);
  }
}
