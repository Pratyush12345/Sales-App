import 'package:pozitive/Core/ViewModel/baseModel.dart';
import 'package:pozitive/Core/Services/database.dart';
import 'package:pozitive/Core/enums/view_state.dart';
import 'package:pozitive/Core/Model/quote_history_dropdown_group_model.dart';
import 'package:pozitive/Core/Model/Api/quote_history_dropdown_group_credential.dart';
import 'package:get_it/get_it.dart';
import 'package:flutter/material.dart';
import 'package:pozitive/Core/AppConstact/appConstant.dart';

GetIt getIt = GetIt.instance;

class QuoteHistoryDropDownGroupViewModel extends BaseModel {
  Database database = getIt<DatabaseImplementation>();

  void getQuoteHistoryDropDownGroupDetails(
      String accountId,
      String groupId,
      String type,
      String strPriceDate,
      String strAction,
      BuildContext context) async {
    setState(ViewState.BUSY);
    QuoteHistoryDropDownGroupModel quoteHistoryDropDownGroupModel =
        await database.getQuoteHistoryDropDownGroupDetails(
      QuoteHistoryDropDownGroupCredential(
        accountId: accountId,
        groupId: groupId.toString(),
        type: type,
        strPriceDate: strPriceDate,
        strAction: strAction,
      ),
    );

    if (quoteHistoryDropDownGroupModel != null) {
      AppConstant.showSuccessToast(
          context, 'Quote History Drop Down Group Success');
    } else {
      AppConstant.showFailToast(
          context, 'Quote History Drop Down Group Failed');
    }
    setState(ViewState.IDLE);
  }
}
