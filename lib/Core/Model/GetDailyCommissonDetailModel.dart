class GetDailyCommissonModel {
  String status;
  String msg;
  LstGetDailycommission data;
  String error;

  GetDailyCommissonModel({this.status, this.msg, this.data, this.error});

  GetDailyCommissonModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    msg = json['msg'];
    data = json['data'] != null ? new LstGetDailycommission.fromJson(json['data']) : null;
    error = json['Error'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['msg'] = this.msg;
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    data['Error'] = this.error;
    return data;
  }
}

class LstGetDailycommission {
  String accountId;
  String weeklyCommissionBroker;
  var totalKWH;
  var undergoingRegistration;
  var fromDate;
  var toDate;
  bool currentweekmonthflag;
  var fueltype;
  var commissiontype;
  List brokerCommissionList;

  LstGetDailycommission(
      {this.accountId,
        this.weeklyCommissionBroker,
        this.totalKWH,
        this.undergoingRegistration,
        this.fromDate,
        this.toDate,
        this.currentweekmonthflag,
        this.fueltype,
        this.commissiontype,
        this.brokerCommissionList});

  LstGetDailycommission.fromJson(Map<String, dynamic> json) {
    accountId = json['AccountId'];
    weeklyCommissionBroker = json['WeeklyCommissionBroker']??'';
    totalKWH = json['TotalKWH'];
    undergoingRegistration = json['UndergoingRegistration']??'';
    fromDate = json['FromDate']??'';
    toDate = json['ToDate']??'';
    currentweekmonthflag = json['currentweekmonthflag'];
    fueltype = json['Fueltype']??'';
    commissiontype = json['Commissiontype']??'';
    brokerCommissionList = json['BrokerCommissionList']??[];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['AccountId'] = this.accountId;
    data['WeeklyCommissionBroker'] = this.weeklyCommissionBroker;
    data['TotalKWH'] = this.totalKWH;
    data['UndergoingRegistration'] = this.undergoingRegistration;
    data['FromDate'] = this.fromDate;
    data['ToDate'] = this.toDate;
    data['currentweekmonthflag'] = this.currentweekmonthflag;
    data['Fueltype'] = this.fueltype;
    data['Commissiontype'] = this.commissiontype;
    data['BrokerCommissionList'] = this.brokerCommissionList;
    return data;
  }
}
