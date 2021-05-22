class GroupDetailsTabCredential {
  String accountID;
  String type;
  String groupId;
  GroupDetailsTabCredential({this.accountID, this.type, this.groupId});
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['AccountId'] = this.accountID;
    data['GroupId'] = this.groupId;
    data['type'] = this.type;
    return data;
  }
}
