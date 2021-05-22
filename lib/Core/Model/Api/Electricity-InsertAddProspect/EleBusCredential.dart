class EleBusCredential {
  String business_Name;
  String business_Type;
  String alternative_Number;
  String email;
  String strNameOfBill;
  String strSupplyName;
  String strCompanyRegNo;
  String strEAMobileNo;
  String registeredCompanyName;
  String btePaperBill;
  String btemicrobuisnes;
  String strPropertOwnerShip;
  String strCustomerRefNo;

  EleBusCredential({
    this.business_Name,
    this.business_Type,
    this.alternative_Number,
    this.email,
    this.strNameOfBill,
    this.strSupplyName,
    this.strCompanyRegNo,
    this.strEAMobileNo,
    this.registeredCompanyName,
    this.btePaperBill,
    this.btemicrobuisnes,
    this.strPropertOwnerShip,
    this.strCustomerRefNo,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    data['business_Name'] = this.business_Name ?? "";
    data['business_Type'] = this.business_Type ?? "";
    data['alternative_Number'] = this.alternative_Number ?? "";
    data['email'] = this.email ?? "";
    data['strNameOfBill'] = this.strNameOfBill ?? "";
    data['strSupplyName'] = this.strSupplyName ?? "";
    data['strCompanyRegNo'] = this.strCompanyRegNo ?? "";
    data['strEAMobileNo'] = this.strEAMobileNo ?? "";
    data['registeredCompanyName'] = this.registeredCompanyName ?? "";
    data['btePaperBill'] = this.btePaperBill ?? "";
    data['btemicrobuisnes'] = this.btemicrobuisnes ?? "";
    data['strPropertOwnerShip'] = this.strPropertOwnerShip ?? "";
    data['strCustomerRefNo'] = this.strCustomerRefNo ?? "";
    return data;
  }
}
