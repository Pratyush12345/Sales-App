class ContractCustomerDetailsCredential {
  String accountID;
  String type;
  String intCustomerId;
  String intGroupId;
  ContractCustomerDetailsCredential(
      {this.accountID, this.intCustomerId, this.type, this.intGroupId});
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['AccountId'] = this.accountID;
    data['intBrokerCommBillMstId'] = this.type;
    data['type'] = this.intCustomerId;
    data['fuel'] = this.intGroupId;
    return data;
  }
}
