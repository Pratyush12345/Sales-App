class DualFuelGasCredential {
  String fullMprn;
  String dfdteGasStartDate;
  String strStandingChargeGas;
  String strUnitPriceGas;
  String aqCharge;
  String dfgasEndDate;
  String dfgascontractEndDate;

  DualFuelGasCredential({
    this.fullMprn,
    this.dfdteGasStartDate,
    this.strStandingChargeGas,
    this.strUnitPriceGas,
    this.aqCharge,
    this.dfgasEndDate,
    this.dfgascontractEndDate,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    data['dfasEndDate'] = this.dfgasEndDate ?? "";
    data['fullMprn'] = this.fullMprn ?? "";
    data['dfdteGasStartDate'] = this.dfdteGasStartDate ?? "";
    data['strStandingChargeGas'] = this.strStandingChargeGas ?? "";
    data['strUnitPriceGas'] = this.strUnitPriceGas ?? "";
    data['aqCharge'] = this.aqCharge ?? "";
    data['dfgascontractEndDate'] = this.dfgascontractEndDate ?? "";

    return data;
  }
}
