import 'package:pozitive/Core/Model/sendable.dart';

class RequestQuoteHistoryGroupCredential extends Sendable {
  String accountId;
  String grouId;
  String type;

  RequestQuoteHistoryGroupCredential({
    this.accountId,
    this.grouId,
    this.type,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['AccountId'] = this.accountId;
    data['GroupId'] = this.grouId;
    data['Type'] = this.type;
    return data;
  }
}
