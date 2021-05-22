class DownloadAllClass {
  String accountId;
  int displaydaycount;
  int bisCommissionSummary;
  int bisalince;
  int intBrokerCommBillMstId;
  String type;
  String downloadALLFilePath;
  String downloadFileZipname;
  var downloadInvoiceFilePath;
  var downloadCommissionSummaryFilepath;
  bool bteisShowCustomerRefId;
  var strCommissionType;
  var renewalDownloadALLFilePath;
  var renewalDownloadFileZipname;
  var renewalDownloadInvoiceFilePath;
  var fuel;
  var brokerCommissionList;
  var introducerCommissionList;
  var renewalCommissionList;
  var saleCommissionList;
  var statusCommissionReportList;
  var allianceCommissionList;
  var renewalCommissionDetailList;

  DownloadAllClass(
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

  DownloadAllClass.fromJson(Map<String, dynamic> json) {
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
    data['BrokerCommissionList'] = this.brokerCommissionList;
    data['IntroducerCommissionList'] = this.introducerCommissionList;
    data['RenewalCommissionList'] = this.renewalCommissionList;
    data['SaleCommissionList'] = this.saleCommissionList;
    data['StatusCommissionReportList'] = this.statusCommissionReportList;
    data['AllianceCommissionList'] = this.allianceCommissionList;
    data['RenewalCommissionDetailList'] = this.renewalCommissionDetailList;
    return data;
  }
}
