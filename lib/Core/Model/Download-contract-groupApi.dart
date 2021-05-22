class DownloadContractGroupApi {
  String accountId;
  String strContractPath;
  String filename;

  DownloadContractGroupApi({this.accountId, this.strContractPath, this.filename});

  DownloadContractGroupApi.fromJson(Map<String, dynamic> json) {
    accountId = json['AccountId'];
    strContractPath = json['strContractPath'];
    filename = json['Filename'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['AccountId'] = this.accountId;
    data['strContractPath'] = this.strContractPath;
    data['Filename'] = this.filename;
    return data;
  }
}
