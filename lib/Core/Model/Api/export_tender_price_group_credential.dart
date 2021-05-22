import 'package:pozitive/Core/Model/sendable.dart';

class ExportTenderPriceGroupCredential extends Sendable {
  String accountId;
  String groupId;
  String quoteId;
  String emailType;

  ExportTenderPriceGroupCredential({
    this.accountId,
    this.groupId,
    this.quoteId,
    this.emailType,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['AccountId'] = this.accountId;
    data['GroupId'] = this.groupId;
    data['Quoteid'] = this.quoteId;
    data['EmailType'] = this.emailType;
    return data;
  }
}
