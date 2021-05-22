import 'package:flutter/material.dart';
import 'package:pozitive/Core/Model/Api/ask_for_requote_credential..dart';
import 'package:pozitive/Core/Model/request_quote_viewbutton_model.dart';
import 'package:pozitive/Core/Services/database.dart';
import 'package:pozitive/Core/ViewModel/baseModel.dart';
import 'package:pozitive/Core/enums/view_state.dart';
import '../../baseview.dart';

class ViewRequestQuoteGasViewModel extends BaseModel {
  Database database = getIt<DatabaseImplementation>();
  RequestQuoteViewButtonModel requestQuoteViewButtonModel =
      RequestQuoteViewButtonModel();

  TextEditingController mprn = TextEditingController();
  TextEditingController aqCharge = TextEditingController();


  void getViewQuoteViewButtonDetails(String accountId, String type,
      String quoteId, BuildContext context) async {
    setState(ViewState.BUSY);
    print('reached here');

    requestQuoteViewButtonModel =
        await database.getRequestQuoteViewButtonDetails(
      RequestQuoteViewButtonCredential(
        accountId: '7257',
        type: 'individual',
        quoteId: '54550',
      ),
    );
    // print(requestQuoteViewButtonModel.businessName);
    // print(requestQuoteViewButtonModel.isforOtheryear);
    setGasDetails();
    setState(ViewState.IDLE);
  }

  void setGasDetails() {
    setState(ViewState.BUSY);
    mprn.text = requestQuoteViewButtonModel.mPRN;
    aqCharge.text = requestQuoteViewButtonModel.aQ;
  }
}
