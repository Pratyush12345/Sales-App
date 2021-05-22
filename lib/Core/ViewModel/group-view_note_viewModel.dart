
import 'package:pozitive/Core/Model/Api/groupQuoteNoteCredential.dart';
import 'package:pozitive/Core/Model/GroupQuoteNotes.dart';
import 'package:pozitive/Core/Services/database.dart';
import 'package:pozitive/Core/ViewModel/baseModel.dart';
import 'package:pozitive/Core/enums/view_state.dart';
import '../getIt.dart';

class GroupsViewNoteViewModel extends BaseModel{

  Database database=getIt<DatabaseImplementation>();

  GroupQuoteNote quoteNote;
  Future getQuoteNoteList(GroupQuoteNoteCredential quoteNoteCredential) async {
    assert( quoteNoteCredential != null);
    // TODO: Apply validation here or somewhere else?

    print('acountId ===${quoteNoteCredential.accountId}');

    setState(ViewState.BUSY);

    final response = await database.getgroupQuoteNoteList(quoteNoteCredential);


    if (isNotError(response)) {
      quoteNote=response;
      print(response);
    }else{
      print("error");

    }
    setState(ViewState.IDLE);
  }

}