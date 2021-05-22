
class SupplyPointCredentials{
  String accountId;
  String strMPANMPRN;
  String intCustomerId;
  String fuelType;
  SupplyPointCredentials({this.accountId,this.fuelType,this.intCustomerId,this.strMPANMPRN});
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['AccountId'] = this.accountId;
    data['strMPANMPRN']=this.strMPANMPRN;
    data['intCustomerId']=this.intCustomerId??'';
    data['fuelType']=this.fuelType;
    return data;
  }
}