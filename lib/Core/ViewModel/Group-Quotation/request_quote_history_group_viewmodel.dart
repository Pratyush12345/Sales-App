import 'package:pozitive/Core/ViewModel/baseModel.dart';
import 'package:pozitive/Core/Services/database.dart';
import 'package:pozitive/Core/enums/view_state.dart';
import 'package:pozitive/Core/Model/request_quote_history_group_model.dart';
import 'package:pozitive/Core/Model/Api/request_quote_history_group_credential.dart';
import 'package:get_it/get_it.dart';
import 'package:flutter/material.dart';
import 'package:pozitive/Core/AppConstact/appConstant.dart';

GetIt getIt = GetIt.instance;

class RequestQuoteHistoryGroupViewModel extends BaseModel {
  Database database = getIt<DatabaseImplementation>();

  void getRequestQuoteHistoryGroupDetails(String accountId, String groupId,
      String type, BuildContext context) async {
    setState(ViewState.BUSY);
    RequestQuoteHistoryGroupModel requestQuoteHistoryGroupModel =
        await database.getRequestQuoteHistoryGroupDetails(
      RequestQuoteHistoryGroupCredential(
        accountId: accountId,
        grouId: groupId.toString(),
        type: type,
      ),
    );
    if (requestQuoteHistoryGroupModel != null) {
      AppConstant.showSuccessToast(context, 'Group Quote History Success');
    } else {
      AppConstant.showFailToast(context, 'Grouup Quote History Failed');
    }
    setState(ViewState.IDLE);
  }
}
