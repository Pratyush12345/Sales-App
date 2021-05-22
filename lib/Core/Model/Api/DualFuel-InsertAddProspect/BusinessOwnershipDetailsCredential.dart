


class OtherBusinessCredential {

  String strTitleOtherowner1;
  String strOtherowner1FirstName;
  String strOtherowner1LastName;
  String strTitleOtherowner2 ;
  String strOtherowner2FirstName;
  String strOtherowner2LastName;


  OtherBusinessCredential({
    this.strTitleOtherowner1,
    this.strOtherowner1FirstName,
    this.strOtherowner1LastName,
    this.strTitleOtherowner2,
    this.strOtherowner2FirstName,
    this.strOtherowner2LastName,

  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    data['strTitleOtherowner1'] = this.strTitleOtherowner1 ?? "";
    data['strOtherowner1FirstName'] = this.strOtherowner1FirstName ?? "";
    data['strOtherowner1LastName'] = this.strOtherowner1LastName ?? "";
    data['strTitleOtherowner2'] = this.strTitleOtherowner2 ?? "";
    data['strOtherowner2FirstName'] = this.strOtherowner2FirstName ?? "";
    data['strOtherowner2LastName'] = this.strOtherowner2LastName ?? "";

    return data;
  }
}


///already used credentials
class LtdBusinessCredential {

  String strTitleDirector1;
  String strDirector1Firstname;
  String strDirector1Lastname;
  String strTitleDirector2;
  String strDirector2Firstname;
  String strDirector2Lastname;

  LtdBusinessCredential({
    this.strTitleDirector1,
    this.strDirector1Firstname,
    this.strDirector1Lastname,
    this.strTitleDirector2,
    this.strDirector2Firstname,
    this.strDirector2Lastname,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    data['strTitleDirector1'] = this.strTitleDirector1 ?? "";
    data['strDirector1Firstname'] = this.strDirector1Firstname ?? "";
    data['strDirector1Lastname'] = this.strDirector1Lastname ?? "";
    data['strTitleDirector2'] = this.strTitleDirector2 ?? "";
    data['strDirector2Firstname'] = this.strDirector2Firstname ?? "";
    data['strDirector2Lastname'] = this.strDirector2Lastname ?? "";


    return data;
  }
}

class CharityBusinessCredential {

  String strTitlecharityowner1;
  String strcharityowner1firstname;
  String strcharityowner1lastname;
  String strTitlecharityowner2;
  String strcharityowner2firstname;
  String strcharityowner2lastname;
  String strchariryRegisterNo;

  CharityBusinessCredential({
    this.strTitlecharityowner1,
    this.strcharityowner1firstname,
    this.strcharityowner1lastname,
    this.strTitlecharityowner2,
    this.strcharityowner2firstname,
    this.strcharityowner2lastname,
    this.strchariryRegisterNo,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    data['strTitlecharityowner1'] = this.strTitlecharityowner1 ?? "";
    data['strcharityowner1firstname'] = this.strcharityowner1firstname ?? "";
    data['strcharityowner1lastname'] = this.strcharityowner1lastname ?? "";
    data['strTitlecharityowner2'] = this.strTitlecharityowner2 ?? "";
    data['strcharityowner2firstname'] = this.strcharityowner2firstname ?? "";
    data['strcharityowner2lastname'] = this.strcharityowner2lastname ?? "";
    data['strchariryRegisterNo'] = this.strchariryRegisterNo ?? "";


    return data;
  }
}

class LLPBusinessCredential {

  String strTitleLLPowner1;
  String strLLPowner1FirstName;
  String strLLPowner1LastName;
  String strTitleLLPowner2;
  String strLLPowner2FirstName;
  String strLLPowner2LastName;

  LLPBusinessCredential({
    this.strTitleLLPowner1,
    this.strLLPowner1FirstName,
    this.strLLPowner1LastName,
    this.strTitleLLPowner2,
    this.strLLPowner2FirstName,
    this.strLLPowner2LastName,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    data['strTitleLLPowner1'] = this.strTitleLLPowner1 ?? "";
    data['strLLPowner1FirstName'] = this.strLLPowner1FirstName ?? "";
    data['strLLPowner1LastName'] = this.strLLPowner1LastName ?? "";
    data['strTitleLLPowner2'] = this.strTitleLLPowner2 ?? "";
    data['strLLPowner2FirstName'] = this.strLLPowner2FirstName ?? "";
    data['strLLPowner2LastName'] = this.strLLPowner2LastName ?? "";

    return data;
  }
}

class LLCBusinessCredential {

  String strTitleLLcowner1;
  String strLLcowner1FirstName;
  String strLLcowner1LastName;
  String strTitleLLcowner2;
  String strLLcowner2FirstName;
  String strLLcowner2LastName;

  LLCBusinessCredential({
    this.strTitleLLcowner1,
    this.strLLcowner1FirstName,
    this.strLLcowner1LastName,
    this.strTitleLLcowner2,
    this.strLLcowner2FirstName,
    this.strLLcowner2LastName,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    data['strTitleLLcowner1'] = this.strTitleLLcowner1 ?? "";
    data['strLLcowner1FirstName'] = this.strLLcowner1FirstName ?? "";
    data['strLLcowner1LastName'] = this.strLLcowner1LastName ?? "";
    data['strTitleLLcowner2'] = this.strTitleLLcowner2 ?? "";
    data['strLLcowner2FirstName'] = this.strLLcowner2FirstName ?? "";
    data['strLLcowner2LastName'] = this.strLLcowner2LastName ?? "";

    return data;
  }
}

class SoleBusinessCredential {

  String strTitleQwner1;
  String firstName;
  String lastName;
  String strTitleDirector2;
  String strDirector2Firstname;
  String strDirector2Lastname;
  String strDobOwner1;
  String home_Address;
  String home_Address2;
  String strHomeAdressPostCode;
  String strHomeAdressCity;
  String strHomeaddressLiveYear;
  String strHomeaddressLiveMonth;
  String strHomeaddress1;
  String strHomeaddress2;
  String strHomeaddressCity1;
  String strHomeaddressPostCode1;
  String strHomeaddressLiveYear1;
  String strHomeaddressLiveMonth1;
  String strHomeaddress3;
  String strHomeaddress4;
  String strHomeaddressCity2;
  String strHomeaddressPostCode2;
  String strHomeaddressPostLiveYear2;
  String strHomeaddressPostLiveMonth2;
  String strHomeaddress5;
  String strHomeaddress6;
  String strHomeaddressCity3;
  String strHomeaddressPostCode3;
  String strHomeaddressLiveYear3;
  String strHomeaddressLivemonth3;
  String strHomeaddress7;
  String strHomeaddress8;
  String strHomeaddressCity4;
  String strHomeaddressPostCode4;
  String strHomeaddressLiveYear4;
  String strHomeaddressLiveMonth4;
  String strHomeaddress9;
  String strHomeaddress10;
  String strHomeaddressCity5;
  String strHomeaddressPostCode5;
  String strHomeaddressLiveYear5;
  String strHomeaddressLiveMonth5owner;




  SoleBusinessCredential({

    this.strTitleQwner1,
    this.firstName,
    this.lastName,
    this.strTitleDirector2,
    this.strDirector2Firstname,
    this.strDirector2Lastname,
    this.strDobOwner1,
    this.home_Address,
    this.home_Address2,
    this.strHomeAdressPostCode,
    this.strHomeAdressCity,
    this.strHomeaddressLiveYear,
    this.strHomeaddressLiveMonth,
    this.strHomeaddress1,
    this.strHomeaddress2,
    this.strHomeaddressCity1,
    this.strHomeaddressPostCode1,
    this.strHomeaddressLiveYear1,
    this.strHomeaddressLiveMonth1,
    this.strHomeaddress3,
    this.strHomeaddress4,
    this.strHomeaddressCity2,
    this.strHomeaddressPostCode2,
    this.strHomeaddressPostLiveYear2,
    this.strHomeaddressPostLiveMonth2,
    this.strHomeaddress5,
    this.strHomeaddress6,
    this.strHomeaddressCity3,
    this.strHomeaddressPostCode3,
    this.strHomeaddressLiveYear3,
    this.strHomeaddressLivemonth3,
    this.strHomeaddress7,
    this.strHomeaddress8,
    this.strHomeaddressCity4,
    this.strHomeaddressPostCode4,
    this.strHomeaddressLiveYear4,
    this.strHomeaddressLiveMonth4,
    this.strHomeaddress9,
    this.strHomeaddress10,
    this.strHomeaddressCity5,
    this.strHomeaddressPostCode5,
    this.strHomeaddressLiveYear5,
    this.strHomeaddressLiveMonth5owner,


  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    data['strTitleQwner1'] = this.strTitleQwner1 ?? "";
    data['firstName'] = this.firstName ?? "";
    data['lastName'] = this.lastName ?? "";
    data['strTitleDirector2'] = this.strTitleDirector2 ?? "";
    data['strDirector2Firstname'] = this.strDirector2Firstname ?? "";
    data['strDirector2Lastname'] = this.strDirector2Lastname ?? "";
    data['strDobOwner1'] = this.strDobOwner1 ?? "";
    data['home_Address'] = this.home_Address ?? "";
    data['home_Address2'] = this.home_Address2 ?? "";
    data['strHomeAdressPostCode'] = this.strHomeAdressPostCode ?? "";
    data['strHomeAdressCity'] = this.strHomeAdressCity ?? "";
    data['strHomeaddressLiveYear'] = this.strHomeaddressLiveYear ?? "";
    data['strHomeaddressLiveMonth'] = this.strHomeaddressLiveMonth ?? "";
    data['strHomeaddress1'] = this.strHomeaddress1 ?? "";
    data['strHomeaddress2'] = this.strHomeaddress2 ?? "";
    data['strHomeaddressCity1'] = this.strHomeaddressCity1 ?? "";
    data['strHomeaddressPostCode1'] = this.strHomeaddressPostCode1 ?? "";
    data['strHomeaddressLiveYear1'] = this.strHomeaddressLiveYear1 ?? "";
    data['strHomeaddressLiveMonth1'] = this.strHomeaddressLiveMonth1 ?? "";
    data['strHomeaddress3'] = this.strHomeaddress3 ?? "";
    data['strHomeaddress4'] = this.strHomeaddress4 ?? "";
    data['strHomeaddressCity2'] = this.strHomeaddressCity2 ?? "";
    data['strHomeaddressPostCode2'] = this.strHomeaddressPostCode2 ?? "";
    data['strHomeaddressPostLiveYear2'] = this.strHomeaddressPostLiveYear2 ?? "";
    data['strHomeaddressPostLiveMonth2'] = this.strHomeaddressPostLiveMonth2 ?? "";
    data['strHomeaddress5'] = this.strHomeaddress5 ?? "";
    data['strHomeaddress6'] = this.strHomeaddress6 ?? "";
    data['strHomeaddressCity3'] = this.strHomeaddressCity3 ?? "";
    data['strHomeaddressPostCode3'] = this.strHomeaddressPostCode3 ?? "";
    data['strHomeaddressLiveYear3'] = this.strHomeaddressLiveYear3 ?? "";
    data['strHomeaddressLivemonth3'] = this.strHomeaddressLivemonth3 ?? "";
    data['strHomeaddress7'] = this.strHomeaddress7 ?? "";
    data['strHomeaddress8'] = this.strHomeaddress8 ?? "";
    data['strHomeaddressCity4'] = this.strHomeaddressCity4 ?? "";
    data['strHomeaddressPostCode4'] = this.strHomeaddressPostCode4 ?? "";
    data['strHomeaddressLiveYear4'] = this.strHomeaddressLiveYear4 ?? "";
    data['strHomeaddressLiveMonth4'] = this.strHomeaddressLiveMonth4 ?? "";
    data['strHomeaddress9'] = this.strHomeaddress9 ?? "";
    data['strHomeaddress10'] = this.strHomeaddress10 ?? "";
    data['strHomeaddressCity5'] = this.strHomeaddressCity5 ?? "";
    data['strHomeaddressPostCode5'] = this.strHomeaddressPostCode5 ?? "";
    data['strHomeaddressLiveYear5'] = this.strHomeaddressLiveYear5 ?? "";
    data['strHomeaddressLiveMonth5owner'] = this.strHomeaddressLiveMonth5owner ?? "";



    return data;
  }
}

class PartnerShipBusinessCredential {

