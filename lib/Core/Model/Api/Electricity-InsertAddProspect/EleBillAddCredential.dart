class EleBillAddCredential {
  String elestrBillAddress1;
  String eletown1;
  String elestrBillAddress2;
  String elestrBillPostCode;
  String elestrBillinTermType;
  String elesameAsSite;

  EleBillAddCredential({
    this.elestrBillAddress1,
    this.eletown1,
    this.elestrBillAddress2,
    this.elestrBillPostCode,
    this.elestrBillinTermType,
    this.elesameAsSite,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    data['elestrBillAddress1'] = this.elestrBillAddress1 ?? "";
    data['eletown1'] = this.eletown1 ?? "";
    data['elestrBillAddress2'] = this.elestrBillAddress2 ?? "";
    data['elestrBillPostCode'] = this.elestrBillPostCode ?? "";
    data['elestrBillinTermType'] = this.elestrBillinTermType ?? "";
    data['elesameAsSite'] = this.elesameAsSite ?? "";
    return data;
  }
}
