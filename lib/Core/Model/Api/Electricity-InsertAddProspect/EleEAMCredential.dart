class EleEAMCredential {
  String strEAName;
  String strEAEmail;
  String strEAPhoneNo;
  String strEAMobileNo;

  EleEAMCredential({
    this.strEAName,
    this.strEAEmail,
    this.strEAPhoneNo,
    this.strEAMobileNo,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    data['strEAName'] = this.strEAName ?? "";
    data['strEAEmail'] = this.strEAEmail ?? "";
    data['strEAPhoneNo'] = this.strEAPhoneNo ?? "";
    data['strEAMobileNo'] = this.strEAMobileNo ?? "";
    return data;
  }
}
