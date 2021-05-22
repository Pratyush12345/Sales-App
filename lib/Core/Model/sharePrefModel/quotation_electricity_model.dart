class QuotationElectricityModel {
  String wholeMpan;
  String mPanCode;
  String mPanOne;
  String mPanTwo;
  String mPanThree;
  String mPanFour;
  String mPanFive;
  String mPanSix;
  String eACDay;
  String eACNight;
  String eWE;
  String hhFilePath;
  QuotationElectricityModel(
      {this.eACDay,
      this.eACNight,
      this.eWE,
      this.hhFilePath,
      this.mPanCode,
      this.mPanFive,
      this.mPanFour,
      this.mPanOne,
      this.mPanSix,
      this.mPanThree,
      this.mPanTwo,
      this.wholeMpan});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    data['wholeMpan'] = this.wholeMpan ?? "";
    data['mPanCode'] = this.mPanCode ?? "";
    data['mPanOne'] = this.mPanOne ?? "";
    data['mPanTwo'] = this.mPanTwo ?? "";
    data['mPanThree'] = this.mPanThree ?? "";
    data['mPanFour'] = this.mPanFour ?? "";
    data['mPanFive'] = this.mPanFive ?? "";
    data['mPanSix'] = this.mPanSix ?? "";
    data['eACDay'] = this.eACDay ?? "";
    data['eACNight'] = this.eACNight ?? "";
    data['eWE'] = this.eWE ?? "";
    data['hhFilePath'] = this.hhFilePath ?? "";
    return data;
  }
}
