
class DownloadAllCredentials{
  String accountID;
  String intBrokerCommBillMstID;
  String type;
  DownloadAllCredentials({this.accountID,this.type,this.intBrokerCommBillMstID});
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['AccountId'] = this.accountID;
    data['intBrokerCommBillMstId'] = this.intBrokerCommBillMstID;
    data['type'] = this.type;
    return data;
  }
}