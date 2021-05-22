import 'dart:convert';

import 'package:pozitive/Core/Model/Api/groupAddQuoteNoteCredential.dart';
import 'package:pozitive/Core/Model/Api/groupQuoteNoteCredential.dart';
import 'package:pozitive/Core/Model/GroupQuoteNotes.dart';
import 'baseApi.dart';

class GroupQuotationNoteApi extends BaseApi { 


  Future<dynamic>getGroupQuoteNoteList(GroupQuoteNoteCredential groupQuoteNoteCredential){
    return postRequest("GetQuoteNotesGroup", (r) {
      print(r.body);
      var res= jsonDecode(r.body);
      return GroupQuoteNote.fromJson(res['data']);

    },groupQuoteNoteCredential);
  }

  Future<dynamic> addgroupQuoteNotes(GroupAddQuoteNoteCredential groupAddQuoteNoteCredential){
    return postRequest("AddQuoteNotesGroup", (r) => r.body,
        groupAddQuoteNoteCredential);
  }


}