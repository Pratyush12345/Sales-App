class QuotationIndividualModelRq {
  String businessNameRq;
  String postCodeRq;
  String termsRq;
  String requireByDateRq;
  String preferredByDateRq;
  String isforFirstyearRq;
  String isforSecondyearRq;
  String isforThirdyearRq;
  String isforFourthyearRq;
  String isForFifthyearRq;
  String isforOtheryearRq;
  String singleRateRq;
  String isStarkDADCRq;
  String intDADCIdRq;
  String thirdPartyMOPRq;
  String thirdPartyDADCRq;
  String preferredEndDateRq;
  QuotationIndividualModelRq({
    this.businessNameRq,
    this.postCodeRq,
    this.preferredByDateRq,
    this.requireByDateRq,
    this.termsRq,
    this.singleRateRq,
    this.thirdPartyMOPRq,
    this.isStarkDADCRq,
    this.isForFifthyearRq,
    this.isforFourthyearRq,
    this.isforThirdyearRq,
    this.isforSecondyearRq,
    this.isforOtheryearRq,
    this.isforFirstyearRq,
    this.intDADCIdRq,
    this.thirdPartyDADCRq,
    this.preferredEndDateRq,
  });
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    data['businessNameRq'] = this.businessNameRq ?? "";
    data['postCodeRq'] = this.postCodeRq ?? "";
    data['preferredByDateRq'] = this.preferredByDateRq ?? "";
    data['requireByDateRq'] = this.requireByDateRq ?? "";
    data['termsRq'] = this.termsRq ?? "";
    data['singleRateRq'] = this.singleRateRq ?? "";
    data['thirdPartyMOPRq'] = this.thirdPartyMOPRq ?? "";
    data['isStarkDADCRq'] = this.isStarkDADCRq ?? "";
    data['isforThirdyearRq'] = this.isforThirdyearRq ?? "";
    data['isforSecondyearRq'] = this.isforSecondyearRq ?? "";
    data['isForFifthyearRq'] = this.isForFifthyearRq ?? "";
    data['isforFourthyearRq'] = this.isforFourthyearRq ?? "";
    data['isforOtheryearRq'] = this.isforOtheryearRq ?? "";
    data['isforFirstyearRq'] = this.isforFirstyearRq ?? "";
    data['intDADCIdRq'] = this.intDADCIdRq ?? "";
    data['thirdPartyDADCRq'] = this.thirdPartyDADCRq ?? "";
    data['preferredEndDateRq'] = this.preferredEndDateRq ?? "";
    return data;
  }
}
