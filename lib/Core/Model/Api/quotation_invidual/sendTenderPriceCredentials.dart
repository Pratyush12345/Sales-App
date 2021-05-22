
class SendTenderPriceCredentials{
  String accountId;
  String quoteid;
  String emailType;
  String termType;
  SendTenderPriceCredentials({this.accountId,this.quoteid,this.termType,this.emailType});
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['AccountId'] = this.accountId;
    data['Quoteid']=this.quoteid;
    data['EmailType']=this.emailType;
    data['termType']=this.termType;
    return data;
  }
}