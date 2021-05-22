class BrokerCommission {
  int intBrokerCommBillMstId;
  String invoiceNumber;
  String invoiceDate;
  String decription;
  var commissionExclVat;
  var vAT;
  var commissionIncVat;
  var invoiceTotal;
  var dteCreatedDate;

  BrokerCommission(
      {this.intBrokerCommBillMstId,
        this.invoiceNumber,
        this.invoiceDate,
        this.decription,
        this.commissionExclVat,
        this.vAT,
        this.commissionIncVat,
        this.invoiceTotal,
        this.dteCreatedDate});

  BrokerCommission.fromJson(Map<String, dynamic> json) {
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