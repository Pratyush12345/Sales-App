
import 'package:get_it/get_it.dart';
import 'package:pozitive/Core/Model/Api/Refresh-RequestQuoteCredential.dart';
import 'package:pozitive/Core/Services/database.dart';
import 'package:pozitive/Core/ViewModel/baseModel.dart';
import 'package:pozitive/Core/enums/view_state.dart';

GetIt getIt = GetIt.instance;

class RefreshReQuotedIndividualViewModel extends BaseModel {
  Database database = getIt<DatabaseImplementation>();

  Future refreshReQuote(RefreshReQuoteCrential refreshReQuoteCrential) async {
    setState(ViewState.BUSY);
    final response = await database.refreshReQuote(refreshReQuoteCrential);
  }

}
