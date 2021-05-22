
class MoveGroupQuoteCredentials{
  String accountID;
  String groupId;
  String liveDate;

  MoveGroupQuoteCredentials({this.accountID,this.groupId,this.liveDate});
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['AccountId'] = this.accountID;
    data['GroupId']=this.groupId;
    data['LiveDate']=this.liveDate;
    return data;
  }
}