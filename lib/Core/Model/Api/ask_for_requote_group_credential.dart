import 'package:pozitive/Core/Model/sendable.dart';

class AskForRequoteGroupCredential extends Sendable {
  String accountId;
  String groupId;
  String flagFrom;

  AskForRequoteGroupCredential({
    this.accountId,
    this.groupId,
    this.flagFrom,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['AccountId'] = this.accountId;
    data['GroupId'] = this.groupId;
    data['FlagFrom'] = this.flagFrom;
    return data;
  }
}
