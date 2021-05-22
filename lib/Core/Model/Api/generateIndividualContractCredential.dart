
import 'package:pozitive/Core/Model/sendable.dart';

class GenerateIndividualContractCredential extends Sendable {
  String accountId;
  String quoteId;
  String nextPreferredStartDate;
  String intsubuserID;
  String termType;
  String intCompanyId;
  String requiredUpliftEle1Y;
  String requiredUpliftEleNight1Y;
  String requiredUpliftEleEWE1Y;
  String requiredUpliftEleSC1Y;
  String affiliateUpliftEle1Y;
  String affiliateUpliftEleNight1Y;
  String affiliateUpliftEleEWE1Y;
  String affiliateUpliftEleSC1Y;
  String baserateDayUnit1;
  String baserateNightUnit1;
  String requiredUpliftGasSC1Y;
  String affiliateUpliftGas1Y;
  String affiliateUpliftGasSC1Y;
  String requiredUpliftGas1Y;



  GenerateIndividualContractCredential({
    this.accountId,
    this.quoteId,
    this.nextPreferredStartDate,
    this.intsubuserID,
    this.termType,
    this.intCompanyId,
    this.requiredUpliftEle1Y,
    this.requiredUpliftEleNight1Y,
    this.requiredUpliftEleEWE1Y,
    this.requiredUpliftEleSC1Y,
    this.affiliateUpliftEle1Y,
    this.affiliateUpliftEleNight1Y,
    this.affiliateUpliftEleEWE1Y,
    this.affiliateUpliftEleSC1Y,
    this.baserateDayUnit1,
    this.baserateNightUnit1,
    this.requiredUpliftGasSC1Y,
    this.affiliateUpliftGas1Y,
    this.affiliateUpliftGasSC1Y,
    this.requiredUpliftGas1Y,
  });

  /// Create the JSON required by Dayblizz API server for updating a post.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['AccountId'] = this.accountId;
    data['Quoteid'] = this.quoteId;
    data['NextPreferredStartDate'] =this.nextPreferredStartDate;
    data['intsubuserID'] =this.intsubuserID;
    data['TermType'] =this.termType;
    data['IntCompanyId'] =this.intCompanyId;
    data['RequiredUpliftEle1Y'] =this.requiredUpliftEle1Y??'';
    data['RequiredUpliftEleNight1Y'] =this.requiredUpliftEleNight1Y??'';
    data['RequiredUpliftEleEWE1Y'] =this.requiredUpliftEleEWE1Y??'';
    data['RequiredUpliftEleSC1Y'] =this.requiredUpliftEleSC1Y??'';
    data['AffiliateUpliftEle1Y'] =this.affiliateUpliftEle1Y??'';
    data['AffiliateUpliftEleNight1Y'] =this.affiliateUpliftEleNight1Y??'';
    data['AffiliateUpliftEleEWE1Y'] =this.affiliateUpliftEleEWE1Y??'';
    data['AffiliateUpliftEleSC1Y'] =this.affiliateUpliftEleSC1Y??'';
    data['BaserateDayUnit1'] =this.baserateDayUnit1??'';
    data['BaserateNightUnit1'] =this.baserateNightUnit1??'';
    data['RequiredUpliftGas1Y']=this.requiredUpliftGas1Y??'';
    data['RequiredUpliftGasSC1Y'] =this.requiredUpliftGasSC1Y??'';
    data['AffiliateUpliftGas1Y'] =this.affiliateUpliftGas1Y??'';
    data['AffiliateUpliftGasSC1Y'] =this.affiliateUpliftGasSC1Y??'';

    return data;
  }
}