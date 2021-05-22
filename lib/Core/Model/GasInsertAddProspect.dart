class GasInsertAddProspectModel {
  String status;
  String msg;
  String DownloadZipPath;
  var strfileElepath;
  var strfilegaspath;
  var strfileRHTpath;
  var data;
  String error;

  GasInsertAddProspectModel(
      {this.status,
      this.msg,
      this.DownloadZipPath,
      this.strfileElepath,
      this.strfilegaspath,
      this.strfileRHTpath,
      this.data,
      this.error});

  GasInsertAddProspectModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    msg = json['msg'];
    DownloadZipPath = json['DownloadZipPath'];
    strfileElepath = json['strfileElepath'];
    strfilegaspath = json['strfilegaspath'];
    strfileRHTpath = json['strfileRHTpath'];
    data = json['data'];
    error = json['Error'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['msg'] = this.msg;
    data['DownloadZipPath'] = this.DownloadZipPath;
    data['strfileElepath'] = this.strfileElepath;
    data['strfilegaspath'] = this.strfilegaspath;
    data['strfileRHTpath'] = this.strfileRHTpath;
    data['data'] = this.data;
    data['Error'] = this.error;
    return data;
  }
}
