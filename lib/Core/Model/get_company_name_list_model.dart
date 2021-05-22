class CompanyListModel {
  List<CompanyListData> companyList;
  CompanyListModel({this.companyList});

  CompanyListModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      companyList = new List<CompanyListData>();
      json['data'].forEach((v) {
        companyList.add(new CompanyListData.fromJson(v));
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

class CompanyListData {
  bool selected;
  String text;
  String value;

  CompanyListData({this.selected, this.text, this.value});

  CompanyListData.fromJson(Map<String, dynamic> json) {
    selected = json['Selected'];
    text = json['Text'];
    value = json['Value'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Selected'] = this.selected;
    data['Text'] = this.text;
    data['Value'] = this.value;
    return data;
  }
}
