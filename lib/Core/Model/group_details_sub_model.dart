class GroupDetailsSubModel {
  String businessName;
  String mpan;
  String mprn;
  String industryEacAq;
  String currentSupplierName;
  String currentSupplierStartDate;
  String siteAddress;
  String meterType;
  String relatedMeter;
  GroupDetailsSubModel({
    this.businessName,
    this.mpan,
    this.mprn,
    this.industryEacAq,
    this.currentSupplierName,
    this.currentSupplierStartDate,
    this.siteAddress,
    this.meterType,
    this.relatedMeter,
  });
}

class EachyYearList {
  String tremtype;
  String mpan;
  String mprn;
  String baserateday;
  String baseratenight;
  String baserateEwe;
  String baserateSC;
  String contractStartDate;
  String contractEndDate;
  String QuoteId;
  int grpId;
  bool checkItem;

  EachyYearList({
    this.tremtype,
    this.mpan,
    this.mprn,
    this.baserateday,
    this.baseratenight,
    this.baserateEwe,
    this.baserateSC,
    this.contractStartDate,
    this.contractEndDate,
    this.QuoteId,
    this.checkItem,
    this.grpId,
  });
}

class CollectionQuoteIds {
  String QuoteId;

  CollectionQuoteIds({
    this.QuoteId,
});
  CollectionQuoteIds.fromJson(Map<String, dynamic> json) {
    QuoteId = json['QuoteId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['QuoteId'] = this.QuoteId;
    return data;
  }
}
