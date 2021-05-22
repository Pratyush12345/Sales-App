
class AccountCredential{
  String accountID;

  AccountCredential({this.accountID});
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['AccountId'] = this.accountID;
    return data;
  }
}