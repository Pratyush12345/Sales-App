
import 'package:pozitive/Core/Model/sendable.dart';

class AddQuoteQuickLeadCredential extends Sendable {
  String accountId;
  String type;
  String quoteID;

  AddQuoteQuickLeadCredential({
    this.accountId,this.type,this.quoteID
  });

  /// Create the JSON required by Dayblizz API server for updating a post.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['AccountId'] = this.accountId;
    data['Type'] = this.type;
    data['Quoteid'] = this.quoteID;
    return data;
  }
}