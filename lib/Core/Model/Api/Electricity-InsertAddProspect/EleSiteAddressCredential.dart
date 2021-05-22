class EleSiteAddressCredential {
  String strSiteAddress1;
  String strSiteTown;
  String strSiteAddress2;
  String strSitePostCode;

  EleSiteAddressCredential({
    this.strSiteAddress1,
    this.strSiteTown,
    this.strSiteAddress2,
    this.strSitePostCode,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    data['strSiteAddress1'] = this.strSiteAddress1 ?? "";
    data['strSiteTown'] = this.strSiteTown ?? "";
    data['strSiteAddress2'] = this.strSiteAddress2 ?? "";
    data['strSitePostCode'] = this.strSitePostCode ?? "";
    return data;
  }
}
