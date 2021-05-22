
class ViewGroupButtonCredentials{
  String accountID;
  String type;
  String quoteID;

  ViewGroupButtonCredentials({this.accountID,this.type,this.quoteID});
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['AccountId'] = this.accountID;
    data['Type']=this.type;
    data['GroupId']=this.quoteID;
    return data;
  }
}