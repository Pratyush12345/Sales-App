import 'broker_commission_model.dart';

class CommissionStatementDetails {
  String accountId;
  int displaydaycount;
  int bisCommissionSummary;
  int bisalince;
  int intBrokerCommBillMstId;
  var type;
  var downloadALLFilePath;
  var downloadFileZipname;
  var downloadInvoiceFilePath;
  var downloadCommissionSummaryFilepath;
  bool bteisShowCustomerRefId;
  var strCommissionType;
  var renewalDownloadALLFilePath;
  var renewalDownloadFileZipname;
  var renewalDownloadInvoiceFilePath;
  var fuel;
  List<BrokerCommission> brokerCommissionList;
  List<Null> introducerCommissionList;
  List<RenewalCommissionList> renewalCommissionList;
  var saleCommissionList;
  var statusCommissionReportList;
  var allianceCommissionList;
  var renewalCommissionDetailList;

  CommissionStatementDetails(
      {this.accountId,
        this.displaydaycount,
        this.bisCommissionSummary,
        this.bisalince,
        this.intBrokerCommBillMstId,
        this.type,
        this.downloadALLFilePath,
        this.downloadFileZipname,
        this.downloadInvoiceFilePath,
        this.downloadCommissionSummaryFilepath,
        this.bteisShowCustomerRefId,
        this.strCommissionType,
        this.renewalDownloadALLFilePath,
        this.renewalDownloadFileZipname,
        this.renewalDownloadInvoiceFilePath,
        this.fuel,
        this.brokerCommissionList,
        this.introducerCommissionList,
        this.renewalCommissionList,
        this.saleCommissionList,
        this.statusCommissionReportList,
        this.allianceCommissionList,
        this.renewalCommissionDetailList});

  CommissionStatementDetails.fromJson(Map<String, dynamic> json) {
    accountId = json['AccountId'];
    displaydaycount = json['displaydaycount'];
    bisCommissionSummary = json['bisCommissionSummary'];
    bisalince = json['bisalince'];
    intBrokerCommBillMstId = json['intBrokerCommBillMstId'];
    type = json['type'];
    downloadALLFilePath = json['DownloadALLFilePath'];
    downloadFileZipname = json['DownloadFileZipname'];
    downloadInvoiceFilePath = json['DownloadInvoiceFilePath'];
    downloadCommissionSummaryFilepath =
    json['DownloadCommissionSummaryFilepath'];
    bteisShowCustomerRefId = json['bteisShowCustomerRefId'];
    strCommissionType = json['strCommissionType'];
    renewalDownloadALLFilePath = json['RenewalDownloadALLFilePath'];
    renewalDownloadFileZipname = json['RenewalDownloadFileZipname'];
    renewalDownloadInvoiceFilePath = json['RenewalDownloadInvoiceFilePath'];
    fuel = json['fuel'];
    if (json['BrokerCommissionList'] != null) {
      brokerCommissionList = new List<BrokerCommission>();
      json['BrokerCommissionList'].forEach((v) {
        brokerCommissionList.add(new BrokerCommission.fromJson(v));
      });
    }
    if (json['IntroducerCommissionList'] != null) {
//      introducerCommissionList = new List<Null>();
//      json['IntroducerCommissionList'].forEach((v) {
//        introducerCommissionList.add(new Null.fromJson(v));
//      });
    }
    if (json['RenewalCommissionList'] != null) {
      renewalCommissionList = new List<RenewalCommissionList>();
      json['RenewalCommissionList'].forEach((v) {
        renewalCommissionList.add(new RenewalCommissionList.fromJson(v));
      });
    }
    saleCommissionList = json['SaleCommissionList'];
    statusCommissionReportList = json['StatusCommissionReportList'];
    allianceCommissionList = json['AllianceCommissionList'];
    renewalCommissionDetailList = json['RenewalCommissionDetailList'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['AccountId'] = this.accountId;
    data['displaydaycount'] = this.displaydaycount;
    data['bisCommissionSummary'] = this.bisCommissionSummary;
    data['bisalince'] = this.bisalince;
    data['intBrokerCommBillMstId'] = this.intBrokerCommBillMstId;
    data['type'] = this.type;
    data['DownloadALLFilePath'] = this.downloadALLFilePath;
    data['DownloadFileZipname'] = this.downloadFileZipname;
    data['DownloadInvoiceFilePath'] = this.downloadInvoiceFilePath;
    data['DownloadCommissionSummaryFilepath'] =
        this.downloadCommissionSummaryFilepath;
    data['bteisShowCustomerRefId'] = this.bteisShowCustomerRefId;
    data['strCommissionType'] = this.strCommissionType;
    data['RenewalDownloadALLFilePath'] = this.renewalDownloadALLFilePath;
    data['RenewalDownloadFileZipname'] = this.renewalDownloadFileZipname;
    data['RenewalDownloadInvoiceFilePath'] =
        this.renewalDownloadInvoiceFilePath;
    data['fuel'] = this.fuel;
    if (this.brokerCommissionList != null) {
      data['BrokerCommissionList'] =
          this.brokerCommissionList.map((v) => v.toJson()).toList();
    }
    if (this.introducerCommissionList != null) {
//      data['IntroducerCommissionList'] =
//          this.introducerCommissionList.map((v) => v.toJson()).toList();
    }
    if (this.renewalCommissionList != null) {
      data['RenewalCommissionList'] =
          this.renewalCommissionList.map((v) => v.toJson()).toList();
    }
    data['SaleCommissionList'] = this.saleCommissionList;
    data['StatusCommissionReportList'] = this.statusCommissionReportList;
    data['AllianceCommissionList'] = this.allianceCommissionList;
    data['RenewalCommissionDetailList'] = this.renewalCommissionDetailList;
    return data;
  }
}

class BrokerCommissionList {
  int intBrokerCommBillMstId;
  String invoiceNumber;
  String invoiceDate;
  String decription;
  int commissionExclVat;
  int vAT;
  int commissionIncVat;
  int invoiceTotal;
  Null dteCreatedDate;

