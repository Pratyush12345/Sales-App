
class GroupRefreshModel {
  String status;
  String msg;
  Null data;
  String error;


  GroupRefreshModel({this.status, this.msg, this.data, this.error});

  GroupRefreshModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    msg = json['msg'];
    data = json['data'];
    error = json['Error'];
  }

}