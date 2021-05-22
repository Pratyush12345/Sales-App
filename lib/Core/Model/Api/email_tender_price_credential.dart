import 'package:pozitive/Core/Model/sendable.dart';

class EmailTenderPriceCredential extends Sendable {
  String accountId;
  String quoteid;
  String emailType;
  String termType;

  EmailTenderPriceCredential({
    this.accountId,
    this.quoteid,
    this.emailType,
    this.termType,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['AccountId'] = this.accountId;
    data['Quoteid'] = this.quoteid;
    data['EmailType'] = this.emailType;
    data['TermType'] = this.termType;
    return data;
  }
}
