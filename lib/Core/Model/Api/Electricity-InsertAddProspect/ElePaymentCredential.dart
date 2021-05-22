class ElePaymentCredential {
  String strPaymentType;
  String strBankACName;
  String strBankACNo;
  String strBankSortCode;
  String strBankName;
  String intPaymentTermDays;
  String elecardNo;
  String eleddDays;
  String eleddAmounts;

  ElePaymentCredential({
    this.strPaymentType,
    this.strBankACName,
    this.strBankACNo,
    this.strBankSortCode,
    this.strBankName,
    this.intPaymentTermDays,
    this.elecardNo,
    this.eleddDays,
    this.eleddAmounts,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    data['strPaymentType'] = this.strPaymentType ?? "";
    data['strBankACName'] = this.strBankACName ?? "";
    data['strBankACNo'] = this.strBankACNo ?? "";
    data['strBankSortCode'] = this.strBankSortCode ?? "";
    data['strBankName'] = this.strBankName ?? "";
    data['intPaymentTermDays'] = this.intPaymentTermDays ?? "";
    data['elecardNo'] = this.elecardNo ?? "";
    data['eleddDays'] = this.eleddDays ?? "";
    data['eleddAmounts'] = this.eleddAmounts ?? "";

    return data;
  }
}
