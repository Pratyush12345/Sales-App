import 'package:flutter/material.dart';
import 'package:pozitive/Core/Model/Api/ask_for_requote_credential..dart';
import 'package:pozitive/Core/Model/request_quote_viewbutton_model.dart';
import 'package:pozitive/Core/Services/database.dart';
import 'package:pozitive/Core/ViewModel/baseModel.dart';
import 'package:pozitive/Core/enums/view_state.dart';

import '../../getIt.dart';

class ViewQuoteIndividualViewModel extends BaseModel{

  Database database=getIt<DatabaseImplementation>();
  RequestQuoteViewButtonModel requestQuoteViewButtonModel =RequestQuoteViewButtonModel();


void getViewQuoteViewButtonDetails(String accountId, String type,
    String quoteId, BuildContext context) async {
  setState(ViewState.BUSY);

    RequestQuoteViewButtonModel requestQuoteViewButtonModel =
    await database.getRequestQuoteViewButtonDetails(
      RequestQuoteViewButtonCredential(
        accountId: accountId,
        type: type,
        quoteId: quoteId,
      ),
    );

}
}