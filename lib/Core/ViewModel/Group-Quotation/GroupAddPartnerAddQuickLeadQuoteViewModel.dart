
import 'package:get_it/get_it.dart';
import 'package:pozitive/Core/Model/Api/GroupAddPartnerAddQuickLeadCredential.dart';
import 'package:pozitive/Core/Model/Group-addPartner-addQuickLeadQuotes.dart';
import 'package:pozitive/Core/ViewModel/baseModel.dart';
import 'package:pozitive/Core/enums/view_state.dart';
import 'package:pozitive/Core/Services/database.dart';

GetIt getIt = GetIt.instance;

class GroupAddPartnerAddQuickLeadQuoteViewModel extends BaseModel {
  Database database = getIt<DatabaseImplementation>();

  GroupAddPartnerAddQuickLeadQuote addQuickLeadQuoteModel = GroupAddPartnerAddQuickLeadQuote();

  Future getGroupAddPartnerQuickQuoteList(GroupAddPartnerAddQuickLeadCrential groupAddPartnerAddQuickLeadCrential) async {
    assert( groupAddPartnerAddQuickLeadCrential != null);
    // TODO: Apply validation here or somewhere else?

    print('acountId ===${groupAddPartnerAddQuickLeadCrential.accountId}');

    setState(ViewState.BUSY);

    final response = await database.groupAddPartnerAddQuickLead(groupAddPartnerAddQuickLeadCrential);


    if (isNotError(response)) {
      addQuickLeadQuoteModel=response;
      print(response);
    }else{
      print("error");
    }
    setState(ViewState.IDLE);
  }

}











