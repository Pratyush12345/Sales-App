import 'package:get_it/get_it.dart';
import 'package:pozitive/Core/Model/Api/ask_for_requote_credential.dart';
import 'package:pozitive/Core/Services/database.dart';
import 'package:pozitive/Core/ViewModel/baseModel.dart';
import 'package:pozitive/Core/enums/view_state.dart';

GetIt getIt = GetIt.instance;

class AskForRequoteViewModel extends BaseModel {
  Database database = getIt<DatabaseImplementation>();

  Future AskForReQuoteView(AskForReQuoteCrential askForReQuoteCrential) async {
    setState(ViewState.BUSY);
    final response = await database.askForReQuote(askForReQuoteCrential);
  }

}



