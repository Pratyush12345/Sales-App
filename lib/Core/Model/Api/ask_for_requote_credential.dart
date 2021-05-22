import 'package:pozitive/Core/Model/sendable.dart';

class AskForReQuoteCrential extends Sendable {
  String accountId;
  String quoteId;
  String flagFrom;

  AskForReQuoteCrential({
    this.accountId,
    this.quoteId,
    this.flagFrom
  });

  /// Create the JSON required by Dayblizz API server for updating a post.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['AccountId'] = this.accountId;
    data['Quoteid'] = this.quoteId;
    data['FlagFrom']=this.flagFrom;
    return data;
  }
}