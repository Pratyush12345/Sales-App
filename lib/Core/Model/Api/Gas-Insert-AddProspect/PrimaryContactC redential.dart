

class GASPrimaryContactCredential{

  String primaryTitle;
  String primaryFirstName;
  String primaryLastName;
  String primaryPhone;
  String primaryEmail;

  GASPrimaryContactCredential({this.primaryTitle,this.primaryFirstName, this.primaryLastName,this.primaryPhone,this.primaryEmail});

  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = new Map<String, dynamic> ();
    data['primaryTitle'] = this.primaryTitle;
    data['primaryFirstName'] = this.primaryFirstName;
    data['primaryLastName'] = this.primaryLastName;
    data['primaryPhone'] = this.primaryPhone;
    data['primaryEmail'] = this.primaryEmail;


    return data;
  }

}