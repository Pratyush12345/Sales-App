import 'dart:convert';

import 'package:get_it/get_it.dart';
import 'package:pozitive/Core/Model/Api/groupAddQuoteNoteCredential.dart';
import 'package:pozitive/Core/Model/Api/groupQuoteNoteCredential.dart';
import 'package:pozitive/Core/Model/GroupQuoteNotes.dart';
import 'package:pozitive/Core/Services/GroupQuoteNotesApi.dart';
import 'package:pozitive/Core/ViewModel/baseModel.dart';
import 'package:pozitive/Core/enums/view_state.dart';

GetIt getIt = GetIt.instance;

class GroupsAddandViewNoteViewModel extends BaseModel {
  GroupQuotationNoteApi _api = getIt<GroupQuotationNoteApi>();

  GroupQuoteNote quoteNote = GroupQuoteNote();

  Future getGroupQuoteNoteList(
      GroupQuoteNoteCredential quoteNoteCredential) async {
    assert(quoteNoteCredential != null);

    print('acountId ===${quoteNoteCredential.accountId}');

    setState(ViewState.BUSY);

    final response = await _api.getGroupQuoteNoteList(quoteNoteCredential);

    if (isNotError(response)) {
      quoteNote = response;
      print(response);
    } else {
      print("error");
    }

    setState(ViewState.IDLE);
  }

  Future uppdateGroupQuoteNote(
      GroupAddQuoteNoteCredential addQuoteNoteCredential) async {
    assert(addQuoteNoteCredential != null);
    // TODO: Apply validation here or somewhere else?

    print('acountId ===${addQuoteNoteCredential.accountId}');

    setState(ViewState.BUSY);

    final response = await _api.addgroupQuoteNotes(addQuoteNoteCredential);

    if (isNotError(response)) {
      var res = jsonDecode(response);
      setState(ViewState.IDLE);
      return res;
    } else {
      print("error");
      setState(ViewState.IDLE);
      return;
    }
  }
}
