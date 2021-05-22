import 'package:pozitive/Core/Model/Api/quoteNoteCredential.dart';
import 'package:pozitive/Core/Model/quoteNotes.dart';
import 'package:pozitive/Core/Services/database.dart';
import 'package:pozitive/Core/ViewModel/baseModel.dart';
import 'package:pozitive/Core/enums/view_state.dart';

import '../getIt.dart';

class GroupViewNoteViewModel extends BaseModel{

  Database database=getIt<DatabaseImplementation>();

QuoteNote quoteNote;
  Future getQuoteNoteList(QuoteNoteCredential quoteNoteCredential) async {
    assert( quoteNoteCredential != null);
    // TODO: Apply validation here or somewhere else?

    print('acountId ===${quoteNoteCredential.accountId}');

    setState(ViewState.BUSY);

    final response = await database.getIndividiualGroupQuoteNoteList(quoteNoteCredential);


    if (isNotError(response)) {
      quoteNote=response;
      print(response);
    }else{
      print("error");
    }
    setState(ViewState.IDLE);
  }

}