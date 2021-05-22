class QuotationIndividualModel {
  String businessName;
  String postCode;
  String terms;
  String requireByDate;
  String preferredByDate;
  String endDate;
  // String rateType;
  String isforFirstyear;
  String isforSecondyear;
  String isforThirdyear;
  String isforFourthyear;
  String isForFifthyear;
  String isforOtheryear;
  String isForAllYearTerms;
  String singleRate;
  String isStarkDADC;
  String intDADCId;
  String thirdPartyMOP;
  String thirdPartyDADC;
  QuotationIndividualModel({
    this.businessName,
    this.postCode,
    this.preferredByDate,
    //  this.rateType,
    this.requireByDate,
    this.endDate,
    this.terms,
    this.singleRate,
    this.thirdPartyMOP,
    this.isStarkDADC,
    this.isForFifthyear,
    this.isforFourthyear,
    this.isforThirdyear,
    this.isforSecondyear,
    this.isforOtheryear,
    this.isForAllYearTerms,
    this.isforFirstyear,
    this.intDADCId,
    this.thirdPartyDADC,
  });
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    data['businessName'] = this.businessName ?? "";
    data['postCode'] = this.postCode ?? "";
    data['preferredByDate'] = this.preferredByDate ?? "";
    // data['rateType'] = this.rateType ?? "";
    data['requireByDate'] = this.requireByDate ?? "";
    data['endDate'] = this.endDate ?? "";

    data['terms'] = this.terms ?? "";
    data['singleRate'] = this.singleRate ?? "";
    data['thirdPartyMOP'] = this.thirdPartyMOP ?? "";
    data['isStarkDADC'] = this.isStarkDADC ?? "";
    data['isforThirdyear'] = this.isforThirdyear ?? "";
    data['isforSecondyear'] = this.isforSecondyear ?? "";
    data['isForFifthyear'] = this.isForFifthyear ?? "";
    data['isforFourthyear'] = this.isforFourthyear ?? "";
    data['isforOtheryear'] = this.isforOtheryear ?? "";

    data['isForAllYearTerms'] = this.isForAllYearTerms ?? "";

    data['isforFirstyear'] = this.isforFirstyear ?? "";
    data['intDADCId'] = this.intDADCId ?? "";
    data['thirdPartyDADC'] = this.thirdPartyDADC ?? "";
    return data;
  }
}