  BrokerCommissionList(
      {this.intBrokerCommBillMstId,
        this.invoiceNumber,
        this.invoiceDate,
        this.decription,
        this.commissionExclVat,
        this.vAT,
        this.commissionIncVat,
        this.invoiceTotal,
        this.dteCreatedDate});

  BrokerCommissionList.fromJson(Map<String, dynamic> json) {
    intBrokerCommBillMstId = json['intBrokerCommBillMstId'];
    invoiceNumber = json['InvoiceNumber'];
    invoiceDate = json['InvoiceDate'];
    decription = json['Decription'];
    commissionExclVat = json['CommissionExclVat'];
    vAT = json['VAT'];
    commissionIncVat = json['CommissionIncVat'];
    invoiceTotal = json['InvoiceTotal'];
    dteCreatedDate = json['dteCreatedDate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['intBrokerCommBillMstId'] = this.intBrokerCommBillMstId;
    data['InvoiceNumber'] = this.invoiceNumber;
    data['InvoiceDate'] = this.invoiceDate;
    data['Decription'] = this.decription;
    data['CommissionExclVat'] = this.commissionExclVat;
    data['VAT'] = this.vAT;
    data['CommissionIncVat'] = this.commissionIncVat;
    data['InvoiceTotal'] = this.invoiceTotal;
    data['dteCreatedDate'] = this.dteCreatedDate;
    return data;
  }
}

class RenewalCommissionList {
  int intBrokerCommBillMstId;
  String invoiceNumber;
  String invoiceDate;
  String decription;
  var commissionExclVat;
  var vAT;
  var commissionIncVat;
  var invoiceTotal;

  RenewalCommissionList(
      {this.intBrokerCommBillMstId,
        this.invoiceNumber,
        this.invoiceDate,
        this.decription,
        this.commissionExclVat,
        this.vAT,
        this.commissionIncVat,
        this.invoiceTotal});

  RenewalCommissionList.fromJson(Map<String, dynamic> json) {
    intBrokerCommBillMstId = json['intBrokerCommBillMstId'];
    invoiceNumber = json['InvoiceNumber'];
    invoiceDate = json['InvoiceDate'];
    decription = json['Decription'];
    commissionExclVat = json['CommissionExclVat'];
    vAT = json['VAT'];
    commissionIncVat = json['CommissionIncVat'];
    invoiceTotal = json['InvoiceTotal'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['intBrokerCommBillMstId'] = this.intBrokerCommBillMstId;
    data['InvoiceNumber'] = this.invoiceNumber;
    data['InvoiceDate'] = this.invoiceDate;
    data['Decription'] = this.decription;
    data['CommissionExclVat'] = this.commissionExclVat;
    data['VAT'] = this.vAT;
    data['CommissionIncVat'] = this.commissionIncVat;
    data['InvoiceTotal'] = this.invoiceTotal;
    return data;
  }
}