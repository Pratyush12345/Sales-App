
import 'package:pozitive/Core/Model/sendable.dart';

class GroupQuoteNoteCredential extends Sendable {
  String accountId;
  String groupId;

  GroupQuoteNoteCredential({
    this.accountId,
    this.groupId,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['AccountId'] = this.accountId;
    data['GroupId'] = this.groupId;
    return data;
  }
}