class GasBillAddCredential {
  String strBillAddress1;
  String town1;
  String strBillAddress2;
  String strBillPostCode;
  String strBillinTermType;
  String sameAsSite;

  GasBillAddCredential({
    this.strBillAddress1,
    this.town1,
    this.strBillAddress2,
    this.strBillPostCode,
    this.strBillinTermType,
    this.sameAsSite,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    data['strBillAddress1'] = this.strBillAddress1 ?? "";
    data['town1'] = this.town1 ?? "";
    data['strBillAddress2'] = this.strBillAddress2 ?? "";
    data['strBillPostCode'] = this.strBillPostCode ?? "";
    data['strBillinTermType'] = this.strBillinTermType ?? "";
    data['sameAsSite'] = this.sameAsSite ?? "";
    return data;
  }
}
