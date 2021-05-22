class AskForRequoteGroupModel {
  String status;
  String msg;
  Null data;
  String error;

  AskForRequoteGroupModel({this.status, this.msg, this.data, this.error});

  AskForRequoteGroupModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    msg = json['msg'];
    data = json['data'];
    error = json['Error'];
  }
}
