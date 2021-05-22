import 'package:pozitive/Core/Model/sendable.dart';

class ViewQuoteIndividualCredential extends Sendable {
  String accountId;
  String type;
  String quoteId;

  ViewQuoteIndividualCredential({
    this.accountId,
    this.type,
    this.quoteId,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['AccountId'] = this.accountId;
    data['type'] = this.type;
    data['Quoteid'] = this.quoteId;
    return data;
  }
}