  String dfstrTitleQwner1;
  String dffirstName;
  String dflastName;
  String dfstrTitleDirector2;
  String dfstrDirector2Firstname;
  String dfstrDirector2Lastname;
  String dfstrDobOwner1;
  String dfhome_Address;
  String dfhome_Address2;
  String dfstrHomeAdressPostCode;
  String dfstrHomeAdressCity;
  String dfstrHomeaddressLiveYear;
  String dfstrHomeaddressLiveMonth;
  String dfstrHomeaddress1;
  String dfstrHomeaddress2;
  String dfstrHomeaddressCity1;
  String dfstrHomeaddressPostCode1;
  String dfstrHomeaddressLiveYear1;
  String dfstrHomeaddressLiveMonth1;
  String dfstrHomeaddress3;
  String dfstrHomeaddress4;
  String dfstrHomeaddressCity2;
  String dfstrHomeaddressPostCode2;
  String dfstrHomeaddressPostLiveYear2;
  String dfstrHomeaddressPostLiveMonth2;
  String dfstrHomeaddress5;
  String dfstrHomeaddress6;
  String dfstrHomeaddressCity3;
  String dfstrHomeaddressPostCode3;
  String dfstrHomeaddressLiveYear3;
  String dfstrHomeaddressLivemonth3;
  String dfstrHomeaddress7;
  String dfstrHomeaddress8;
  String dfstrHomeaddressCity4;
  String dfstrHomeaddressPostCode4;
  String dfstrHomeaddressLiveYear4;
  String dfstrHomeaddressLiveMonth4;
  String dfstrHomeaddress9;
  String dfstrHomeaddress10;
  String dfstrHomeaddressCity5;
  String dfstrHomeaddressPostCode5;
  String dfstrHomeaddressLiveYear5;
  String dfstrTitleQwner2;
  String dfstrFirstNameowner;
  String dfstrLastNameowner;
  String dfstrDobOwner2;
  String dfhome_Addressowner;
  String dfhome_Address2owner;
  String dfstrHomeAdressPostCodeowner;
  String dfstrHomeAdressCityowner;
  String dfstrHomeaddressLiveYearowner;
  String dfstrHomeaddressLiveMonthowner;
  String dfstrHomeaddress1owner;
  String dfstrHomeaddress2owner;
  String dfstrHomeaddressCity1owner;
  String dfstrHomeaddressPostCode1owner;
  String dfstrHomeaddressLiveYear1owner;
  String dfstrHomeaddressLiveMonth1owner;
  String dfstrHomeaddress3owner;
  String dfstrHomeaddress4owner;
  String dfstrHomeaddressCity2owner;
  String dfstrHomeaddressPostCode2owner;
  String dfstrHomeaddressPostLiveYear2owner;
  String dfstrHomeaddressPostLiveMonth2owner;
  String dfstrHomeaddress5owner;
  String dfstrHomeaddress6owner;
  String dfstrHomeaddressCity3owner;
  String dfstrHomeaddressPostCode3owner;
  String dfstrHomeaddressLiveYear3owner;
  String dfstrHomeaddressLivemonth3owner;
  String dfstrHomeaddress7owner;
  String dfstrHomeaddress8owner;
  String dfstrHomeaddressCity4owner;
  String dfstrHomeaddressPostCode4owner;
  String dfstrHomeaddressLiveYear4owner;
  String dfstrHomeaddressLiveMonth4owner;
  String dfstrHomeaddress9owner;
  String dfstrHomeaddress10owner;
  String dfstrHomeaddressCity5owner;
  String dfstrHomeaddressPostCode5owner;
  String dfstrHomeaddressLiveYear5owner;
  String dfstrHomeaddressLiveMonth5owner;
  String dfstrTitleQwner3;
  String dfstrFirstNameowner3;
  String dfstrLastNameowner3;
  String dfstrstrDobOwner3;
  String dfhome_Addressowner3;
  String dfhome_Address2owner3;
  String dfstrHomeAdressCityowner3;
  String dfstrHomeAdressPostCodeowner3;
  String dfstrHomeaddressLiveYearowner3;
  String dfstrHomeaddressLiveMonthowner3;
  String dfstrHomeaddress1owner3;
  String dfstrHomeaddress2owner3;
  String dfstrHomeaddressCity1owner3;
  String dfstrHomeaddressPostCode1owner3;
  String dfstrHomeaddressLiveYear1owner3;
  String dfstrHomeaddressLiveMonth1owner3;
  String dfstrHomeaddress3owner3;
  String dfstrHomeaddress4owner3;
  String dfstrHomeaddressCity2owner3;
  String dfstrHomeaddressPostCode2owner3;
  String dfstrHomeaddressPostLiveYear2owner3;
  String dfstrHomeaddressPostLiveMonth2owner3;
  String dfstrHomeaddress5owner3;
  String dfstrHomeaddress6owner3;
  String dfstrHomeaddressCity3owner3;
  String dfstrHomeaddressPostCode3owner3;
  String dfstrHomeaddressLiveYear3owner3;
  String dfstrHomeaddressLivemonth3owner3;
  String dfstrHomeaddress7owner3;
  String dfstrHomeaddress8owner3;
  String dfstrHomeaddressCity4owner3;
  String dfstrHomeaddressPostCode4owner3;
  String dfstrHomeaddressLiveYear4owner3;
  String dfstrHomeaddressLiveMonth4owner3;
  String dfstrHomeaddress9owner3;
  String dfstrHomeaddress10owner3;
  String dfstrHomeaddressCity5owner3;
  String dfstrHomeaddressPostCode5owner3;
  String dfstrHomeaddressLiveYear5owner3;
  String dfstrHomeaddressLiveMonth5owner3;
  String dfstrTitleQwner4;
  String dfstrFirstNameowner4;
  String dfstrLastNameowner4;
  String dfstrstrDobOwner4;
  String dfhome_Addressowner4;
  String dfhome_Address2owner4;
  String dfstrHomeAdressCityowner4;
  String dfstrHomeAdressPostCodeowner4;
  String dfstrHomeaddressLiveYearowner4;
  String dfstrHomeaddressLiveMonthowner4;
  String dfstrHomeaddress1owner4;
  String dfstrHomeaddress2owner4;
  String dfstrHomeaddressCity1owner4;
  String dfstrHomeaddressPostCode1owner4;
  String dfstrHomeaddressLiveYear1owner4;
  String dfstrHomeaddressLiveMonth1owner4;
  String dfstrHomeaddress3owner4;
  String dfstrHomeaddress4owner4;
  String dfstrHomeaddressCity2owner4;
  String dfstrHomeaddressPostCode2owner4;
  String dfstrHomeaddressPostLiveYear2owner4;
  String dfstrHomeaddressPostLiveMonth2owner4;
  String dfstrHomeaddress5owner4;
  String dfstrHomeaddress6owner4;
  String dfstrHomeaddressCity3owner4;
  String dfstrHomeaddressPostCode3owner4;
  String dfstrHomeaddressLiveYear3owner4;
  String dfstrHomeaddressLivemonth3owner4;
  String dfstrHomeaddress7owner4;
  String dfstrHomeaddress8owner4;
  String dfstrHomeaddressCity4owner4;
  String dfstrHomeaddressPostCode4owner4;
  String dfstrHomeaddressLiveYear4owner4;
  String dfstrHomeaddressLiveMonth4owner4;
  String dfstrHomeaddress9owner4;
  String dfstrHomeaddress10owner4;
  String dfstrHomeaddressCity5owner4;
  String dfstrHomeaddressPostCode5owner4;
  String dfstrHomeaddressLiveYear5owner4;
  String dfstrHomeaddressLiveMonth5owner4;
  String dfstrTitleQwner5;
  String dfstrFirstNameowner5;
  String dfstrLastNameowner5;
  String dfstrstrDobOwner5;
  String dfhome_Addressowner5;
  String dfhome_Address2owner5;
  String dfstrHomeAdressCityowner5;
  String dfstrHomeAdressPostCodeowner5;
  String dfstrHomeaddressLiveYearowner5;
  String dfstrHomeaddressLiveMonthowner5;
  String dfstrHomeaddress1owner5;
  String dfstrHomeaddress2owner5;
  String dfstrHomeaddressCity1owner5;
  String dfstrHomeaddressPostCode1owner5;
  String dfstrHomeaddressLiveYear1owner5;
  String dfstrHomeaddressLiveMonth1owner5;
  String dfstrHomeaddress3owner5;
  String dfstrHomeaddress4owner5;
  String dfstrHomeaddressCity2owner5;
  String dfstrHomeaddressPostCode2owner5;
  String dfstrHomeaddressPostLiveYear2owner5;
  String dfstrHomeaddressPostLiveMonth2owner5;
  String dfstrHomeaddress5owner5;
  String dfstrHomeaddress6owner5;
  String dfstrHomeaddressCity3owner5;
  String dfstrHomeaddressPostCode3owner5;
  String dfstrHomeaddressLiveYear3owner5;
  String dfstrHomeaddressLivemonth3owner5;
  String dfstrHomeaddress7owner5;
  String dfstrHomeaddress8owner5;
  String dfstrHomeaddressCity4owner5;
  String dfstrHomeaddressPostCode4owner5;
  String dfstrHomeaddressLiveYear4owner5;
  String dfstrHomeaddressLiveMonth4owner5;
  String dfstrHomeaddress9owner5;
  String dfstrHomeaddress10owner5;
  String dfstrHomeaddressCity5owner5;
  String dfstrHomeaddressPostCode5owner5;
  String dfstrHomeaddressLiveYear5owner5;
  String dfstrHomeaddressLiveMonth5owner5;
  String dfstrTitleQwner6;
  String dfstrFirstNameowner6;
  String dfstrLastNameowner6;
  String dfstrstrDobOwner6;
  String dfhome_Addressowner6;
  String dfhome_Address2owner6;
  String dfstrHomeAdressCityowner6;
  String dfstrHomeAdressPostCodeowner6;
  String dfstrHomeaddressLiveYearowner6;
  String dfstrHomeaddressLiveMonthowner6;
  String dfstrHomeaddress1owner6;
  String dfstrHomeaddress2owner6;
  String dfstrHomeaddressCity1owner6;
  String dfstrHomeaddressPostCode1owner6;
  String dfstrHomeaddressLiveYear1owner6;
  String dfstrHomeaddressLiveMonth1owner6;
  String dfstrHomeaddress3owner6;
  String dfstrHomeaddress4owner6;
  String dfstrHomeaddressCity2owner6;
  String dfstrHomeaddressPostCode2owner6;
  String dfstrHomeaddressPostLiveYear2owner6;
  String dfstrHomeaddressPostLiveMonth2owner6;
  String dfstrHomeaddress5owner6;
  String dfstrHomeaddress6owner6;
  String dfstrHomeaddressCity3owner6;
  String dfstrHomeaddressPostCode3owner6;
  String dfstrHomeaddressLiveYear3owner6;
  String dfstrHomeaddressLivemonth3owner6;
  String dfstrHomeaddress7owner6;
  String dfstrHomeaddress8owner6;
  String dfstrHomeaddressCity4owner6;
  String dfstrHomeaddressPostCode4owner6;
  String dfstrHomeaddressLiveYear4owner6;
  String dfstrHomeaddressLiveMonth4owner6;
  String dfstrHomeaddress9owner6;
  String dfstrHomeaddress10owner6;
  String dfstrHomeaddressCity5owner6;
  String dfstrHomeaddressPostCode5owner6;
  String dfstrHomeaddressLiveYear5owner6;
  String dfstrHomeaddressLiveMonth5owner6;
  String dfstrTitleQwner7;
  String dfstrFirstNameowner7;
  String dfstrLastNameowner7;
  String dfstrstrDobOwner7;
  String dfhome_Addressowner7;
  String dfhome_Address2owner7;
  String dfstrHomeAdressCityowner7;
  String dfstrHomeAdressPostCodeowner7;
  String dfstrHomeaddressLiveYearowner7;
  String dfstrHomeaddressLiveMonthowner7;
  String dfstrHomeaddress1owner7;
  String dfstrHomeaddress2owner7;
  String dfstrHomeaddressCity1owner7;
  String dfstrHomeaddressPostCode1owner7;
  String dfstrHomeaddressLiveYear1owner7;
  String dfstrHomeaddressLiveMonth1owner7;
  String dfstrHomeaddress3owner7;
  String dfstrHomeaddress4owner7;
  String dfstrHomeaddressCity2owner7;
  String dfstrHomeaddressPostCode2owner7;
  String dfstrHomeaddressPostLiveYear2owner7;
  String dfstrHomeaddressPostLiveMonth2owner7;
  String dfstrHomeaddress5owner7;
  String dfstrHomeaddress6owner7;
  String dfstrHomeaddressCity3owner7;
  String dfstrHomeaddressPostCode3owner7;
  String dfstrHomeaddressLiveYear3owner7;
  String dfstrHomeaddressLivemonth3owner7;
  String dfstrHomeaddress7owner7;
  String dfstrHomeaddress8owner7;
  String dfstrHomeaddressCity4owner7;
  String dfstrHomeaddressPostCode4owner7;
  String dfstrHomeaddressLiveYear4owner7;
  String dfstrHomeaddressLiveMonth4owner7;
  String dfstrHomeaddress9owner7;
  String dfstrHomeaddress10owner7;
  String dfstrHomeaddressCity5owner7;
  String dfstrHomeaddressPostCode5owner7;
  String dfstrHomeaddressLiveYear5owner7;
  String dfstrHomeaddressLiveMonth5owner7;
  String dfstrTitleQwner8;
  String dfstrFirstNameowner8;
  String dfstrLastNameowner8;
  String dfstrstrDobOwner8;
  String dfhome_Addressowner8;
  String dfhome_Address2owner8;
  String dfstrHomeAdressCityowner8;
  String dfstrHomeAdressPostCodeowner8;
  String dfstrHomeaddressLiveYearowner8;
  String dfstrHomeaddressLiveMonthowner8;
  String dfstrHomeaddress1owner8;
  String dfstrHomeaddress2owner8;
  String dfstrHomeaddressCity1owner8;
  String dfstrHomeaddressPostCode1owner8;
  String dfstrHomeaddressLiveYear1owner8;
  String dfstrHomeaddressLiveMonth1owner8;
  String dfstrHomeaddress3owner8;
  String dfstrHomeaddress4owner8;
  String dfstrHomeaddressCity2owner8;
  String dfstrHomeaddressPostCode2owner8;
  String dfstrHomeaddressPostLiveYear2owner8;
  String dfstrHomeaddressPostLiveMonth2owner8;
  String dfstrHomeaddress5owner8;
  String dfstrHomeaddress6owner8;
  String dfstrHomeaddressCity3owner8;
  String dfstrHomeaddressPostCode3owner8;
  String dfstrHomeaddressLiveYear3owner8;
  String dfstrHomeaddressLivemonth3owner8;
  String dfstrHomeaddress7owner8;
  String dfstrHomeaddress8owner8;
  String dfstrHomeaddressCity4owner8;
  String dfstrHomeaddressPostCode4owner8;
  String dfstrHomeaddressLiveYear4owner8;
  String dfstrHomeaddressLiveMonth4owner8;
  String dfstrHomeaddress9owner8;
  String dfstrHomeaddress10owner8;
  String dfstrHomeaddressCity5owner8;
  String dfstrHomeaddressPostCode5owner8;
  String dfstrHomeaddressLiveYear5owner8;
  String dfstrHomeaddressLiveMonth5owner8;
  String dfstrTitleQwner9;
  String dfstrFirstNameowner9;
  String dfstrLastNameowner9;
  String dfstrstrDobOwner9;
  String dfhome_Addressowner9;
  String dfhome_Address2owner9;
  String dfstrHomeAdressCityowner9;
  String dfstrHomeAdressPostCodeowner9;
  String dfstrHomeaddressLiveYearowner9;
  String dfstrHomeaddressLiveMonthowner9;
  String dfstrHomeaddress1owner9;
  String dfstrHomeaddress2owner9;
  String dfstrHomeaddressCity1owner9;
  String dfstrHomeaddressPostCode1owner9;
  String dfstrHomeaddressLiveYear1owner9;
  String dfstrHomeaddressLiveMonth1owner9;
  String dfstrHomeaddress3owner9;
  String dfstrHomeaddress4owner9;
  String dfstrHomeaddressCity2owner9;
  String dfstrHomeaddressPostCode2owner9;
  String dfstrHomeaddressPostLiveYear2owner9;
  String dfstrHomeaddressPostLiveMonth2owner9;
  String dfstrHomeaddress5owner9;
  String dfstrHomeaddress6owner9;
  String dfstrHomeaddressCity3owner9;
  String dfstrHomeaddressPostCode3owner9;
  String dfstrHomeaddressLiveYear3owner9;
  String dfstrHomeaddressLivemonth3owner9;
  String dfstrHomeaddress7owner9;
  String dfstrHomeaddress8owner9;
  String dfstrHomeaddressCity4owner9;
  String dfstrHomeaddressPostCode4owner9;
  String dfstrHomeaddressLiveYear4owner9;
  String dfstrHomeaddressLiveMonth4owner9;
  String dfstrHomeaddress9owner9;
  String dfstrHomeaddress10owner9;
  String dfstrHomeaddressCity5owner9;
  String dfstrHomeaddressPostCode5owner9;
  String dfstrHomeaddressLiveYear5owner9;
  String dfstrHomeaddressLiveMonth5owner9;
  String dfstrTitleQwner10;
  String dfstrFirstNameowner10;
  String dfstrLastNameowner10;
  String dfstrstrDobOwner10;
  String dfhome_Addressowner10;
  String dfhome_Address2owner10;
  String dfstrHomeAdressCityowner10;
  String dfstrHomeAdressPostCodeowner10;
  String dfstrHomeaddressLiveYearowner10;
  String dfstrHomeaddressLiveMonthowner10;
  String dfstrHomeaddress1owner10;
  String dfstrHomeaddress2owner10;
  String dfstrHomeaddressCity1owner10;
  String dfstrHomeaddressPostCode1owner10;
  String dfstrHomeaddressLiveYear1owner10;
  String dfstrHomeaddressLiveMonth1owner10;
  String dfstrHomeaddress3owner10;
  String dfstrHomeaddress4owner10;
  String dfstrHomeaddressCity2owner10;
  String dfstrHomeaddressPostCode2owner10;
  String dfstrHomeaddressPostLiveYear2owner10;
  String dfstrHomeaddressPostLiveMonth2owner10;
  String dfstrHomeaddress5owner10;
  String dfstrHomeaddress6owner10;
  String dfstrHomeaddressCity3owner10;
  String dfstrHomeaddressPostCode3owner10;
  String dfstrHomeaddressLiveYear3owner10;
  String dfstrHomeaddressLivemonth3owner10;
  String dfstrHomeaddress7owner10;
  String dfstrHomeaddress8owner10;
  String dfstrHomeaddressCity4owner10;
  String dfstrHomeaddressPostCode4owner10;
  String dfstrHomeaddressLiveYear4owner10;
  String dfstrHomeaddressLiveMonth4owner10;
  String dfstrHomeaddress9owner10;
  String dfstrHomeaddress10owner10;
  String dfstrHomeaddressCity5owner10;
  String dfstrHomeaddressPostCode5owner10;
  String dfstrHomeaddressLiveYear5owner10;
  String dfstrHomeaddressLiveMonth5owner10;

