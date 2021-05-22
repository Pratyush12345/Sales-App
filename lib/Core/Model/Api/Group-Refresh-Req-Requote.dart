
import 'package:pozitive/Core/Model/sendable.dart';

class GroupRefreshReQuoteCrential extends Sendable {
  String accountId;
  String quoteId;


  GroupRefreshReQuoteCrential({
    this.accountId,
    this.quoteId,

  });

  /// Create the JSON required by Dayblizz API server for updating a post.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['AccountId'] = this.accountId;
    data['Quoteid'] = this.quoteId;
    return data;

  }
}