class SendEmailTenderResponse {
  String status;
  String msg;
  Data data;
  String error;

  SendEmailTenderResponse({this.status, this.msg, this.data, this.error});

  SendEmailTenderResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    msg = json['msg'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    error = json['Error'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['msg'] = this.msg;
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    data['Error'] = this.error;
    return data;
  }
}

class Data {
  String accountId;
  int termType;
  String emailType;
  int quoteid;
  String exportTenderPricePath;

  Data(
      {this.accountId,
        this.termType,
        this.emailType,
        this.quoteid,
        this.exportTenderPricePath});

  Data.fromJson(Map<String, dynamic> json) {
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