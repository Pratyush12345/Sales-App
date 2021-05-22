import 'package:pozitive/Core/ViewModel/baseModel.dart';
import 'package:pozitive/Core/Services/database.dart';
import 'package:pozitive/Core/enums/view_state.dart';
import 'package:pozitive/Core/Model/request_quote_history_button_model.dart';
import 'package:pozitive/Core/Model/Api/request_quote_history_button_credential.dart';
import 'package:get_it/get_it.dart';

GetIt getIt = GetIt.instance;

class RequestQuoteHistoryButtonViewModel extends BaseModel {
  Database database = getIt<DatabaseImplementation>();

  void getRequestQuoteHistoryButtonDetails(String accountId, String quoteId,
      String type, String strAction, String strPriceDate) async {
    setState(ViewState.BUSY);
    RequestQuoteHistoryButtonModel requestQuoteHistoryButtonModel =
        await database.getRequestQuoteHistoryButtonDetails(
      RequestQuoteHistoryButtonCredential(
        accountId: accountId,
        quoteid: quoteId.toString(),
        type: type,
        strAction: strAction,
        strPriceDate: strPriceDate,
      ),
    );
    setState(ViewState.IDLE);
  }
}
