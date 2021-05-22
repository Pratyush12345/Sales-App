import 'package:pozitive/Core/Model/broker_commission_model.dart';

class BrokerCommissionDetails {
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
  String strCommissionType;
  var renewalDownloadALLFilePath;
  var renewalDownloadFileZipname;
  var renewalDownloadInvoiceFilePath;
  var fuel;
  var brokerCommissionList;
  var introducerCommissionList;
  var renewalCommissionList;
  List<BrokerCommission> saleCommissionList;
  var statusCommissionReportList;
  var allianceCommissionList;
  var renewalCommissionDetailList;

  BrokerCommissionDetails(
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

  BrokerCommissionDetails.fromJson(Map<String, dynamic> json) {
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
    brokerCommissionList = json['BrokerCommissionList'];
    introducerCommissionList = json['IntroducerCommissionList'];
    renewalCommissionList = json['RenewalCommissionList'];
    if (json['SaleCommissionList'] != BrokerCommission) {
      saleCommissionList = new List<BrokerCommission>();
      json['SaleCommissionList'].forEach((v) {
        saleCommissionList.add(new BrokerCommission.fromJson(v));
      });
    }
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
    data['BrokerCommissionList'] = this.brokerCommissionList;
    data['IntroducerCommissionList'] = this.introducerCommissionList;
    data['RenewalCommissionList'] = this.renewalCommissionList;
    if (this.saleCommissionList != null) {
      data['SaleCommissionList'] =
          this.saleCommissionList.map((v) => v.toJson()).toList();
    }
    data['StatusCommissionReportList'] = this.statusCommissionReportList;
    data['AllianceCommissionList'] = this.allianceCommissionList;
    data['RenewalCommissionDetailList'] = this.renewalCommissionDetailList;
    return data;
  }
}