class GasPaymentCredential {
  String gasstrPaymentType;
  String gasstrBankACName;
  String gasstrBankACNo;
  String gasstrBankSortCode;
  String gasstrBankName;
  String gasgasPaymentTermDays;
  String gasddAmounts;
  String gasddDays;
  String gascardNo;

  GasPaymentCredential({
    this.gasstrPaymentType,
    this.gasstrBankACName,
    this.gasstrBankACNo,
    this.gasstrBankSortCode,
    this.gasstrBankName,
    this.gasgasPaymentTermDays,
    this.gasddAmounts,
    this.gasddDays,
    this.gascardNo,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    data['gasstrPaymentType'] = this.gasstrPaymentType ?? "";
    data['gasstrBankACName'] = this.gasstrBankACName ?? "";
    data['gasstrBankACNo'] = this.gasstrBankACNo ?? "";
    data['gasstrBankSortCode'] = this.gasstrBankSortCode ?? "";
    data['gasstrBankName'] = this.gasstrBankName ?? "";
    data['gasgasPaymentTermDays'] = this.gasgasPaymentTermDays ?? "";
    data['gasddAmounts'] = this.gasddAmounts ?? "";
    data['gasddDays'] = this.gasddDays ?? "";
    data['gascardNo'] = this.gascardNo ?? "";

    return data;
  }
}
