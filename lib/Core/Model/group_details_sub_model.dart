class GroupDetailsSubModel {
  String businessName;
  String mpan;
  String mprn;
  String industryEacAq;
  String currentSupplierName;
  String currentSupplierStartDate;
  String siteAddress;
  String meterType;
  String relatedMeter;
  GroupDetailsSubModel({
    this.businessName,
    this.mpan,
    this.mprn,
    this.industryEacAq,
    this.currentSupplierName,
    this.currentSupplierStartDate,
    this.siteAddress,
    this.meterType,
    this.relatedMeter,
  });
}
class EACvalues{
  String mpan;
  String EACDay;
  String EACnight;
  String strAq;

  EACvalues({
    this.mpan,
    this.EACDay,
    this.EACnight,
    this.strAq,
  } );
}
class Skippedmapn {
  String mapncore;
  String Reason;

  Skippedmapn({
    this.mapncore,
    this.Reason,
});
}
class EachyYearList {
  String tremtype;
  String mpan;
  String mprn;
  String baserateday;
  String baseratenight;
  String baserateEwe;
  String baserateSC;
  String contractStartDate;
  String contractEndDate;
  String QuoteId;
  int grpId;
  String visibleGrpName;
  int intCompId;
  bool checkItem;
  String dayEac;
  String nightEac;
  String gasEac;
  bool visited;

  String requiredUpliftDayGas ;
  String requiredUpliftScGas ;
  String upliftPreminumDayGas ;
  String upliftPreminumScGas ;

  String requiredUpliftDay ;
  String requiredUpliftNight ;
  String requiredUpliftEWE ;
  String requiredUpliftSc ;

  String upliftPreminumDay ;
  String upliftPreminumNight ;
  String upliftPreminumEWE ;
  String upliftPreminumSc ;

  String affiliateUpliftDay ;
  String affiliateUpliftNight ;
  String affiliateUpliftEWE ;
  String affiliateUpliftSc ;

  EachyYearList({
    this.tremtype,
    this.mpan,
    this.mprn,
    this.baserateday,
    this.baseratenight,
    this.baserateEwe,
    this.baserateSC,
    this.contractStartDate,
    this.contractEndDate,
    this.QuoteId,
    this.checkItem,
    this.grpId,
    this.intCompId,
    this.visibleGrpName,
    this.dayEac,
    this.nightEac,
    this.gasEac,
    this.visited,

    this.requiredUpliftDayGas,
    this.requiredUpliftScGas,
    this.upliftPreminumDayGas,
    this.upliftPreminumScGas,

    this.requiredUpliftDay ,
    this.requiredUpliftNight ,
    this.requiredUpliftEWE ,
    this.requiredUpliftSc ,

    this.upliftPreminumDay ,
    this.upliftPreminumNight ,
    this.upliftPreminumEWE ,
    this.upliftPreminumSc ,

    this.affiliateUpliftDay ,
    this.affiliateUpliftNight ,
    this.affiliateUpliftEWE ,
    this.affiliateUpliftSc ,

  });
}

class CollectionQuoteIds {
  String QuoteId;

  CollectionQuoteIds({
    this.QuoteId,
});
  CollectionQuoteIds.fromJson(Map<String, dynamic> json) {
    QuoteId = json['QuoteId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['QuoteId'] = this.QuoteId;
    return data;
  }
}

class GenerateQuoteIds {
  String QuteId;
  int IntSubUserId;
  String decupliftEle;
  String decupliftEleNight;
  String decupliftEleSC;
  String decupliftGasSC;
  String decupliftGas;
  String decupliftEle_UPP;
  String decupliftEleEWE_UPP;
  String decupliftEleNight_UPP;
  String decUpliftEleSC_UPP;
  String decUpliftGasSC_UPP;
  String decupliftGas_UPP;
  String decupliftEle_Sub;
  String decupliftEleEWE_Sub;
  String decupliftEleNight_Sub;
  String decupliftEleSC_Sub;
  String decupliftGasSC_Sub;
  String decupliftGas_Sub;
  String intTermType;
  String decChargeDay;
  String decChargeNight;
  String decChargeEWE;
  String decSCPrice;
  String decUnitPriceGas;
  String decSCPriceGas;

