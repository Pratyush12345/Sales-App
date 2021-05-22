class PriceEleGasGroupQuoteCredential {
  String accountId;
  List<LstPriceList> lstPriceList;

  PriceEleGasGroupQuoteCredential({this.accountId, this.lstPriceList});

  PriceEleGasGroupQuoteCredential.fromJson(Map<String, dynamic> json) {
    accountId = json['AccountId'];
    if (json['lstPriceList'] != null) {
      lstPriceList = new List<LstPriceList>();
      json['lstPriceList'].forEach((v) {
        lstPriceList.add(new LstPriceList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['AccountId'] = this.accountId;
    if (this.lstPriceList != null) {
      data['lstPriceList'] = this.lstPriceList.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class LstPriceList {
  String quteId;
  String intTermType;
  int intSubUserId;
  String decChargeDay;
  String decChargeEWE;
  String decChargeNight;
  String decUnitPriceGas;
  String decSCPrice;
  String decupliftEle;
  String decupliftEleEWE;
  String decupliftEleNight;
  String decUpliftEleSC;
  String decupliftEleSub;
  String decupliftEleEWESub;
  String decupliftEleNightSub;
  String decUpliftEleSCSub;
  String decupliftGas;
  String decUpliftGasSC;
  String decupliftGasSub;
  String decUpliftGasSCSub;

  LstPriceList(
      {this.quteId,
        this.intTermType,
        this.intSubUserId,
        this.decChargeDay,
        this.decChargeEWE,
        this.decChargeNight,
        this.decUnitPriceGas,
        this.decSCPrice,
        this.decupliftEle,
        this.decupliftEleEWE,
        this.decupliftEleNight,
        this.decUpliftEleSC,
        this.decupliftEleSub,
        this.decupliftEleEWESub,
        this.decupliftEleNightSub,
        this.decUpliftEleSCSub,
        this.decupliftGas,
        this.decUpliftGasSC,
        this.decupliftGasSub,
        this.decUpliftGasSCSub});

  LstPriceList.fromJson(Map<String, dynamic> json) {
    quteId = json['QuteId'];
    intTermType = json['intTermType'];
    intSubUserId = json['IntSubUserId'];
    decChargeDay = json['decChargeDay'];
    decChargeEWE = json['decChargeEWE'];
    decChargeNight = json['decChargeNight'];
    decUnitPriceGas = json['decUnitPriceGas'];
    decSCPrice = json['decSCPrice'];
    decupliftEle = json['decupliftEle'];
    decupliftEleEWE = json['decupliftEleEWE'];
    decupliftEleNight = json['decupliftEleNight'];
    decUpliftEleSC = json['decUpliftEleSC'];
    decupliftEleSub = json['decupliftEle_Sub'];
    decupliftEleEWESub = json['decupliftEleEWE_Sub'];
    decupliftEleNightSub = json['decupliftEleNight_Sub'];
    decUpliftEleSCSub = json['decUpliftEleSC_Sub'];
    decupliftGas = json['decupliftGas'];
    decUpliftGasSC = json['decUpliftGasSC'];
    decupliftGasSub = json['decupliftGas_Sub'];
    decUpliftGasSCSub = json['decUpliftGasSC_Sub'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['QuteId'] = this.quteId;
    data['intTermType'] = this.intTermType;
    data['IntSubUserId'] = this.intSubUserId;
    data['decChargeDay'] = this.decChargeDay;
    data['decChargeEWE'] = this.decChargeEWE;
    data['decChargeNight'] = this.decChargeNight;
    data['decUnitPriceGas'] = this.decUnitPriceGas;
    data['decSCPrice'] = this.decSCPrice;
    data['decupliftEle'] = this.decupliftEle;
    data['decupliftEleEWE'] = this.decupliftEleEWE;
    data['decupliftEleNight'] = this.decupliftEleNight;
    data['decUpliftEleSC'] = this.decUpliftEleSC;
    data['decupliftEle_Sub'] = this.decupliftEleSub;
    data['decupliftEleEWE_Sub'] = this.decupliftEleEWESub;
    data['decupliftEleNight_Sub'] = this.decupliftEleNightSub;
    data['decUpliftEleSC_Sub'] = this.decUpliftEleSCSub;
    data['decupliftGas'] = this.decupliftGas;
    data['decUpliftGasSC'] = this.decUpliftGasSC;
    data['decupliftGas_Sub'] = this.decupliftGasSub;
    data['decUpliftGasSC_Sub'] = this.decUpliftGasSCSub;
    return data;
  }
}
