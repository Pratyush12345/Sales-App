import 'package:pozitive/Core/Model/Api/ask_for_requote_credential..dart';
import 'package:pozitive/Core/ViewModel/baseModel.dart';
import 'package:pozitive/Core/Services/database.dart';
import 'package:pozitive/Core/enums/view_state.dart';
import 'package:pozitive/Core/Model/request_quote_viewbutton_model.dart';
import 'package:get_it/get_it.dart';

GetIt getIt = GetIt.instance;

class RequestQuoteViewButtonViewModel extends BaseModel {
  Database database = getIt<DatabaseImplementation>();

  void getRequestQuoteViewButtonDetails(
      String accountId, String type, String quoteId) async {
    setState(ViewState.BUSY);
    RequestQuoteViewButtonModel requestQuoteHistoryModel =
        await database.getRequestQuoteViewButtonDetails(
      RequestQuoteViewButtonCredential(
        accountId: accountId,
        type: type,
        quoteId: quoteId,
      ),
    );
    setState(ViewState.IDLE);
  }
}
