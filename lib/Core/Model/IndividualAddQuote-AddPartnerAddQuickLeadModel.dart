class IndividualAddQuoteModel {
  String status;
  int customerId;
  String msg;
  Null data;
  String error;
  String priceAlertMsg;

  IndividualAddQuoteModel(
      {this.status,
      this.customerId,
      this.msg,
      this.data,
      this.error,
      this.priceAlertMsg});

  IndividualAddQuoteModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    customerId = json['CustomerId'];
    msg = json['msg'];
    data = json['data'];
    error = json['Error'];
    priceAlertMsg = json['PriceAlertmsg'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['CustomerId'] = this.customerId;
    data['msg'] = this.msg;
    data['data'] = this.data;
    data['Error'] = this.error;
    data['PriceAlertmsg'] = this.priceAlertMsg;
    return data;
  }
}