  PartnerShipBusinessCredential({

    this.dfstrTitleQwner1,
    this.dffirstName,
    this.dflastName,
    this.dfstrTitleDirector2,
    this.dfstrDirector2Firstname,
    this.dfstrDirector2Lastname,
    this.dfstrDobOwner1,
    this.dfhome_Address,
    this.dfhome_Address2,
    this.dfstrHomeAdressPostCode,
    this.dfstrHomeAdressCity,
    this.dfstrHomeaddressLiveYear,
    this.dfstrHomeaddressLiveMonth,
    this.dfstrHomeaddress1,
    this.dfstrHomeaddress2,
    this.dfstrHomeaddressCity1,
    this.dfstrHomeaddressPostCode1,
    this.dfstrHomeaddressLiveYear1,
    this.dfstrHomeaddressLiveMonth1,
    this.dfstrHomeaddress3,
    this.dfstrHomeaddress4,
    this.dfstrHomeaddressCity2,
    this.dfstrHomeaddressPostCode2,
    this.dfstrHomeaddressPostLiveYear2,
    this.dfstrHomeaddressPostLiveMonth2,
    this.dfstrHomeaddress5,
    this.dfstrHomeaddress6,
    this.dfstrHomeaddressCity3,
    this.dfstrHomeaddressPostCode3,
    this.dfstrHomeaddressLiveYear3,
    this.dfstrHomeaddressLivemonth3,
    this.dfstrHomeaddress7,
    this.dfstrHomeaddress8,
    this.dfstrHomeaddressCity4,
    this.dfstrHomeaddressPostCode4,
    this.dfstrHomeaddressLiveYear4,
    this.dfstrHomeaddressLiveMonth4,
    this.dfstrHomeaddress9,
    this.dfstrHomeaddress10,
    this.dfstrHomeaddressCity5,
    this.dfstrHomeaddressPostCode5,
    this.dfstrHomeaddressLiveYear5,
    this.dfstrTitleQwner2,
    this.dfstrFirstNameowner,
    this.dfstrLastNameowner,
    this.dfstrDobOwner2,
    this.dfhome_Addressowner,
    this.dfhome_Address2owner,
    this.dfstrHomeAdressPostCodeowner,
    this.dfstrHomeAdressCityowner,
    this.dfstrHomeaddressLiveYearowner,
    this.dfstrHomeaddressLiveMonthowner,
    this.dfstrHomeaddress1owner,
    this.dfstrHomeaddress2owner,
    this.dfstrHomeaddressCity1owner,
    this.dfstrHomeaddressPostCode1owner,
    this.dfstrHomeaddressLiveYear1owner,
    this.dfstrHomeaddressLiveMonth1owner,
    this.dfstrHomeaddress3owner,
    this.dfstrHomeaddress4owner,
    this.dfstrHomeaddressCity2owner,
    this.dfstrHomeaddressPostCode2owner,
    this.dfstrHomeaddressPostLiveYear2owner,
    this.dfstrHomeaddressPostLiveMonth2owner,
    this.dfstrHomeaddress5owner,
    this.dfstrHomeaddress6owner,
    this.dfstrHomeaddressCity3owner,
    this.dfstrHomeaddressPostCode3owner,
    this.dfstrHomeaddressLiveYear3owner,
    this.dfstrHomeaddressLivemonth3owner,
    this.dfstrHomeaddress7owner,
    this.dfstrHomeaddress8owner,
    this.dfstrHomeaddressCity4owner,
    this.dfstrHomeaddressPostCode4owner,
    this.dfstrHomeaddressLiveYear4owner,
    this.dfstrHomeaddressLiveMonth4owner,
    this.dfstrHomeaddress9owner,
    this.dfstrHomeaddress10owner,
    this.dfstrHomeaddressCity5owner,
    this.dfstrHomeaddressPostCode5owner,
    this.dfstrHomeaddressLiveYear5owner,
    this.dfstrHomeaddressLiveMonth5owner,
    this.dfstrTitleQwner3,
    this.dfstrFirstNameowner3,
    this.dfstrLastNameowner3,
    this.dfstrstrDobOwner3,
    this.dfhome_Addressowner3,
    this.dfhome_Address2owner3,
    this.dfstrHomeAdressCityowner3,
    this.dfstrHomeAdressPostCodeowner3,
    this.dfstrHomeaddressLiveYearowner3,
    this.dfstrHomeaddressLiveMonthowner3,
    this.dfstrHomeaddress1owner3,
    this.dfstrHomeaddress2owner3,
    this.dfstrHomeaddressCity1owner3,
    this.dfstrHomeaddressPostCode1owner3,
    this.dfstrHomeaddressLiveYear1owner3,
    this.dfstrHomeaddressLiveMonth1owner3,
    this.dfstrHomeaddress3owner3,
    this.dfstrHomeaddress4owner3,
    this.dfstrHomeaddressCity2owner3,
    this.dfstrHomeaddressPostCode2owner3,
    this.dfstrHomeaddressPostLiveYear2owner3,
    this.dfstrHomeaddressPostLiveMonth2owner3,
    this.dfstrHomeaddress5owner3,
    this.dfstrHomeaddress6owner3,
    this.dfstrHomeaddressCity3owner3,
    this.dfstrHomeaddressPostCode3owner3,
    this.dfstrHomeaddressLiveYear3owner3,
    this.dfstrHomeaddressLivemonth3owner3,
    this.dfstrHomeaddress7owner3,
    this.dfstrHomeaddress8owner3,
    this.dfstrHomeaddressCity4owner3,
    this.dfstrHomeaddressPostCode4owner3,
    this.dfstrHomeaddressLiveYear4owner3,
    this.dfstrHomeaddressLiveMonth4owner3,
    this.dfstrHomeaddress9owner3,
    this.dfstrHomeaddress10owner3,
    this.dfstrHomeaddressCity5owner3,
    this.dfstrHomeaddressPostCode5owner3,
    this.dfstrHomeaddressLiveYear5owner3,
    this.dfstrHomeaddressLiveMonth5owner3,
    this.dfstrTitleQwner4,
    this.dfstrFirstNameowner4,
    this.dfstrLastNameowner4,
    this.dfstrstrDobOwner4,
    this.dfhome_Addressowner4,
    this.dfhome_Address2owner4,
    this.dfstrHomeAdressCityowner4,
    this.dfstrHomeAdressPostCodeowner4,
    this.dfstrHomeaddressLiveYearowner4,
    this.dfstrHomeaddressLiveMonthowner4,
    this.dfstrHomeaddress1owner4,
    this.dfstrHomeaddress2owner4,
    this.dfstrHomeaddressCity1owner4,
    this.dfstrHomeaddressPostCode1owner4,
    this.dfstrHomeaddressLiveYear1owner4,
    this.dfstrHomeaddressLiveMonth1owner4,
    this.dfstrHomeaddress3owner4,
    this.dfstrHomeaddress4owner4,
    this.dfstrHomeaddressCity2owner4,
    this.dfstrHomeaddressPostCode2owner4,
    this.dfstrHomeaddressPostLiveYear2owner4,
    this.dfstrHomeaddressPostLiveMonth2owner4,
    this.dfstrHomeaddress5owner4,
    this.dfstrHomeaddress6owner4,
    this.dfstrHomeaddressCity3owner4,
    this.dfstrHomeaddressPostCode3owner4,
    this.dfstrHomeaddressLiveYear3owner4,
    this.dfstrHomeaddressLivemonth3owner4,
    this.dfstrHomeaddress7owner4,
    this.dfstrHomeaddress8owner4,
    this.dfstrHomeaddressCity4owner4,
    this.dfstrHomeaddressPostCode4owner4,
    this.dfstrHomeaddressLiveYear4owner4,
    this.dfstrHomeaddressLiveMonth4owner4,
    this.dfstrHomeaddress9owner4,
    this.dfstrHomeaddress10owner4,
    this.dfstrHomeaddressCity5owner4,
    this.dfstrHomeaddressPostCode5owner4,
    this.dfstrHomeaddressLiveYear5owner4,
    this.dfstrHomeaddressLiveMonth5owner4,
    this.dfstrTitleQwner5,
    this.dfstrFirstNameowner5,
    this.dfstrLastNameowner5,
    this.dfstrstrDobOwner5,
    this.dfhome_Addressowner5,
    this.dfhome_Address2owner5,
    this.dfstrHomeAdressCityowner5,
    this.dfstrHomeAdressPostCodeowner5,
    this.dfstrHomeaddressLiveYearowner5,
    this.dfstrHomeaddressLiveMonthowner5,
    this.dfstrHomeaddress1owner5,
    this.dfstrHomeaddress2owner5,
    this.dfstrHomeaddressCity1owner5,
    this.dfstrHomeaddressPostCode1owner5,
    this.dfstrHomeaddressLiveYear1owner5,
    this.dfstrHomeaddressLiveMonth1owner5,
    this.dfstrHomeaddress3owner5,
    this.dfstrHomeaddress4owner5,
    this.dfstrHomeaddressCity2owner5,
    this.dfstrHomeaddressPostCode2owner5,
    this.dfstrHomeaddressPostLiveYear2owner5,
    this.dfstrHomeaddressPostLiveMonth2owner5,
    this.dfstrHomeaddress5owner5,
    this.dfstrHomeaddress6owner5,
    this.dfstrHomeaddressCity3owner5,
    this.dfstrHomeaddressPostCode3owner5,
    this.dfstrHomeaddressLiveYear3owner5,
    this.dfstrHomeaddressLivemonth3owner5,
    this.dfstrHomeaddress7owner5,
    this.dfstrHomeaddress8owner5,
    this.dfstrHomeaddressCity4owner5,
    this.dfstrHomeaddressPostCode4owner5,
    this.dfstrHomeaddressLiveYear4owner5,
    this.dfstrHomeaddressLiveMonth4owner5,
    this.dfstrHomeaddress9owner5,
    this.dfstrHomeaddress10owner5,
    this.dfstrHomeaddressCity5owner5,
    this.dfstrHomeaddressPostCode5owner5,
    this.dfstrHomeaddressLiveYear5owner5,
    this.dfstrHomeaddressLiveMonth5owner5,
    this.dfstrTitleQwner6,
    this.dfstrFirstNameowner6,
    this.dfstrLastNameowner6,
    this.dfstrstrDobOwner6,
    this.dfhome_Addressowner6,
    this.dfhome_Address2owner6,
    this.dfstrHomeAdressCityowner6,
    this.dfstrHomeAdressPostCodeowner6,
    this.dfstrHomeaddressLiveYearowner6,
    this.dfstrHomeaddressLiveMonthowner6,
    this.dfstrHomeaddress1owner6,
    this.dfstrHomeaddress2owner6,
    this.dfstrHomeaddressCity1owner6,
    this.dfstrHomeaddressPostCode1owner6,
    this.dfstrHomeaddressLiveYear1owner6,
    this.dfstrHomeaddressLiveMonth1owner6,
    this.dfstrHomeaddress3owner6,
    this.dfstrHomeaddress4owner6,
    this.dfstrHomeaddressCity2owner6,
    this.dfstrHomeaddressPostCode2owner6,
    this.dfstrHomeaddressPostLiveYear2owner6,
    this.dfstrHomeaddressPostLiveMonth2owner6,
    this.dfstrHomeaddress5owner6,
    this.dfstrHomeaddress6owner6,
    this.dfstrHomeaddressCity3owner6,
    this.dfstrHomeaddressPostCode3owner6,
    this.dfstrHomeaddressLiveYear3owner6,
    this.dfstrHomeaddressLivemonth3owner6,
    this.dfstrHomeaddress7owner6,
    this.dfstrHomeaddress8owner6,
    this.dfstrHomeaddressCity4owner6,
    this.dfstrHomeaddressPostCode4owner6,
    this.dfstrHomeaddressLiveYear4owner6,
    this.dfstrHomeaddressLiveMonth4owner6,
    this.dfstrHomeaddress9owner6,
    this.dfstrHomeaddress10owner6,
    this.dfstrHomeaddressCity5owner6,
    this.dfstrHomeaddressPostCode5owner6,
    this.dfstrHomeaddressLiveYear5owner6,
    this.dfstrHomeaddressLiveMonth5owner6,
    this.dfstrTitleQwner7,
    this.dfstrFirstNameowner7,
    this.dfstrLastNameowner7,
    this.dfstrstrDobOwner7,
    this.dfhome_Addressowner7,
    this.dfhome_Address2owner7,
    this.dfstrHomeAdressCityowner7,
    this.dfstrHomeAdressPostCodeowner7,
    this.dfstrHomeaddressLiveYearowner7,
    this.dfstrHomeaddressLiveMonthowner7,
    this.dfstrHomeaddress1owner7,
    this.dfstrHomeaddress2owner7,
    this.dfstrHomeaddressCity1owner7,
    this.dfstrHomeaddressPostCode1owner7,
    this.dfstrHomeaddressLiveYear1owner7,
    this.dfstrHomeaddressLiveMonth1owner7,
    this.dfstrHomeaddress3owner7,
    this.dfstrHomeaddress4owner7,
    this.dfstrHomeaddressCity2owner7,
    this.dfstrHomeaddressPostCode2owner7,
    this.dfstrHomeaddressPostLiveYear2owner7,
    this.dfstrHomeaddressPostLiveMonth2owner7,
    this.dfstrHomeaddress5owner7,
    this.dfstrHomeaddress6owner7,
    this.dfstrHomeaddressCity3owner7,
    this.dfstrHomeaddressPostCode3owner7,
    this.dfstrHomeaddressLiveYear3owner7,
    this.dfstrHomeaddressLivemonth3owner7,
    this.dfstrHomeaddress7owner7,
    this.dfstrHomeaddress8owner7,
    this.dfstrHomeaddressCity4owner7,
    this.dfstrHomeaddressPostCode4owner7,
    this.dfstrHomeaddressLiveYear4owner7,
    this.dfstrHomeaddressLiveMonth4owner7,
    this.dfstrHomeaddress9owner7,
    this.dfstrHomeaddress10owner7,
    this.dfstrHomeaddressCity5owner7,
    this.dfstrHomeaddressPostCode5owner7,
    this.dfstrHomeaddressLiveYear5owner7,
    this.dfstrHomeaddressLiveMonth5owner7,
    this.dfstrTitleQwner8,
    this.dfstrFirstNameowner8,
    this.dfstrLastNameowner8,
    this.dfstrstrDobOwner8,
    this.dfhome_Addressowner8,
    this.dfhome_Address2owner8,
    this.dfstrHomeAdressCityowner8,
    this.dfstrHomeAdressPostCodeowner8,
    this.dfstrHomeaddressLiveYearowner8,
    this.dfstrHomeaddressLiveMonthowner8,
    this.dfstrHomeaddress1owner8,
    this.dfstrHomeaddress2owner8,
    this.dfstrHomeaddressCity1owner8,
    this.dfstrHomeaddressPostCode1owner8,
    this.dfstrHomeaddressLiveYear1owner8,
    this.dfstrHomeaddressLiveMonth1owner8,
    this.dfstrHomeaddress3owner8,
    this.dfstrHomeaddress4owner8,
    this.dfstrHomeaddressCity2owner8,
    this.dfstrHomeaddressPostCode2owner8,
    this.dfstrHomeaddressPostLiveYear2owner8,
    this.dfstrHomeaddressPostLiveMonth2owner8,
    this.dfstrHomeaddress5owner8,
    this.dfstrHomeaddress6owner8,
    this.dfstrHomeaddressCity3owner8,
    this.dfstrHomeaddressPostCode3owner8,
    this.dfstrHomeaddressLiveYear3owner8,
    this.dfstrHomeaddressLivemonth3owner8,
    this.dfstrHomeaddress7owner8,
    this.dfstrHomeaddress8owner8,
    this.dfstrHomeaddressCity4owner8,
    this.dfstrHomeaddressPostCode4owner8,
    this.dfstrHomeaddressLiveYear4owner8,
    this.dfstrHomeaddressLiveMonth4owner8,
    this.dfstrHomeaddress9owner8,
    this.dfstrHomeaddress10owner8,
    this.dfstrHomeaddressCity5owner8,
    this.dfstrHomeaddressPostCode5owner8,
    this.dfstrHomeaddressLiveYear5owner8,
    this.dfstrHomeaddressLiveMonth5owner8,
    this.dfstrTitleQwner9,
    this.dfstrFirstNameowner9,
    this.dfstrLastNameowner9,
    this.dfstrstrDobOwner9,
    this.dfhome_Addressowner9,
    this.dfhome_Address2owner9,
    this.dfstrHomeAdressCityowner9,
    this.dfstrHomeAdressPostCodeowner9,
    this.dfstrHomeaddressLiveYearowner9,
    this.dfstrHomeaddressLiveMonthowner9,
    this.dfstrHomeaddress1owner9,
    this.dfstrHomeaddress2owner9,
    this.dfstrHomeaddressCity1owner9,
    this.dfstrHomeaddressPostCode1owner9,
    this.dfstrHomeaddressLiveYear1owner9,
    this.dfstrHomeaddressLiveMonth1owner9,
    this.dfstrHomeaddress3owner9,
    this.dfstrHomeaddress4owner9,
    this.dfstrHomeaddressCity2owner9,
    this.dfstrHomeaddressPostCode2owner9,
    this.dfstrHomeaddressPostLiveYear2owner9,
    this.dfstrHomeaddressPostLiveMonth2owner9,
    this.dfstrHomeaddress5owner9,
    this.dfstrHomeaddress6owner9,
    this.dfstrHomeaddressCity3owner9,
    this.dfstrHomeaddressPostCode3owner9,
    this.dfstrHomeaddressLiveYear3owner9,
    this.dfstrHomeaddressLivemonth3owner9,
    this.dfstrHomeaddress7owner9,
    this.dfstrHomeaddress8owner9,
    this.dfstrHomeaddressCity4owner9,
    this.dfstrHomeaddressPostCode4owner9,
    this.dfstrHomeaddressLiveYear4owner9,
    this.dfstrHomeaddressLiveMonth4owner9,
    this.dfstrHomeaddress9owner9,
    this.dfstrHomeaddress10owner9,
    this.dfstrHomeaddressCity5owner9,
    this.dfstrHomeaddressPostCode5owner9,
    this.dfstrHomeaddressLiveYear5owner9,
    this.dfstrHomeaddressLiveMonth5owner9,
    this.dfstrTitleQwner10,
    this.dfstrFirstNameowner10,
    this.dfstrLastNameowner10,
    this.dfstrstrDobOwner10,
    this.dfhome_Addressowner10,
    this.dfhome_Address2owner10,
    this.dfstrHomeAdressCityowner10,
    this.dfstrHomeAdressPostCodeowner10,
    this.dfstrHomeaddressLiveYearowner10,
    this.dfstrHomeaddressLiveMonthowner10,
    this.dfstrHomeaddress1owner10,
    this.dfstrHomeaddress2owner10,
    this.dfstrHomeaddressCity1owner10,
    this.dfstrHomeaddressPostCode1owner10,
    this.dfstrHomeaddressLiveYear1owner10,
    this.dfstrHomeaddressLiveMonth1owner10,
    this.dfstrHomeaddress3owner10,
    this.dfstrHomeaddress4owner10,
    this.dfstrHomeaddressCity2owner10,
    this.dfstrHomeaddressPostCode2owner10,
    this.dfstrHomeaddressPostLiveYear2owner10,
    this.dfstrHomeaddressPostLiveMonth2owner10,
    this.dfstrHomeaddress5owner10,
    this.dfstrHomeaddress6owner10,
    this.dfstrHomeaddressCity3owner10,
    this.dfstrHomeaddressPostCode3owner10,
    this.dfstrHomeaddressLiveYear3owner10,
    this.dfstrHomeaddressLivemonth3owner10,
    this.dfstrHomeaddress7owner10,
    this.dfstrHomeaddress8owner10,
    this.dfstrHomeaddressCity4owner10,
    this.dfstrHomeaddressPostCode4owner10,
    this.dfstrHomeaddressLiveYear4owner10,
    this.dfstrHomeaddressLiveMonth4owner10,
    this.dfstrHomeaddress9owner10,
    this.dfstrHomeaddress10owner10,
    this.dfstrHomeaddressCity5owner10,
    this.dfstrHomeaddressPostCode5owner10,
    this.dfstrHomeaddressLiveYear5owner10,
    this.dfstrHomeaddressLiveMonth5owner10,

  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    data['strTitleQwner1'] = this.dfstrTitleQwner1 ?? "";
    data['firstName'] = this.dffirstName ?? "";
    data['lastName'] = this.dflastName ?? "";
    data['strTitleDirector2'] = this.dfstrTitleDirector2 ?? "";
    data['strDirector2Firstname'] = this.dfstrDirector2Firstname ?? "";
    data['strDirector2Lastname'] = this.dfstrDirector2Lastname ?? "";
    data['strDobOwner1'] = this.dfstrDobOwner1 ?? "";
    data['home_Address'] = this.dfhome_Address ?? "";
    data['home_Address2'] = this.dfhome_Address2 ?? "";
    data['strHomeAdressPostCode'] = this.dfstrHomeAdressPostCode ?? "";
    data['strHomeAdressCity'] = this.dfstrHomeAdressCity ?? "";
    data['strHomeaddressLiveYear'] = this.dfstrHomeaddressLiveYear ?? "";
    data['strHomeaddressLiveMonth'] = this.dfstrHomeaddressLiveMonth ?? "";
    data['strHomeaddress1'] = this.dfstrHomeaddress1 ?? "";
    data['strHomeaddress2'] = this.dfstrHomeaddress2 ?? "";
    data['strHomeaddressCity1'] = this.dfstrHomeaddressCity1 ?? "";
    data['strHomeaddressPostCode1'] = this.dfstrHomeaddressPostCode1 ?? "";
    data['strHomeaddressLiveYear1'] = this.dfstrHomeaddressLiveYear1 ?? "";
    data['strHomeaddressLiveMonth1'] = this.dfstrHomeaddressLiveMonth1 ?? "";
    data['strHomeaddress3'] = this.dfstrHomeaddress3 ?? "";
    data['strHomeaddress4'] = this.dfstrHomeaddress4 ?? "";
    data['strHomeaddressCity2'] = this.dfstrHomeaddressCity2 ?? "";
    data['strHomeaddressPostCode2'] = this.dfstrHomeaddressPostCode2 ?? "";
    data['strHomeaddressPostLiveYear2'] = this.dfstrHomeaddressPostLiveYear2 ?? "";
    data['strHomeaddressPostLiveMonth2'] = this.dfstrHomeaddressPostLiveMonth2 ?? "";
    data['strHomeaddress5'] = this.dfstrHomeaddress5 ?? "";
    data['strHomeaddress6'] = this.dfstrHomeaddress6 ?? "";
    data['strHomeaddressCity3'] = this.dfstrHomeaddressCity3 ?? "";
    data['strHomeaddressPostCode3'] = this.dfstrHomeaddressPostCode3 ?? "";
    data['strHomeaddressLiveYear3'] = this.dfstrHomeaddressLiveYear3 ?? "";
    data['strHomeaddressLivemonth3'] = this.dfstrHomeaddressLivemonth3 ?? "";
    data['strHomeaddress7'] = this.dfstrHomeaddress7 ?? "";
    data['strHomeaddress8'] = this.dfstrHomeaddress8 ?? "";
    data['strHomeaddressCity4'] = this.dfstrHomeaddressCity4 ?? "";
    data['strHomeaddressPostCode4'] = this.dfstrHomeaddressPostCode4 ?? "";
    data['strHomeaddressLiveYear4'] = this.dfstrHomeaddressLiveYear4 ?? "";
    data['strHomeaddressLiveMonth4'] = this.dfstrHomeaddressLiveMonth4 ?? "";
    data['strHomeaddress9'] = this.dfstrHomeaddress9 ?? "";
    data['strHomeaddress10'] = this.dfstrHomeaddress10 ?? "";
    data['strHomeaddressCity5'] = this.dfstrHomeaddressCity5 ?? "";
    data['strHomeaddressPostCode5'] = this.dfstrHomeaddressPostCode5 ?? "";
    data['strHomeaddressLiveYear5'] = this.dfstrHomeaddressLiveYear5 ?? "";
    data['strTitleQwner2'] = this.dfstrTitleQwner2 ?? "";
    data['strFirstNameowner'] = this.dfstrFirstNameowner ?? "";
    data['strLastNameowner'] = this.dfstrLastNameowner ?? "";
    data['strDobOwner2'] = this.dfstrDobOwner2 ?? "";
    data['home_Addressowner'] = this.dfhome_Addressowner ?? "";
    data['home_Address2owner'] = this.dfhome_Address2owner ?? "";
    data['strHomeAdressPostCodeowner'] = this.dfstrHomeAdressPostCodeowner ?? "";
    data['strHomeAdressCityowner'] = this.dfstrHomeAdressCityowner ?? "";
    data['strHomeaddressLiveYearowner'] = this.dfstrHomeaddressLiveYearowner ?? "";
    data['strHomeaddressLiveMonthowner'] = this.dfstrHomeaddressLiveMonthowner ?? "";
    data['strHomeaddress1owner'] = this.dfstrHomeaddress1owner ?? "";
    data['strHomeaddress2owner'] = this.dfstrHomeaddress2owner ?? "";
    data['strHomeaddressCity1owner'] = this.dfstrHomeaddressCity1owner ?? "";
    data['strHomeaddressPostCode1owner'] = this.dfstrHomeaddressPostCode1owner ?? "";
    data['strHomeaddressLiveYear1owner'] = this.dfstrHomeaddressLiveYear1owner ?? "";
    data['strHomeaddressLiveMonth1owner'] = this.dfstrHomeaddressLiveMonth1owner ?? "";
    data['strHomeaddress3owner'] = this.dfstrHomeaddress3owner ?? "";
    data['strHomeaddress4owner'] = this.dfstrHomeaddress4owner ?? "";
    data['strHomeaddressCity2owner'] = this.dfstrHomeaddressCity2owner ?? "";
    data['strHomeaddressPostCode2owner'] = this.dfstrHomeaddressPostCode2owner ?? "";
    data['strHomeaddressPostLiveYear2owner'] = this.dfstrHomeaddressPostLiveYear2owner ?? "";
    data['strHomeaddressPostLiveMonth2owner'] = this.dfstrHomeaddressPostLiveMonth2owner ?? "";
    data['strHomeaddress5owner'] = this.dfstrHomeaddress5owner ?? "";
    data['strHomeaddress6owner'] = this.dfstrHomeaddress6owner ?? "";
    data['strHomeaddressCity3owner'] = this.dfstrHomeaddressCity3owner ?? "";
    data['strHomeaddressPostCode3owner'] = this.dfstrHomeaddressPostCode3owner ?? "";
    data['strHomeaddressLiveYear3owner'] = this.dfstrHomeaddressLiveYear3owner ?? "";
    data['strHomeaddressLivemonth3owner'] = this.dfstrHomeaddressLivemonth3owner ?? "";
    data['strHomeaddress7owner'] = this.dfstrHomeaddress7owner ?? "";
    data['strHomeaddress8owner'] = this.dfstrHomeaddress8owner ?? "";
    data['strHomeaddressCity4owner'] = this.dfstrHomeaddressCity4owner ?? "";
    data['strHomeaddressPostCode4owner'] = this.dfstrHomeaddressPostCode4owner ?? "";
    data['strHomeaddressLiveYear4owner'] = this.dfstrHomeaddressLiveYear4owner ?? "";
    data['strHomeaddressLiveMonth4owner'] = this.dfstrHomeaddressLiveMonth4owner ?? "";
    data['strHomeaddress9owner'] = this.dfstrHomeaddress9owner ?? "";
    data['strHomeaddress10owner'] = this.dfstrHomeaddress10owner ?? "";
    data['strHomeaddressCity5owner'] = this.dfstrHomeaddressCity5owner ?? "";
    data['strHomeaddressPostCode5owner'] = this.dfstrHomeaddressPostCode5owner ?? "";
    data['strHomeaddressLiveYear5owner'] = this.dfstrHomeaddressLiveYear5owner ?? "";
    data['strHomeaddressLiveMonth5owner'] = this.dfstrHomeaddressLiveMonth5owner ?? "";
    data['strTitleQwner3'] = this.dfstrTitleQwner3 ?? "";
    data['strFirstNameowner3'] = this.dfstrFirstNameowner3 ?? "";
    data['strLastNameowner3'] = this.dfstrLastNameowner3 ?? "";
    data['strstrDobOwner3'] = this.dfstrstrDobOwner3 ?? "";
    data['home_Addressowner3'] = this.dfhome_Addressowner3 ?? "";
    data['home_Address2owner3'] = this.dfhome_Address2owner3 ?? "";
    data['strHomeAdressCityowner3'] = this.dfstrHomeAdressCityowner3 ?? "";
    data['strHomeAdressPostCodeowner3'] = this.dfstrHomeAdressPostCodeowner3 ?? "";
    data['strHomeaddressLiveYearowner3'] = this.dfstrHomeaddressLiveYearowner3 ?? "";
    data['strHomeaddressLiveMonthowner3'] = this.dfstrHomeaddressLiveMonthowner3 ?? "";
    data['strHomeaddress1owner3'] = this.dfstrHomeaddress1owner3 ?? "";
    data['strHomeaddress2owner3'] = this.dfstrHomeaddress2owner3 ?? "";
    data['strHomeaddressCity1owner3'] = this.dfstrHomeaddressCity1owner3 ?? "";
    data['strHomeaddressPostCode1owner3'] = this.dfstrHomeaddressPostCode1owner3 ?? "";
    data['strHomeaddressLiveYear1owner3'] = this.dfstrHomeaddressLiveYear1owner3 ?? "";
    data['strHomeaddressLiveMonth1owner3'] = this.dfstrHomeaddressLiveMonth1owner3 ?? "";
    data['strHomeaddress3owner3'] = this.dfstrHomeaddress3owner3 ?? "";
    data['strHomeaddress4owner3'] = this.dfstrHomeaddress4owner3 ?? "";
    data['strHomeaddressCity2owner3'] = this.dfstrHomeaddressCity2owner3 ?? "";
    data['strHomeaddressPostCode2owner3'] = this.dfstrHomeaddressPostCode2owner3 ?? "";
    data['strHomeaddressPostLiveYear2owner3'] = this.dfstrHomeaddressPostLiveYear2owner3 ?? "";
    data['strHomeaddressPostLiveMonth2owner3'] = this.dfstrHomeaddressPostLiveMonth2owner3 ?? "";
    data['strHomeaddress5owner3'] = this.dfstrHomeaddress5owner3 ?? "";
    data['strHomeaddress6owner3'] = this.dfstrHomeaddress6owner3 ?? "";
    data['strHomeaddressCity3owner3'] = this.dfstrHomeaddressCity3owner3 ?? "";
    data['strHomeaddressPostCode3owner3'] = this.dfstrHomeaddressPostCode3owner3 ?? "";
    data['strHomeaddressLiveYear3owner3'] = this.dfstrHomeaddressLiveYear3owner3 ?? "";
    data['strHomeaddressLivemonth3owner3'] = this.dfstrHomeaddressLivemonth3owner3 ?? "";
    data['strHomeaddress7owner3'] = this.dfstrHomeaddress7owner3 ?? "";
    data['strHomeaddress8owner3'] = this.dfstrHomeaddress8owner3 ?? "";
    data['strHomeaddressCity4owner3'] = this.dfstrHomeaddressCity4owner3 ?? "";
    data['strHomeaddressPostCode4owner3'] = this.dfstrHomeaddressPostCode4owner3 ?? "";
    data['strHomeaddressLiveYear4owner3'] = this.dfstrHomeaddressLiveYear4owner3 ?? "";
    data['strHomeaddressLiveMonth4owner3'] = this.dfstrHomeaddressLiveMonth4owner3 ?? "";
    data['strHomeaddress9owner3'] = this.dfstrHomeaddress9owner3 ?? "";
    data['strHomeaddress10owner3'] = this.dfstrHomeaddress10owner3 ?? "";
    data['strHomeaddressCity5owner3'] = this.dfstrHomeaddressCity5owner3 ?? "";
    data['strHomeaddressPostCode5owner3'] = this.dfstrHomeaddressPostCode5owner3 ?? "";
    data['strHomeaddressLiveYear5owner3'] = this.dfstrHomeaddressLiveYear5owner3 ?? "";
    data['strHomeaddressLiveMonth5owner3'] = this.dfstrHomeaddressLiveMonth5owner3 ?? "";
    data['strTitleQwner4'] = this.dfstrTitleQwner4 ?? "";
    data['strFirstNameowner4'] = this.dfstrFirstNameowner4 ?? "";
    data['strLastNameowner4'] = this.dfstrLastNameowner4 ?? "";
    data['strstrDobOwner4'] = this.dfstrstrDobOwner4 ?? "";
    data['home_Addressowner4'] = this.dfhome_Addressowner4 ?? "";
    data['home_Address2owner4'] = this.dfhome_Address2owner4 ?? "";
    data['strHomeAdressCityowner4'] = this.dfstrHomeAdressCityowner4 ?? "";
    data['strHomeAdressPostCodeowner4'] = this.dfstrHomeAdressPostCodeowner4 ?? "";
    data['strHomeaddressLiveYearowner4'] = this.dfstrHomeaddressLiveYearowner4 ?? "";
    data['strHomeaddressLiveMonthowner4'] = this.dfstrHomeaddressLiveMonthowner4 ?? "";
    data['strHomeaddress1owner4'] = this.dfstrHomeaddress1owner4 ?? "";
    data['strHomeaddress2owner4'] = this.dfstrHomeaddress2owner4 ?? "";
    data['strHomeaddressCity1owner4'] = this.dfstrHomeaddressCity1owner4 ?? "";
    data['strHomeaddressPostCode1owner4'] = this.dfstrHomeaddressPostCode1owner4 ?? "";
    data['strHomeaddressLiveYear1owner4'] = this.dfstrHomeaddressLiveYear1owner4 ?? "";
    data['strHomeaddressLiveMonth1owner4'] = this.dfstrHomeaddressLiveMonth1owner4 ?? "";
    data['strHomeaddress3owner4'] = this.dfstrHomeaddress3owner4 ?? "";
    data['strHomeaddress4owner4'] = this.dfstrHomeaddress4owner4 ?? "";
    data['strHomeaddressCity2owner4'] = this.dfstrHomeaddressCity2owner4 ?? "";
    data['strHomeaddressPostCode2owner4'] = this.dfstrHomeaddressPostCode2owner4 ?? "";
    data['strHomeaddressPostLiveYear2owner4'] = this.dfstrHomeaddressPostLiveYear2owner4 ?? "";
    data['strHomeaddressPostLiveMonth2owner4'] = this.dfstrHomeaddressPostLiveMonth2owner4 ?? "";
    data['strHomeaddress5owner4'] = this.dfstrHomeaddress5owner4 ?? "";
    data['strHomeaddress6owner4'] = this.dfstrHomeaddress6owner4 ?? "";
    data['strHomeaddressCity3owner4'] = this.dfstrHomeaddressCity3owner4 ?? "";
    data['strHomeaddressPostCode3owner4'] = this.dfstrHomeaddressPostCode3owner4 ?? "";
    data['strHomeaddressLiveYear3owner4'] = this.dfstrHomeaddressLiveYear3owner4 ?? "";
    data['strHomeaddressLivemonth3owner4'] = this.dfstrHomeaddressLivemonth3owner4 ?? "";
    data['strHomeaddress7owner4'] = this.dfstrHomeaddress7owner4 ?? "";
    data['strHomeaddress8owner4'] = this.dfstrHomeaddress8owner4 ?? "";
    data['strHomeaddressCity4owner4'] = this.dfstrHomeaddressCity4owner4 ?? "";
    data['strHomeaddressPostCode4owner4'] = this.dfstrHomeaddressPostCode4owner4 ?? "";
    data['strHomeaddressLiveYear4owner4'] = this.dfstrHomeaddressLiveYear4owner4 ?? "";
    data['strHomeaddressLiveMonth4owner4'] = this.dfstrHomeaddressLiveMonth4owner4 ?? "";
    data['strHomeaddress9owner4'] = this.dfstrHomeaddress9owner4 ?? "";
    data['strHomeaddress10owner4'] = this.dfstrHomeaddress10owner4 ?? "";
    data['strHomeaddressCity5owner4'] = this.dfstrHomeaddressCity5owner4 ?? "";
    data['strHomeaddressPostCode5owner4'] = this.dfstrHomeaddressPostCode5owner4 ?? "";
    data['strHomeaddressLiveYear5owner4'] = this.dfstrHomeaddressLiveYear5owner4 ?? "";
    data['strHomeaddressLiveMonth5owner4'] = this.dfstrHomeaddressLiveMonth5owner4 ?? "";
    data['strTitleQwner5'] = this.dfstrTitleQwner5 ?? "";
    data['strFirstNameowner5'] = this.dfstrFirstNameowner5 ?? "";
    data['strLastNameowner5'] = this.dfstrLastNameowner5 ?? "";
    data['strstrDobOwner5'] = this.dfstrstrDobOwner5 ?? "";
    data['home_Addressowner5'] = this.dfhome_Addressowner5 ?? "";
    data['home_Address2owner5'] = this.dfhome_Address2owner5 ?? "";
    data['strHomeAdressCityowner5'] = this.dfstrHomeAdressCityowner5 ?? "";
    data['strHomeAdressPostCodeowner5'] = this.dfstrHomeAdressPostCodeowner5 ?? "";
    data['strHomeaddressLiveYearowner5'] = this.dfstrHomeaddressLiveYearowner5 ?? "";
    data['strHomeaddressLiveMonthowner5'] = this.dfstrHomeaddressLiveMonthowner5 ?? "";
    data['strHomeaddress1owner5'] = this.dfstrHomeaddress1owner5 ?? "";
    data['strHomeaddress2owner5'] = this.dfstrHomeaddress2owner5 ?? "";
    data['strHomeaddressCity1owner5'] = this.dfstrHomeaddressCity1owner5 ?? "";
    data['strHomeaddressPostCode1owner5'] = this.dfstrHomeaddressPostCode1owner5 ?? "";
    data['strHomeaddressLiveYear1owner5'] = this.dfstrHomeaddressLiveYear1owner5 ?? "";
    data['strHomeaddressLiveMonth1owner5'] = this.dfstrHomeaddressLiveMonth1owner5 ?? "";
    data['strHomeaddress3owner5'] = this.dfstrHomeaddress3owner5 ?? "";
    data['strHomeaddress4owner5'] = this.dfstrHomeaddress4owner5 ?? "";
    data['strHomeaddressCity2owner5'] = this.dfstrHomeaddressCity2owner5 ?? "";
    data['strHomeaddressPostCode2owner5'] = this.dfstrHomeaddressPostCode2owner5 ?? "";
    data['strHomeaddressPostLiveYear2owner5'] = this.dfstrHomeaddressPostLiveYear2owner5 ?? "";
    data['strHomeaddressPostLiveMonth2owner5'] = this.dfstrHomeaddressPostLiveMonth2owner5 ?? "";
    data['strHomeaddress5owner5'] = this.dfstrHomeaddress5owner5 ?? "";
    data['strHomeaddress6owner5'] = this.dfstrHomeaddress6owner5 ?? "";
    data['strHomeaddressCity3owner5'] = this.dfstrHomeaddressCity3owner5 ?? "";
    data['strHomeaddressPostCode3owner5'] = this.dfstrHomeaddressPostCode3owner5 ?? "";
    data['strHomeaddressLiveYear3owner5'] = this.dfstrHomeaddressLiveYear3owner5 ?? "";
    data['strHomeaddressLivemonth3owner5'] = this.dfstrHomeaddressLivemonth3owner5 ?? "";
    data['strHomeaddress7owner5'] = this.dfstrHomeaddress7owner5 ?? "";
    data['strHomeaddress8owner5'] = this.dfstrHomeaddress8owner5 ?? "";
    data['strHomeaddressCity4owner5'] = this.dfstrHomeaddressCity4owner5 ?? "";
    data['strHomeaddressPostCode4owner5'] = this.dfstrHomeaddressPostCode4owner5 ?? "";
    data['strHomeaddressLiveYear4owner5'] = this.dfstrHomeaddressLiveYear4owner5 ?? "";
    data['strHomeaddressLiveMonth4owner5'] = this.dfstrHomeaddressLiveMonth4owner5 ?? "";
    data['strHomeaddress9owner5'] = this.dfstrHomeaddress9owner5 ?? "";
    data['strHomeaddress10owner5'] = this.dfstrHomeaddress10owner5 ?? "";
    data['strHomeaddressCity5owner5'] = this.dfstrHomeaddressCity5owner5 ?? "";
    data['strHomeaddressPostCode5owner5'] = this.dfstrHomeaddressPostCode5owner5 ?? "";
    data['strHomeaddressLiveYear5owner5'] = this.dfstrHomeaddressLiveYear5owner5 ?? "";
    data['strHomeaddressLiveMonth5owner5'] = this.dfstrHomeaddressLiveMonth5owner5 ?? "";
    data['strTitleQwner6'] = this.dfstrTitleQwner6 ?? "";
    data['strFirstNameowner6'] = this.dfstrFirstNameowner6 ?? "";
    data['strLastNameowner6'] = this.dfstrLastNameowner6 ?? "";
    data['strstrDobOwner6'] = this.dfstrstrDobOwner6 ?? "";
    data['home_Addressowner6'] = this.dfhome_Addressowner6 ?? "";
    data['home_Address2owner6'] = this.dfhome_Address2owner6 ?? "";
    data['strHomeAdressCityowner6'] = this.dfstrHomeAdressCityowner6 ?? "";
    data['strHomeAdressPostCodeowner6'] = this.dfstrHomeAdressPostCodeowner6 ?? "";
    data['strHomeaddressLiveYearowner6'] = this.dfstrHomeaddressLiveYearowner6 ?? "";
    data['strHomeaddressLiveMonthowner6'] = this.dfstrHomeaddressLiveMonthowner6 ?? "";
    data['strHomeaddress1owner6'] = this.dfstrHomeaddress1owner6 ?? "";
    data['strHomeaddress2owner6'] = this.dfstrHomeaddress2owner6 ?? "";
    data['strHomeaddressCity1owner6'] = this.dfstrHomeaddressCity1owner6 ?? "";
    data['strHomeaddressPostCode1owner6'] = this.dfstrHomeaddressPostCode1owner6 ?? "";
    data['strHomeaddressLiveYear1owner6'] = this.dfstrHomeaddressLiveYear1owner6 ?? "";
    data['strHomeaddressLiveMonth1owner6'] = this.dfstrHomeaddressLiveMonth1owner6 ?? "";
    data['strHomeaddress3owner6'] = this.dfstrHomeaddress3owner6 ?? "";
    data['strHomeaddress4owner6'] = this.dfstrHomeaddress4owner6 ?? "";
    data['strHomeaddressCity2owner6'] = this.dfstrHomeaddressCity2owner6 ?? "";
    data['strHomeaddressPostCode2owner6'] = this.dfstrHomeaddressPostCode2owner6 ?? "";
    data['strHomeaddressPostLiveYear2owner6'] = this.dfstrHomeaddressPostLiveYear2owner6 ?? "";
    data['strHomeaddressPostLiveMonth2owner6'] = this.dfstrHomeaddressPostLiveMonth2owner6 ?? "";
    data['strHomeaddress5owner6'] = this.dfstrHomeaddress5owner6 ?? "";
    data['strHomeaddress6owner6'] = this.dfstrHomeaddress6owner6 ?? "";
    data['strHomeaddressCity3owner6'] = this.dfstrHomeaddressCity3owner6 ?? "";
    data['strHomeaddressPostCode3owner6'] = this.dfstrHomeaddressPostCode3owner6 ?? "";
    data['strHomeaddressLiveYear3owner6'] = this.dfstrHomeaddressLiveYear3owner6 ?? "";
    data['strHomeaddressLivemonth3owner6'] = this.dfstrHomeaddressLivemonth3owner6 ?? "";
    data['strHomeaddress7owner6'] = this.dfstrHomeaddress7owner6 ?? "";
    data['strHomeaddress8owner6'] = this.dfstrHomeaddress8owner6 ?? "";
    data['strHomeaddressCity4owner6'] = this.dfstrHomeaddressCity4owner6 ?? "";
    data['strHomeaddressPostCode4owner6'] = this.dfstrHomeaddressPostCode4owner6 ?? "";
    data['strHomeaddressLiveYear4owner6'] = this.dfstrHomeaddressLiveYear4owner6 ?? "";
    data['strHomeaddressLiveMonth4owner6'] = this.dfstrHomeaddressLiveMonth4owner6 ?? "";
    data['strHomeaddress9owner6'] = this.dfstrHomeaddress9owner6 ?? "";
    data['strHomeaddress10owner6'] = this.dfstrHomeaddress10owner6 ?? "";
    data['strHomeaddressCity5owner6'] = this.dfstrHomeaddressCity5owner6 ?? "";
    data['strHomeaddressPostCode5owner6'] = this.dfstrHomeaddressPostCode5owner6 ?? "";
    data['strHomeaddressLiveYear5owner6'] = this.dfstrHomeaddressLiveYear5owner6 ?? "";
    data['strHomeaddressLiveMonth5owner6'] = this.dfstrHomeaddressLiveMonth5owner6 ?? "";
    data['strTitleQwner7'] = this.dfstrTitleQwner7 ?? "";
    data['strFirstNameowner7'] = this.dfstrFirstNameowner7 ?? "";
    data['strLastNameowner7'] = this.dfstrLastNameowner7 ?? "";
    data['strstrDobOwner7'] = this.dfstrstrDobOwner7 ?? "";
    data['home_Addressowner7'] = this.dfhome_Addressowner7 ?? "";
    data['home_Address2owner7'] = this.dfhome_Address2owner7 ?? "";
    data['strHomeAdressCityowner7'] = this.dfstrHomeAdressCityowner7 ?? "";
    data['strHomeAdressPostCodeowner7'] = this.dfstrHomeAdressPostCodeowner7 ?? "";
    data['strHomeaddressLiveYearowner7'] = this.dfstrHomeaddressLiveYearowner7 ?? "";
    data['strHomeaddressLiveMonthowner7'] = this.dfstrHomeaddressLiveMonthowner7 ?? "";
    data['strHomeaddress1owner7'] = this.dfstrHomeaddress1owner7 ?? "";
    data['strHomeaddress2owner7'] = this.dfstrHomeaddress2owner7 ?? "";
    data['strHomeaddressCity1owner7'] = this.dfstrHomeaddressCity1owner7 ?? "";
    data['strHomeaddressPostCode1owner7'] = this.dfstrHomeaddressPostCode1owner7 ?? "";
    data['strHomeaddressLiveYear1owner7'] = this.dfstrHomeaddressLiveYear1owner7 ?? "";
    data['strHomeaddressLiveMonth1owner7'] = this.dfstrHomeaddressLiveMonth1owner7 ?? "";
    data['strHomeaddress3owner7'] = this.dfstrHomeaddress3owner7 ?? "";
    data['strHomeaddress4owner7'] = this.dfstrHomeaddress4owner7 ?? "";
    data['strHomeaddressCity2owner7'] = this.dfstrHomeaddressCity2owner7 ?? "";
    data['strHomeaddressPostCode2owner7'] = this.dfstrHomeaddressPostCode2owner7 ?? "";
    data['strHomeaddressPostLiveYear2owner7'] = this.dfstrHomeaddressPostLiveYear2owner7 ?? "";
    data['strHomeaddressPostLiveMonth2owner7'] = this.dfstrHomeaddressPostLiveMonth2owner7 ?? "";
    data['strHomeaddress5owner7'] = this.dfstrHomeaddress5owner7 ?? "";
    data['strHomeaddress6owner7'] = this.dfstrHomeaddress6owner7 ?? "";
    data['strHomeaddressCity3owner7'] = this.dfstrHomeaddressCity3owner7 ?? "";
    data['strHomeaddressPostCode3owner7'] = this.dfstrHomeaddressPostCode3owner7 ?? "";
    data['strHomeaddressLiveYear3owner7'] = this.dfstrHomeaddressLiveYear3owner7 ?? "";
    data['strHomeaddressLivemonth3owner7'] = this.dfstrHomeaddressLivemonth3owner7 ?? "";
    data['strHomeaddress7owner7'] = this.dfstrHomeaddress7owner7 ?? "";
    data['strHomeaddress8owner7'] = this.dfstrHomeaddress8owner7 ?? "";
    data['strHomeaddressCity4owner7'] = this.dfstrHomeaddressCity4owner7 ?? "";
    data['strHomeaddressPostCode4owner7'] = this.dfstrHomeaddressPostCode4owner7 ?? "";
    data['strHomeaddressLiveYear4owner7'] = this.dfstrHomeaddressLiveYear4owner7 ?? "";
    data['strHomeaddressLiveMonth4owner7'] = this.dfstrHomeaddressLiveMonth4owner7 ?? "";
    data['strHomeaddress9owner7'] = this.dfstrHomeaddress9owner7 ?? "";
    data['strHomeaddress10owner7'] = this.dfstrHomeaddress10owner7 ?? "";
    data['strHomeaddressCity5owner7'] = this.dfstrHomeaddressCity5owner7 ?? "";
    data['strHomeaddressPostCode5owner7'] = this.dfstrHomeaddressPostCode5owner7 ?? "";
    data['strHomeaddressLiveYear5owner7'] = this.dfstrHomeaddressLiveYear5owner7 ?? "";
    data['strHomeaddressLiveMonth5owner7'] = this.dfstrHomeaddressLiveMonth5owner7 ?? "";
    data['strTitleQwner8'] = this.dfstrTitleQwner8 ?? "";
    data['strFirstNameowner8'] = this.dfstrFirstNameowner8 ?? "";
    data['strLastNameowner8'] = this.dfstrLastNameowner8 ?? "";
    data['strstrDobOwner8'] = this.dfstrstrDobOwner8 ?? "";
    data['home_Addressowner8'] = this.dfhome_Addressowner8 ?? "";
    data['home_Address2owner8'] = this.dfhome_Address2owner8 ?? "";
    data['strHomeAdressCityowner8'] = this.dfstrHomeAdressCityowner8 ?? "";
    data['strHomeAdressPostCodeowner8'] = this.dfstrHomeAdressPostCodeowner8 ?? "";
    data['strHomeaddressLiveYearowner8'] = this.dfstrHomeaddressLiveYearowner8 ?? "";
    data['strHomeaddressLiveMonthowner8'] = this.dfstrHomeaddressLiveMonthowner8 ?? "";
    data['strHomeaddress1owner8'] = this.dfstrHomeaddress1owner8 ?? "";
    data['strHomeaddress2owner8'] = this.dfstrHomeaddress2owner8 ?? "";
    data['strHomeaddressCity1owner8'] = this.dfstrHomeaddressCity1owner8 ?? "";
    data['strHomeaddressPostCode1owner8'] = this.dfstrHomeaddressPostCode1owner8 ?? "";
    data['strHomeaddressLiveYear1owner8'] = this.dfstrHomeaddressLiveYear1owner8 ?? "";
    data['strHomeaddressLiveMonth1owner8'] = this.dfstrHomeaddressLiveMonth1owner8 ?? "";
    data['strHomeaddress3owner8'] = this.dfstrHomeaddress3owner8 ?? "";
    data['strHomeaddress4owner8'] = this.dfstrHomeaddress4owner8 ?? "";
    data['strHomeaddressCity2owner8'] = this.dfstrHomeaddressCity2owner8 ?? "";
    data['strHomeaddressPostCode2owner8'] = this.dfstrHomeaddressPostCode2owner8 ?? "";
    data['strHomeaddressPostLiveYear2owner8'] = this.dfstrHomeaddressPostLiveYear2owner8 ?? "";
    data['strHomeaddressPostLiveMonth2owner8'] = this.dfstrHomeaddressPostLiveMonth2owner8 ?? "";
    data['strHomeaddress5owner8'] = this.dfstrHomeaddress5owner8 ?? "";
    data['strHomeaddress6owner8'] = this.dfstrHomeaddress6owner8 ?? "";
    data['strHomeaddressCity3owner8'] = this.dfstrHomeaddressCity3owner8 ?? "";
    data['strHomeaddressPostCode3owner8'] = this.dfstrHomeaddressPostCode3owner8 ?? "";
    data['strHomeaddressLiveYear3owner8'] = this.dfstrHomeaddressLiveYear3owner8 ?? "";
    data['strHomeaddressLivemonth3owner8'] = this.dfstrHomeaddressLivemonth3owner8 ?? "";
    data['strHomeaddress7owner8'] = this.dfstrHomeaddress7owner8 ?? "";
    data['strHomeaddress8owner8'] = this.dfstrHomeaddress8owner8 ?? "";
    data['strHomeaddressCity4owner8'] = this.dfstrHomeaddressCity4owner8 ?? "";
    data['strHomeaddressPostCode4owner8'] = this.dfstrHomeaddressPostCode4owner8 ?? "";
    data['strHomeaddressLiveYear4owner8'] = this.dfstrHomeaddressLiveYear4owner8 ?? "";
    data['strHomeaddressLiveMonth4owner8'] = this.dfstrHomeaddressLiveMonth4owner8 ?? "";
    data['strHomeaddress9owner8'] = this.dfstrHomeaddress9owner8 ?? "";
    data['strHomeaddress10owner8'] = this.dfstrHomeaddress10owner8 ?? "";
    data['strHomeaddressCity5owner8'] = this.dfstrHomeaddressCity5owner8 ?? "";
    data['strHomeaddressPostCode5owner8'] = this.dfstrHomeaddressPostCode5owner8 ?? "";
    data['strHomeaddressLiveYear5owner8'] = this.dfstrHomeaddressLiveYear5owner8 ?? "";
    data['strHomeaddressLiveMonth5owner8'] = this.dfstrHomeaddressLiveMonth5owner8 ?? "";
    data['strTitleQwner9'] = this.dfstrTitleQwner9 ?? "";
    data['strFirstNameowner9'] = this.dfstrFirstNameowner9 ?? "";
    data['strLastNameowner9'] = this.dfstrLastNameowner9 ?? "";
    data['strstrDobOwner9'] = this.dfstrstrDobOwner9 ?? "";
    data['home_Addressowner9'] = this.dfhome_Addressowner9 ?? "";
    data['home_Address2owner9'] = this.dfhome_Address2owner9 ?? "";
    data['strHomeAdressCityowner9'] = this.dfstrHomeAdressCityowner9 ?? "";
    data['strHomeAdressPostCodeowner9'] = this.dfstrHomeAdressPostCodeowner9 ?? "";
    data['strHomeaddressLiveYearowner9'] = this.dfstrHomeaddressLiveYearowner9 ?? "";
    data['strHomeaddressLiveMonthowner9'] = this.dfstrHomeaddressLiveMonthowner9 ?? "";
    data['strHomeaddress1owner9'] = this.dfstrHomeaddress1owner9 ?? "";
    data['strHomeaddress2owner9'] = this.dfstrHomeaddress2owner9 ?? "";
    data['strHomeaddressCity1owner9'] = this.dfstrHomeaddressCity1owner9 ?? "";
    data['strHomeaddressPostCode1owner9'] = this.dfstrHomeaddressPostCode1owner9 ?? "";
    data['strHomeaddressLiveYear1owner9'] = this.dfstrHomeaddressLiveYear1owner9 ?? "";
    data['strHomeaddressLiveMonth1owner9'] = this.dfstrHomeaddressLiveMonth1owner9 ?? "";
    data['strHomeaddress3owner9'] = this.dfstrHomeaddress3owner9 ?? "";
    data['strHomeaddress4owner9'] = this.dfstrHomeaddress4owner9 ?? "";
    data['strHomeaddressCity2owner9'] = this.dfstrHomeaddressCity2owner9 ?? "";
    data['strHomeaddressPostCode2owner9'] = this.dfstrHomeaddressPostCode2owner9 ?? "";
    data['strHomeaddressPostLiveYear2owner9'] = this.dfstrHomeaddressPostLiveYear2owner9 ?? "";
    data['strHomeaddressPostLiveMonth2owner9'] = this.dfstrHomeaddressPostLiveMonth2owner9 ?? "";
    data['strHomeaddress5owner9'] = this.dfstrHomeaddress5owner9 ?? "";
    data['strHomeaddress6owner9'] = this.dfstrHomeaddress6owner9 ?? "";
    data['strHomeaddressCity3owner9'] = this.dfstrHomeaddressCity3owner9 ?? "";
    data['strHomeaddressPostCode3owner9'] = this.dfstrHomeaddressPostCode3owner9 ?? "";
    data['strHomeaddressLiveYear3owner9'] = this.dfstrHomeaddressLiveYear3owner9 ?? "";
    data['strHomeaddressLivemonth3owner9'] = this.dfstrHomeaddressLivemonth3owner9 ?? "";
    data['strHomeaddress7owner9'] = this.dfstrHomeaddress7owner9 ?? "";
    data['strHomeaddress8owner9'] = this.dfstrHomeaddress8owner9 ?? "";
    data['strHomeaddressCity4owner9'] = this.dfstrHomeaddressCity4owner9 ?? "";
    data['strHomeaddressPostCode4owner9'] = this.dfstrHomeaddressPostCode4owner9 ?? "";
    data['strHomeaddressLiveYear4owner9'] = this.dfstrHomeaddressLiveYear4owner9 ?? "";
    data['strHomeaddressLiveMonth4owner9'] = this.dfstrHomeaddressLiveMonth4owner9 ?? "";
    data['strHomeaddress9owner9'] = this.dfstrHomeaddress9owner9 ?? "";
    data['strHomeaddress10owner9'] = this.dfstrHomeaddress10owner9 ?? "";
    data['strHomeaddressCity5owner9'] = this.dfstrHomeaddressCity5owner9 ?? "";
    data['strHomeaddressPostCode5owner9'] = this.dfstrHomeaddressPostCode5owner9 ?? "";
    data['strHomeaddressLiveYear5owner9'] = this.dfstrHomeaddressLiveYear5owner9 ?? "";
    data['strHomeaddressLiveMonth5owner9'] = this.dfstrHomeaddressLiveMonth5owner9 ?? "";
    data['strTitleQwner10'] = this.dfstrTitleQwner10 ?? "";
    data['strFirstNameowner10'] = this.dfstrFirstNameowner10 ?? "";
    data['strLastNameowner10'] = this.dfstrLastNameowner10 ?? "";
    data['strstrDobOwner10'] = this.dfstrstrDobOwner10 ?? "";
    data['home_Addressowner10'] = this.dfhome_Addressowner10 ?? "";
    data['home_Address2owner10'] = this.dfhome_Address2owner10 ?? "";
    data['strHomeAdressCityowner10'] = this.dfstrHomeAdressCityowner10 ?? "";
    data['strHomeAdressPostCodeowner10'] = this.dfstrHomeAdressPostCodeowner10 ?? "";
    data['strHomeaddressLiveYearowner10'] = this.dfstrHomeaddressLiveYearowner10 ?? "";
    data['strHomeaddressLiveMonthowner10'] = this.dfstrHomeaddressLiveMonthowner10 ?? "";
    data['strHomeaddress1owner10'] = this.dfstrHomeaddress1owner10 ?? "";
    data['strHomeaddress2owner10'] = this.dfstrHomeaddress2owner10 ?? "";
    data['strHomeaddressCity1owner10'] = this.dfstrHomeaddressCity1owner10 ?? "";
    data['strHomeaddressPostCode1owner10'] = this.dfstrHomeaddressPostCode1owner10 ?? "";
    data['strHomeaddressLiveYear1owner10'] = this.dfstrHomeaddressLiveYear1owner10 ?? "";
    data['strHomeaddressLiveMonth1owner10'] = this.dfstrHomeaddressLiveMonth1owner10 ?? "";
    data['strHomeaddress3owner10'] = this.dfstrHomeaddress3owner10 ?? "";
    data['strHomeaddress4owner10'] = this.dfstrHomeaddress4owner10 ?? "";
    data['strHomeaddressCity2owner10'] = this.dfstrHomeaddressCity2owner10 ?? "";
    data['strHomeaddressPostCode2owner10'] = this.dfstrHomeaddressPostCode2owner10 ?? "";
    data['strHomeaddressPostLiveYear2owner10'] = this.dfstrHomeaddressPostLiveYear2owner10 ?? "";
    data['strHomeaddressPostLiveMonth2owner10'] = this.dfstrHomeaddressPostLiveMonth2owner10 ?? "";
    data['strHomeaddress5owner10'] = this.dfstrHomeaddress5owner10 ?? "";
    data['strHomeaddress6owner10'] = this.dfstrHomeaddress6owner10 ?? "";
    data['strHomeaddressCity3owner10'] = this.dfstrHomeaddressCity3owner10 ?? "";
    data['strHomeaddressPostCode3owner10'] = this.dfstrHomeaddressPostCode3owner10 ?? "";
    data['strHomeaddressLiveYear3owner10'] = this.dfstrHomeaddressLiveYear3owner10 ?? "";
    data['strHomeaddressLivemonth3owner10'] = this.dfstrHomeaddressLivemonth3owner10 ?? "";
    data['strHomeaddress7owner10'] = this.dfstrHomeaddress7owner10 ?? "";
    data['strHomeaddress8owner10'] = this.dfstrHomeaddress8owner10 ?? "";
    data['strHomeaddressCity4owner10'] = this.dfstrHomeaddressCity4owner10 ?? "";
    data['strHomeaddressPostCode4owner10'] = this.dfstrHomeaddressPostCode4owner10 ?? "";
    data['strHomeaddressLiveYear4owner10'] = this.dfstrHomeaddressLiveYear4owner10 ?? "";
    data['strHomeaddressLiveMonth4owner10'] = this.dfstrHomeaddressLiveMonth4owner10 ?? "";
    data['strHomeaddress9owner10'] = this.dfstrHomeaddress9owner10 ?? "";
    data['strHomeaddress10owner10'] = this.dfstrHomeaddress10owner10 ?? "";
    data['strHomeaddressCity5owner10'] = this.dfstrHomeaddressCity5owner10 ?? "";
    data['strHomeaddressPostCode5owner10'] = this.dfstrHomeaddressPostCode5owner10 ?? "";
    data['strHomeaddressLiveYear5owner10'] = this.dfstrHomeaddressLiveYear5owner10 ?? "";
    data['strHomeaddressLiveMonth5owner10'] = this.dfstrHomeaddressLiveMonth5owner10 ?? "";



    return data;
  }
}


class BusinessTypeAddressCredential  {

