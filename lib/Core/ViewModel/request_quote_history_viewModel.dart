import 'package:pozitive/Core/ViewModel/baseModel.dart';
import 'package:pozitive/Core/Services/database.dart';
import 'package:pozitive/Core/enums/view_state.dart';
import 'package:pozitive/Core/Model/request_quote_history_model.dart';
import 'package:pozitive/Core/Model/Api/request_quote_history_credential.dart';
import 'package:get_it/get_it.dart';

GetIt getIt = GetIt.instance;

class RequestQuoteHistoryViewModel extends BaseModel {
  Database database = getIt<DatabaseImplementation>();

  void getRequestQuoteHistoryDetails(
      String accountId, String quoteId, String type) async {
    setState(ViewState.BUSY);
    RequestQuoteHistoryModel requestQuoteHistoryModel =
        await database.getRequestQuoteHistoryDetails(
      RequestQuoteHistoryCredential(
        accountId: accountId,
        quoteid: quoteId.toString(),
        type: type,
      ),
    );
    setState(ViewState.IDLE);
  }
}