  GenerateQuoteIds({
    this.QuteId,
    this.IntSubUserId,
    this.decupliftEle,
    this.decupliftEleNight,
    this.decupliftEleSC,
    this.decupliftGasSC,
    this.decupliftGas,
    this.decupliftEle_UPP,
    this.decupliftEleEWE_UPP,
    this.decupliftEleNight_UPP,
    this.decUpliftEleSC_UPP,
    this.decUpliftGasSC_UPP,
    this.decupliftGas_UPP,
    this.decupliftEle_Sub,
    this.decupliftEleEWE_Sub,
    this.decupliftEleNight_Sub,
    this.decupliftEleSC_Sub,
    this.decupliftGasSC_Sub,
    this.decupliftGas_Sub,
    this.intTermType,
    this.decChargeDay,
    this.decChargeNight,
    this.decChargeEWE,
    this.decSCPrice,
    this.decUnitPriceGas,
    this.decSCPriceGas,
  });
  GenerateQuoteIds.fromJson(Map<String, dynamic> json) {
    QuteId = json['QuteId'];
    IntSubUserId = json['IntSubUserId'];
    decupliftEle = json['decupliftEle'];
    decupliftEleNight = json['decupliftEleNight'];
    decupliftEleSC = json['decupliftEleSC'];
    decupliftGasSC = json['decupliftGasSC'];
    decupliftGas = json['decupliftGas'];
    decupliftEle_UPP = json['decupliftEle_UPP'];
    decupliftEleEWE_UPP = json['decupliftEleEWE_UPP'];
    decupliftEleNight_UPP = json['decupliftEleNight_UPP'];
    decUpliftEleSC_UPP = json['decUpliftEleSC_UPP'];
    decUpliftGasSC_UPP = json['decUpliftGasSC_UPP'];
    decupliftGas_UPP = json['decupliftGas_UPP'];
    decupliftEle_Sub = json['decupliftEle_Sub'];
    decupliftEleEWE_Sub = json['decupliftEleEWE_Sub'];
    decupliftEleNight_Sub = json['decupliftEleNight_Sub'];
    decupliftEleSC_Sub = json['decupliftEleSC_Sub'];
    decupliftGasSC_Sub = json['decupliftGasSC_Sub'];
    decupliftGas_Sub = json['decupliftGas_Sub'];
    intTermType = json['intTermType'];
    decChargeDay = json['decChargeDay'];
    decChargeNight = json['decChargeNight'];
    decChargeEWE = json['decChargeEWE'];
    decSCPrice = json['decSCPrice'];
    decUnitPriceGas = json['decUnitPriceGas'];
    decSCPriceGas = json['decSCPriceGas'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['QuteId'] = this.QuteId;
    data['IntSubUserId'] =this.IntSubUserId;
    data['decupliftEle'] = this.decupliftEle;
    data['decupliftEleNight'] =this.decupliftEleNight;
    data['decupliftEleSC'] =this.decupliftEleSC;
    data['decupliftGasSC'] =this.decupliftGasSC;
    data['decupliftGas'] =this.decupliftGas;
    data['decupliftEle_UPP'] =this.decupliftEle_UPP;
    data['decupliftEleEWE_UPP'] =this.decupliftEleEWE_UPP;
    data['decupliftEleNight_UPP'] = this.decupliftEleNight_UPP;
    data['decUpliftEleSC_UPP'] =this.decUpliftEleSC_UPP;
    data['decUpliftGasSC_UPP'] =this.decUpliftGasSC_UPP;
    data['decupliftGas_UPP'] = this.decupliftGas_UPP;
    data['decupliftEle_Sub'] = this.decupliftEle_Sub;
    data['decupliftEleEWE_Sub'] =this.decupliftEleEWE_Sub;
    data['decupliftEleNight_Sub'] = this.decupliftEleNight_Sub;
    data['decupliftEleSC_Sub'] = this.decupliftEleSC_Sub;
    data['decupliftGasSC_Sub'] = this.decupliftGasSC_Sub;
    data['decupliftGas_Sub'] =this.decupliftGas_Sub;
    data['intTermType'] =this.intTermType;
    data['decChargeDay'] = this.decChargeDay;
    data['decChargeNight'] = this.decChargeNight;
    data['decChargeEWE'] =this.decChargeEWE;
    data['decSCPrice'] = this.decSCPrice;
    data['decUnitPriceGas'] =this.decUnitPriceGas;
    data['decSCPriceGas'] =this.decSCPriceGas;
    return data;
  }
}