  String strTitleDirector1;
  String strDirector1Firstname;
  String strDirector1Lastname;
  String strTitleQwner1;
  String firstName;
  String lastName;
  String strTitlecharityowner1;
  String strcharityowner1firstname;
  String strcharityowner1lastname;
  String strchariryRegisterNo;
  String strTitleLLPowner1;
  String strLLPowner1FirstName;
  String strLLPowner1LastName;
  String strTitleLLcowner1;
  String strLLcowner1FirstName;
  String strLLcowner1LastName;
  String strTitleOtherowner1;
  String strOtherowner1FirstName;
  String strOtherowner1LastName;
  String strTitleDirector2;
  String strDirector2Firstname;
  String strDirector2Lastname;
  String strTitleQwner2;
  String firstName2;
  String lastName2;
  String strTitlecharityowner2;
  String strcharityowner2firstname;
  String strcharityowner2lastname;
  String strchariryRegisterNo2;
  String strTitleLLPowner2;
  String strLLPowner2FirstName;
  String strLLPowner2LastName;
  String strTitleLLcowner2;
  String strLLcowner2FirstName;
  String strLLcowner2LastName;
  String strTitleOtherowner2;
  String strOtherowner2FirstName;
  String strOtherowner2LastName;


  BusinessTypeAddressCredential({
    this.strTitleDirector1,
    this.strDirector1Firstname,
    this.strDirector1Lastname,
    this.strTitleQwner1,
    this.firstName,
    this.lastName,
    this.strTitlecharityowner1,
    this.strcharityowner1firstname,
    this.strcharityowner1lastname,
    this.strchariryRegisterNo,
    this.strTitleLLPowner1,
    this.strLLPowner1FirstName,
    this.strLLPowner1LastName,
    this.strTitleLLcowner1,
    this.strLLcowner1FirstName,
    this.strLLcowner1LastName,
    this.strTitleOtherowner1,
    this.strOtherowner1FirstName,
    this.strOtherowner1LastName,
    this.strTitleDirector2,
    this.strDirector2Firstname,
    this.strDirector2Lastname,
    this.strTitleQwner2,
    this.firstName2,
    this.lastName2,
    this.strTitlecharityowner2,
    this.strcharityowner2firstname,
    this.strcharityowner2lastname,
    this.strchariryRegisterNo2,
    this.strTitleLLPowner2,
    this.strLLPowner2FirstName,
    this.strLLPowner2LastName,
    this.strTitleLLcowner2,
    this.strLLcowner2FirstName,
    this.strLLcowner2LastName,
    this.strTitleOtherowner2,
    this.strOtherowner2FirstName,
    this.strOtherowner2LastName,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    data['strTitleDirector1'] = this.strTitleDirector1 ?? "";
    data['strDirector1Firstname'] = this.strDirector1Firstname ?? "";
    data['strDirector1Lastname'] = this.strDirector1Lastname ?? "";
    data['strTitleQwner1'] = this.strTitleQwner1 ?? "";
    data['firstName'] = this.firstName ?? "";
    data['lastName'] = this.lastName ?? "";
    data['strTitlecharityowner1'] = this.strTitlecharityowner1 ?? "";
    data['strcharityowner1firstname'] = this.strcharityowner1firstname ?? "";
    data['strcharityowner1lastname'] = this.strcharityowner1lastname ?? "";
    data['strchariryRegisterNo'] = this.strchariryRegisterNo ?? "";
    data['strTitleLLPowner1'] = this.strTitleLLPowner1 ?? "";
    data['strLLPowner1FirstName'] = this.strLLPowner1FirstName ?? "";
    data['strLLPowner1LastName'] = this.strLLPowner1LastName ?? "";
    data['strTitleLLcowner1'] = this.strTitleLLcowner1 ?? "";
    data['strLLcowner1FirstName'] = this.strLLcowner1FirstName ?? "";
    data['strLLcowner1LastName'] = this.strLLcowner1LastName ?? "";
    data['strTitleOtherowner1'] = this.strTitleOtherowner1 ?? "";
    data['strOtherowner1FirstName'] = this.strOtherowner1FirstName ?? "";
    data['strOtherowner1LastName'] = this.strOtherowner1LastName ?? "";
    data['strTitleDirector2'] = this.strTitleDirector2 ?? "";
    data['strDirector2Firstname'] = this.strDirector2Firstname ?? "";
    data['strDirector2Lastname'] = this.strDirector2Lastname ?? "";
    data['strTitleQwner2'] = this.strTitleQwner2 ?? "";
    data['firstName2'] = this.firstName2 ?? "";
    data['lastName2'] = this.lastName2 ?? "";
    data['strTitlecharityowner2'] = this.strTitlecharityowner2 ?? "";
    data['strcharityowner2firstname'] = this.strcharityowner2firstname ?? "";
    data['strcharityowner2lastname'] = this.strcharityowner2lastname ?? "";
    data['strchariryRegisterNo2'] = this.strchariryRegisterNo2 ?? "";
    data['strTitleLLPowner2'] = this.strTitleLLPowner2 ?? "";
    data['strLLPowner2FirstName'] = this.strLLPowner2FirstName ?? "";
    data['strLLPowner2LastName'] = this.strLLPowner2LastName ?? "";
    data['strTitleLLcowner2'] = this.strTitleLLcowner2 ?? "";
    data['strLLcowner2FirstName'] = this.strLLcowner2FirstName ?? "";
    data['strLLcowner2LastName'] = this.strLLcowner2LastName ?? "";
    data['strTitleOtherowner2'] = this.strTitleOtherowner2 ?? "";
    data['strOtherowner2FirstName'] = this.strOtherowner2FirstName ?? "";
    data['strOtherowner2LastName'] = this.strOtherowner2LastName ?? "";

    return data;
  }
}
