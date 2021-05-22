import 'package:pozitive/Core/Model/sendable.dart';

class QuoteHistoryDropDownGroupCredential extends Sendable {
  String accountId;
  String groupId;
  String type;
  String strPriceDate;
  String strAction;

  QuoteHistoryDropDownGroupCredential(
      {this.accountId,
      this.groupId,
      this.type,
      this.strPriceDate,
      this.strAction});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['AccountId'] = this.accountId;
    data['GroupId'] = this.groupId;
    data['Type'] = this.type;
    data['strPriceDate'] = this.strPriceDate;
    data['strAction'] = this.strAction;
    return data;
  }
}
