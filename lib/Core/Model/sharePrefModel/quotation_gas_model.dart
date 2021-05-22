class QuotationGasModel {
  String mPrn;
  String aQ;

  QuotationGasModel({this.aQ, this.mPrn});
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['mPrn'] = this.mPrn ?? "";
    data['aQ'] = this.aQ ?? "";

    return data;
  }
}
