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
  });
}
