import 'package:pozitive/Core/Model/sendable.dart';

class RequestQuoteHistoryButtonCredential extends Sendable {
  String accountId;
  String quoteid;
  String type;
  String strAction;
  String strPriceDate;

  RequestQuoteHistoryButtonCredential(
      {this.accountId,
      this.quoteid,
      this.type,
      this.strAction,
      this.strPriceDate});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['AccountId'] = this.accountId;
    data['QuoteId'] = this.quoteid;
    data['Type'] = this.type;
    data['strAction'] = this.strAction;
    data['strPriceDate'] = this.strPriceDate;
    return data;
  }
}
