class CompanyNameGroupAddQuoteModel {
  bool selected;
  String text;
  String value;

  CompanyNameGroupAddQuoteModel({this.selected, this.text, this.value});

  CompanyNameGroupAddQuoteModel.fromJson(Map<String, dynamic> json) {
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
