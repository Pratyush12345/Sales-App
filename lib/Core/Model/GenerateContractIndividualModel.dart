class GenerateContractIndividualModel {
  String status;
  String msg;
  Null data;
  String error;

  GenerateContractIndividualModel({this.status, this.msg, this.data, this.error});

  GenerateContractIndividualModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    msg = json['msg'];
    data = json['data'];
    error = json['Error'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['msg'] = this.msg;
    data['data'] = this.data;
    data['Error'] = this.error;
    return data;
  }
}
