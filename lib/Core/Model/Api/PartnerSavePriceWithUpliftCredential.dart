
import 'package:pozitive/Core/Model/sendable.dart';

class PartnerSavePriceWithUpliftCredential extends Sendable {
  String accountId;
  String quoteid;
  var nextPreferredStartDate;
  int intAffiliateSubUserId;
  var termType;
  var fuel;
  var baserateDayUnit1;
  var requiredUpliftEle1Y;
  var affiliateUpliftEle1Y;
  var baserateEWEUnit1;
  var requiredUpliftEleEWE1Y;
  var affiliateUpliftEleEWE1Y;
  var baserateNightUnit1;
  var requiredUpliftEleNight1Y;
  var affiliateUpliftEleNight1Y;
  var baserateStandingCharge1;
  var requiredUpliftEleSC1Y;
  var affiliateUpliftEleSC1Y;
  var baserateUnitPriceGas1;
  var requiredUpliftGas1Y;
  var affiliateUpliftGas1Y;
  var baserateSatandingChargeGas1;
  var requiredUpliftGasSC1Y;
  var affiliateUpliftGasSC1Y;

  PartnerSavePriceWithUpliftCredential({
    this.accountId,
    this.quoteid,
    this.nextPreferredStartDate,
    this.intAffiliateSubUserId,
    this.termType,
    this.fuel,
    this.baserateDayUnit1,
    this.requiredUpliftEle1Y,
    this.affiliateUpliftEle1Y,
    this.baserateEWEUnit1,
    this.requiredUpliftEleEWE1Y,
    this.affiliateUpliftEleEWE1Y,
    this.baserateNightUnit1,
    this.requiredUpliftEleNight1Y,
    this.affiliateUpliftEleNight1Y,
    this.baserateStandingCharge1,
    this.requiredUpliftEleSC1Y,
    this.affiliateUpliftEleSC1Y,
    this.baserateUnitPriceGas1,
    this.requiredUpliftGas1Y,
    this.affiliateUpliftGas1Y,
    this.baserateSatandingChargeGas1,
    this.requiredUpliftGasSC1Y,
    this.affiliateUpliftGasSC1Y,

  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    data['AccountId'] = this.accountId;
    data['Quoteid'] = this.quoteid;
    data['NextPreferredStartDate'] = this.nextPreferredStartDate;
    data['IntAffiliateSubUserId'] = this.intAffiliateSubUserId.toString();

    data['TermType'] = this.termType;
    data['Fuel'] = this.fuel;
    data['BaserateDayUnit1'] = this.baserateDayUnit1;
    data['RequiredUpliftEle1Y'] = this.requiredUpliftEle1Y;
    data['AffiliateUpliftEle1Y'] = this.affiliateUpliftEle1Y;
    data['BaserateEWEUnit1'] = this.baserateEWEUnit1;
    data['RequiredUpliftEleEWE1Y'] = this.requiredUpliftEleEWE1Y;
    data['AffiliateUpliftEleEWE1Y'] = this.affiliateUpliftEleEWE1Y;
    data['BaserateNightUnit1'] = this.baserateNightUnit1;
    data['RequiredUpliftEleNight1Y'] = this.requiredUpliftEleNight1Y;
    data['AffiliateUpliftEleNight1Y'] = this.affiliateUpliftEleNight1Y;
    data['BaserateStandingCharge1'] = this.baserateStandingCharge1;
    data['RequiredUpliftEleSC1Y'] = this.requiredUpliftEleSC1Y ;
    data['AffiliateUpliftEleSC1Y'] = this.affiliateUpliftEleSC1Y ;
    data['BaserateUnitPriceGas1'] = this.baserateUnitPriceGas1 ;
    data['RequiredUpliftGas1Y'] = this.requiredUpliftGas1Y ;
    data['AffiliateUpliftGas1Y'] = this.affiliateUpliftGas1Y;
    data['BaserateSatandingChargeGas1'] = this.baserateSatandingChargeGas1 ;
    data['RequiredUpliftGasSC1Y'] = this.requiredUpliftGasSC1Y ;
    data['AffiliateUpliftGasSC1Y'] = this.affiliateUpliftGasSC1Y ;
    return data;

  }
}