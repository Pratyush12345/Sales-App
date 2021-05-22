
class BrokerCommonBillCredentials {
  String accountID;
  String intBrokerCommBillMstID;
  String type;
  String fuel;
  BrokerCommonBillCredentials({this.accountID,this.type,this.intBrokerCommBillMstID,this.fuel});
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['AccountId'] = this.accountID;
    data['intBrokerCommBillMstId'] = this.intBrokerCommBillMstID;
    data['type'] = this.type;
    data['fuel']=this.fuel;
    return data;
  }
}