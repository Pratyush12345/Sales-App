import 'package:pozitive/Core/Model/sendable.dart';

class QuoteHistoryDropDownIndividualCredential extends Sendable {
  String accountId;
  String quoteId;
  String type;
  String strAction;
  String strPriceDate;

  QuoteHistoryDropDownIndividualCredential(
      {this.accountId,
      this.quoteId,
      this.type,
      this.strAction,
      this.strPriceDate});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['AccountId'] = this.accountId;
    data['QuoteId'] = this.quoteId;
    data['Type'] = this.type;
    data['strAction'] = this.strAction;
    data['strPriceDate'] = this.strPriceDate;
    return data;
  }
}
