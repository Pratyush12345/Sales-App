class ExportTenderPriceModel {
  String accountId;
  int termType;
  String emailType;
  int quoteid;
  String exportTenderPricePath;

  ExportTenderPriceModel(
      {this.accountId,

      this.termType,
      this.emailType,
      this.quoteid,
      this.exportTenderPricePath});


  ExportTenderPriceModel.fromJson(Map<String, dynamic> json) {
    accountId = json['AccountId'];
    termType = json['TermType'];
    emailType = json['EmailType'];
    quoteid = json['Quoteid'];
    exportTenderPricePath = json['ExportTenderPricePath'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['AccountId'] = this.accountId;
    data['TermType'] = this.termType;
    data['EmailType'] = this.emailType;
    data['Quoteid'] = this.quoteid;

    data['ExportTenderPricePath'] = this.exportTenderPricePath;

    return data;
  }
}
