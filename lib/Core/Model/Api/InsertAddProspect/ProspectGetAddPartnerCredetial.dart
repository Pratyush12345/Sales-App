
class ProspectGetAddCredential{
  String accountID;
  String companyId;
  String customerId;

  ProspectGetAddCredential({this.accountID,this.companyId, this.customerId});
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['AccountId'] = this.accountID;
    data['companyid'] = this.companyId;
    data['Customerid'] = this.customerId;
    return data;
  }
}