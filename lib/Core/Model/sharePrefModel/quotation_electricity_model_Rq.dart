class QuotationElectricityModelRq {
  String wholeMpanRq;
  String mPanCodeRq;
  String mPanOneRq;
  String mPanTwoRq;
  String mPanThreeRq;
  String mPanFourRq;
  String mPanFiveRq;
  String mPanSixRq;
  String eACDayRq;
  String eACNightRq;
  String eWERq;
  String hhFilePathRq;
  QuotationElectricityModelRq(
      {this.eACDayRq,
      this.eACNightRq,
      this.eWERq,
      this.hhFilePathRq,
      this.mPanCodeRq,
      this.mPanFiveRq,
      this.mPanFourRq,
      this.mPanOneRq,
      this.mPanSixRq,
      this.mPanThreeRq,
      this.mPanTwoRq,
      this.wholeMpanRq});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    data['wholeMpanRq'] = this.wholeMpanRq ?? "";
    data['mPanCodeRq'] = this.mPanCodeRq ?? "";
    data['mPanOneRq'] = this.mPanOneRq ?? "";
    data['mPanTwoRq'] = this.mPanTwoRq ?? "";
    data['mPanThreeRq'] = this.mPanThreeRq ?? "";
    data['mPanFourRq'] = this.mPanFourRq ?? "";
    data['mPanFiveRq'] = this.mPanFiveRq ?? "";
    data['mPanSixRq'] = this.mPanSixRq ?? "";
    data['eACDayRq'] = this.eACDayRq ?? "";
    data['eACNightRq'] = this.eACNightRq ?? "";
    data['eWERq'] = this.eWERq ?? "";
    data['hhFilePathRq'] = this.hhFilePathRq ?? "";
    return data;
  }
}
