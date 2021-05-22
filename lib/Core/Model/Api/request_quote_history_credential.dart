import 'package:pozitive/Core/Model/sendable.dart';

class RequestQuoteHistoryCredential extends Sendable {
  String accountId;
  String quoteid;
  String type;

  RequestQuoteHistoryCredential({
    this.accountId,
    this.quoteid,
    this.type,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['AccountId'] = this.accountId;
    data['QuoteId'] = this.quoteid;
    data['Type'] = this.type;
    return data;
  }
}
