class SaveButtonCredentials {
  String accountID;
  String quoteID;
  String nextPreferredStartDate;
  String intAffiliateSubUserId;
  String termType;
  String fuel;
  String baserateDayUnit1;
  String requiredUpliftEle1Y;
  String affiliateUpliftEle1Y;
  String baserateEWEUnit1;
  String requiredUpliftEleEWE1Y;
  String affiliateUpliftEleEWE1Y;
  String baserateNightUnit1;
  String requiredUpliftEleNight1Y;
  String affiliateUpliftEleNight1Y;
  String baserateStandingCharge1;
  String requiredUpliftEleSC1Y;
  String affiliateUpliftEleSC1Y;
  String baserateUnitPriceGas1;
  String requiredUpliftGas1Y;
  String affiliateUpliftGas1Y;
  String baserateSatandingChargeGas1;
  String requiredUpliftGasSC1Y;
  String affiliateUpliftGasSC1Y;

  SaveButtonCredentials(
      {this.quoteID,
      this.accountID,
      this.termType,
      this.fuel,
      this.affiliateUpliftEle1Y,
      this.affiliateUpliftEleEWE1Y,
      this.affiliateUpliftEleNight1Y,
      this.affiliateUpliftEleSC1Y,
      this.affiliateUpliftGas1Y,
      this.affiliateUpliftGasSC1Y,
      this.baserateDayUnit1,
      this.baserateEWEUnit1,
      this.baserateNightUnit1,
      this.baserateSatandingChargeGas1,
      this.baserateStandingCharge1,
      this.baserateUnitPriceGas1,
      this.intAffiliateSubUserId,
      this.nextPreferredStartDate,
      this.requiredUpliftEle1Y,
      this.requiredUpliftEleEWE1Y,
      this.requiredUpliftEleNight1Y,
      this.requiredUpliftEleSC1Y,
      this.requiredUpliftGas1Y,
      this.requiredUpliftGasSC1Y});
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['AccountId'] = this.accountID ?? '';
    data['Quoteid'] = this.quoteID ?? '';
    data['NextPreferredStartDate'] = this.nextPreferredStartDate ?? '';
    data['IntAffiliateSubUserId'] = this.intAffiliateSubUserId ?? '';
    data['TermType'] = this.termType ?? '';
    data['Fuel'] = this.fuel ?? '';
    data['BaserateDayUnit1'] = this.baserateDayUnit1 ?? '';
    data['RequiredUpliftEle1Y'] = this.requiredUpliftEle1Y ?? '';
    data['AffiliateUpliftEle1Y'] = this.affiliateUpliftEle1Y ?? '';
    data['BaserateEWEUnit1'] = this.baserateEWEUnit1 ?? '';
    data['RequiredUpliftEleEWE1Y'] = this.requiredUpliftEleEWE1Y ?? '';
    data['AffiliateUpliftEleEWE1Y'] = this.affiliateUpliftEleEWE1Y ?? '';
    data['BaserateNightUnit1'] = this.baserateNightUnit1 ?? '';
    data['RequiredUpliftEleNight1Y'] = this.requiredUpliftEleNight1Y ?? '';
    data['AffiliateUpliftEleNight1Y'] = this.affiliateUpliftEleNight1Y ?? '';
    data['BaserateStandingCharge1'] = this.baserateStandingCharge1 ?? '';
    data['RequiredUpliftEleSC1Y'] = this.requiredUpliftEleSC1Y ?? '';
    data['AffiliateUpliftEleSC1Y'] = this.affiliateUpliftEleSC1Y ?? '';
    data['BaserateUnitPriceGas1'] = this.baserateUnitPriceGas1 ?? '';
    data['requiredUpliftGas1Y'] = this.requiredUpliftGas1Y ?? '';
    data['AffiliateUpliftGas1Y'] = this.affiliateUpliftGas1Y ?? '';
    data['baserateSatandingChargeGas1'] =
        this.baserateSatandingChargeGas1 ?? '';
    data['RequiredUpliftGasSC1Y'] = this.requiredUpliftGasSC1Y ?? '';
    data['AffiliateUpliftGasSC1Y'] = this.affiliateUpliftGasSC1Y ?? '';
    return data;
  }
}
