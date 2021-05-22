class GetCompanyRegNoModel {
  List<CompanyRegNoData> companyList;
  GetCompanyRegNoModel({this.companyList});

  GetCompanyRegNoModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      companyList = new List<CompanyRegNoData>();
      json['data'].forEach((v) {
        companyList.add(new CompanyRegNoData.fromJson(v));
      });
    } else {
      companyList = [];
    }
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.companyList != null) {
      data['data'] = this.companyList.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class CompanyRegNoData {
  String companyName;
  String companyRegNo;
  String companyType;

  CompanyRegNoData({this.companyName, this.companyRegNo, this.companyType});

  CompanyRegNoData.fromJson(Map<String, dynamic> json) {
    companyName = json['strCompanyName'];
    companyRegNo = json['strCompanyRegNumber'];
    companyType = json['strCompanyType'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['strCompanyName'] = this.companyName;
    data['strCompanyRegNumber'] = this.companyRegNo;
    data['strCompanyType'] = this.companyType;
    return data;
  }
}
