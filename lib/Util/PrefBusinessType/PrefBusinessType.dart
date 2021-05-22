import 'package:pozitive/Core/Model/Api/DualFuel-InsertAddProspect/BusinessOwnershipDetailsCredential.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BusinessTypePref {
  /// other Business<Add-Prosp> set
  static void setOtherBusinessTypeAdd(
      OtherBusinessCredential businessTypeAddressCredential) async {
    print(businessTypeAddressCredential.toJson());
    print(businessTypeAddressCredential.strTitleOtherowner1);

    final sharedPreferences = await SharedPreferences.getInstance();

    if (businessTypeAddressCredential.strTitleOtherowner1 != null) {
      sharedPreferences.setString("otherDFstrTitleOtherowner1",
          businessTypeAddressCredential.strTitleOtherowner1);
    }
    if (businessTypeAddressCredential.strOtherowner1FirstName != null) {
      sharedPreferences.setString("otherDFstrOtherowner1FirstName",
          businessTypeAddressCredential.strOtherowner1FirstName);
    }
    if (businessTypeAddressCredential.strOtherowner1LastName != null) {
      sharedPreferences.setString("otherDFstrOtherowner1LastName",
          businessTypeAddressCredential.strOtherowner1LastName);
    }
    if (businessTypeAddressCredential.strTitleOtherowner2 != null) {
      sharedPreferences.setString("otherDFstrTitleOtherowner2",
          businessTypeAddressCredential.strTitleOtherowner2);
    }
    if (businessTypeAddressCredential.strOtherowner2FirstName != null) {
      sharedPreferences.setString("otherDFstrOtherowner2FirstName",
          businessTypeAddressCredential.strOtherowner2FirstName);
    }
    if (businessTypeAddressCredential.strOtherowner2LastName != null) {
      sharedPreferences.setString("otherDFstrOtherowner2LastName",
          businessTypeAddressCredential.strOtherowner2LastName);
    }
  }

  static void clearDFOtherBusinessTypeAdd() async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString("otherDFstrTitleOtherowner1", null);
  }

  ///other Business<Add-Prosp> getMethod

  static Future<OtherBusinessCredential> getOtherBusinessTypeAdd() async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();

    String strTitleOtherowner1 =
        preferences.getString("otherDFstrTitleOtherowner1");
    String strOtherowner1FirstName =
        preferences.getString("otherDFstrOtherowner1FirstName");
    String strOtherowner1LastName =
        preferences.getString("otherDFstrOtherowner1LastName");
    String strTitleOtherowner2 =
        preferences.getString("otherDFstrTitleOtherowner2");
    String strOtherowner2FirstName =
        preferences.getString("otherDFstrOtherowner2FirstName");
    String strOtherowner2LastName =
        preferences.getString("otherDFstrOtherowner2LastName");
    if (strTitleOtherowner1 != null) {
      return new OtherBusinessCredential(
        strTitleOtherowner1: strTitleOtherowner1,
        strOtherowner1FirstName: strOtherowner1FirstName,
        strOtherowner1LastName: strOtherowner1LastName,
        strTitleOtherowner2: strTitleOtherowner2,
        strOtherowner2FirstName: strOtherowner2FirstName,
        strOtherowner2LastName: strOtherowner2LastName,
      );
    } else {
      return null;
    }
  }

  /// ltd Business<Add-Prosp> set
  static void setltdBusinessTypeAdd(
      LtdBusinessCredential businessTypeAddressCredential) async {
    print(businessTypeAddressCredential.toJson());
    print(businessTypeAddressCredential.strTitleDirector1);

    final sharedPreferences = await SharedPreferences.getInstance();

    if (businessTypeAddressCredential.strTitleDirector1 != null) {
      sharedPreferences.setString("ltdDFstrTitleDirector1",
          businessTypeAddressCredential.strTitleDirector1);
    }
    if (businessTypeAddressCredential.strDirector1Firstname != null) {
      sharedPreferences.setString("ltdDFstrDirector1Firstname",
          businessTypeAddressCredential.strDirector1Firstname);
    }
    if (businessTypeAddressCredential.strDirector1Lastname != null) {
      sharedPreferences.setString("ltdDFstrDirector1Lastname",
          businessTypeAddressCredential.strDirector1Lastname);
    }
    if (businessTypeAddressCredential.strTitleDirector2 != null) {
      sharedPreferences.setString("ltdDFstrTitleDirector2",
          businessTypeAddressCredential.strTitleDirector2);
    }
    if (businessTypeAddressCredential.strDirector2Firstname != null) {
      sharedPreferences.setString("ltdDFstrDirector2Firstname",
          businessTypeAddressCredential.strDirector2Firstname);
    }
    if (businessTypeAddressCredential.strDirector2Lastname != null) {
      sharedPreferences.setString("ltdDFstrDirector2Lastname",
          businessTypeAddressCredential.strDirector2Lastname);
    }
  }

  static void clearDFLtdBusiness() async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString("ltdDFstrTitleDirector1", null);
  }

  ///ltd Business<Add-Prosp> getMethod
  static Future<LtdBusinessCredential> getltdBusinessTypeAdd() async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();

    String strTitleDirector1 = preferences.getString("ltdDFstrTitleDirector1");
    String strDirector1Firstname =
        preferences.getString("ltdDFstrDirector1Firstname");
    String strDirector1Lastname =
        preferences.getString("ltdDFstrDirector1Lastname");
    String strTitleDirector2 = preferences.getString("ltdDFstrTitleDirector2");
    String strDirector2Firstname =
        preferences.getString("ltdDFstrDirector2Firstname");
    String strDirector2Lastname =
        preferences.getString("ltdDFstrDirector2Lastname");

    if (strTitleDirector1 != null) {
      return new LtdBusinessCredential(
        strTitleDirector1: strTitleDirector1,
        strDirector1Firstname: strDirector1Firstname,
        strDirector1Lastname: strDirector1Lastname,
        strTitleDirector2: strTitleDirector2,
        strDirector2Firstname: strDirector2Firstname,
        strDirector2Lastname: strDirector2Lastname,
      );
    } else {
      return null;
    }
  }

  /// Charity Business<Add-Prosp> set
  static void setCharityBusinessTypeAdd(
      CharityBusinessCredential businessTypeAddressCredential) async {
    print(businessTypeAddressCredential.toJson());
    print(businessTypeAddressCredential.strchariryRegisterNo);

    final sharedPreferences = await SharedPreferences.getInstance();

    if (businessTypeAddressCredential.strTitlecharityowner1 != null) {
      sharedPreferences.setString("charityDFstrTitlecharityowner1",
          businessTypeAddressCredential.strTitlecharityowner1);
    }
    if (businessTypeAddressCredential.strcharityowner1firstname != null) {
      sharedPreferences.setString("charityDFstrcharityowner1firstname",
          businessTypeAddressCredential.strcharityowner1firstname);
    }
    if (businessTypeAddressCredential.strcharityowner1lastname != null) {
      sharedPreferences.setString("charityDFstrcharityowner1lastname",
          businessTypeAddressCredential.strcharityowner1lastname);
    }
    if (businessTypeAddressCredential.strTitlecharityowner2 != null) {
      sharedPreferences.setString("charityDFstrTitlecharityowner2",
          businessTypeAddressCredential.strTitlecharityowner2);
    }
    if (businessTypeAddressCredential.strcharityowner2firstname != null) {
      sharedPreferences.setString("charityDFstrcharityowner2firstname",
          businessTypeAddressCredential.strcharityowner2firstname);
    }
    if (businessTypeAddressCredential.strcharityowner2lastname != null) {
      sharedPreferences.setString("charityDFstrcharityowner2lastname",
          businessTypeAddressCredential.strcharityowner2lastname);
    }
    if (businessTypeAddressCredential.strchariryRegisterNo != null) {
      sharedPreferences.setString("charityDFstrchariryRegisterNo",
          businessTypeAddressCredential.strchariryRegisterNo);
    }
  }

  static void clearDFCharityBusiness() async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString("charityDFstrTitlecharityowner1", null);
  }

  ///Charity Business<Add-Prosp> getMethod
  static Future<CharityBusinessCredential> getCharityBusinessTypeAdd() async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();

    String strTitlecharityowner1 =
        preferences.getString("charityDFstrTitlecharityowner1");
    String strcharityowner1firstname =
        preferences.getString("charityDFstrcharityowner1firstname");
    String strcharityowner1lastname =
        preferences.getString("charityDFstrcharityowner1lastname");
    String strTitlecharityowner2 =
        preferences.getString("charityDFstrTitlecharityowner2");
    String strcharityowner2firstname =
        preferences.getString("charityDFstrcharityowner2firstname");
    String strcharityowner2lastname =
        preferences.getString("charityDFstrcharityowner2lastname");
    String strchariryRegisterNo =
        preferences.getString("charityDFstrchariryRegisterNo");

    print('#####OwnerShip Details....$strTitlecharityowner1');

    return new CharityBusinessCredential(
      strTitlecharityowner1: strTitlecharityowner1,
      strcharityowner1firstname: strcharityowner1firstname,
      strcharityowner1lastname: strcharityowner1lastname,
      strTitlecharityowner2: strTitlecharityowner2,
      strcharityowner2firstname: strcharityowner2firstname,
      strcharityowner2lastname: strcharityowner2lastname,
      strchariryRegisterNo: strchariryRegisterNo,
    );
  }

  /// llp Business<Add-Prosp> set
  static void setLLPBusinessTypeAdd(
      LLPBusinessCredential businessTypeAddressCredential) async {
    print(businessTypeAddressCredential.toJson());
    print(businessTypeAddressCredential.strLLPowner1FirstName);

    final sharedPreferences = await SharedPreferences.getInstance();

    if (businessTypeAddressCredential.strTitleLLPowner1 != null) {
      sharedPreferences.setString("llpDFstrTitleLLPowner1",
          businessTypeAddressCredential.strTitleLLPowner1);
    }
    if (businessTypeAddressCredential.strLLPowner1FirstName != null) {
      sharedPreferences.setString("llpDFstrLLPowner1FirstName",
          businessTypeAddressCredential.strLLPowner1FirstName);
    }
    if (businessTypeAddressCredential.strLLPowner1LastName != null) {
      sharedPreferences.setString("llpDFstrLLPowner1LastName",
          businessTypeAddressCredential.strLLPowner1LastName);
    }
    if (businessTypeAddressCredential.strTitleLLPowner2 != null) {
      sharedPreferences.setString("llpDFstrTitleLLPowner2",
          businessTypeAddressCredential.strTitleLLPowner2);
    }
    if (businessTypeAddressCredential.strLLPowner2FirstName != null) {
      sharedPreferences.setString("llpDFstrLLPowner2FirstName",
          businessTypeAddressCredential.strLLPowner2FirstName);
    }
    if (businessTypeAddressCredential.strLLPowner2LastName != null) {
      sharedPreferences.setString("llpDFstrLLPowner2LastName",
          businessTypeAddressCredential.strLLPowner2LastName);
    }
  }

  static void clearDFLLPBusiness() async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString("llpDFstrTitleLLPowner1", null);
  }

  ///llp Business<Add-Prosp> getMethod
  static Future<LLPBusinessCredential> getLLPBusinessTypeAdd() async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();

    String strTitleLLPowner1 = preferences.getString("llpDFstrTitleLLPowner1");
    String strLLPowner1FirstName =
        preferences.getString("llpDFstrLLPowner1FirstName");
    String strLLPowner1LastName =
        preferences.getString("llpDFstrLLPowner1LastName");
    String strTitleLLPowner2 = preferences.getString("llpDFstrTitleLLPowner2");
    String strLLPowner2FirstName =
        preferences.getString("llpDFstrLLPowner2FirstName");
    String strLLPowner2LastName =
        preferences.getString("llpDFstrLLPowner2LastName");

    print('#####LLP--OwnerShip Details....$strTitleLLPowner1');
    return new LLPBusinessCredential(
      strTitleLLPowner1: strTitleLLPowner1,
      strLLPowner1FirstName: strLLPowner1FirstName,
      strLLPowner1LastName: strLLPowner1LastName,
      strTitleLLPowner2: strTitleLLPowner2,
      strLLPowner2FirstName: strLLPowner2FirstName,
      strLLPowner2LastName: strLLPowner2LastName,
    );
  }

  /// llc Business<Add-Prosp> set
  static void setLLCBusinessTypeAdd(
      LLCBusinessCredential businessTypeAddressCredential) async {
    print(businessTypeAddressCredential.toJson());
    print(businessTypeAddressCredential.strLLcowner1FirstName);

    final sharedPreferences = await SharedPreferences.getInstance();

    if (businessTypeAddressCredential.strTitleLLcowner1 != null) {
      sharedPreferences.setString("llcDFstrTitleLLcowner1",
          businessTypeAddressCredential.strTitleLLcowner1);
    }
    if (businessTypeAddressCredential.strLLcowner1FirstName != null) {
      sharedPreferences.setString("llcDFstrLLcowner1FirstName",
          businessTypeAddressCredential.strLLcowner1FirstName);
    }
    if (businessTypeAddressCredential.strLLcowner1LastName != null) {
      sharedPreferences.setString("llcDFstrLLcowner1LastName",
          businessTypeAddressCredential.strLLcowner1LastName);
    }
    if (businessTypeAddressCredential.strTitleLLcowner2 != null) {
      sharedPreferences.setString("llcDFstrTitleLLcowner2",
          businessTypeAddressCredential.strTitleLLcowner2);
    }
    if (businessTypeAddressCredential.strLLcowner2FirstName != null) {
      sharedPreferences.setString("llcDFstrLLcowner2FirstName",
          businessTypeAddressCredential.strLLcowner2FirstName);
    }
    if (businessTypeAddressCredential.strLLcowner2LastName != null) {
      sharedPreferences.setString("llcDFstrLLcowner2LastName",
          businessTypeAddressCredential.strLLcowner2LastName);
    }
  }

  static void clearDFLLCBusiness() async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString("llcDFstrTitleLLcowner1", null);
  }

  ///llc Business<Add-Prosp> getMethod
  static Future<LLCBusinessCredential> getLLCBusinessTypeAdd() async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();

    String strTitleLLcowner1 = preferences.getString("llcDFstrTitleLLcowner1");
    String strLLcowner1FirstName =
        preferences.getString("llcDFstrLLcowner1FirstName");
    String strLLcowner1LastName =
        preferences.getString("llcDFstrLLcowner1LastName");
    String strTitleLLcowner2 = preferences.getString("llcDFstrTitleLLcowner2");
    String strLLcowner2FirstName =
        preferences.getString("llcDFstrLLcowner2FirstName");
    String strLLcowner2LastName =
        preferences.getString("llcDFstrLLcowner2LastName");

    print('#####LLP--OwnerShip Details....$strTitleLLcowner1');
    return new LLCBusinessCredential(
      strTitleLLcowner1: strTitleLLcowner1,
      strLLcowner1FirstName: strLLcowner1FirstName,
      strLLcowner1LastName: strLLcowner1LastName,
      strTitleLLcowner2: strTitleLLcowner2,
      strLLcowner2FirstName: strLLcowner2FirstName,
      strLLcowner2LastName: strLLcowner2LastName,
    );
  }

  /// Sole Business<Add-Prosp> set
  static void setSoleBusinessTypeAdd(
      SoleBusinessCredential businessTypeAddressCredential) async {
    print(businessTypeAddressCredential.toJson());
    print(businessTypeAddressCredential.home_Address);

    final sharedPreferences = await SharedPreferences.getInstance();

    if (businessTypeAddressCredential.strTitleQwner1 != null) {
      sharedPreferences.setString(
          "soleDFstrTitleQwner1", businessTypeAddressCredential.strTitleQwner1);
    }
    if (businessTypeAddressCredential.firstName != null) {
      sharedPreferences.setString(
          "soleDFfirstName", businessTypeAddressCredential.firstName);
    }
    if (businessTypeAddressCredential.lastName != null) {
      sharedPreferences.setString(
          "soleDFlastName", businessTypeAddressCredential.lastName);
    }
    if (businessTypeAddressCredential.strTitleDirector2 != null) {
      sharedPreferences.setString("soleDFstrTitleDirector2",
          businessTypeAddressCredential.strTitleDirector2);
    }
    if (businessTypeAddressCredential.strDirector2Firstname != null) {
      sharedPreferences.setString("soleDFstrDirector2Firstname",
          businessTypeAddressCredential.strDirector2Firstname);
    }
    if (businessTypeAddressCredential.strDirector2Lastname != null) {
      sharedPreferences.setString("soleDFstrDirector2Lastname",
          businessTypeAddressCredential.strDirector2Lastname);
    }
    if (businessTypeAddressCredential.strDobOwner1 != null) {
      sharedPreferences.setString(
          "soleDFstrDobOwner1", businessTypeAddressCredential.strDobOwner1);
    }
    if (businessTypeAddressCredential.home_Address != null) {
      sharedPreferences.setString(
          "soleDFhome_Address", businessTypeAddressCredential.home_Address);
    }
    if (businessTypeAddressCredential.home_Address2 != null) {
      sharedPreferences.setString(
          "soleDFhome_Address2", businessTypeAddressCredential.home_Address2);
    }
    if (businessTypeAddressCredential.strHomeAdressPostCode != null) {
      sharedPreferences.setString("soleDFstrHomeAdressPostCode",
          businessTypeAddressCredential.strHomeAdressPostCode);
    }
    if (businessTypeAddressCredential.strHomeAdressCity != null) {
      sharedPreferences.setString("soleDFstrHomeAdressCity",
          businessTypeAddressCredential.strHomeAdressCity);
    }
    if (businessTypeAddressCredential.strHomeaddressLiveYear != null) {
      sharedPreferences.setString("soleDFstrHomeaddressLiveYear",
          businessTypeAddressCredential.strHomeaddressLiveYear);
    }
    if (businessTypeAddressCredential.strHomeaddressLiveMonth != null) {
      sharedPreferences.setString("soleDFstrHomeaddressLiveMonth",
          businessTypeAddressCredential.strHomeaddressLiveMonth);
    }
    if (businessTypeAddressCredential.strHomeaddress1 != null) {
      sharedPreferences.setString("soleDFstrHomeaddress1",
          businessTypeAddressCredential.strHomeaddress1);
    }
    if (businessTypeAddressCredential.strHomeaddress2 != null) {
      sharedPreferences.setString("soleDFstrHomeaddress2",
          businessTypeAddressCredential.strHomeaddress2);
    }
    if (businessTypeAddressCredential.strHomeaddressCity1 != null) {
      sharedPreferences.setString("soleDFstrHomeaddressCity1",
          businessTypeAddressCredential.strHomeaddressCity1);
    }
    if (businessTypeAddressCredential.strHomeaddressPostCode1 != null) {
      sharedPreferences.setString("soleDFstrHomeaddressPostCode1",
          businessTypeAddressCredential.strHomeaddressPostCode1);
    }
    if (businessTypeAddressCredential.strHomeaddressLiveYear1 != null) {
      sharedPreferences.setString("soleDFstrHomeaddressLiveYear1",
          businessTypeAddressCredential.strHomeaddressLiveYear1);
    }
    if (businessTypeAddressCredential.strHomeaddressLiveMonth1 != null) {
      sharedPreferences.setString("soleDFstrHomeaddressLiveMonth1",
          businessTypeAddressCredential.strHomeaddressLiveMonth1);
    }
    if (businessTypeAddressCredential.strHomeaddress3 != null) {
      sharedPreferences.setString("soleDFstrHomeaddress3",
          businessTypeAddressCredential.strHomeaddress3);
    }
    if (businessTypeAddressCredential.strHomeaddress4 != null) {
      sharedPreferences.setString("soleDFstrHomeaddress4",
          businessTypeAddressCredential.strHomeaddress4);
    }
    if (businessTypeAddressCredential.strHomeaddressCity2 != null) {
      sharedPreferences.setString("soleDFstrHomeaddressCity2",
          businessTypeAddressCredential.strHomeaddressCity2);
    }
    if (businessTypeAddressCredential.strHomeaddressPostCode2 != null) {
      sharedPreferences.setString("soleDFstrHomeaddressPostCode2",
          businessTypeAddressCredential.strHomeaddressPostCode2);
    }
    if (businessTypeAddressCredential.strHomeaddressPostLiveYear2 != null) {
      sharedPreferences.setString("soleDFstrHomeaddressPostLiveYear2",
          businessTypeAddressCredential.strHomeaddressPostLiveYear2);
    }
    if (businessTypeAddressCredential.strHomeaddressPostLiveMonth2 != null) {
      sharedPreferences.setString("soleDFstrHomeaddressPostLiveMonth2",
          businessTypeAddressCredential.strHomeaddressPostLiveMonth2);
    }
    if (businessTypeAddressCredential.strHomeaddress5 != null) {
      sharedPreferences.setString("soleDFstrHomeaddress5",
          businessTypeAddressCredential.strHomeaddress5);
    }
    if (businessTypeAddressCredential.strHomeaddress6 != null) {
      sharedPreferences.setString("soleDFstrHomeaddress6",
          businessTypeAddressCredential.strHomeaddress6);
    }
    if (businessTypeAddressCredential.strHomeaddressCity3 != null) {
      sharedPreferences.setString("soleDFstrHomeaddressCity3",
          businessTypeAddressCredential.strHomeaddressCity3);
    }
    if (businessTypeAddressCredential.strHomeaddressPostCode3 != null) {
      sharedPreferences.setString("soleDFstrHomeaddressPostCode3",
          businessTypeAddressCredential.strHomeaddressPostCode3);
    }
    if (businessTypeAddressCredential.strHomeaddressLiveYear3 != null) {
      sharedPreferences.setString("soleDFstrHomeaddressLiveYear3",
          businessTypeAddressCredential.strHomeaddressLiveYear3);
    }
    if (businessTypeAddressCredential.strHomeaddressLivemonth3 != null) {
      sharedPreferences.setString("soleDFstrHomeaddressLivemonth3",
          businessTypeAddressCredential.strHomeaddressLivemonth3);
    }
    if (businessTypeAddressCredential.strHomeaddress7 != null) {
      sharedPreferences.setString("soleDFstrHomeaddress7",
          businessTypeAddressCredential.strHomeaddress7);
    }
    if (businessTypeAddressCredential.strHomeaddress8 != null) {
      sharedPreferences.setString("soleDFstrHomeaddress8",
          businessTypeAddressCredential.strHomeaddress8);
    }
    if (businessTypeAddressCredential.strHomeaddressCity4 != null) {
      sharedPreferences.setString("soleDFstrHomeaddressCity4",
          businessTypeAddressCredential.strHomeaddressCity4);
    }
    if (businessTypeAddressCredential.strHomeaddressPostCode4 != null) {
      sharedPreferences.setString("soleDFstrHomeaddressPostCode4",
          businessTypeAddressCredential.strHomeaddressPostCode4);
    }
    if (businessTypeAddressCredential.strHomeaddressLiveYear4 != null) {
      sharedPreferences.setString("soleDFstrHomeaddressLiveYear4",
          businessTypeAddressCredential.strHomeaddressLiveYear4);
    }
    if (businessTypeAddressCredential.strHomeaddressLiveMonth4 != null) {
      sharedPreferences.setString("soleDFstrHomeaddressLiveMonth4",
          businessTypeAddressCredential.strHomeaddressLiveMonth4);
    }
    if (businessTypeAddressCredential.strHomeaddress9 != null) {
      sharedPreferences.setString("soleDFstrHomeaddress9",
          businessTypeAddressCredential.strHomeaddress9);
    }
    if (businessTypeAddressCredential.strHomeaddress10 != null) {
      sharedPreferences.setString("soleDFstrHomeaddress10",
          businessTypeAddressCredential.strHomeaddress10);
    }
    if (businessTypeAddressCredential.strHomeaddressCity5 != null) {
      sharedPreferences.setString("soleDFstrHomeaddressCity5",
          businessTypeAddressCredential.strHomeaddressCity5);
    }
    if (businessTypeAddressCredential.strHomeaddressPostCode5 != null) {
      sharedPreferences.setString("soleDFstrHomeaddressPostCode5",
          businessTypeAddressCredential.strHomeaddressPostCode5);
    }
    if (businessTypeAddressCredential.strHomeaddressLiveYear5 != null) {
      sharedPreferences.setString("soleDFstrHomeaddressLiveYear5",
          businessTypeAddressCredential.strHomeaddressLiveYear5);
    }
    if (businessTypeAddressCredential.strHomeaddressLiveMonth5owner != null) {
      sharedPreferences.setString("soleDFstrHomeaddressLiveMonth5owner",
          businessTypeAddressCredential.strHomeaddressLiveMonth5owner);
    }
  }

  static void clearDFSoleBusiness() async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString("soleDFstrTitleQwner1", null);
  }

  ///Sole Business<Add-Prosp> getMethod
  static Future<SoleBusinessCredential> getSoleBusinessTypeAdd() async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();

    String strTitleQwner1 = preferences.getString("soleDFstrTitleQwner1");
    String firstName = preferences.getString("soleDFfirstName");
    String lastName = preferences.getString("soleDFlastName");
    String strTitleDirector2 = preferences.getString("soleDFstrTitleDirector2");
    String strDirector2Firstname =
        preferences.getString("soleDFstrDirector2Firstname");
    String strDirector2Lastname =
        preferences.getString("soleDFstrDirector2Lastname");
    String strDobOwner1 = preferences.getString("soleDFstrDobOwner1");
    String home_Address = preferences.getString("soleDFhome_Address");
    String home_Address2 = preferences.getString("soleDFhome_Address2");
    String strHomeAdressPostCode =
        preferences.getString("soleDFstrHomeAdressPostCode");
    String strHomeAdressCity = preferences.getString("soleDFstrHomeAdressCity");
    String strHomeaddressLiveYear =
        preferences.getString("soleDFstrHomeaddressLiveYear");
    String strHomeaddressLiveMonth =
        preferences.getString("soleDFstrHomeaddressLiveMonth");
    String strHomeaddress1 = preferences.getString("soleDFstrHomeaddress1");
    String strHomeaddress2 = preferences.getString("soleDFstrHomeaddress2");
    String strHomeaddressCity1 =
        preferences.getString("soleDFstrHomeaddressCity1");
    String strHomeaddressPostCode1 =
        preferences.getString("soleDFstrHomeaddressPostCode1");
    String strHomeaddressLiveYear1 =
        preferences.getString("soleDFstrHomeaddressLiveYear1");
    String strHomeaddressLiveMonth1 =
        preferences.getString("soleDFstrHomeaddressLiveMonth1");
    String strHomeaddress3 = preferences.getString("soleDFstrHomeaddress3");
    String strHomeaddress4 = preferences.getString("soleDFstrHomeaddress4");
    String strHomeaddressCity2 =
        preferences.getString("soleDFstrHomeaddressCity2");
    String strHomeaddressPostCode2 =
        preferences.getString("soleDFstrHomeaddressPostCode2");
    String strHomeaddressPostLiveYear2 =
        preferences.getString("soleDFstrHomeaddressPostLiveYear2");
    String strHomeaddressPostLiveMonth2 =
        preferences.getString("soleDFstrHomeaddressPostLiveMonth2");
    String strHomeaddress5 = preferences.getString("soleDFstrHomeaddress5");
    String strHomeaddress6 = preferences.getString("soleDFstrHomeaddress6");
    String strHomeaddressCity3 =
        preferences.getString("soleDFstrHomeaddressCity3");
    String strHomeaddressPostCode3 =
        preferences.getString("soleDFstrHomeaddressPostCode3");
    String strHomeaddressLiveYear3 =
        preferences.getString("soleDFstrHomeaddressLiveYear3");
    String strHomeaddressLivemonth3 =
        preferences.getString("soleDFstrHomeaddressLivemonth3");
    String strHomeaddress7 = preferences.getString("soleDFstrHomeaddress7");
    String strHomeaddress8 = preferences.getString("soleDFstrHomeaddress8");
    String strHomeaddressCity4 =
        preferences.getString("soleDFstrHomeaddressCity4");
    String strHomeaddressPostCode4 =
        preferences.getString("soleDFstrHomeaddressPostCode4");
    String strHomeaddressLiveYear4 =
        preferences.getString("soleDFstrHomeaddressLiveYear4");
    String strHomeaddressLiveMonth4 =
        preferences.getString("soleDFstrHomeaddressLiveMonth4");
    String strHomeaddress9 = preferences.getString("soleDFstrHomeaddress9");
    String strHomeaddress10 = preferences.getString("soleDFstrHomeaddress10");
    String strHomeaddressCity5 =
        preferences.getString("soleDFstrHomeaddressCity5");
    String strHomeaddressPostCode5 =
        preferences.getString("soleDFstrHomeaddressPostCode5");
    String strHomeaddressLiveYear5 =
        preferences.getString("soleDFstrHomeaddressLiveYear5");
    String strHomeaddressLiveMonth5owner =
        preferences.getString("soleDFstrHomeaddressLiveMonth5owner");

    print('#####Sole--OwnerShip Details....$strTitleQwner1');
    return new SoleBusinessCredential(
      strTitleQwner1: strTitleQwner1,
      firstName: firstName,
      lastName: lastName,
      strTitleDirector2: strTitleDirector2,
      strDirector2Firstname: strDirector2Firstname,
      strDirector2Lastname: strDirector2Lastname,
      strDobOwner1: strDobOwner1,
      home_Address: home_Address,
      home_Address2: home_Address2,
      strHomeAdressPostCode: strHomeAdressPostCode,
      strHomeAdressCity: strHomeAdressCity,
      strHomeaddressLiveYear: strHomeaddressLiveYear,
      strHomeaddressLiveMonth: strHomeaddressLiveMonth,
      strHomeaddress1: strHomeaddress1,
      strHomeaddress2: strHomeaddress2,
      strHomeaddressCity1: strHomeaddressCity1,
      strHomeaddressPostCode1: strHomeaddressPostCode1,
      strHomeaddressLiveYear1: strHomeaddressLiveYear1,
      strHomeaddressLiveMonth1: strHomeaddressLiveMonth1,
      strHomeaddress3: strHomeaddress3,
      strHomeaddress4: strHomeaddress4,
      strHomeaddressCity2: strHomeaddressCity2,
      strHomeaddressPostCode2: strHomeaddressPostCode2,
      strHomeaddressPostLiveYear2: strHomeaddressPostLiveYear2,
      strHomeaddressPostLiveMonth2: strHomeaddressPostLiveMonth2,
      strHomeaddress5: strHomeaddress5,
      strHomeaddress6: strHomeaddress6,
      strHomeaddressCity3: strHomeaddressCity3,
      strHomeaddressPostCode3: strHomeaddressPostCode3,
      strHomeaddressLiveYear3: strHomeaddressLiveYear3,
      strHomeaddressLivemonth3: strHomeaddressLivemonth3,
      strHomeaddress7: strHomeaddress7,
      strHomeaddress8: strHomeaddress8,
      strHomeaddressCity4: strHomeaddressCity4,
      strHomeaddressPostCode4: strHomeaddressPostCode4,
      strHomeaddressLiveYear4: strHomeaddressLiveYear4,
      strHomeaddressLiveMonth4: strHomeaddressLiveMonth4,
      strHomeaddress9: strHomeaddress9,
      strHomeaddress10: strHomeaddress10,
      strHomeaddressCity5: strHomeaddressCity5,
      strHomeaddressPostCode5: strHomeaddressPostCode5,
      strHomeaddressLiveYear5: strHomeaddressLiveYear5,
      strHomeaddressLiveMonth5owner: strHomeaddressLiveMonth5owner,
    );
  }

  /// Partner Business<Add-Prosp> set
  static void setPartnerShipBusinessTypeAdd(
      PartnerShipBusinessCredential businessTypeAddressCredential) async {
    print(businessTypeAddressCredential.toJson());
    print(businessTypeAddressCredential.dfhome_Address);

    final sharedPreferences = await SharedPreferences.getInstance();

    if (businessTypeAddressCredential.dfstrTitleQwner1 != null) {
      sharedPreferences.setString("partnerDFstrTitleQwner1",
          businessTypeAddressCredential.dfstrTitleQwner1);
    }
    if (businessTypeAddressCredential.dffirstName != null) {
      sharedPreferences.setString(
          "partnerDFfirstName", businessTypeAddressCredential.dffirstName);
    }
    if (businessTypeAddressCredential.dflastName != null) {
      sharedPreferences.setString(
          "partnerDFlastName", businessTypeAddressCredential.dflastName);
    }
    if (businessTypeAddressCredential.dfstrTitleDirector2 != null) {
      sharedPreferences.setString("partnerDFstrTitleDirector2",
          businessTypeAddressCredential.dfstrTitleDirector2);
    }
    if (businessTypeAddressCredential.dfstrDirector2Firstname != null) {
      sharedPreferences.setString("partnerDFstrDirector2Firstname",
          businessTypeAddressCredential.dfstrDirector2Firstname);
    }
    if (businessTypeAddressCredential.dfstrDirector2Lastname != null) {
      sharedPreferences.setString("partnerDFstrDirector2Lastname",
          businessTypeAddressCredential.dfstrDirector2Lastname);
    }
    if (businessTypeAddressCredential.dfstrDobOwner1 != null) {
      sharedPreferences.setString("partnerDFstrDobOwner1",
          businessTypeAddressCredential.dfstrDobOwner1);
    }
    if (businessTypeAddressCredential.dfhome_Address != null) {
      sharedPreferences.setString("partnerDFhome_Address",
          businessTypeAddressCredential.dfhome_Address);
    }
    if (businessTypeAddressCredential.dfhome_Address2 != null) {
      sharedPreferences.setString("partnerDFhome_Address2",
          businessTypeAddressCredential.dfhome_Address2);
    }
    if (businessTypeAddressCredential.dfstrHomeAdressPostCode != null) {
      sharedPreferences.setString("partnerDFstrHomeAdressPostCode",
          businessTypeAddressCredential.dfstrHomeAdressPostCode);
    }
    if (businessTypeAddressCredential.dfstrHomeAdressCity != null) {
      sharedPreferences.setString("partnerDFstrHomeAdressCity",
          businessTypeAddressCredential.dfstrHomeAdressCity);
    }
    if (businessTypeAddressCredential.dfstrHomeaddressLiveYear != null) {
      sharedPreferences.setString("partnerDFstrHomeaddressLiveYear",
          businessTypeAddressCredential.dfstrHomeaddressLiveYear);
    }
    if (businessTypeAddressCredential.dfstrHomeaddressLiveMonth != null) {
      sharedPreferences.setString("partnerDFstrHomeaddressLiveMonth",
          businessTypeAddressCredential.dfstrHomeaddressLiveMonth);
    }
    if (businessTypeAddressCredential.dfstrHomeaddress1 != null) {
      sharedPreferences.setString("partnerDFstrHomeaddress1",
          businessTypeAddressCredential.dfstrHomeaddress1);
    }
    if (businessTypeAddressCredential.dfstrHomeaddress2 != null) {
      sharedPreferences.setString("partnerDFstrHomeaddress2",
          businessTypeAddressCredential.dfstrHomeaddress2);
    }
    if (businessTypeAddressCredential.dfstrHomeaddressCity1 != null) {
      sharedPreferences.setString("partnerDFstrHomeaddressCity1",
          businessTypeAddressCredential.dfstrHomeaddressCity1);
    }
    if (businessTypeAddressCredential.dfstrHomeaddressPostCode1 != null) {
      sharedPreferences.setString("partnerDFstrHomeaddressPostCode1",
          businessTypeAddressCredential.dfstrHomeaddressPostCode1);
    }
    if (businessTypeAddressCredential.dfstrHomeaddressLiveYear1 != null) {
      sharedPreferences.setString("partnerDFstrHomeaddressLiveYear1",
          businessTypeAddressCredential.dfstrHomeaddressLiveYear1);
    }
    if (businessTypeAddressCredential.dfstrHomeaddressLiveMonth1 != null) {
      sharedPreferences.setString("partnerDFstrHomeaddressLiveMonth1",
          businessTypeAddressCredential.dfstrHomeaddressLiveMonth1);
    }
    if (businessTypeAddressCredential.dfstrHomeaddress3 != null) {
      sharedPreferences.setString("partnerDFstrHomeaddress3",
          businessTypeAddressCredential.dfstrHomeaddress3);
    }
    if (businessTypeAddressCredential.dfstrHomeaddress4 != null) {
      sharedPreferences.setString("partnerDFstrHomeaddress4",
          businessTypeAddressCredential.dfstrHomeaddress4);
    }
    if (businessTypeAddressCredential.dfstrHomeaddressCity2 != null) {
      sharedPreferences.setString("partnerDFstrHomeaddressCity2",
          businessTypeAddressCredential.dfstrHomeaddressCity2);
    }
    if (businessTypeAddressCredential.dfstrHomeaddressPostCode2 != null) {
      sharedPreferences.setString("partnerDFstrHomeaddressPostCode2",
          businessTypeAddressCredential.dfstrHomeaddressPostCode2);
    }
    if (businessTypeAddressCredential.dfstrHomeaddressPostLiveYear2 != null) {
      sharedPreferences.setString("partnerDFstrHomeaddressPostLiveYear2",
          businessTypeAddressCredential.dfstrHomeaddressPostLiveYear2);
    }
    if (businessTypeAddressCredential.dfstrHomeaddressPostLiveMonth2 != null) {
      sharedPreferences.setString("partnerDFstrHomeaddressPostLiveMonth2",
          businessTypeAddressCredential.dfstrHomeaddressPostLiveMonth2);
    }
    if (businessTypeAddressCredential.dfstrHomeaddress5 != null) {
      sharedPreferences.setString("partnerDFstrHomeaddress5",
          businessTypeAddressCredential.dfstrHomeaddress5);
    }
    if (businessTypeAddressCredential.dfstrHomeaddress6 != null) {
      sharedPreferences.setString("partnerDFstrHomeaddress6",
          businessTypeAddressCredential.dfstrHomeaddress6);
    }
    if (businessTypeAddressCredential.dfstrHomeaddressCity3 != null) {
      sharedPreferences.setString("partnerDFstrHomeaddressCity3",
          businessTypeAddressCredential.dfstrHomeaddressCity3);
    }
    if (businessTypeAddressCredential.dfstrHomeaddressPostCode3 != null) {
      sharedPreferences.setString("partnerDFstrHomeaddressPostCode3",
          businessTypeAddressCredential.dfstrHomeaddressPostCode3);
    }
    if (businessTypeAddressCredential.dfstrHomeaddressLiveYear3 != null) {
      sharedPreferences.setString("partnerDFstrHomeaddressLiveYear3",
          businessTypeAddressCredential.dfstrHomeaddressLiveYear3);
    }
    if (businessTypeAddressCredential.dfstrHomeaddressLivemonth3 != null) {
      sharedPreferences.setString("partnerDFstrHomeaddressLivemonth3",
          businessTypeAddressCredential.dfstrHomeaddressLivemonth3);
    }
    if (businessTypeAddressCredential.dfstrHomeaddress7 != null) {
      sharedPreferences.setString("partnerDFstrHomeaddress7",
          businessTypeAddressCredential.dfstrHomeaddress7);
    }
    if (businessTypeAddressCredential.dfstrHomeaddress8 != null) {
      sharedPreferences.setString("partnerDFstrHomeaddress8",
          businessTypeAddressCredential.dfstrHomeaddress8);
    }
    if (businessTypeAddressCredential.dfstrHomeaddressCity4 != null) {
      sharedPreferences.setString("partnerDFstrHomeaddressCity4",
          businessTypeAddressCredential.dfstrHomeaddressCity4);
    }
    if (businessTypeAddressCredential.dfstrHomeaddressPostCode4 != null) {
      sharedPreferences.setString("partnerDFstrHomeaddressPostCode4",
          businessTypeAddressCredential.dfstrHomeaddressPostCode4);
    }
    if (businessTypeAddressCredential.dfstrHomeaddressLiveYear4 != null) {
      sharedPreferences.setString("partnerDFstrHomeaddressLiveYear4",
          businessTypeAddressCredential.dfstrHomeaddressLiveYear4);
    }
    if (businessTypeAddressCredential.dfstrHomeaddressLiveMonth4 != null) {
      sharedPreferences.setString("partnerDFstrHomeaddressLiveMonth4",
          businessTypeAddressCredential.dfstrHomeaddressLiveMonth4);
    }
    if (businessTypeAddressCredential.dfstrHomeaddress9 != null) {
      sharedPreferences.setString("partnerDFstrHomeaddress9",
          businessTypeAddressCredential.dfstrHomeaddress9);
    }
    if (businessTypeAddressCredential.dfstrHomeaddress10 != null) {
      sharedPreferences.setString("partnerDFstrHomeaddress10",
          businessTypeAddressCredential.dfstrHomeaddress10);
    }
    if (businessTypeAddressCredential.dfstrHomeaddressCity5 != null) {
      sharedPreferences.setString("partnerDFstrHomeaddressCity5",
          businessTypeAddressCredential.dfstrHomeaddressCity5);
    }
    if (businessTypeAddressCredential.dfstrHomeaddressPostCode5 != null) {
      sharedPreferences.setString("partnerDFstrHomeaddressPostCode5",
          businessTypeAddressCredential.dfstrHomeaddressPostCode5);
    }
    if (businessTypeAddressCredential.dfstrHomeaddressLiveYear5 != null) {
      sharedPreferences.setString("partnerDFstrHomeaddressLiveYear5",
          businessTypeAddressCredential.dfstrHomeaddressLiveYear5);
    }
    if (businessTypeAddressCredential.dfstrTitleQwner2 != null) {
      sharedPreferences.setString("partnerDFstrTitleQwner2",
          businessTypeAddressCredential.dfstrTitleQwner2);
    }
    if (businessTypeAddressCredential.dfstrFirstNameowner != null) {
      sharedPreferences.setString("partnerDFstrFirstNameowner",
          businessTypeAddressCredential.dfstrFirstNameowner);
    }
    if (businessTypeAddressCredential.dfstrLastNameowner != null) {
      sharedPreferences.setString("partnerDFstrLastNameowner",
          businessTypeAddressCredential.dfstrLastNameowner);
    }
    if (businessTypeAddressCredential.dfstrDobOwner2 != null) {
      sharedPreferences.setString("partnerDFstrDobOwner2",
          businessTypeAddressCredential.dfstrDobOwner2);
    }
    if (businessTypeAddressCredential.dfhome_Addressowner != null) {
      sharedPreferences.setString("partnerDFhome_Addressowner",
          businessTypeAddressCredential.dfhome_Addressowner);
    }
    if (businessTypeAddressCredential.dfhome_Address2owner != null) {
      sharedPreferences.setString("partnerDFhome_Address2owner",
          businessTypeAddressCredential.dfhome_Address2owner);
    }
    if (businessTypeAddressCredential.dfstrHomeAdressPostCodeowner != null) {
      sharedPreferences.setString("partnerDFstrHomeAdressPostCodeowner",
          businessTypeAddressCredential.dfstrHomeAdressPostCodeowner);
    }
    if (businessTypeAddressCredential.dfstrHomeAdressCityowner != null) {
      sharedPreferences.setString("partnerDFstrHomeAdressCityowner",
          businessTypeAddressCredential.dfstrHomeAdressCityowner);
    }
    if (businessTypeAddressCredential.dfstrHomeaddressLiveYearowner != null) {
      sharedPreferences.setString("partnerDFstrHomeaddressLiveYearowner",
          businessTypeAddressCredential.dfstrHomeaddressLiveYearowner);
    }
    if (businessTypeAddressCredential.dfstrHomeaddressLiveMonthowner != null) {
      sharedPreferences.setString("partnerDFstrHomeaddressLiveMonthowner",
          businessTypeAddressCredential.dfstrHomeaddressLiveMonthowner);
    }
    if (businessTypeAddressCredential.dfstrHomeaddress1owner != null) {
      sharedPreferences.setString("partnerDFstrHomeaddress1owner",
          businessTypeAddressCredential.dfstrHomeaddress1owner);
    }
    if (businessTypeAddressCredential.dfstrHomeaddress2owner != null) {
      sharedPreferences.setString("partnerDFstrHomeaddress2owner",
          businessTypeAddressCredential.dfstrHomeaddress2owner);
    }
    if (businessTypeAddressCredential.dfstrHomeaddressCity1owner != null) {
      sharedPreferences.setString("partnerDFstrHomeaddressCity1owner",
          businessTypeAddressCredential.dfstrHomeaddressCity1owner);
    }
    if (businessTypeAddressCredential.dfstrHomeaddressPostCode1owner != null) {
      sharedPreferences.setString("partnerDFstrHomeaddressPostCode1owner",
          businessTypeAddressCredential.dfstrHomeaddressPostCode1owner);
    }
    if (businessTypeAddressCredential.dfstrHomeaddressLiveYear1owner != null) {
      sharedPreferences.setString("partnerDFstrHomeaddressLiveYear1owner",
          businessTypeAddressCredential.dfstrHomeaddressLiveYear1owner);
    }
    if (businessTypeAddressCredential.dfstrHomeaddressLiveMonth1owner != null) {
      sharedPreferences.setString("partnerDFstrHomeaddressLiveMonth1owner",
          businessTypeAddressCredential.dfstrHomeaddressLiveMonth1owner);
    }
    if (businessTypeAddressCredential.dfstrHomeaddress3owner != null) {
      sharedPreferences.setString("partnerDFstrHomeaddress3owner",
          businessTypeAddressCredential.dfstrHomeaddress3owner);
    }
    if (businessTypeAddressCredential.dfstrHomeaddress4owner != null) {
      sharedPreferences.setString("partnerDFstrHomeaddress4owner",
          businessTypeAddressCredential.dfstrHomeaddress4owner);
    }
    if (businessTypeAddressCredential.dfstrHomeaddressCity2owner != null) {
      sharedPreferences.setString("partnerDFstrHomeaddressCity2owner",
          businessTypeAddressCredential.dfstrHomeaddressCity2owner);
    }
    if (businessTypeAddressCredential.dfstrHomeaddressPostCode2owner != null) {
      sharedPreferences.setString("partnerDFstrHomeaddressPostCode2owner",
          businessTypeAddressCredential.dfstrHomeaddressPostCode2owner);
    }
    if (businessTypeAddressCredential.dfstrHomeaddressPostLiveYear2owner !=
        null) {
      sharedPreferences.setString("partnerDFstrHomeaddressPostLiveYear2owner",
          businessTypeAddressCredential.dfstrHomeaddressPostLiveYear2owner);
    }
    if (businessTypeAddressCredential.dfstrHomeaddressPostLiveMonth2owner !=
        null) {
      sharedPreferences.setString("partnerDFstrHomeaddressPostLiveMonth2owner",
          businessTypeAddressCredential.dfstrHomeaddressPostLiveMonth2owner);
    }
    if (businessTypeAddressCredential.dfstrHomeaddress5owner != null) {
      sharedPreferences.setString("partnerDFstrHomeaddress5owner",
          businessTypeAddressCredential.dfstrHomeaddress5owner);
    }
    if (businessTypeAddressCredential.dfstrHomeaddress6owner != null) {
      sharedPreferences.setString("partnerDFstrHomeaddress6owner",
          businessTypeAddressCredential.dfstrHomeaddress6owner);
    }
    if (businessTypeAddressCredential.dfstrHomeaddressCity3owner != null) {
      sharedPreferences.setString("partnerDFstrHomeaddressCity3owner",
          businessTypeAddressCredential.dfstrHomeaddressCity3owner);
    }
    if (businessTypeAddressCredential.dfstrHomeaddressPostCode3owner != null) {
      sharedPreferences.setString("partnerDFstrHomeaddressPostCode3owner",
          businessTypeAddressCredential.dfstrHomeaddressPostCode3owner);
    }
    if (businessTypeAddressCredential.dfstrHomeaddressLiveYear3owner != null) {
      sharedPreferences.setString("partnerDFstrHomeaddressLiveYear3owner",
          businessTypeAddressCredential.dfstrHomeaddressLiveYear3owner);
    }
    if (businessTypeAddressCredential.dfstrHomeaddressLivemonth3owner != null) {
      sharedPreferences.setString("partnerDFstrHomeaddressLivemonth3owner",
          businessTypeAddressCredential.dfstrHomeaddressLivemonth3owner);
    }
    if (businessTypeAddressCredential.dfstrHomeaddress7owner != null) {
      sharedPreferences.setString("partnerDFstrHomeaddress7owner",
          businessTypeAddressCredential.dfstrHomeaddress7owner);
    }
    if (businessTypeAddressCredential.dfstrHomeaddress8owner != null) {
      sharedPreferences.setString("partnerDFstrHomeaddress8owner",
          businessTypeAddressCredential.dfstrHomeaddress8owner);
    }
    if (businessTypeAddressCredential.dfstrHomeaddressCity4owner != null) {
      sharedPreferences.setString("partnerDFstrHomeaddressCity4owner",
          businessTypeAddressCredential.dfstrHomeaddressCity4owner);
    }
    if (businessTypeAddressCredential.dfstrHomeaddressPostCode4owner != null) {
      sharedPreferences.setString("partnerDFstrHomeaddressPostCode4owner",
          businessTypeAddressCredential.dfstrHomeaddressPostCode4owner);
    }
    if (businessTypeAddressCredential.dfstrHomeaddressLiveYear4owner != null) {
      sharedPreferences.setString("partnerDFstrHomeaddressLiveYear4owner",
          businessTypeAddressCredential.dfstrHomeaddressLiveYear4owner);
    }
    if (businessTypeAddressCredential.dfstrHomeaddressLiveMonth4owner != null) {
      sharedPreferences.setString("partnerDFstrHomeaddressLiveMonth4owner",
          businessTypeAddressCredential.dfstrHomeaddressLiveMonth4owner);
    }
    if (businessTypeAddressCredential.dfstrHomeaddress9owner != null) {
      sharedPreferences.setString("partnerDFstrHomeaddress9owner",
          businessTypeAddressCredential.dfstrHomeaddress9owner);
    }
    if (businessTypeAddressCredential.dfstrHomeaddress10owner != null) {
      sharedPreferences.setString("partnerDFstrHomeaddress10owner",
          businessTypeAddressCredential.dfstrHomeaddress10owner);
    }
    if (businessTypeAddressCredential.dfstrHomeaddressCity5owner != null) {
      sharedPreferences.setString("partnerDFstrHomeaddressCity5owner",
          businessTypeAddressCredential.dfstrHomeaddressCity5owner);
    }
    if (businessTypeAddressCredential.dfstrHomeaddressPostCode5owner != null) {
      sharedPreferences.setString("partnerDFstrHomeaddressPostCode5owner",
          businessTypeAddressCredential.dfstrHomeaddressPostCode5owner);
    }
    if (businessTypeAddressCredential.dfstrHomeaddressLiveYear5owner != null) {
      sharedPreferences.setString("partnerDFstrHomeaddressLiveYear5owner",
          businessTypeAddressCredential.dfstrHomeaddressLiveYear5owner);
    }
    if (businessTypeAddressCredential.dfstrHomeaddressLiveMonth5owner != null) {
      sharedPreferences.setString("partnerDFstrHomeaddressLiveMonth5owner",
          businessTypeAddressCredential.dfstrHomeaddressLiveMonth5owner);
    }
    if (businessTypeAddressCredential.dfstrTitleQwner3 != null) {
      sharedPreferences.setString("partnerDFstrTitleQwner3",
          businessTypeAddressCredential.dfstrTitleQwner3);
    }
    if (businessTypeAddressCredential.dfstrFirstNameowner3 != null) {
      sharedPreferences.setString("partnerDFstrFirstNameowner3",
          businessTypeAddressCredential.dfstrFirstNameowner3);
    }
    if (businessTypeAddressCredential.dfstrLastNameowner3 != null) {
      sharedPreferences.setString("partnerDFstrLastNameowner3",
          businessTypeAddressCredential.dfstrLastNameowner3);
    }
    if (businessTypeAddressCredential.dfstrstrDobOwner3 != null) {
      sharedPreferences.setString("partnerDFstrstrDobOwner3",
          businessTypeAddressCredential.dfstrstrDobOwner3);
    }
    if (businessTypeAddressCredential.dfhome_Addressowner3 != null) {
      sharedPreferences.setString("partnerDFhome_Addressowner3",
          businessTypeAddressCredential.dfhome_Addressowner3);
    }
    if (businessTypeAddressCredential.dfhome_Address2owner3 != null) {
      sharedPreferences.setString("partnerDFhome_Address2owner3",
          businessTypeAddressCredential.dfhome_Address2owner3);
    }
    if (businessTypeAddressCredential.dfstrHomeAdressCityowner3 != null) {
      sharedPreferences.setString("partnerDFstrHomeAdressCityowner3",
          businessTypeAddressCredential.dfstrHomeAdressCityowner3);
    }
    if (businessTypeAddressCredential.dfstrHomeAdressPostCodeowner3 != null) {
      sharedPreferences.setString("partnerDFstrHomeAdressPostCodeowner3",
          businessTypeAddressCredential.dfstrHomeAdressPostCodeowner3);
    }
    if (businessTypeAddressCredential.dfstrHomeaddressLiveYearowner3 != null) {
      sharedPreferences.setString("partnerDFstrHomeaddressLiveYearowner3",
          businessTypeAddressCredential.dfstrHomeaddressLiveYearowner3);
    }
    if (businessTypeAddressCredential.dfstrHomeaddressLiveMonthowner3 != null) {
      sharedPreferences.setString("partnerDFstrHomeaddressLiveMonthowner3",
          businessTypeAddressCredential.dfstrHomeaddressLiveMonthowner3);
    }
    if (businessTypeAddressCredential.dfstrHomeaddress1owner3 != null) {
      sharedPreferences.setString("partnerDFstrHomeaddress1owner3",
          businessTypeAddressCredential.dfstrHomeaddress1owner3);
    }
    if (businessTypeAddressCredential.dfstrHomeaddress2owner3 != null) {
      sharedPreferences.setString("partnerDFstrHomeaddress2owner3",
          businessTypeAddressCredential.dfstrHomeaddress2owner3);
    }
    if (businessTypeAddressCredential.dfstrHomeaddressCity1owner3 != null) {
      sharedPreferences.setString("partnerDFstrHomeaddressCity1owner3",
          businessTypeAddressCredential.dfstrHomeaddressCity1owner3);
    }
    if (businessTypeAddressCredential.dfstrHomeaddressPostCode1owner3 != null) {
      sharedPreferences.setString("partnerDFstrHomeaddressPostCode1owner3",
          businessTypeAddressCredential.dfstrHomeaddressPostCode1owner3);
    }
    if (businessTypeAddressCredential.dfstrHomeaddressLiveYear1owner3 != null) {
      sharedPreferences.setString("partnerDFstrHomeaddressLiveYear1owner3",
          businessTypeAddressCredential.dfstrHomeaddressLiveYear1owner3);
    }
    if (businessTypeAddressCredential.dfstrHomeaddressLiveMonth1owner3 !=
        null) {
      sharedPreferences.setString("partnerDFstrHomeaddressLiveMonth1owner3",
          businessTypeAddressCredential.dfstrHomeaddressLiveMonth1owner3);
    }
    if (businessTypeAddressCredential.dfstrHomeaddress3owner3 != null) {
      sharedPreferences.setString("partnerDFstrHomeaddress3owner3",
          businessTypeAddressCredential.dfstrHomeaddress3owner3);
    }
    if (businessTypeAddressCredential.dfstrHomeaddress4owner3 != null) {
      sharedPreferences.setString("partnerDFstrHomeaddress4owner3",
          businessTypeAddressCredential.dfstrHomeaddress4owner3);
    }
    if (businessTypeAddressCredential.dfstrHomeaddressCity2owner3 != null) {
      sharedPreferences.setString("partnerDFstrHomeaddressCity2owner3",
          businessTypeAddressCredential.dfstrHomeaddressCity2owner3);
    }
    if (businessTypeAddressCredential.dfstrHomeaddressPostCode2owner3 != null) {
      sharedPreferences.setString("partnerDFstrHomeaddressPostCode2owner3",
          businessTypeAddressCredential.dfstrHomeaddressPostCode2owner3);
    }
    if (businessTypeAddressCredential.dfstrHomeaddressPostLiveYear2owner3 !=
        null) {
      sharedPreferences.setString("partnerDFstrHomeaddressPostLiveYear2owner3",
          businessTypeAddressCredential.dfstrHomeaddressPostLiveYear2owner3);
    }
    if (businessTypeAddressCredential.dfstrHomeaddressPostLiveMonth2owner3 !=
        null) {
      sharedPreferences.setString("partnerDFstrHomeaddressPostLiveMonth2owner3",
          businessTypeAddressCredential.dfstrHomeaddressPostLiveMonth2owner3);
    }
    if (businessTypeAddressCredential.dfstrHomeaddress5owner3 != null) {
      sharedPreferences.setString("partnerDFstrHomeaddress5owner3",
          businessTypeAddressCredential.dfstrHomeaddress5owner3);
    }
    if (businessTypeAddressCredential.dfstrHomeaddress6owner3 != null) {
      sharedPreferences.setString("partnerDFstrHomeaddress6owner3",
          businessTypeAddressCredential.dfstrHomeaddress6owner3);
    }
    if (businessTypeAddressCredential.dfstrHomeaddressCity3owner3 != null) {
      sharedPreferences.setString("partnerDFstrHomeaddressCity3owner3",
          businessTypeAddressCredential.dfstrHomeaddressCity3owner3);
    }
    if (businessTypeAddressCredential.dfstrHomeaddressPostCode3owner3 != null) {
      sharedPreferences.setString("partnerDFstrHomeaddressPostCode3owner3",
          businessTypeAddressCredential.dfstrHomeaddressPostCode3owner3);
    }
    if (businessTypeAddressCredential.dfstrHomeaddressLiveYear3owner3 != null) {
      sharedPreferences.setString("partnerDFstrHomeaddressLiveYear3owner3",
          businessTypeAddressCredential.dfstrHomeaddressLiveYear3owner3);
    }
    if (businessTypeAddressCredential.dfstrHomeaddressLivemonth3owner3 !=
        null) {
      sharedPreferences.setString("partnerDFstrHomeaddressLivemonth3owner3",
          businessTypeAddressCredential.dfstrHomeaddressLivemonth3owner3);
    }
    if (businessTypeAddressCredential.dfstrHomeaddress7owner3 != null) {
      sharedPreferences.setString("partnerDFstrHomeaddress7owner3",
          businessTypeAddressCredential.dfstrHomeaddress7owner3);
    }
    if (businessTypeAddressCredential.dfstrHomeaddress8owner3 != null) {
      sharedPreferences.setString("partnerDFstrHomeaddress8owner3",
          businessTypeAddressCredential.dfstrHomeaddress8owner3);
    }
    if (businessTypeAddressCredential.dfstrHomeaddressCity4owner3 != null) {
      sharedPreferences.setString("partnerDFstrHomeaddressCity4owner3",
          businessTypeAddressCredential.dfstrHomeaddressCity4owner3);
    }
    if (businessTypeAddressCredential.dfstrHomeaddressPostCode4owner3 != null) {
      sharedPreferences.setString("partnerDFstrHomeaddressPostCode4owner3",
          businessTypeAddressCredential.dfstrHomeaddressPostCode4owner3);
    }
    if (businessTypeAddressCredential.dfstrHomeaddressLiveYear4owner3 != null) {
      sharedPreferences.setString("partnerDFstrHomeaddressLiveYear4owner3",
          businessTypeAddressCredential.dfstrHomeaddressLiveYear4owner3);
    }
    if (businessTypeAddressCredential.dfstrHomeaddressLiveMonth4owner3 !=
        null) {
      sharedPreferences.setString("partnerDFstrHomeaddressLiveMonth4owner3",
          businessTypeAddressCredential.dfstrHomeaddressLiveMonth4owner3);
    }
    if (businessTypeAddressCredential.dfstrHomeaddress9owner3 != null) {
      sharedPreferences.setString("partnerDFstrHomeaddress9owner3",
          businessTypeAddressCredential.dfstrHomeaddress9owner3);
    }
    if (businessTypeAddressCredential.dfstrHomeaddress10owner3 != null) {
      sharedPreferences.setString("partnerDFstrHomeaddress10owner3",
          businessTypeAddressCredential.dfstrHomeaddress10owner3);
    }
    if (businessTypeAddressCredential.dfstrHomeaddressCity5owner3 != null) {
      sharedPreferences.setString("partnerDFstrHomeaddressCity5owner3",
          businessTypeAddressCredential.dfstrHomeaddressCity5owner3);
    }
    if (businessTypeAddressCredential.dfstrHomeaddressPostCode5owner3 != null) {
      sharedPreferences.setString("partnerDFstrHomeaddressPostCode5owner3",
          businessTypeAddressCredential.dfstrHomeaddressPostCode5owner3);
    }
    if (businessTypeAddressCredential.dfstrHomeaddressLiveYear5owner3 != null) {
      sharedPreferences.setString("partnerDFstrHomeaddressLiveYear5owner3",
          businessTypeAddressCredential.dfstrHomeaddressLiveYear5owner3);
    }
    if (businessTypeAddressCredential.dfstrHomeaddressLiveMonth5owner3 !=
        null) {
      sharedPreferences.setString("partnerDFstrHomeaddressLiveMonth5owner3",
          businessTypeAddressCredential.dfstrHomeaddressLiveMonth5owner3);
    }
    if (businessTypeAddressCredential.dfstrTitleQwner4 != null) {
      sharedPreferences.setString("partnerDFstrTitleQwner4",
          businessTypeAddressCredential.dfstrTitleQwner4);
    }
    if (businessTypeAddressCredential.dfstrFirstNameowner4 != null) {
      sharedPreferences.setString("partnerDFstrFirstNameowner4",
          businessTypeAddressCredential.dfstrFirstNameowner4);
    }
    if (businessTypeAddressCredential.dfstrLastNameowner4 != null) {
      sharedPreferences.setString("partnerDFstrLastNameowner4",
          businessTypeAddressCredential.dfstrLastNameowner4);
    }
    if (businessTypeAddressCredential.dfstrstrDobOwner4 != null) {
      sharedPreferences.setString("partnerDFstrstrDobOwner4",
          businessTypeAddressCredential.dfstrstrDobOwner4);
    }
    if (businessTypeAddressCredential.dfhome_Addressowner4 != null) {
      sharedPreferences.setString("partnerDFhome_Addressowner4",
          businessTypeAddressCredential.dfhome_Addressowner4);
    }
    if (businessTypeAddressCredential.dfhome_Address2owner4 != null) {
      sharedPreferences.setString("partnerDFhome_Address2owner4",
          businessTypeAddressCredential.dfhome_Address2owner4);
    }
    if (businessTypeAddressCredential.dfstrHomeAdressCityowner4 != null) {
      sharedPreferences.setString("partnerDFstrHomeAdressCityowner4",
          businessTypeAddressCredential.dfstrHomeAdressCityowner4);
    }
    if (businessTypeAddressCredential.dfstrHomeAdressPostCodeowner4 != null) {
      sharedPreferences.setString("partnerDFstrHomeAdressPostCodeowner4",
          businessTypeAddressCredential.dfstrHomeAdressPostCodeowner4);
    }
    if (businessTypeAddressCredential.dfstrHomeaddressLiveYearowner4 != null) {
      sharedPreferences.setString("partnerDFstrHomeaddressLiveYearowner4",
          businessTypeAddressCredential.dfstrHomeaddressLiveYearowner4);
    }
    if (businessTypeAddressCredential.dfstrHomeaddressLiveMonthowner4 != null) {
      sharedPreferences.setString("partnerDFstrHomeaddressLiveMonthowner4",
          businessTypeAddressCredential.dfstrHomeaddressLiveMonthowner4);
    }
    if (businessTypeAddressCredential.dfstrHomeaddress1owner4 != null) {
      sharedPreferences.setString("partnerDFstrHomeaddress1owner4",
          businessTypeAddressCredential.dfstrHomeaddress1owner4);
    }
    if (businessTypeAddressCredential.dfstrHomeaddress2owner4 != null) {
      sharedPreferences.setString("partnerDFstrHomeaddress2owner4",
          businessTypeAddressCredential.dfstrHomeaddress2owner4);
    }
    if (businessTypeAddressCredential.dfstrHomeaddressCity1owner4 != null) {
      sharedPreferences.setString("partnerDFstrHomeaddressCity1owner4",
          businessTypeAddressCredential.dfstrHomeaddressCity1owner4);
    }
    if (businessTypeAddressCredential.dfstrHomeaddressPostCode1owner4 != null) {
      sharedPreferences.setString("partnerDFstrHomeaddressPostCode1owner4",
          businessTypeAddressCredential.dfstrHomeaddressPostCode1owner4);
    }
    if (businessTypeAddressCredential.dfstrHomeaddressLiveYear1owner4 != null) {
      sharedPreferences.setString("partnerDFstrHomeaddressLiveYear1owner4",
          businessTypeAddressCredential.dfstrHomeaddressLiveYear1owner4);
    }
    if (businessTypeAddressCredential.dfstrHomeaddressLiveMonth1owner4 !=
        null) {
      sharedPreferences.setString("partnerDFstrHomeaddressLiveMonth1owner4",
          businessTypeAddressCredential.dfstrHomeaddressLiveMonth1owner4);
    }
    if (businessTypeAddressCredential.dfstrHomeaddress3owner4 != null) {
      sharedPreferences.setString("partnerDFstrHomeaddress3owner4",
          businessTypeAddressCredential.dfstrHomeaddress3owner4);
    }
    if (businessTypeAddressCredential.dfstrHomeaddress4owner4 != null) {
      sharedPreferences.setString("partnerDFstrHomeaddress4owner4",
          businessTypeAddressCredential.dfstrHomeaddress4owner4);
    }
    if (businessTypeAddressCredential.dfstrHomeaddressCity2owner4 != null) {
      sharedPreferences.setString("partnerDFstrHomeaddressCity2owner4",
          businessTypeAddressCredential.dfstrHomeaddressCity2owner4);
    }
    if (businessTypeAddressCredential.dfstrHomeaddressPostCode2owner4 != null) {
      sharedPreferences.setString("partnerDFstrHomeaddressPostCode2owner4",
          businessTypeAddressCredential.dfstrHomeaddressPostCode2owner4);
    }
    if (businessTypeAddressCredential.dfstrHomeaddressPostLiveYear2owner4 !=
        null) {
      sharedPreferences.setString("partnerDFstrHomeaddressPostLiveYear2owner4",
          businessTypeAddressCredential.dfstrHomeaddressPostLiveYear2owner4);
    }
    if (businessTypeAddressCredential.dfstrHomeaddressPostLiveMonth2owner4 !=
        null) {
      sharedPreferences.setString("partnerDFstrHomeaddressPostLiveMonth2owner4",
          businessTypeAddressCredential.dfstrHomeaddressPostLiveMonth2owner4);
    }
    if (businessTypeAddressCredential.dfstrHomeaddress5owner4 != null) {
      sharedPreferences.setString("partnerDFstrHomeaddress5owner4",
          businessTypeAddressCredential.dfstrHomeaddress5owner4);
    }
    if (businessTypeAddressCredential.dfstrHomeaddress6owner4 != null) {
      sharedPreferences.setString("partnerDFstrHomeaddress6owner4",
          businessTypeAddressCredential.dfstrHomeaddress6owner4);
    }
    if (businessTypeAddressCredential.dfstrHomeaddressCity3owner4 != null) {
      sharedPreferences.setString("partnerDFstrHomeaddressCity3owner4",
          businessTypeAddressCredential.dfstrHomeaddressCity3owner4);
    }
    if (businessTypeAddressCredential.dfstrHomeaddressPostCode3owner4 != null) {
      sharedPreferences.setString("partnerDFstrHomeaddressPostCode3owner4",
          businessTypeAddressCredential.dfstrHomeaddressPostCode3owner4);
    }
    if (businessTypeAddressCredential.dfstrHomeaddressLiveYear3owner4 != null) {
      sharedPreferences.setString("partnerDFstrHomeaddressLiveYear3owner4",
          businessTypeAddressCredential.dfstrHomeaddressLiveYear3owner4);
    }
    if (businessTypeAddressCredential.dfstrHomeaddressLivemonth3owner4 !=
        null) {
      sharedPreferences.setString("partnerDFstrHomeaddressLivemonth3owner4",
          businessTypeAddressCredential.dfstrHomeaddressLivemonth3owner4);
    }
    if (businessTypeAddressCredential.dfstrHomeaddress7owner4 != null) {
      sharedPreferences.setString("partnerDFstrHomeaddress7owner4",
          businessTypeAddressCredential.dfstrHomeaddress7owner4);
    }
    if (businessTypeAddressCredential.dfstrHomeaddress8owner4 != null) {
      sharedPreferences.setString("partnerDFstrHomeaddress8owner4",
          businessTypeAddressCredential.dfstrHomeaddress8owner4);
    }
    if (businessTypeAddressCredential.dfstrHomeaddressCity4owner4 != null) {
      sharedPreferences.setString("partnerDFstrHomeaddressCity4owner4",
          businessTypeAddressCredential.dfstrHomeaddressCity4owner4);
    }
    if (businessTypeAddressCredential.dfstrHomeaddressPostCode4owner4 != null) {
      sharedPreferences.setString("partnerDFstrHomeaddressPostCode4owner4",
          businessTypeAddressCredential.dfstrHomeaddressPostCode4owner4);
    }
    if (businessTypeAddressCredential.dfstrHomeaddressLiveYear4owner4 != null) {
      sharedPreferences.setString("partnerDFstrHomeaddressLiveYear4owner4",
          businessTypeAddressCredential.dfstrHomeaddressLiveYear4owner4);
    }
    if (businessTypeAddressCredential.dfstrHomeaddressLiveMonth4owner4 !=
        null) {
      sharedPreferences.setString("partnerDFstrHomeaddressLiveMonth4owner4",
          businessTypeAddressCredential.dfstrHomeaddressLiveMonth4owner4);
    }
    if (businessTypeAddressCredential.dfstrHomeaddress9owner4 != null) {
      sharedPreferences.setString("partnerDFstrHomeaddress9owner4",
          businessTypeAddressCredential.dfstrHomeaddress9owner4);
    }
    if (businessTypeAddressCredential.dfstrHomeaddress10owner4 != null) {
      sharedPreferences.setString("partnerDFstrHomeaddress10owner4",
          businessTypeAddressCredential.dfstrHomeaddress10owner4);
    }
    if (businessTypeAddressCredential.dfstrHomeaddressCity5owner4 != null) {
      sharedPreferences.setString("partnerDFstrHomeaddressCity5owner4",
          businessTypeAddressCredential.dfstrHomeaddressCity5owner4);
    }
    if (businessTypeAddressCredential.dfstrHomeaddressPostCode5owner4 != null) {
      sharedPreferences.setString("partnerDFstrHomeaddressPostCode5owner4",
          businessTypeAddressCredential.dfstrHomeaddressPostCode5owner4);
    }
    if (businessTypeAddressCredential.dfstrHomeaddressLiveYear5owner4 != null) {
      sharedPreferences.setString("partnerDFstrHomeaddressLiveYear5owner4",
          businessTypeAddressCredential.dfstrHomeaddressLiveYear5owner4);
    }
    if (businessTypeAddressCredential.dfstrHomeaddressLiveMonth5owner4 !=
        null) {
      sharedPreferences.setString("partnerDFstrHomeaddressLiveMonth5owner4",
          businessTypeAddressCredential.dfstrHomeaddressLiveMonth5owner4);
    }
    if (businessTypeAddressCredential.dfstrTitleQwner5 != null) {
      sharedPreferences.setString("partnerDFstrTitleQwner5",
          businessTypeAddressCredential.dfstrTitleQwner5);
    }
    if (businessTypeAddressCredential.dfstrFirstNameowner5 != null) {
      sharedPreferences.setString("partnerDFstrFirstNameowner5",
          businessTypeAddressCredential.dfstrFirstNameowner5);
    }
    if (businessTypeAddressCredential.dfstrLastNameowner5 != null) {
      sharedPreferences.setString("partnerDFstrLastNameowner5",
          businessTypeAddressCredential.dfstrLastNameowner5);
    }
    if (businessTypeAddressCredential.dfstrstrDobOwner5 != null) {
      sharedPreferences.setString("partnerDFstrstrDobOwner5",
          businessTypeAddressCredential.dfstrstrDobOwner5);
    }
    if (businessTypeAddressCredential.dfhome_Addressowner5 != null) {
      sharedPreferences.setString("partnerDFhome_Addressowner5",
          businessTypeAddressCredential.dfhome_Addressowner5);
    }
    if (businessTypeAddressCredential.dfhome_Address2owner5 != null) {
      sharedPreferences.setString("partnerDFhome_Address2owner5",
          businessTypeAddressCredential.dfhome_Address2owner5);
    }
    if (businessTypeAddressCredential.dfstrHomeAdressCityowner5 != null) {
      sharedPreferences.setString("partnerDFstrHomeAdressCityowner5",
          businessTypeAddressCredential.dfstrHomeAdressCityowner5);
    }
    if (businessTypeAddressCredential.dfstrHomeAdressPostCodeowner5 != null) {
      sharedPreferences.setString("partnerDFstrHomeAdressPostCodeowner5",
          businessTypeAddressCredential.dfstrHomeAdressPostCodeowner5);
    }
    if (businessTypeAddressCredential.dfstrHomeaddressLiveYearowner5 != null) {
      sharedPreferences.setString("partnerDFstrHomeaddressLiveYearowner5",
          businessTypeAddressCredential.dfstrHomeaddressLiveYearowner5);
    }
    if (businessTypeAddressCredential.dfstrHomeaddressLiveMonthowner5 != null) {
      sharedPreferences.setString("partnerDFstrHomeaddressLiveMonthowner5",
          businessTypeAddressCredential.dfstrHomeaddressLiveMonthowner5);
    }
    if (businessTypeAddressCredential.dfstrHomeaddress1owner5 != null) {
      sharedPreferences.setString("partnerDFstrHomeaddress1owner5",
          businessTypeAddressCredential.dfstrHomeaddress1owner5);
    }
    if (businessTypeAddressCredential.dfstrHomeaddress2owner5 != null) {
      sharedPreferences.setString("partnerDFstrHomeaddress2owner5",
          businessTypeAddressCredential.dfstrHomeaddress2owner5);
    }
    if (businessTypeAddressCredential.dfstrHomeaddressCity1owner5 != null) {
      sharedPreferences.setString("partnerDFstrHomeaddressCity1owner5",
          businessTypeAddressCredential.dfstrHomeaddressCity1owner5);
    }
    if (businessTypeAddressCredential.dfstrHomeaddressPostCode1owner5 != null) {
      sharedPreferences.setString("partnerDFstrHomeaddressPostCode1owner5",
          businessTypeAddressCredential.dfstrHomeaddressPostCode1owner5);
    }
    if (businessTypeAddressCredential.dfstrHomeaddressLiveYear1owner5 != null) {
      sharedPreferences.setString("partnerDFstrHomeaddressLiveYear1owner5",
          businessTypeAddressCredential.dfstrHomeaddressLiveYear1owner5);
    }
    if (businessTypeAddressCredential.dfstrHomeaddressLiveMonth1owner5 !=
        null) {
      sharedPreferences.setString("partnerDFstrHomeaddressLiveMonth1owner5",
          businessTypeAddressCredential.dfstrHomeaddressLiveMonth1owner5);
    }
    if (businessTypeAddressCredential.dfstrHomeaddress3owner5 != null) {
      sharedPreferences.setString("partnerDFstrHomeaddress3owner5",
          businessTypeAddressCredential.dfstrHomeaddress3owner5);
    }
    if (businessTypeAddressCredential.dfstrHomeaddress4owner5 != null) {
      sharedPreferences.setString("partnerDFstrHomeaddress4owner5",
          businessTypeAddressCredential.dfstrHomeaddress4owner5);
    }
    if (businessTypeAddressCredential.dfstrHomeaddressCity2owner5 != null) {
      sharedPreferences.setString("partnerDFstrHomeaddressCity2owner5",
          businessTypeAddressCredential.dfstrHomeaddressCity2owner5);
    }
    if (businessTypeAddressCredential.dfstrHomeaddressPostCode2owner5 != null) {
      sharedPreferences.setString("partnerDFstrHomeaddressPostCode2owner5",
          businessTypeAddressCredential.dfstrHomeaddressPostCode2owner5);
    }
    if (businessTypeAddressCredential.dfstrHomeaddressPostLiveYear2owner5 !=
        null) {
      sharedPreferences.setString("partnerDFstrHomeaddressPostLiveYear2owner5",
          businessTypeAddressCredential.dfstrHomeaddressPostLiveYear2owner5);
    }
    if (businessTypeAddressCredential.dfstrHomeaddressPostLiveMonth2owner5 !=
        null) {
      sharedPreferences.setString("partnerDFstrHomeaddressPostLiveMonth2owner5",
          businessTypeAddressCredential.dfstrHomeaddressPostLiveMonth2owner5);
    }
    if (businessTypeAddressCredential.dfstrHomeaddress5owner5 != null) {
      sharedPreferences.setString("partnerDFstrHomeaddress5owner5",
          businessTypeAddressCredential.dfstrHomeaddress5owner5);
    }
    if (businessTypeAddressCredential.dfstrHomeaddress6owner5 != null) {
      sharedPreferences.setString("partnerDFstrHomeaddress6owner5",
          businessTypeAddressCredential.dfstrHomeaddress6owner5);
    }
    if (businessTypeAddressCredential.dfstrHomeaddressCity3owner5 != null) {
      sharedPreferences.setString("partnerDFstrHomeaddressCity3owner5",
          businessTypeAddressCredential.dfstrHomeaddressCity3owner5);
    }
    if (businessTypeAddressCredential.dfstrHomeaddressPostCode3owner5 != null) {
      sharedPreferences.setString("partnerDFstrHomeaddressPostCode3owner5",
          businessTypeAddressCredential.dfstrHomeaddressPostCode3owner5);
    }
    if (businessTypeAddressCredential.dfstrHomeaddressLiveYear3owner5 != null) {
      sharedPreferences.setString("partnerDFstrHomeaddressLiveYear3owner5",
          businessTypeAddressCredential.dfstrHomeaddressLiveYear3owner5);
    }
    if (businessTypeAddressCredential.dfstrHomeaddressLivemonth3owner5 !=
        null) {
      sharedPreferences.setString("partnerDFstrHomeaddressLivemonth3owner5",
          businessTypeAddressCredential.dfstrHomeaddressLivemonth3owner5);
    }
    if (businessTypeAddressCredential.dfstrHomeaddress7owner5 != null) {
      sharedPreferences.setString("partnerDFstrHomeaddress7owner5",
          businessTypeAddressCredential.dfstrHomeaddress7owner5);
    }
    if (businessTypeAddressCredential.dfstrHomeaddress8owner5 != null) {
      sharedPreferences.setString("partnerDFstrHomeaddress8owner5",
          businessTypeAddressCredential.dfstrHomeaddress8owner5);
    }
    if (businessTypeAddressCredential.dfstrHomeaddressCity4owner5 != null) {
      sharedPreferences.setString("partnerDFstrHomeaddressCity4owner5",
          businessTypeAddressCredential.dfstrHomeaddressCity4owner5);
    }
    if (businessTypeAddressCredential.dfstrHomeaddressPostCode4owner5 != null) {
      sharedPreferences.setString("partnerDFstrHomeaddressPostCode4owner5",
          businessTypeAddressCredential.dfstrHomeaddressPostCode4owner5);
    }
    if (businessTypeAddressCredential.dfstrHomeaddressLiveYear4owner5 != null) {
      sharedPreferences.setString("partnerDFstrHomeaddressLiveYear4owner5",
          businessTypeAddressCredential.dfstrHomeaddressLiveYear4owner5);
    }
    if (businessTypeAddressCredential.dfstrHomeaddressLiveMonth4owner5 !=
        null) {
      sharedPreferences.setString("partnerDFstrHomeaddressLiveMonth4owner5",
          businessTypeAddressCredential.dfstrHomeaddressLiveMonth4owner5);
    }
    if (businessTypeAddressCredential.dfstrHomeaddress9owner5 != null) {
      sharedPreferences.setString("partnerDFstrHomeaddress9owner5",
          businessTypeAddressCredential.dfstrHomeaddress9owner5);
    }
    if (businessTypeAddressCredential.dfstrHomeaddress10owner5 != null) {
      sharedPreferences.setString("partnerDFstrHomeaddress10owner5",
          businessTypeAddressCredential.dfstrHomeaddress10owner5);
    }
    if (businessTypeAddressCredential.dfstrHomeaddressCity5owner5 != null) {
      sharedPreferences.setString("partnerDFstrHomeaddressCity5owner5",
          businessTypeAddressCredential.dfstrHomeaddressCity5owner5);
    }
    if (businessTypeAddressCredential.dfstrHomeaddressPostCode5owner5 != null) {
      sharedPreferences.setString("partnerDFstrHomeaddressPostCode5owner5",
          businessTypeAddressCredential.dfstrHomeaddressPostCode5owner5);
    }
    if (businessTypeAddressCredential.dfstrHomeaddressLiveYear5owner5 != null) {
      sharedPreferences.setString("partnerDFstrHomeaddressLiveYear5owner5",
          businessTypeAddressCredential.dfstrHomeaddressLiveYear5owner5);
    }
    if (businessTypeAddressCredential.dfstrHomeaddressLiveMonth5owner5 !=
        null) {
      sharedPreferences.setString("partnerDFstrHomeaddressLiveMonth5owner5",
          businessTypeAddressCredential.dfstrHomeaddressLiveMonth5owner5);
    }
    if (businessTypeAddressCredential.dfstrTitleQwner6 != null) {
      sharedPreferences.setString("partnerDFstrTitleQwner6",
          businessTypeAddressCredential.dfstrTitleQwner6);
    }
    if (businessTypeAddressCredential.dfstrFirstNameowner6 != null) {
      sharedPreferences.setString("partnerDFstrFirstNameowner6",
          businessTypeAddressCredential.dfstrFirstNameowner6);
    }
    if (businessTypeAddressCredential.dfstrLastNameowner6 != null) {
      sharedPreferences.setString("partnerDFstrLastNameowner6",
          businessTypeAddressCredential.dfstrLastNameowner6);
    }
    if (businessTypeAddressCredential.dfstrstrDobOwner6 != null) {
      sharedPreferences.setString("partnerDFstrstrDobOwner6",
          businessTypeAddressCredential.dfstrstrDobOwner6);
    }
    if (businessTypeAddressCredential.dfhome_Addressowner6 != null) {
      sharedPreferences.setString("partnerDFhome_Addressowner6",
          businessTypeAddressCredential.dfhome_Addressowner6);
    }
    if (businessTypeAddressCredential.dfhome_Address2owner6 != null) {
      sharedPreferences.setString("partnerDFhome_Address2owner6",
          businessTypeAddressCredential.dfhome_Address2owner6);
    }
    if (businessTypeAddressCredential.dfstrHomeAdressCityowner6 != null) {
      sharedPreferences.setString("partnerDFstrHomeAdressCityowner6",
          businessTypeAddressCredential.dfstrHomeAdressCityowner6);
    }
  }

  static void clearDFPartnerBusiness() async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString("partnerDFstrTitleQwner1", null);
  }

  ///Partner Business<Add-Prosp> getMethod
  static Future<PartnerShipBusinessCredential>
      getPartnerShipBusinessTypeAdd() async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();

    String dfstrTitleQwner1 = preferences.getString("partnerDFstrTitleQwner1");
    String dffirstName = preferences.getString("partnerDFfirstName");
    String dflastName = preferences.getString("partnerDFlastName");
    String dfstrTitleDirector2 =
        preferences.getString("partnerDFstrTitleDirector2");
    String dfstrDirector2Firstname =
        preferences.getString("partnerDFstrDirector2Firstname");
    String dfstrDirector2Lastname =
        preferences.getString("partnerDFstrDirector2Lastname");
    String dfstrDobOwner1 = preferences.getString("partnerDFstrDobOwner1");
    String dfhome_Address = preferences.getString("partnerDFhome_Address");
    String dfhome_Address2 = preferences.getString("partnerDFhome_Address2");
    String dfstrHomeAdressPostCode =
        preferences.getString("partnerDFstrHomeAdressPostCode");
    String dfstrHomeAdressCity =
        preferences.getString("partnerDFstrHomeAdressCity");
    String dfstrHomeaddressLiveYear =
        preferences.getString("partnerDFstrHomeaddressLiveYear");
    String dfstrHomeaddressLiveMonth =
        preferences.getString("partnerDFstrHomeaddressLiveMonth");
    String dfstrHomeaddress1 =
        preferences.getString("partnerDFstrHomeaddress1");
    String dfstrHomeaddress2 =
        preferences.getString("partnerDFstrHomeaddress2");
    String dfstrHomeaddressCity1 =
        preferences.getString("partnerDFstrHomeaddressCity1");
    String dfstrHomeaddressPostCode1 =
        preferences.getString("partnerDFstrHomeaddressPostCode1");
    String dfstrHomeaddressLiveYear1 =
        preferences.getString("partnerDFstrHomeaddressLiveYear1");
    String dfstrHomeaddressLiveMonth1 =
        preferences.getString("partnerDFstrHomeaddressLiveMonth1");
    String dfstrHomeaddress3 =
        preferences.getString("partnerDFstrHomeaddress3");
    String dfstrHomeaddress4 =
        preferences.getString("partnerDFstrHomeaddress4");
    String dfstrHomeaddressCity2 =
        preferences.getString("partnerDFstrHomeaddressCity2");
    String dfstrHomeaddressPostCode2 =
        preferences.getString("partnerDFstrHomeaddressPostCode2");
    String dfstrHomeaddressPostLiveYear2 =
        preferences.getString("partnerDFstrHomeaddressPostLiveYear2");
    String dfstrHomeaddressPostLiveMonth2 =
        preferences.getString("partnerDFstrHomeaddressPostLiveMonth2");
    String dfstrHomeaddress5 =
        preferences.getString("partnerDFstrHomeaddress5");
    String dfstrHomeaddress6 =
        preferences.getString("partnerDFstrHomeaddress6");
    String dfstrHomeaddressCity3 =
        preferences.getString("partnerDFstrHomeaddressCity3");
    String dfstrHomeaddressPostCode3 =
        preferences.getString("partnerDFstrHomeaddressPostCode3");
    String dfstrHomeaddressLiveYear3 =
        preferences.getString("partnerDFstrHomeaddressLiveYear3");
    String dfstrHomeaddressLivemonth3 =
        preferences.getString("partnerDFstrHomeaddressLivemonth3");
    String dfstrHomeaddress7 =
        preferences.getString("partnerDFstrHomeaddress7");
    String dfstrHomeaddress8 =
        preferences.getString("partnerDFstrHomeaddress8");
    String dfstrHomeaddressCity4 =
        preferences.getString("partnerDFstrHomeaddressCity4");
    String dfstrHomeaddressPostCode4 =
        preferences.getString("partnerDFstrHomeaddressPostCode4");
    String dfstrHomeaddressLiveYear4 =
        preferences.getString("partnerDFstrHomeaddressLiveYear4");
    String dfstrHomeaddressLiveMonth4 =
        preferences.getString("partnerDFstrHomeaddressLiveMonth4");
    String dfstrHomeaddress9 =
        preferences.getString("partnerDFstrHomeaddress9");
    String dfstrHomeaddress10 =
        preferences.getString("partnerDFstrHomeaddress10");
    String dfstrHomeaddressCity5 =
        preferences.getString("partnerDFstrHomeaddressCity5");
    String dfstrHomeaddressPostCode5 =
        preferences.getString("partnerDFstrHomeaddressPostCode5");
    String dfstrHomeaddressLiveYear5 =
        preferences.getString("partnerDFstrHomeaddressLiveYear5");
    String dfstrTitleQwner2 = preferences.getString("partnerDFstrTitleQwner2");
    String dfstrFirstNameowner =
        preferences.getString("partnerDFstrFirstNameowner");
    String dfstrLastNameowner =
        preferences.getString("partnerDFstrLastNameowner");
    String dfstrDobOwner2 = preferences.getString("partnerDFstrDobOwner2");
    String dfhome_Addressowner =
        preferences.getString("partnerDFhome_Addressowner");
    String dfhome_Address2owner =
        preferences.getString("partnerDFhome_Address2owner");
    String dfstrHomeAdressPostCodeowner =
        preferences.getString("partnerDFstrHomeAdressPostCodeowner");
    String dfstrHomeAdressCityowner =
        preferences.getString("partnerDFstrHomeAdressCityowner");
    String dfstrHomeaddressLiveYearowner =
        preferences.getString("partnerDFstrHomeaddressLiveYearowner");
    String dfstrHomeaddressLiveMonthowner =
        preferences.getString("partnerDFstrHomeaddressLiveMonthowner");
    String dfstrHomeaddress1owner =
        preferences.getString("partnerDFstrHomeaddress1owner");
    String dfstrHomeaddress2owner =
        preferences.getString("partnerDFstrHomeaddress2owner");
    String dfstrHomeaddressCity1owner =
        preferences.getString("partnerDFstrHomeaddressCity1owner");
    String dfstrHomeaddressPostCode1owner =
        preferences.getString("partnerDFstrHomeaddressPostCode1owner");
    String dfstrHomeaddressLiveYear1owner =
        preferences.getString("partnerDFstrHomeaddressLiveYear1owner");
    String dfstrHomeaddressLiveMonth1owner =
        preferences.getString("partnerDFstrHomeaddressLiveMonth1owner");
    String dfstrHomeaddress3owner =
        preferences.getString("partnerDFstrHomeaddress3owner");
    String dfstrHomeaddress4owner =
        preferences.getString("partnerDFstrHomeaddress4owner");
    String dfstrHomeaddressCity2owner =
        preferences.getString("partnerDFstrHomeaddressCity2owner");
    String dfstrHomeaddressPostCode2owner =
        preferences.getString("partnerDFstrHomeaddressPostCode2owner");
    String dfstrHomeaddressPostLiveYear2owner =
        preferences.getString("partnerDFstrHomeaddressPostLiveYear2owner");
    String dfstrHomeaddressPostLiveMonth2owner =
        preferences.getString("partnerDFstrHomeaddressPostLiveMonth2owner");
    String dfstrHomeaddress5owner =
        preferences.getString("partnerDFstrHomeaddress5owner");
    String dfstrHomeaddress6owner =
        preferences.getString("partnerDFstrHomeaddress6owner");
    String dfstrHomeaddressCity3owner =
        preferences.getString("partnerDFstrHomeaddressCity3owner");
    String dfstrHomeaddressPostCode3owner =
        preferences.getString("partnerDFstrHomeaddressPostCode3owner");
    String dfstrHomeaddressLiveYear3owner =
        preferences.getString("partnerDFstrHomeaddressLiveYear3owner");
    String dfstrHomeaddressLivemonth3owner =
        preferences.getString("partnerDFstrHomeaddressLivemonth3owner");
    String dfstrHomeaddress7owner =
        preferences.getString("partnerDFstrHomeaddress7owner");
    String dfstrHomeaddress8owner =
        preferences.getString("partnerDFstrHomeaddress8owner");
    String dfstrHomeaddressCity4owner =
        preferences.getString("partnerDFstrHomeaddressCity4owner");
    String dfstrHomeaddressPostCode4owner =
        preferences.getString("partnerDFstrHomeaddressPostCode4owner");
    String dfstrHomeaddressLiveYear4owner =
        preferences.getString("partnerDFstrHomeaddressLiveYear4owner");
    String dfstrHomeaddressLiveMonth4owner =
        preferences.getString("partnerDFstrHomeaddressLiveMonth4owner");
    String dfstrHomeaddress9owner =
        preferences.getString("partnerDFstrHomeaddress9owner");
    String dfstrHomeaddress10owner =
        preferences.getString("partnerDFstrHomeaddress10owner");
    String dfstrHomeaddressCity5owner =
        preferences.getString("partnerDFstrHomeaddressCity5owner");
    String dfstrHomeaddressPostCode5owner =
        preferences.getString("partnerDFstrHomeaddressPostCode5owner");
    String dfstrHomeaddressLiveYear5owner =
        preferences.getString("partnerDFstrHomeaddressLiveYear5owner");
    String dfstrHomeaddressLiveMonth5owner =
        preferences.getString("partnerDFstrHomeaddressLiveMonth5owner");
    String dfstrTitleQwner3 = preferences.getString("partnerDFstrTitleQwner3");
    String dfstrFirstNameowner3 =
        preferences.getString("partnerDFstrFirstNameowner3");
    String dfstrLastNameowner3 =
        preferences.getString("partnerDFstrLastNameowner3");
    String dfstrstrDobOwner3 =
        preferences.getString("partnerDFstrstrDobOwner3");
    String dfhome_Addressowner3 =
        preferences.getString("partnerDFhome_Addressowner3");
    String dfhome_Address2owner3 =
        preferences.getString("partnerDFhome_Address2owner3");
    String dfstrHomeAdressCityowner3 =
        preferences.getString("partnerDFstrHomeAdressCityowner3");
    String dfstrHomeAdressPostCodeowner3 =
        preferences.getString("partnerDFstrHomeAdressPostCodeowner3");
    String dfstrHomeaddressLiveYearowner3 =
        preferences.getString("partnerDFstrHomeaddressLiveYearowner3");
    String dfstrHomeaddressLiveMonthowner3 =
        preferences.getString("partnerDFstrHomeaddressLiveMonthowner3");
    String dfstrHomeaddress1owner3 =
        preferences.getString("partnerDFstrHomeaddress1owner3");
    String dfstrHomeaddress2owner3 =
        preferences.getString("partnerDFstrHomeaddress2owner3");
    String dfstrHomeaddressCity1owner3 =
        preferences.getString("partnerDFstrHomeaddressCity1owner3");
    String dfstrHomeaddressPostCode1owner3 =
        preferences.getString("partnerDFstrHomeaddressPostCode1owner3");
    String dfstrHomeaddressLiveYear1owner3 =
        preferences.getString("partnerDFstrHomeaddressLiveYear1owner3");
    String dfstrHomeaddressLiveMonth1owner3 =
        preferences.getString("partnerDFstrHomeaddressLiveMonth1owner3");
    String dfstrHomeaddress3owner3 =
        preferences.getString("partnerDFstrHomeaddress3owner3");
    String dfstrHomeaddress4owner3 =
        preferences.getString("partnerDFstrHomeaddress4owner3");
    String dfstrHomeaddressCity2owner3 =
        preferences.getString("partnerDFstrHomeaddressCity2owner3");
    String dfstrHomeaddressPostCode2owner3 =
        preferences.getString("partnerDFstrHomeaddressPostCode2owner3");
    String dfstrHomeaddressPostLiveYear2owner3 =
        preferences.getString("partnerDFstrHomeaddressPostLiveYear2owner3");
    String dfstrHomeaddressPostLiveMonth2owner3 =
        preferences.getString("partnerDFstrHomeaddressPostLiveMonth2owner3");
    String dfstrHomeaddress5owner3 =
        preferences.getString("partnerDFstrHomeaddress5owner3");
    String dfstrHomeaddress6owner3 =
        preferences.getString("partnerDFstrHomeaddress6owner3");
    String dfstrHomeaddressCity3owner3 =
        preferences.getString("partnerDFstrHomeaddressCity3owner3");
    String dfstrHomeaddressPostCode3owner3 =
        preferences.getString("partnerDFstrHomeaddressPostCode3owner3");
    String dfstrHomeaddressLiveYear3owner3 =
        preferences.getString("partnerDFstrHomeaddressLiveYear3owner3");
    String dfstrHomeaddressLivemonth3owner3 =
        preferences.getString("partnerDFstrHomeaddressLivemonth3owner3");
    String dfstrHomeaddress7owner3 =
        preferences.getString("partnerDFstrHomeaddress7owner3");
    String dfstrHomeaddress8owner3 =
        preferences.getString("partnerDFstrHomeaddress8owner3");
    String dfstrHomeaddressCity4owner3 =
        preferences.getString("partnerDFstrHomeaddressCity4owner3");
    String dfstrHomeaddressPostCode4owner3 =
        preferences.getString("partnerDFstrHomeaddressPostCode4owner3");
    String dfstrHomeaddressLiveYear4owner3 =
        preferences.getString("partnerDFstrHomeaddressLiveYear4owner3");
    String dfstrHomeaddressLiveMonth4owner3 =
        preferences.getString("partnerDFstrHomeaddressLiveMonth4owner3");
    String dfstrHomeaddress9owner3 =
        preferences.getString("partnerDFstrHomeaddress9owner3");
    String dfstrHomeaddress10owner3 =
        preferences.getString("partnerDFstrHomeaddress10owner3");
    String dfstrHomeaddressCity5owner3 =
        preferences.getString("partnerDFstrHomeaddressCity5owner3");
    String dfstrHomeaddressPostCode5owner3 =
        preferences.getString("partnerDFstrHomeaddressPostCode5owner3");
    String dfstrHomeaddressLiveYear5owner3 =
        preferences.getString("partnerDFstrHomeaddressLiveYear5owner3");
    String dfstrHomeaddressLiveMonth5owner3 =
        preferences.getString("partnerDFstrHomeaddressLiveMonth5owner3");
    String dfstrTitleQwner4 = preferences.getString("partnerDFstrTitleQwner4");
    String dfstrFirstNameowner4 =
        preferences.getString("partnerDFstrFirstNameowner4");
    String dfstrLastNameowner4 =
        preferences.getString("partnerDFstrLastNameowner4");
    String dfstrstrDobOwner4 =
        preferences.getString("partnerDFstrstrDobOwner4");
    String dfhome_Addressowner4 =
        preferences.getString("partnerDFhome_Addressowner4");
    String dfhome_Address2owner4 =
        preferences.getString("partnerDFhome_Address2owner4");
    String dfstrHomeAdressCityowner4 =
        preferences.getString("partnerDFstrHomeAdressCityowner4");
    String dfstrHomeAdressPostCodeowner4 =
        preferences.getString("partnerDFstrHomeAdressPostCodeowner4");
    String dfstrHomeaddressLiveYearowner4 =
        preferences.getString("partnerDFstrHomeaddressLiveYearowner4");
    String dfstrHomeaddressLiveMonthowner4 =
        preferences.getString("partnerDFstrHomeaddressLiveMonthowner4");
    String dfstrHomeaddress1owner4 =
        preferences.getString("partnerDFstrHomeaddress1owner4");
    String dfstrHomeaddress2owner4 =
        preferences.getString("partnerDFstrHomeaddress2owner4");
    String dfstrHomeaddressCity1owner4 =
        preferences.getString("partnerDFstrHomeaddressCity1owner4");
    String dfstrHomeaddressPostCode1owner4 =
        preferences.getString("partnerDFstrHomeaddressPostCode1owner4");
    String dfstrHomeaddressLiveYear1owner4 =
        preferences.getString("partnerDFstrHomeaddressLiveYear1owner4");
    String dfstrHomeaddressLiveMonth1owner4 =
        preferences.getString("partnerDFstrHomeaddressLiveMonth1owner4");
    String dfstrHomeaddress3owner4 =
        preferences.getString("partnerDFstrHomeaddress3owner4");
    String dfstrHomeaddress4owner4 =
        preferences.getString("partnerDFstrHomeaddress4owner4");
    String dfstrHomeaddressCity2owner4 =
        preferences.getString("partnerDFstrHomeaddressCity2owner4");
    String dfstrHomeaddressPostCode2owner4 =
        preferences.getString("partnerDFstrHomeaddressPostCode2owner4");
    String dfstrHomeaddressPostLiveYear2owner4 =
        preferences.getString("partnerDFstrHomeaddressPostLiveYear2owner4");
    String dfstrHomeaddressPostLiveMonth2owner4 =
        preferences.getString("partnerDFstrHomeaddressPostLiveMonth2owner4");
    String dfstrHomeaddress5owner4 =
        preferences.getString("partnerDFstrHomeaddress5owner4");
    String dfstrHomeaddress6owner4 =
        preferences.getString("partnerDFstrHomeaddress6owner4");
    String dfstrHomeaddressCity3owner4 =
        preferences.getString("partnerDFstrHomeaddressCity3owner4");
    String dfstrHomeaddressPostCode3owner4 =
        preferences.getString("partnerDFstrHomeaddressPostCode3owner4");
    String dfstrHomeaddressLiveYear3owner4 =
        preferences.getString("partnerDFstrHomeaddressLiveYear3owner4");
    String dfstrHomeaddressLivemonth3owner4 =
        preferences.getString("partnerDFstrHomeaddressLivemonth3owner4");
    String dfstrHomeaddress7owner4 =
        preferences.getString("partnerDFstrHomeaddress7owner4");
    String dfstrHomeaddress8owner4 =
        preferences.getString("partnerDFstrHomeaddress8owner4");
    String dfstrHomeaddressCity4owner4 =
        preferences.getString("partnerDFstrHomeaddressCity4owner4");
    String dfstrHomeaddressPostCode4owner4 =
        preferences.getString("partnerDFstrHomeaddressPostCode4owner4");
    String dfstrHomeaddressLiveYear4owner4 =
        preferences.getString("partnerDFstrHomeaddressLiveYear4owner4");
    String dfstrHomeaddressLiveMonth4owner4 =
        preferences.getString("partnerDFstrHomeaddressLiveMonth4owner4");
    String dfstrHomeaddress9owner4 =
        preferences.getString("partnerDFstrHomeaddress9owner4");
    String dfstrHomeaddress10owner4 =
        preferences.getString("partnerDFstrHomeaddress10owner4");
    String dfstrHomeaddressCity5owner4 =
        preferences.getString("partnerDFstrHomeaddressCity5owner4");
    String dfstrHomeaddressPostCode5owner4 =
        preferences.getString("partnerDFstrHomeaddressPostCode5owner4");
    String dfstrHomeaddressLiveYear5owner4 =
        preferences.getString("partnerDFstrHomeaddressLiveYear5owner4");
    String dfstrHomeaddressLiveMonth5owner4 =
        preferences.getString("partnerDFstrHomeaddressLiveMonth5owner4");
    String dfstrTitleQwner5 = preferences.getString("partnerDFstrTitleQwner5");
    String dfstrFirstNameowner5 =
        preferences.getString("partnerDFstrFirstNameowner5");
    String dfstrLastNameowner5 =
        preferences.getString("partnerDFstrLastNameowner5");
    String dfstrstrDobOwner5 =
        preferences.getString("partnerDFstrstrDobOwner5");
    String dfhome_Addressowner5 =
        preferences.getString("partnerDFhome_Addressowner5");
    String dfhome_Address2owner5 =
        preferences.getString("partnerDFhome_Address2owner5");
    String dfstrHomeAdressCityowner5 =
        preferences.getString("partnerDFstrHomeAdressCityowner5");
    String dfstrHomeAdressPostCodeowner5 =
        preferences.getString("partnerDFstrHomeAdressPostCodeowner5");
    String dfstrHomeaddressLiveYearowner5 =
        preferences.getString("partnerDFstrHomeaddressLiveYearowner5");
    String dfstrHomeaddressLiveMonthowner5 =
        preferences.getString("partnerDFstrHomeaddressLiveMonthowner5");
    String dfstrHomeaddress1owner5 =
        preferences.getString("partnerDFstrHomeaddress1owner5");
    String dfstrHomeaddress2owner5 =
        preferences.getString("partnerDFstrHomeaddress2owner5");
    String dfstrHomeaddressCity1owner5 =
        preferences.getString("partnerDFstrHomeaddressCity1owner5");
    String dfstrHomeaddressPostCode1owner5 =
        preferences.getString("partnerDFstrHomeaddressPostCode1owner5");
    String dfstrHomeaddressLiveYear1owner5 =
        preferences.getString("partnerDFstrHomeaddressLiveYear1owner5");
    String dfstrHomeaddressLiveMonth1owner5 =
        preferences.getString("partnerDFstrHomeaddressLiveMonth1owner5");
    String dfstrHomeaddress3owner5 =
        preferences.getString("partnerDFstrHomeaddress3owner5");
    String dfstrHomeaddress4owner5 =
        preferences.getString("partnerDFstrHomeaddress4owner5");
    String dfstrHomeaddressCity2owner5 =
        preferences.getString("partnerDFstrHomeaddressCity2owner5");
    String dfstrHomeaddressPostCode2owner5 =
        preferences.getString("partnerDFstrHomeaddressPostCode2owner5");
    String dfstrHomeaddressPostLiveYear2owner5 =
        preferences.getString("partnerDFstrHomeaddressPostLiveYear2owner5");
    String dfstrHomeaddressPostLiveMonth2owner5 =
        preferences.getString("partnerDFstrHomeaddressPostLiveMonth2owner5");
    String dfstrHomeaddress5owner5 =
        preferences.getString("partnerDFstrHomeaddress5owner5");
    String dfstrHomeaddress6owner5 =
        preferences.getString("partnerDFstrHomeaddress6owner5");
    String dfstrHomeaddressCity3owner5 =
        preferences.getString("partnerDFstrHomeaddressCity3owner5");
    String dfstrHomeaddressPostCode3owner5 =
        preferences.getString("partnerDFstrHomeaddressPostCode3owner5");
    String dfstrHomeaddressLiveYear3owner5 =
        preferences.getString("partnerDFstrHomeaddressLiveYear3owner5");
    String dfstrHomeaddressLivemonth3owner5 =
        preferences.getString("partnerDFstrHomeaddressLivemonth3owner5");
    String dfstrHomeaddress7owner5 =
        preferences.getString("partnerDFstrHomeaddress7owner5");
    String dfstrHomeaddress8owner5 =
        preferences.getString("partnerDFstrHomeaddress8owner5");
    String dfstrHomeaddressCity4owner5 =
        preferences.getString("partnerDFstrHomeaddressCity4owner5");
    String dfstrHomeaddressPostCode4owner5 =
        preferences.getString("partnerDFstrHomeaddressPostCode4owner5");
    String dfstrHomeaddressLiveYear4owner5 =
        preferences.getString("partnerDFstrHomeaddressLiveYear4owner5");
    String dfstrHomeaddressLiveMonth4owner5 =
        preferences.getString("partnerDFstrHomeaddressLiveMonth4owner5");
    String dfstrHomeaddress9owner5 =
        preferences.getString("partnerDFstrHomeaddress9owner5");
    String dfstrHomeaddress10owner5 =
        preferences.getString("partnerDFstrHomeaddress10owner5");
    String dfstrHomeaddressCity5owner5 =
        preferences.getString("partnerDFstrHomeaddressCity5owner5");
    String dfstrHomeaddressPostCode5owner5 =
        preferences.getString("partnerDFstrHomeaddressPostCode5owner5");
    String dfstrHomeaddressLiveYear5owner5 =
        preferences.getString("partnerDFstrHomeaddressLiveYear5owner5");
    String dfstrHomeaddressLiveMonth5owner5 =
        preferences.getString("partnerDFstrHomeaddressLiveMonth5owner5");
    String dfstrTitleQwner6 = preferences.getString("partnerDFstrTitleQwner6");
    String dfstrFirstNameowner6 =
        preferences.getString("partnerDFstrFirstNameowner6");
    String dfstrLastNameowner6 =
        preferences.getString("partnerDFstrLastNameowner6");
    String dfstrstrDobOwner6 =
        preferences.getString("partnerDFstrstrDobOwner6");
    String dfhome_Addressowner6 =
        preferences.getString("partnerDFhome_Addressowner6");
    String dfhome_Address2owner6 =
        preferences.getString("partnerDFhome_Address2owner6");
    String dfstrHomeAdressCityowner6 =
        preferences.getString("partnerDFstrHomeAdressCityowner6");
    String dfstrHomeAdressPostCodeowner6 =
        preferences.getString("partnerDFstrHomeAdressPostCodeowner6");
    String dfstrHomeaddressLiveYearowner6 =
        preferences.getString("partnerDFstrHomeaddressLiveYearowner6");
    String dfstrHomeaddressLiveMonthowner6 =
        preferences.getString("partnerDFstrHomeaddressLiveMonthowner6");
    String dfstrHomeaddress1owner6 =
        preferences.getString("partnerDFstrHomeaddress1owner6");
    String dfstrHomeaddress2owner6 =
        preferences.getString("partnerDFstrHomeaddress2owner6");
    String dfstrHomeaddressCity1owner6 =
        preferences.getString("partnerDFstrHomeaddressCity1owner6");
    String dfstrHomeaddressPostCode1owner6 =
        preferences.getString("partnerDFstrHomeaddressPostCode1owner6");
    String dfstrHomeaddressLiveYear1owner6 =
        preferences.getString("partnerDFstrHomeaddressLiveYear1owner6");
    String dfstrHomeaddressLiveMonth1owner6 =
        preferences.getString("partnerDFstrHomeaddressLiveMonth1owner6");
    String dfstrHomeaddress3owner6 =
        preferences.getString("partnerDFstrHomeaddress3owner6");
    String dfstrHomeaddress4owner6 =
        preferences.getString("partnerDFstrHomeaddress4owner6");
    String dfstrHomeaddressCity2owner6 =
        preferences.getString("partnerDFstrHomeaddressCity2owner6");
    String dfstrHomeaddressPostCode2owner6 =
        preferences.getString("partnerDFstrHomeaddressPostCode2owner6");
    String dfstrHomeaddressPostLiveYear2owner6 =
        preferences.getString("partnerDFstrHomeaddressPostLiveYear2owner6");
    String dfstrHomeaddressPostLiveMonth2owner6 =
        preferences.getString("partnerDFstrHomeaddressPostLiveMonth2owner6");
    String dfstrHomeaddress5owner6 =
        preferences.getString("partnerDFstrHomeaddress5owner6");
    String dfstrHomeaddress6owner6 =
        preferences.getString("partnerDFstrHomeaddress6owner6");
    String dfstrHomeaddressCity3owner6 =
        preferences.getString("partnerDFstrHomeaddressCity3owner6");
    String dfstrHomeaddressPostCode3owner6 =
        preferences.getString("partnerDFstrHomeaddressPostCode3owner6");
    String dfstrHomeaddressLiveYear3owner6 =
        preferences.getString("partnerDFstrHomeaddressLiveYear3owner6");
    String dfstrHomeaddressLivemonth3owner6 =
        preferences.getString("partnerDFstrHomeaddressLivemonth3owner6");
    String dfstrHomeaddress7owner6 =
        preferences.getString("partnerDFstrHomeaddress7owner6");
    String dfstrHomeaddress8owner6 =
        preferences.getString("partnerDFstrHomeaddress8owner6");
    String dfstrHomeaddressCity4owner6 =
        preferences.getString("partnerDFstrHomeaddressCity4owner6");
    String dfstrHomeaddressPostCode4owner6 =
        preferences.getString("partnerDFstrHomeaddressPostCode4owner6");
    String dfstrHomeaddressLiveYear4owner6 =
        preferences.getString("partnerDFstrHomeaddressLiveYear4owner6");
    String dfstrHomeaddressLiveMonth4owner6 =
        preferences.getString("partnerDFstrHomeaddressLiveMonth4owner6");
    String dfstrHomeaddress9owner6 =
        preferences.getString("partnerDFstrHomeaddress9owner6");
    String dfstrHomeaddress10owner6 =
        preferences.getString("partnerDFstrHomeaddress10owner6");
    String dfstrHomeaddressCity5owner6 =
        preferences.getString("partnerDFstrHomeaddressCity5owner6");
    String dfstrHomeaddressPostCode5owner6 =
        preferences.getString("partnerDFstrHomeaddressPostCode5owner6");
    String dfstrHomeaddressLiveYear5owner6 =
        preferences.getString("partnerDFstrHomeaddressLiveYear5owner6");
    String dfstrHomeaddressLiveMonth5owner6 =
        preferences.getString("partnerDFstrHomeaddressLiveMonth5owner6");

    print('#####Partner--OwnerShip Details....$dfstrTitleQwner1');

    return new PartnerShipBusinessCredential(
      dfstrTitleQwner1: dfstrTitleQwner1,
      dffirstName: dffirstName,
      dflastName: dflastName,
      dfstrTitleDirector2: dfstrTitleDirector2,
      dfstrDirector2Firstname: dfstrDirector2Firstname,
      dfstrDirector2Lastname: dfstrDirector2Lastname,
      dfstrDobOwner1: dfstrDobOwner1,
      dfhome_Address: dfhome_Address,
      dfhome_Address2: dfhome_Address2,
      dfstrHomeAdressPostCode: dfstrHomeAdressPostCode,
      dfstrHomeAdressCity: dfstrHomeAdressCity,
      dfstrHomeaddressLiveYear: dfstrHomeaddressLiveYear,
      dfstrHomeaddressLiveMonth: dfstrHomeaddressLiveMonth,
      dfstrHomeaddress1: dfstrHomeaddress1,
      dfstrHomeaddress2: dfstrHomeaddress2,
      dfstrHomeaddressCity1: dfstrHomeaddressCity1,
      dfstrHomeaddressPostCode1: dfstrHomeaddressPostCode1,
      dfstrHomeaddressLiveYear1: dfstrHomeaddressLiveYear1,
      dfstrHomeaddressLiveMonth1: dfstrHomeaddressLiveMonth1,
      dfstrHomeaddress3: dfstrHomeaddress3,
      dfstrHomeaddress4: dfstrHomeaddress4,
      dfstrHomeaddressCity2: dfstrHomeaddressCity2,
      dfstrHomeaddressPostCode2: dfstrHomeaddressPostCode2,
      dfstrHomeaddressPostLiveYear2: dfstrHomeaddressPostLiveYear2,
      dfstrHomeaddressPostLiveMonth2: dfstrHomeaddressPostLiveMonth2,
      dfstrHomeaddress5: dfstrHomeaddress5,
      dfstrHomeaddress6: dfstrHomeaddress6,
      dfstrHomeaddressCity3: dfstrHomeaddressCity3,
      dfstrHomeaddressPostCode3: dfstrHomeaddressPostCode3,
      dfstrHomeaddressLiveYear3: dfstrHomeaddressLiveYear3,
      dfstrHomeaddressLivemonth3: dfstrHomeaddressLivemonth3,
      dfstrHomeaddress7: dfstrHomeaddress7,
      dfstrHomeaddress8: dfstrHomeaddress8,
      dfstrHomeaddressCity4: dfstrHomeaddressCity4,
      dfstrHomeaddressPostCode4: dfstrHomeaddressPostCode4,
      dfstrHomeaddressLiveYear4: dfstrHomeaddressLiveYear4,
      dfstrHomeaddressLiveMonth4: dfstrHomeaddressLiveMonth4,
      dfstrHomeaddress9: dfstrHomeaddress9,
      dfstrHomeaddress10: dfstrHomeaddress10,
      dfstrHomeaddressCity5: dfstrHomeaddressCity5,
      dfstrHomeaddressPostCode5: dfstrHomeaddressPostCode5,
      dfstrHomeaddressLiveYear5: dfstrHomeaddressLiveYear5,
      dfstrTitleQwner2: dfstrTitleQwner2,
      dfstrFirstNameowner: dfstrFirstNameowner,
      dfstrLastNameowner: dfstrLastNameowner,
      dfstrDobOwner2: dfstrDobOwner2,
      dfhome_Addressowner: dfhome_Addressowner,
      dfhome_Address2owner: dfhome_Address2owner,
      dfstrHomeAdressPostCodeowner: dfstrHomeAdressPostCodeowner,
      dfstrHomeAdressCityowner: dfstrHomeAdressCityowner,
      dfstrHomeaddressLiveYearowner: dfstrHomeaddressLiveYearowner,
      dfstrHomeaddressLiveMonthowner: dfstrHomeaddressLiveMonthowner,
      dfstrHomeaddress1owner: dfstrHomeaddress1owner,
      dfstrHomeaddress2owner: dfstrHomeaddress2owner,
      dfstrHomeaddressCity1owner: dfstrHomeaddressCity1owner,
      dfstrHomeaddressPostCode1owner: dfstrHomeaddressPostCode1owner,
      dfstrHomeaddressLiveYear1owner: dfstrHomeaddressLiveYear1owner,
      dfstrHomeaddressLiveMonth1owner: dfstrHomeaddressLiveMonth1owner,
      dfstrHomeaddress3owner: dfstrHomeaddress3owner,
      dfstrHomeaddress4owner: dfstrHomeaddress4owner,
      dfstrHomeaddressCity2owner: dfstrHomeaddressCity2owner,
      dfstrHomeaddressPostCode2owner: dfstrHomeaddressPostCode2owner,
      dfstrHomeaddressPostLiveYear2owner: dfstrHomeaddressPostLiveYear2owner,
      dfstrHomeaddressPostLiveMonth2owner: dfstrHomeaddressPostLiveMonth2owner,
      dfstrHomeaddress5owner: dfstrHomeaddress5owner,
      dfstrHomeaddress6owner: dfstrHomeaddress6owner,
      dfstrHomeaddressCity3owner: dfstrHomeaddressCity3owner,
      dfstrHomeaddressPostCode3owner: dfstrHomeaddressPostCode3owner,
      dfstrHomeaddressLiveYear3owner: dfstrHomeaddressLiveYear3owner,
      dfstrHomeaddressLivemonth3owner: dfstrHomeaddressLivemonth3owner,
      dfstrHomeaddress7owner: dfstrHomeaddress7owner,
      dfstrHomeaddress8owner: dfstrHomeaddress8owner,
      dfstrHomeaddressCity4owner: dfstrHomeaddressCity4owner,
      dfstrHomeaddressPostCode4owner: dfstrHomeaddressPostCode4owner,
      dfstrHomeaddressLiveYear4owner: dfstrHomeaddressLiveYear4owner,
      dfstrHomeaddressLiveMonth4owner: dfstrHomeaddressLiveMonth4owner,
      dfstrHomeaddress9owner: dfstrHomeaddress9owner,
      dfstrHomeaddress10owner: dfstrHomeaddress10owner,
      dfstrHomeaddressCity5owner: dfstrHomeaddressCity5owner,
      dfstrHomeaddressPostCode5owner: dfstrHomeaddressPostCode5owner,
      dfstrHomeaddressLiveYear5owner: dfstrHomeaddressLiveYear5owner,
      dfstrHomeaddressLiveMonth5owner: dfstrHomeaddressLiveMonth5owner,
      dfstrTitleQwner3: dfstrTitleQwner3,
      dfstrFirstNameowner3: dfstrFirstNameowner3,
      dfstrLastNameowner3: dfstrLastNameowner3,
      dfstrstrDobOwner3: dfstrstrDobOwner3,
      dfhome_Addressowner3: dfhome_Addressowner3,
      dfhome_Address2owner3: dfhome_Address2owner3,
      dfstrHomeAdressCityowner3: dfstrHomeAdressCityowner3,
      dfstrHomeAdressPostCodeowner3: dfstrHomeAdressPostCodeowner3,
      dfstrHomeaddressLiveYearowner3: dfstrHomeaddressLiveYearowner3,
      dfstrHomeaddressLiveMonthowner3: dfstrHomeaddressLiveMonthowner3,
      dfstrHomeaddress1owner3: dfstrHomeaddress1owner3,
      dfstrHomeaddress2owner3: dfstrHomeaddress2owner3,
      dfstrHomeaddressCity1owner3: dfstrHomeaddressCity1owner3,
      dfstrHomeaddressPostCode1owner3: dfstrHomeaddressPostCode1owner3,
      dfstrHomeaddressLiveYear1owner3: dfstrHomeaddressLiveYear1owner3,
      dfstrHomeaddressLiveMonth1owner3: dfstrHomeaddressLiveMonth1owner3,
      dfstrHomeaddress3owner3: dfstrHomeaddress3owner3,
      dfstrHomeaddress4owner3: dfstrHomeaddress4owner3,
      dfstrHomeaddressCity2owner3: dfstrHomeaddressCity2owner3,
      dfstrHomeaddressPostCode2owner3: dfstrHomeaddressPostCode2owner3,
      dfstrHomeaddressPostLiveYear2owner3: dfstrHomeaddressPostLiveYear2owner3,
      dfstrHomeaddressPostLiveMonth2owner3:
          dfstrHomeaddressPostLiveMonth2owner3,
      dfstrHomeaddress5owner3: dfstrHomeaddress5owner3,
      dfstrHomeaddress6owner3: dfstrHomeaddress6owner3,
      dfstrHomeaddressCity3owner3: dfstrHomeaddressCity3owner3,
      dfstrHomeaddressPostCode3owner3: dfstrHomeaddressPostCode3owner3,
      dfstrHomeaddressLiveYear3owner3: dfstrHomeaddressLiveYear3owner3,
      dfstrHomeaddressLivemonth3owner3: dfstrHomeaddressLivemonth3owner3,
      dfstrHomeaddress7owner3: dfstrHomeaddress7owner3,
      dfstrHomeaddress8owner3: dfstrHomeaddress8owner3,
      dfstrHomeaddressCity4owner3: dfstrHomeaddressCity4owner3,
      dfstrHomeaddressPostCode4owner3: dfstrHomeaddressPostCode4owner3,
      dfstrHomeaddressLiveYear4owner3: dfstrHomeaddressLiveYear4owner3,
      dfstrHomeaddressLiveMonth4owner3: dfstrHomeaddressLiveMonth4owner3,
      dfstrHomeaddress9owner3: dfstrHomeaddress9owner3,
      dfstrHomeaddress10owner3: dfstrHomeaddress10owner3,
      dfstrHomeaddressCity5owner3: dfstrHomeaddressCity5owner3,
      dfstrHomeaddressPostCode5owner3: dfstrHomeaddressPostCode5owner3,
      dfstrHomeaddressLiveYear5owner3: dfstrHomeaddressLiveYear5owner3,
      dfstrHomeaddressLiveMonth5owner3: dfstrHomeaddressLiveMonth5owner3,
      dfstrTitleQwner4: dfstrTitleQwner4,
      dfstrFirstNameowner4: dfstrFirstNameowner4,
      dfstrLastNameowner4: dfstrLastNameowner4,
      dfstrstrDobOwner4: dfstrstrDobOwner4,
      dfhome_Addressowner4: dfhome_Addressowner4,
      dfhome_Address2owner4: dfhome_Address2owner4,
      dfstrHomeAdressCityowner4: dfstrHomeAdressCityowner4,
      dfstrHomeAdressPostCodeowner4: dfstrHomeAdressPostCodeowner4,
      dfstrHomeaddressLiveYearowner4: dfstrHomeaddressLiveYearowner4,
      dfstrHomeaddressLiveMonthowner4: dfstrHomeaddressLiveMonthowner4,
      dfstrHomeaddress1owner4: dfstrHomeaddress1owner4,
      dfstrHomeaddress2owner4: dfstrHomeaddress2owner4,
      dfstrHomeaddressCity1owner4: dfstrHomeaddressCity1owner4,
      dfstrHomeaddressPostCode1owner4: dfstrHomeaddressPostCode1owner4,
      dfstrHomeaddressLiveYear1owner4: dfstrHomeaddressLiveYear1owner4,
      dfstrHomeaddressLiveMonth1owner4: dfstrHomeaddressLiveMonth1owner4,
      dfstrHomeaddress3owner4: dfstrHomeaddress3owner4,
      dfstrHomeaddress4owner4: dfstrHomeaddress4owner4,
      dfstrHomeaddressCity2owner4: dfstrHomeaddressCity2owner4,
      dfstrHomeaddressPostCode2owner4: dfstrHomeaddressPostCode2owner4,
      dfstrHomeaddressPostLiveYear2owner4: dfstrHomeaddressPostLiveYear2owner4,
      dfstrHomeaddressPostLiveMonth2owner4:
          dfstrHomeaddressPostLiveMonth2owner4,
      dfstrHomeaddress5owner4: dfstrHomeaddress5owner4,
      dfstrHomeaddress6owner4: dfstrHomeaddress6owner4,
      dfstrHomeaddressCity3owner4: dfstrHomeaddressCity3owner4,
      dfstrHomeaddressPostCode3owner4: dfstrHomeaddressPostCode3owner4,
      dfstrHomeaddressLiveYear3owner4: dfstrHomeaddressLiveYear3owner4,
      dfstrHomeaddressLivemonth3owner4: dfstrHomeaddressLivemonth3owner4,
      dfstrHomeaddress7owner4: dfstrHomeaddress7owner4,
      dfstrHomeaddress8owner4: dfstrHomeaddress8owner4,
      dfstrHomeaddressCity4owner4: dfstrHomeaddressCity4owner4,
      dfstrHomeaddressPostCode4owner4: dfstrHomeaddressPostCode4owner4,
      dfstrHomeaddressLiveYear4owner4: dfstrHomeaddressLiveYear4owner4,
      dfstrHomeaddressLiveMonth4owner4: dfstrHomeaddressLiveMonth4owner4,
      dfstrHomeaddress9owner4: dfstrHomeaddress9owner4,
      dfstrHomeaddress10owner4: dfstrHomeaddress10owner4,
      dfstrHomeaddressCity5owner4: dfstrHomeaddressCity5owner4,
      dfstrHomeaddressPostCode5owner4: dfstrHomeaddressPostCode5owner4,
      dfstrHomeaddressLiveYear5owner4: dfstrHomeaddressLiveYear5owner4,
      dfstrHomeaddressLiveMonth5owner4: dfstrHomeaddressLiveMonth5owner4,
      dfstrTitleQwner5: dfstrTitleQwner5,
      dfstrFirstNameowner5: dfstrFirstNameowner5,
      dfstrLastNameowner5: dfstrLastNameowner5,
      dfstrstrDobOwner5: dfstrstrDobOwner5,
      dfhome_Addressowner5: dfhome_Addressowner5,
      dfhome_Address2owner5: dfhome_Address2owner5,
      dfstrHomeAdressCityowner5: dfstrHomeAdressCityowner5,
      dfstrHomeAdressPostCodeowner5: dfstrHomeAdressPostCodeowner5,
      dfstrHomeaddressLiveYearowner5: dfstrHomeaddressLiveYearowner5,
      dfstrHomeaddressLiveMonthowner5: dfstrHomeaddressLiveMonthowner5,
      dfstrHomeaddress1owner5: dfstrHomeaddress1owner5,
      dfstrHomeaddress2owner5: dfstrHomeaddress2owner5,
      dfstrHomeaddressCity1owner5: dfstrHomeaddressCity1owner5,
      dfstrHomeaddressPostCode1owner5: dfstrHomeaddressPostCode1owner5,
      dfstrHomeaddressLiveYear1owner5: dfstrHomeaddressLiveYear1owner5,
      dfstrHomeaddressLiveMonth1owner5: dfstrHomeaddressLiveMonth1owner5,
      dfstrHomeaddress3owner5: dfstrHomeaddress3owner5,
      dfstrHomeaddress4owner5: dfstrHomeaddress4owner5,
      dfstrHomeaddressCity2owner5: dfstrHomeaddressCity2owner5,
      dfstrHomeaddressPostCode2owner5: dfstrHomeaddressPostCode2owner5,
      dfstrHomeaddressPostLiveYear2owner5: dfstrHomeaddressPostLiveYear2owner5,
      dfstrHomeaddressPostLiveMonth2owner5:
          dfstrHomeaddressPostLiveMonth2owner5,
      dfstrHomeaddress5owner5: dfstrHomeaddress5owner5,
      dfstrHomeaddress6owner5: dfstrHomeaddress6owner5,
      dfstrHomeaddressCity3owner5: dfstrHomeaddressCity3owner5,
      dfstrHomeaddressPostCode3owner5: dfstrHomeaddressPostCode3owner5,
      dfstrHomeaddressLiveYear3owner5: dfstrHomeaddressLiveYear3owner5,
      dfstrHomeaddressLivemonth3owner5: dfstrHomeaddressLivemonth3owner5,
      dfstrHomeaddress7owner5: dfstrHomeaddress7owner5,
      dfstrHomeaddress8owner5: dfstrHomeaddress8owner5,
      dfstrHomeaddressCity4owner5: dfstrHomeaddressCity4owner5,
      dfstrHomeaddressPostCode4owner5: dfstrHomeaddressPostCode4owner5,
      dfstrHomeaddressLiveYear4owner5: dfstrHomeaddressLiveYear4owner5,
      dfstrHomeaddressLiveMonth4owner5: dfstrHomeaddressLiveMonth4owner5,
      dfstrHomeaddress9owner5: dfstrHomeaddress9owner5,
      dfstrHomeaddress10owner5: dfstrHomeaddress10owner5,
      dfstrHomeaddressCity5owner5: dfstrHomeaddressCity5owner5,
      dfstrHomeaddressPostCode5owner5: dfstrHomeaddressPostCode5owner5,
      dfstrHomeaddressLiveYear5owner5: dfstrHomeaddressLiveYear5owner5,
      dfstrHomeaddressLiveMonth5owner5: dfstrHomeaddressLiveMonth5owner5,
      dfstrTitleQwner6: dfstrTitleQwner6,
      dfstrFirstNameowner6: dfstrFirstNameowner6,
      dfstrLastNameowner6: dfstrLastNameowner6,
      dfstrstrDobOwner6: dfstrstrDobOwner6,
      dfhome_Addressowner6: dfhome_Addressowner6,
      dfhome_Address2owner6: dfhome_Address2owner6,
      dfstrHomeAdressCityowner6: dfstrHomeAdressCityowner6,
      dfstrHomeAdressPostCodeowner6: dfstrHomeAdressPostCodeowner6,
      dfstrHomeaddressLiveYearowner6: dfstrHomeaddressLiveYearowner6,
      dfstrHomeaddressLiveMonthowner6: dfstrHomeaddressLiveMonthowner6,
      dfstrHomeaddress1owner6: dfstrHomeaddress1owner6,
      dfstrHomeaddress2owner6: dfstrHomeaddress2owner6,
      dfstrHomeaddressCity1owner6: dfstrHomeaddressCity1owner6,
      dfstrHomeaddressPostCode1owner6: dfstrHomeaddressPostCode1owner6,
      dfstrHomeaddressLiveYear1owner6: dfstrHomeaddressLiveYear1owner6,
      dfstrHomeaddressLiveMonth1owner6: dfstrHomeaddressLiveMonth1owner6,
      dfstrHomeaddress3owner6: dfstrHomeaddress3owner6,
      dfstrHomeaddress4owner6: dfstrHomeaddress4owner6,
      dfstrHomeaddressCity2owner6: dfstrHomeaddressCity2owner6,
      dfstrHomeaddressPostCode2owner6: dfstrHomeaddressPostCode2owner6,
      dfstrHomeaddressPostLiveYear2owner6: dfstrHomeaddressPostLiveYear2owner6,
      dfstrHomeaddressPostLiveMonth2owner6:
          dfstrHomeaddressPostLiveMonth2owner6,
      dfstrHomeaddress5owner6: dfstrHomeaddress5owner6,
      dfstrHomeaddress6owner6: dfstrHomeaddress6owner6,
      dfstrHomeaddressCity3owner6: dfstrHomeaddressCity3owner6,
      dfstrHomeaddressPostCode3owner6: dfstrHomeaddressPostCode3owner6,
      dfstrHomeaddressLiveYear3owner6: dfstrHomeaddressLiveYear3owner6,
      dfstrHomeaddressLivemonth3owner6: dfstrHomeaddressLivemonth3owner6,
      dfstrHomeaddress7owner6: dfstrHomeaddress7owner6,
      dfstrHomeaddress8owner6: dfstrHomeaddress8owner6,
      dfstrHomeaddressCity4owner6: dfstrHomeaddressCity4owner6,
      dfstrHomeaddressPostCode4owner6: dfstrHomeaddressPostCode4owner6,
      dfstrHomeaddressLiveYear4owner6: dfstrHomeaddressLiveYear4owner6,
      dfstrHomeaddressLiveMonth4owner6: dfstrHomeaddressLiveMonth4owner6,
      dfstrHomeaddress9owner6: dfstrHomeaddress9owner6,
      dfstrHomeaddress10owner6: dfstrHomeaddress10owner6,
      dfstrHomeaddressCity5owner6: dfstrHomeaddressCity5owner6,
      dfstrHomeaddressPostCode5owner6: dfstrHomeaddressPostCode5owner6,
      dfstrHomeaddressLiveYear5owner6: dfstrHomeaddressLiveYear5owner6,
      dfstrHomeaddressLiveMonth5owner6: dfstrHomeaddressLiveMonth5owner6,
    );
  }
}
