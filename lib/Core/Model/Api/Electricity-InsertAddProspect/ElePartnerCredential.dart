class ElePartnerCredential {
  String elepartnerName;
  String eleadditionalEmail;
  String eleaffiliateDetail;
  String elecommissionType;
  String eleeleDayFixed;
  String eleeleNightFixed;
  String eleeleEweFixed;
  String eleeleScFixed;
  String elecommoneleDayFixed;
  String elecommoneleNightFixed;
  String elecommoneleEweFixed;
  String elecommoneleScFixed;

  ElePartnerCredential({
    this.elepartnerName,
    this.eleadditionalEmail,
    this.eleaffiliateDetail,
    this.elecommissionType,
    this.eleeleDayFixed,
    this.eleeleNightFixed,
    this.eleeleEweFixed,
    this.eleeleScFixed,
    this.elecommoneleDayFixed,
    this.elecommoneleNightFixed,
    this.elecommoneleEweFixed,
    this.elecommoneleScFixed,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    data['elepartnerName'] = this.elepartnerName ?? "";
    data['eleadditionalEmail'] = this.eleadditionalEmail ?? "";
    data['eleaffiliateDetail'] = this.eleaffiliateDetail ?? "";
    data['elecommissionType'] = this.elecommissionType ?? "";
    data['eleeleDayFixed'] = this.eleeleDayFixed ?? "";
    data['eleeleNightFixed'] = this.eleeleNightFixed ?? "";
    data['eleeleEweFixed'] = this.eleeleEweFixed ?? "";
    data['eleeleScFixed'] = this.eleeleScFixed ?? "";
    data['elecommoneleDayFixed'] = this.elecommoneleDayFixed ?? "";
    data['elecommoneleNightFixed'] = this.elecommoneleNightFixed ?? "";
    data['elecommoneleEweFixed'] = this.elecommoneleEweFixed ?? "";
    data['elecommoneleScFixed'] = this.elecommoneleScFixed ?? "";
    return data;
  }
}
