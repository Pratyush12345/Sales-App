class RequestQuoteHistoryButtonModel {
  String accountId;
  int quoteId;
  String type;
  String strAction;
  Null strCreatedDate;
  Null strCreatedBy;
  Null decTotalAQ;
  Null decTotalEAC;
  String strPriceDate;
  Null lSTQuoteHistory;
  Null lSTQuoteHistoryDate;
  List<LSTQuotePriceHistory> lSTQuotePriceHistory;

  RequestQuoteHistoryButtonModel(
      {this.accountId,
      this.quoteId,
      this.type,
      this.strAction,
      this.strCreatedDate,
      this.strCreatedBy,
      this.decTotalAQ,
      this.decTotalEAC,
      this.strPriceDate,
      this.lSTQuoteHistory,
      this.lSTQuoteHistoryDate,
      this.lSTQuotePriceHistory});

  RequestQuoteHistoryButtonModel.fromJson(Map<String, dynamic> json) {
    accountId = json['AccountId'];
    quoteId = json['QuoteId'];
    type = json['Type'];
    strAction = json['strAction'];
    strCreatedDate = json['strCreatedDate'];
    strCreatedBy = json['strCreatedBy'];
    decTotalAQ = json['decTotalAQ'];
    decTotalEAC = json['decTotalEAC'];
    strPriceDate = json['strPriceDate'];
    lSTQuoteHistory = json['LSTQuoteHistory'];
    lSTQuoteHistoryDate = json['LSTQuoteHistory_Date'];
    if (json['LSTQuotePriceHistory'] != null) {
      lSTQuotePriceHistory = new List<LSTQuotePriceHistory>();
      json['LSTQuotePriceHistory'].forEach((v) {
        lSTQuotePriceHistory.add(new LSTQuotePriceHistory.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['AccountId'] = this.accountId;
    data['QuoteId'] = this.quoteId;
    data['Type'] = this.type;
    data['strAction'] = this.strAction;
    data['strCreatedDate'] = this.strCreatedDate;
    data['strCreatedBy'] = this.strCreatedBy;
    data['decTotalAQ'] = this.decTotalAQ;
    data['decTotalEAC'] = this.decTotalEAC;
    data['strPriceDate'] = this.strPriceDate;
    data['LSTQuoteHistory'] = this.lSTQuoteHistory;
    data['LSTQuoteHistory_Date'] = this.lSTQuoteHistoryDate;
    if (this.lSTQuotePriceHistory != null) {
      data['LSTQuotePriceHistory'] =
          this.lSTQuotePriceHistory.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class LSTQuotePriceHistory {
  Null strGasValidityDate;
  Null strEleValidityDateNHH;
  Null strEleValidityDateHH;
  String strMPAN;
  String strMPRN;
  Null topLine;
  String decChargesDay;
  String decChargesEwe;
  String decChargesNight;
  String decSCElectricity;
  String decUpliftEleDay;
  String decUpliftEleEWE;
  String decUpliftEleNight;
  String decUpliftEleSC;
  String decChargesDayF;
  String decChargesEweF;
  String decChargesNightF;
  String decSCElectricityF;
  String decCCPriceF;
  String decEMR;
  String decSupplyCapacity;
  String decExcessCapacityCharge;
  String decReactiveCharge;
  String decUpliftEleDaySub;
  String decUpliftEleEWESub;
  String decUpliftEleNightSub;
  String decUpliftEleSCSub;
  String decUpliftGasSub;
  String decUpliftGasSCSub;
  String decUnitPriceGas;
  String decSCGas;
  String decUpliftGas;
  String decUpliftGasSC;
  String decUnitPriceGasF;
  String decSCGasF;
  int intTermType;

  LSTQuotePriceHistory(
      {this.strGasValidityDate,
      this.strEleValidityDateNHH,
      this.strEleValidityDateHH,
      this.strMPAN,
      this.strMPRN,
      this.topLine,
      this.decChargesDay,
      this.decChargesEwe,
      this.decChargesNight,
      this.decSCElectricity,
      this.decUpliftEleDay,
      this.decUpliftEleEWE,
      this.decUpliftEleNight,
      this.decUpliftEleSC,
      this.decChargesDayF,
      this.decChargesEweF,
      this.decChargesNightF,
      this.decSCElectricityF,
      this.decCCPriceF,
      this.decEMR,
      this.decSupplyCapacity,
      this.decExcessCapacityCharge,
      this.decReactiveCharge,
      this.decUpliftEleDaySub,
      this.decUpliftEleEWESub,
      this.decUpliftEleNightSub,
      this.decUpliftEleSCSub,
      this.decUpliftGasSub,
      this.decUpliftGasSCSub,
      this.decUnitPriceGas,
      this.decSCGas,
      this.decUpliftGas,
      this.decUpliftGasSC,
      this.decUnitPriceGasF,
      this.decSCGasF,
      this.intTermType});

  LSTQuotePriceHistory.fromJson(Map<String, dynamic> json) {
    strGasValidityDate = json['strGasValidityDate'];
    strEleValidityDateNHH = json['strEleValidityDateNHH'];
    strEleValidityDateHH = json['strEleValidityDateHH'];
    strMPAN = json['strMPAN'];
    strMPRN = json['strMPRN'];
    topLine = json['TopLine'];
    decChargesDay = json['decChargesDay'];
    decChargesEwe = json['decChargesEwe'];
    decChargesNight = json['decChargesNight'];
    decSCElectricity = json['decSCElectricity'];
    decUpliftEleDay = json['decUpliftEle_Day'];
    decUpliftEleEWE = json['decUpliftEle_EWE'];
    decUpliftEleNight = json['decUpliftEle_Night'];
    decUpliftEleSC = json['decUpliftEleSC'];
    decChargesDayF = json['decChargesDayF'];
    decChargesEweF = json['decChargesEweF'];
    decChargesNightF = json['decChargesNightF'];
    decSCElectricityF = json['decSCElectricityF'];
    decCCPriceF = json['decCCPriceF'];
    decEMR = json['decEMR'];
    decSupplyCapacity = json['decSupplyCapacity'];
    decExcessCapacityCharge = json['decExcessCapacityCharge'];
    decReactiveCharge = json['decReactiveCharge'];
    decUpliftEleDaySub = json['decUpliftEle_Day_Sub'];
    decUpliftEleEWESub = json['decUpliftEle_EWE_Sub'];
    decUpliftEleNightSub = json['decUpliftEle_Night_Sub'];
    decUpliftEleSCSub = json['decUpliftEleSC_Sub'];
    decUpliftGasSub = json['decUpliftGas_Sub'];
    decUpliftGasSCSub = json['decUpliftGasSC_Sub'];
    decUnitPriceGas = json['decUnitPriceGas'];
    decSCGas = json['decSCGas'];
    decUpliftGas = json['decUpliftGas'];
    decUpliftGasSC = json['decUpliftGasSC'];
    decUnitPriceGasF = json['decUnitPriceGasF'];
    decSCGasF = json['decSCGasF'];
    intTermType = json['intTermType'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['strGasValidityDate'] = this.strGasValidityDate;
    data['strEleValidityDateNHH'] = this.strEleValidityDateNHH;
    data['strEleValidityDateHH'] = this.strEleValidityDateHH;
    data['strMPAN'] = this.strMPAN;
    data['strMPRN'] = this.strMPRN;
    data['TopLine'] = this.topLine;
    data['decChargesDay'] = this.decChargesDay;
    data['decChargesEwe'] = this.decChargesEwe;
    data['decChargesNight'] = this.decChargesNight;
    data['decSCElectricity'] = this.decSCElectricity;
    data['decUpliftEle_Day'] = this.decUpliftEleDay;
    data['decUpliftEle_EWE'] = this.decUpliftEleEWE;
    data['decUpliftEle_Night'] = this.decUpliftEleNight;
    data['decUpliftEleSC'] = this.decUpliftEleSC;
    data['decChargesDayF'] = this.decChargesDayF;
    data['decChargesEweF'] = this.decChargesEweF;
    data['decChargesNightF'] = this.decChargesNightF;
    data['decSCElectricityF'] = this.decSCElectricityF;
    data['decCCPriceF'] = this.decCCPriceF;
    data['decEMR'] = this.decEMR;
    data['decSupplyCapacity'] = this.decSupplyCapacity;
    data['decExcessCapacityCharge'] = this.decExcessCapacityCharge;
    data['decReactiveCharge'] = this.decReactiveCharge;
    data['decUpliftEle_Day_Sub'] = this.decUpliftEleDaySub;
    data['decUpliftEle_EWE_Sub'] = this.decUpliftEleEWESub;
    data['decUpliftEle_Night_Sub'] = this.decUpliftEleNightSub;
    data['decUpliftEleSC_Sub'] = this.decUpliftEleSCSub;
    data['decUpliftGas_Sub'] = this.decUpliftGasSub;
    data['decUpliftGasSC_Sub'] = this.decUpliftGasSCSub;
    data['decUnitPriceGas'] = this.decUnitPriceGas;
    data['decSCGas'] = this.decSCGas;
    data['decUpliftGas'] = this.decUpliftGas;
    data['decUpliftGasSC'] = this.decUpliftGasSC;
    data['decUnitPriceGasF'] = this.decUnitPriceGasF;
    data['decSCGasF'] = this.decSCGasF;
    data['intTermType'] = this.intTermType;
    return data;
  }
}
