class DownloadContractGroupCredentials{
  String accountID;
  String Filename;
  DownloadContractGroupCredentials({this.accountID,this.Filename});
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['AccountId'] = this.accountID;
    data['Filename'] = this.Filename;
    return data;
  }
}