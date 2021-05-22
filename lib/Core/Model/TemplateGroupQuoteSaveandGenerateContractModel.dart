class SaveAndGenerateGroup {
  String status;
  String msg;
  String filepath;
  Null data;
  String error;

  SaveAndGenerateGroup({this.status, this.msg, this.filepath, this.data, this.error});

  SaveAndGenerateGroup.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    msg = json['msg'];
    filepath = json['Filepath'];
    data = json['data'];
    error = json['Error'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['msg'] = this.msg;
    data['Filepath'] = this.filepath;
    data['data'] = this.data;
    data['Error'] = this.error;
    return data;
  }
}
