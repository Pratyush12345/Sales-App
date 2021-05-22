class EmailTenderPriceGroupModel {
  String accountId;
  String emailType;
  int quoteid;
  int groupid;
  Null exportTenderPricePath;

  EmailTenderPriceGroupModel(
      {this.accountId,
      this.emailType,
      this.quoteid,
      this.groupid,
      this.exportTenderPricePath});

  EmailTenderPriceGroupModel.fromJson(Map<String, dynamic> json) {
    accountId = json['AccountId'];
    emailType = json['EmailType'];
    quoteid = json['Quoteid'];
    groupid = json['Groupid'];
    exportTenderPricePath = json['ExportTenderPricePath'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['AccountId'] = this.accountId;
    data['EmailType'] = this.emailType;
    data['Quoteid'] = this.quoteid;
    data['Groupid'] = this.groupid;
    data['ExportTenderPricePath'] = this.exportTenderPricePath;
    return data;
  }
}
