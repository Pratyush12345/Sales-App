
import 'package:pozitive/Core/Model/sendable.dart';

class GroupAddQuoteNoteCredential extends Sendable {
  String accountId;
  String groupid;
  String notesText;

  GroupAddQuoteNoteCredential({
    this.accountId,
    this.groupid,
    this.notesText
  });

  /// Create the JSON required by Dayblizz API server for updating a post.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['AccountId'] = this.accountId;
    data['GroupId'] = this.groupid;
    data['NotesText']=this.notesText;
    return data;
  }
}