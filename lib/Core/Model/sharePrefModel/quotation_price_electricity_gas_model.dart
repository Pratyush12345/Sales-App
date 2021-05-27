class QuotationPriceElectricityGasModel {
  var electricityUplift;
  var electricityScUplift;
  var gasUplift;
  var gasScUplift;
  var eAUplift;
  var eAScUplift;
  var gAUplift;
  var gAScUplift;
  var selectPartner;
  var subUserID;

  QuotationPriceElectricityGasModel(
      {this.eAScUplift,
      this.eAUplift,
      this.electricityScUplift,
      this.electricityUplift,
      this.gAScUplift,
      this.gasScUplift,
      this.gasUplift,
      this.gAUplift,
      this.selectPartner,this.subUserID});
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['electricityUplift'] = this.electricityUplift;
    data['electricityScUplift'] = this.electricityScUplift;
    data['gasUplift'] = this.gasUplift;
    data['gasScUplift'] = this.gasScUplift;
    data['eAUplift'] = this.eAUplift;
    data['eAScUplift'] = this.eAScUplift;
    data['gAUplift'] = this.gAUplift;
    data['gAScUplift'] = this.gAScUplift;
    data['subUserID']=this.subUserID;
    data['selectPartner'] = this.selectPartner;


    return data;
  }


}

class GroupQuotationPriceElectricityGasModel {
   var elecCommonUnit ;
   var elecCommonSc ;
   var elecAffiliateUnit ;
   var elecAffiliateSc ;
   var gasCommonUnit;
   var gasCommonSc ;
   var gasAffiliateUnit ;
   var gasAffiliateSc;
   var getGroupVolumeDataModel;




  GroupQuotationPriceElectricityGasModel(
      {this.elecCommonUnit,
        this.elecCommonSc,
        this.elecAffiliateUnit,
        this.elecAffiliateSc,
        this.gasCommonUnit,
        this.gasCommonSc,
        this.gasAffiliateUnit,
        this.gasAffiliateSc,
        this.getGroupVolumeDataModel,
        });
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['elecCommonUnit'] = this.elecCommonUnit;
    data['elecCommonSc'] = this.elecCommonSc;
    data['elecAffiliateUnit'] = this.elecAffiliateUnit;
    data['elecAffiliateSc'] = this.elecAffiliateSc;
    data['gasCommonUnit'] = this.gasCommonUnit;
    data['gasCommonSc'] = this.gasCommonSc;
    data['gasAffiliateUnit'] = this.gasAffiliateUnit;
    data['gasAffiliateSc'] = this.gasAffiliateSc;
    data['getGroupVolumeDataModel']=this.getGroupVolumeDataModel;



    return data;
  }


}

