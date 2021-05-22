class StatusCommissionReport {
  int iD;
  String mPAN;
  String goLive;
  String contractEndDate;
  String partnerName;
  String businessName;
  int fUEL;
  int intBrokerId;
  String billDate;
  String tempBillDate;
  String paymentDate;
  String commissionDate;
  String status;
  String type;
  int intbrokerbillId;
  String dtecreateddate;
  String strbrokerCustRefid;

  StatusCommissionReport(
      {this.iD,
        this.mPAN,
        this.goLive,
        this.contractEndDate,
        this.partnerName,
        this.businessName,
        this.fUEL,
        this.intBrokerId,
        this.billDate,
        this.tempBillDate,
        this.paymentDate,
        this.commissionDate,
        this.status,
        this.type,
        this.intbrokerbillId,
        this.dtecreateddate,
        this.strbrokerCustRefid});

  StatusCommissionReport.fromJson(Map<String, dynamic> json) {
    iD = json['ID'];
    mPAN = json['MPAN'];
    goLive = json['GoLive'];
    contractEndDate = json['ContractEndDate'];
    partnerName = json['PartnerName'];
    businessName = json['BusinessName'];
    fUEL = json['FUEL'];
    intBrokerId = json['intBrokerId'];
    billDate = json['BillDate'];
    tempBillDate = json['TempBillDate'];
    paymentDate = json['PaymentDate'];
    commissionDate = json['CommissionDate'];
    status = json['Status'];
    type = json['Type'];
    intbrokerbillId = json['intbrokerbillId'];
    dtecreateddate = json['dtecreateddate'];
    strbrokerCustRefid = json['strbrokerCustRefid'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ID'] = this.iD;
    data['MPAN'] = this.mPAN;
    data['GoLive'] = this.goLive;
    data['ContractEndDate'] = this.contractEndDate;
    data['PartnerName'] = this.partnerName;
    data['BusinessName'] = this.businessName;
    data['FUEL'] = this.fUEL;
    data['intBrokerId'] = this.intBrokerId;
    data['BillDate'] = this.billDate;
    data['TempBillDate'] = this.tempBillDate;
    data['PaymentDate'] = this.paymentDate;
    data['CommissionDate'] = this.commissionDate;
    data['Status'] = this.status;
    data['Type'] = this.type;
    data['intbrokerbillId'] = this.intbrokerbillId;
    data['dtecreateddate'] = this.dtecreateddate;
    data['strbrokerCustRefid'] = this.strbrokerCustRefid;
    return data;
  }
}