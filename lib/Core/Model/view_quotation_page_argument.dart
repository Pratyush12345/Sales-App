import 'package:pozitive/Core/ViewModel/baseModel.dart';

class ViewQuotationPageArgument {
  Function addTab;
  String quoteID;
  String businessName;
  String postCode;
  String requireByDate;
  String preferredDate;
  String mprn;
  String aqCharge;
  bool oneYear;
  bool twoYear;
  bool threeYear;
  bool fourYear;
  bool fiveYear;
  bool other;
  bool all;
  bool customerThirdPartyMop;
  bool dcDA;
  bool starkDcDa;
  bool singleRate;
  String mpancode;
  String mpanOne;
  String mpan;
  String mpanTwo;
  String mpanThree;
  String mpanFour;
  String mpanFive;
  String mpanSix;
  String dayEac;
  String nightEac;
  String eweEac;
  String aq;
  ViewQuotationPageArgument(
      {this.all,
      this.threeYear,
      this.twoYear,
      this.oneYear,
      this.quoteID,
      this.starkDcDa,
      this.singleRate,
      this.customerThirdPartyMop,
      this.dcDA,
      this.other,
      this.requireByDate,
      this.postCode,
      this.businessName,
      this.addTab,
      this.aq,
      this.aqCharge,
      this.dayEac,
      this.eweEac,
      this.fiveYear,
      this.fourYear,
      this.mpan,
      this.mpancode,
      this.mpanFive,
      this.mpanFour,
      this.mpanOne,
      this.mpanSix,
      this.mprn,
      this.nightEac,
      this.preferredDate,
      this.mpanTwo,
      this.mpanThree});
}
