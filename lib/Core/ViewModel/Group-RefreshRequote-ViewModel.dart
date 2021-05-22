import 'package:get_it/get_it.dart';
import 'package:pozitive/Core/Services/database.dart';
import 'package:pozitive/Core/ViewModel/baseModel.dart';

GetIt getIt = GetIt.instance;

class GroupRefreshReQuotedViewModel extends BaseModel {
  Database database = getIt<DatabaseImplementation>();

/*  Future groupRefreshReQuote(GroupRefreshReQuoteCrential refreshReQuoteCrential) async {
    setState(ViewState.BUSY);
    final response = await database.groupRefreshReQuote(refreshReQuoteCrential);
  }*/

}
