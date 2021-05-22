class GasGasCredential {
  String fullMprn;
  String dteGasStartDate;
  String strContractTermGas;
  String strStandingChargeGas;
  String strUnitPriceGas;
  String aqGasCharge;
  String intContractEndDateSelected;
  String endDate;

  GasGasCredential(
      {this.fullMprn,
      this.dteGasStartDate,
      this.strContractTermGas,
      this.strStandingChargeGas,
      this.strUnitPriceGas,
      this.aqGasCharge,
      this.intContractEndDateSelected,
      this.endDate});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    data['fullMprn'] = this.fullMprn ?? "";
    data['dteGasStartDate'] = this.dteGasStartDate ?? "";
    data['strContractTermGas'] = this.strContractTermGas ?? "";
    data['strStandingChargeGas'] = this.strStandingChargeGas ?? "";
    data['strUnitPriceGas'] = this.strUnitPriceGas ?? "";
    data['aqCharge'] = this.aqGasCharge ?? "";
    data['intContractEndDateSelected'] = this.intContractEndDateSelected ?? "";
    data['endDate'] = this.endDate ?? "";

    return data;
  }
}
