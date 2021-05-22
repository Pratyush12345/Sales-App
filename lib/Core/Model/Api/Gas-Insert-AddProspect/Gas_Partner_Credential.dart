class GasPartnerCredential {
  String partnerName;
  String additionalEmail;
  String affiliateDetail;
  String commissionType;
  String gasFixed;
  String gasScFixed;
  String commongasFixed;
  String commongasScFixed;

  GasPartnerCredential({
    this.partnerName,
    this.additionalEmail,
    this.affiliateDetail,
    this.commissionType,
    this.gasFixed,
    this.gasScFixed,
    this.commongasFixed,
    this.commongasScFixed,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    data['partnerName'] = this.partnerName ?? "";
    data['additionalEmail'] = this.additionalEmail ?? "";
    data['affiliateDetail'] = this.affiliateDetail ?? "";
    data['commissionType'] = this.commissionType ?? "";
    data['gasFixed'] = this.gasFixed ?? "";
    data['gasScFixed'] = this.gasScFixed ?? "";

    data['commongasFixed'] = this.commongasFixed ?? "";
    data['commongasScFixed'] = this.commongasScFixed ?? "";
    return data;
  }
}
