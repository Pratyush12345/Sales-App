class RefreshReqQuoteModel {
  String status;
  String msg;
  Null data;
  String error;
  int customerId;

  RefreshReqQuoteModel(
      {this.status, this.msg, this.data, this.error, this.customerId});

  RefreshReqQuoteModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    msg = json['msg'];
    data = json['data'];
    error = json['Error'];
    customerId = json['CustomerId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['msg'] = this.msg;
    data['data'] = this.data;
    data['Error'] = this.error;
    data['CustomerId'] = this.customerId;
    return data;
  }
}
