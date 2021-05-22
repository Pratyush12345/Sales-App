class DualFuelPaymentCredential {
  String strPaymentType;
  String strBankACName;
  String strBankACNo;
  String strBankSortCode;
  String strBankName;
  String intPaymentTermDays;
  String dfcardNo;
  String dfddDays;
  String dfddAmounts;

  DualFuelPaymentCredential({
    this.strPaymentType,
    this.strBankACName,
    this.strBankACNo,
    this.strBankSortCode,
    this.strBankName,
    this.intPaymentTermDays,
    this.dfcardNo,
    this.dfddDays,
    this.dfddAmounts,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    data['strPaymentType'] = this.strPaymentType ?? "";
    data['strBankACName'] = this.strBankACName ?? "";
    data['strBankACNo'] = this.strBankACNo ?? "";
    data['strBankSortCode'] = this.strBankSortCode ?? "";
    data['strBankName'] = this.strBankName ?? "";
    data['intPaymentTermDays'] = this.intPaymentTermDays ?? "";
    data['dfcardNo'] = this.dfcardNo ?? "";
    data['dfddDays'] = this.dfddDays ?? "";
    data['dfddAmounts'] = this.dfddAmounts ?? "";

    return data;
  }
}
