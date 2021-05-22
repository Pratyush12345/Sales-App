
class AddQuoteResponse {
  String status;
  String msg;
  Data data;
  String error;

  AddQuoteResponse({this.status, this.msg, this.data, this.error});

  AddQuoteResponse.fromJson(Map<String, dynamic> json) {
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
  String hHSampleFileAttachment;
  String requiredByDate;
  String preferredStartDate;

  Data(
      {this.accountId,
        this.hHSampleFileAttachment,
        this.requiredByDate,
        this.preferredStartDate});

  Data.fromJson(Map<String, dynamic> json) {
    accountId = json['AccountId'];
    hHSampleFileAttachment = json['HHSampleFileAttachment'];
    requiredByDate = json['RequiredByDate'];
    preferredStartDate = json['PreferredStartDate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['AccountId'] = this.accountId;
    data['HHSampleFileAttachment'] = this.hHSampleFileAttachment;
    data['RequiredByDate'] = this.requiredByDate;
    data['PreferredStartDate'] = this.preferredStartDate;
    return data;
  }
}