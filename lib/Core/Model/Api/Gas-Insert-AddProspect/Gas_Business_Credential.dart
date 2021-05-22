class GasBusinessCredential {
  String gbusiness_Name;
  String gbusiness_Type;
  String galternative_Number;
  String gemail;
  String gstrNameOfBill;
  String gstrSupplyName;
  String gstrCompanyRegNo;
  String gstrEAMobileNo;
  String gregisteredCompanyName;
  String gbtePaperBill;
  String gbtemicrobuisnes;
  String gstrPropertOwnerShip;
  String gstrCustomerRefNo;

  GasBusinessCredential({
    this.gbusiness_Name,
    this.gbusiness_Type,
    this.galternative_Number,
    this.gemail,
    this.gstrNameOfBill,
    this.gstrSupplyName,
    this.gstrCompanyRegNo,
    this.gstrEAMobileNo,
    this.gregisteredCompanyName,
    this.gbtePaperBill,
    this.gbtemicrobuisnes,
    this.gstrPropertOwnerShip,
    this.gstrCustomerRefNo,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    data['business_Name'] = this.gbusiness_Name ?? "";
    data['business_Type'] = this.gbusiness_Type ?? "";
    data['alternative_Number'] = this.galternative_Number ?? "";
    data['email'] = this.gemail ?? "";
    data['strNameOfBill'] = this.gstrNameOfBill ?? "";
    data['strSupplyName'] = this.gstrSupplyName ?? "";
    data['strCompanyRegNo'] = this.gstrCompanyRegNo ?? "";
    data['strEAMobileNo'] = this.gstrEAMobileNo ?? "";
    data['registeredCompanyName'] = this.gregisteredCompanyName ?? "";
    data['btePaperBill'] = this.gbtePaperBill ?? "";
    data['btemicrobuisnes'] = this.gbtemicrobuisnes ?? "";
    data['strPropertOwnerShip'] = this.gstrPropertOwnerShip ?? "";
    data['strCustomerRefNo'] = this.gstrCustomerRefNo ?? "";
    return data;
  }
}
