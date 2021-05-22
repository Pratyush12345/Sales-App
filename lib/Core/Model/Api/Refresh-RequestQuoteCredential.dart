
import 'package:pozitive/Core/Model/sendable.dart';

class RefreshReQuoteCrential extends Sendable {
  String accountId;
  String quoteId;
  String flagFrom;
  String fuel;
  String termType;

  RefreshReQuoteCrential({
    this.accountId,
    this.quoteId,
    this.flagFrom,
    this.fuel,
    this.termType,
  });

  /// Create the JSON required by Dayblizz API server for updating a post.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['AccountId'] = this.accountId;
    data['Quoteid'] = this.quoteId;
    data['FlagFrom']=this.flagFrom;
    data['Fuel']=this.fuel;
    data['TermType']=this.termType;
    return data;
  }
}