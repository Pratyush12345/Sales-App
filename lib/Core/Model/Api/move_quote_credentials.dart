
class MoveQuoteCredentials{
  String accountID;
  String quoteID;
  String liveDate;

  MoveQuoteCredentials({this.accountID,this.quoteID,this.liveDate});
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['AccountId'] = this.accountID;
    data['QuoteId']=this.quoteID;
    data['LiveDate']=this.liveDate;
    return data;
  }
}