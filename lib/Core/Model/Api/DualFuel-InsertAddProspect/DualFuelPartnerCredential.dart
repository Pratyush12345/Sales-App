class DualFuelPartnerCredential {
  String partnerName;
  String additionalEmail;
  String commissionType;
  String eleDayFixed;
  String eleNightFixed;
  String eleEweFixed;
  String eleScFixed;
  String gasFixed;
  String gasScFixed;
  String commoneleDayFixed;
  String commoneleNightFixed;
  String commoneleEweFixed;
  String commoneleScFixed;
  String commongasFixed;
  String commongasScFixed;

  DualFuelPartnerCredential({
    this.partnerName,
    this.additionalEmail,
    this.commissionType,
    this.eleDayFixed,
    this.eleNightFixed,
    this.eleEweFixed,
    this.eleScFixed,
    this.gasFixed,
    this.gasScFixed,
    this.commoneleDayFixed,
    this.commoneleNightFixed,
    this.commoneleEweFixed,
    this.commoneleScFixed,
    this.commongasFixed,
    this.commongasScFixed,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    data['partnerName'] = this.partnerName ?? "";
    data['additionalEmail'] = this.additionalEmail ?? "";
    data['commissionType'] = this.commissionType ?? "";
    data['eleDayFixed'] = this.eleDayFixed ?? "";
    data['eleNightFixed'] = this.eleNightFixed ?? "";
    data['eleEweFixed'] = this.eleEweFixed ?? "";
    data['eleScFixed'] = this.eleScFixed ?? "";
    data['gasFixed'] = this.gasFixed ?? "";
    data['gasScFixed'] = this.gasScFixed ?? "";
    data['commoneleDayFixed'] = this.commoneleDayFixed ?? "";
    data['commoneleNightFixed'] = this.commoneleNightFixed ?? "";
    data['commoneleEweFixed'] = this.commoneleEweFixed ?? "";
    data['commoneleScFixed'] = this.commoneleScFixed ?? "";
    data['commongasFixed'] = this.commongasFixed ?? "";
    data['commongasScFixed'] = this.commongasScFixed ?? "";
    return data;
  }
}
