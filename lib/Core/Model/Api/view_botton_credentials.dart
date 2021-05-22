
class ViewButtonCredentials{
  String accountID;
  String type;
  String quoteID;

  ViewButtonCredentials({this.accountID,this.type,this.quoteID});
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['AccountId'] = this.accountID;
    data['Type']=this.type;
    data['Quoteid']=this.quoteID;
    return data;
  }
}