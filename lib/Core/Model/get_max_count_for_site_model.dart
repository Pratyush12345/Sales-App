class GetMaxCountForAddSiteModel {
  String status;
  String msg;
  String result;
  String error;

  GetMaxCountForAddSiteModel({this.status, this.msg, this.result, this.error});

  GetMaxCountForAddSiteModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    msg = json['msg'];
    result = json['result'];
    error = json['Error'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['msg'] = this.msg;
    data['result'] = this.result;
    data['Error'] = this.error;
    return data;
  }
}
