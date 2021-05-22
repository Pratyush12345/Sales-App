import 'package:pozitive/Core/Model/Api/Electricity-InsertAddProspect/EleBusinessOwnershipDetailsCredential.dart';
import 'package:shared_preferences/shared_preferences.dart';

class EleBusinessTypePref {
  /// other Business<Add-Prosp> set
  static void setOtherBusinessTypeAdd(
      OtherBusinessCredential businessTypeAddressCredential) async {
    print(businessTypeAddressCredential.toJson());
    // print(businessTypeAddressCredential.otherstrTitleOtherowner1);
    print('other business set method');

    final sharedPreferences = await SharedPreferences.getInstance();

    if (businessTypeAddressCredential.otherstrTitleOtherowner1 != null) {
      sharedPreferences.setString("otherstrTitleOtherowner1",
          businessTypeAddressCredential.otherstrTitleOtherowner1);
    }
    if (businessTypeAddressCredential.otherstrOtherowner1FirstName != null) {
      sharedPreferences.setString("otherstrOtherowner1FirstName",
          businessTypeAddressCredential.otherstrOtherowner1FirstName);
    }
    if (businessTypeAddressCredential.otherstrOtherowner1LastName != null) {
      sharedPreferences.setString("otherstrOtherowner1LastName",
          businessTypeAddressCredential.otherstrOtherowner1LastName);
    }
    if (businessTypeAddressCredential.otherstrTitleOtherowner2 != null) {
      sharedPreferences.setString("otherstrTitleOtherowner2",
          businessTypeAddressCredential.otherstrTitleOtherowner2);
    }
    if (businessTypeAddressCredential.otherstrOtherowner2FirstName != null) {
      sharedPreferences.setString("otherstrOtherowner2FirstName",
          businessTypeAddressCredential.otherstrOtherowner2FirstName);
    }
    if (businessTypeAddressCredential.otherstrOtherowner2LastName != null) {
      sharedPreferences.setString("otherstrOtherowner2LastName",
          businessTypeAddressCredential.otherstrOtherowner2LastName);
    }
  }

  static void clearELEOtherBusiness() async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString("otherstrTitleOtherowner1", null);
  }

  ///other Business<Add-Prosp> getMethod

  static Future<OtherBusinessCredential> getOtherBusinessTypeAdd() async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();

    String otherstrTitleOtherowner1 =
        preferences.getString("otherstrTitleOtherowner1");
    String otherstrOtherowner1FirstName =
        preferences.getString("otherstrOtherowner1FirstName");
    String otherstrOtherowner1LastName =
        preferences.getString("otherstrOtherowner1LastName");
    String otherstrTitleOtherowner2 =
        preferences.getString("otherstrTitleOtherowner2");
    String otherstrOtherowner2FirstName =
        preferences.getString("otherstrOtherowner2FirstName");
    String otherstrOtherowner2LastName =
        preferences.getString("otherstrOtherowner2LastName");

    print('#####OwnerShip Details....$otherstrTitleOtherowner1');
    if (otherstrTitleOtherowner1 != null) {
      return new OtherBusinessCredential(
        otherstrTitleOtherowner1: otherstrTitleOtherowner1,
        otherstrOtherowner1FirstName: otherstrOtherowner1FirstName,
        otherstrOtherowner1LastName: otherstrOtherowner1LastName,
        otherstrTitleOtherowner2: otherstrTitleOtherowner2,
        otherstrOtherowner2FirstName: otherstrOtherowner2FirstName,
        otherstrOtherowner2LastName: otherstrOtherowner2LastName,
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
      sharedPreferences.setString("ltdELEstrTitleDirector1",
          businessTypeAddressCredential.strTitleDirector1);
    }
    if (businessTypeAddressCredential.strDirector1Firstname != null) {
      sharedPreferences.setString("ltdELEstrDirector1Firstname",
          businessTypeAddressCredential.strDirector1Firstname);
    }
    if (businessTypeAddressCredential.strDirector1Lastname != null) {
      sharedPreferences.setString("ltdELEstrDirector1Lastname",
          businessTypeAddressCredential.strDirector1Lastname);
    }
    if (businessTypeAddressCredential.strTitleDirector2 != null) {
      sharedPreferences.setString("ltdELEstrTitleDirector2",
          businessTypeAddressCredential.strTitleDirector2);
    }
    if (businessTypeAddressCredential.strDirector2Firstname != null) {
      sharedPreferences.setString("ltdELEstrDirector2Firstname",
          businessTypeAddressCredential.strDirector2Firstname);
    }
    if (businessTypeAddressCredential.strDirector2Lastname != null) {
      sharedPreferences.setString("ltdELEstrDirector2Lastname",
          businessTypeAddressCredential.strDirector2Lastname);
    }
  }

  static void clearELELTDBusiness() async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString("ltdELEstrTitleDirector1", null);
  }

  ///ltd Business<Add-Prosp> getMethod
  static Future<LtdBusinessCredential> getltdBusinessTypeAdd() async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();

    String strTitleDirector1 = preferences.getString("ltdELEstrTitleDirector1");
    String strDirector1Firstname =
        preferences.getString("ltdELEstrDirector1Firstname");
    String strDirector1Lastname =
        preferences.getString("ltdELEstrDirector1Lastname");
    String strTitleDirector2 = preferences.getString("ltdELEstrTitleDirector2");
    String strDirector2Firstname =
        preferences.getString("ltdELEstrDirector2Firstname");
    String strDirector2Lastname =
        preferences.getString("ltdELEstrDirector2Lastname");

    print('#####OwnerShip Details....$strTitleDirector1');
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
      sharedPreferences.setString("charityELEstrTitlecharityowner1",
          businessTypeAddressCredential.strTitlecharityowner1);
    }
    if (businessTypeAddressCredential.strcharityowner1firstname != null) {
      sharedPreferences.setString("charityELEstrcharityowner1firstname",
          businessTypeAddressCredential.strcharityowner1firstname);
    }
    if (businessTypeAddressCredential.strcharityowner1lastname != null) {
      sharedPreferences.setString("charityELEstrcharityowner1lastname",
          businessTypeAddressCredential.strcharityowner1lastname);
    }
    if (businessTypeAddressCredential.strTitlecharityowner2 != null) {
      sharedPreferences.setString("charityELEstrTitlecharityowner2",
          businessTypeAddressCredential.strTitlecharityowner2);
    }
    if (businessTypeAddressCredential.strcharityowner2firstname != null) {
      sharedPreferences.setString("charityELEstrcharityowner2firstname",
          businessTypeAddressCredential.strcharityowner2firstname);
    }
    if (businessTypeAddressCredential.strcharityowner2lastname != null) {
      sharedPreferences.setString("charityELEstrcharityowner2lastname",
          businessTypeAddressCredential.strcharityowner2lastname);
    }
    if (businessTypeAddressCredential.strchariryRegisterNo != null) {
      sharedPreferences.setString("charityELEstrchariryRegisterNo",
          businessTypeAddressCredential.strchariryRegisterNo);
    }
  }

  static void clearELECharityBusiness() async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString("charityELEstrTitlecharityowner1", null);
  }

  ///Charity Business<Add-Prosp> getMethod
  static Future<CharityBusinessCredential> getCharityBusinessTypeAdd() async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();

    String strTitlecharityowner1 =
        preferences.getString("charityELEstrTitlecharityowner1");
    String strcharityowner1firstname =
        preferences.getString("charityELEstrcharityowner1firstname");
    String strcharityowner1lastname =
        preferences.getString("charityELEstrcharityowner1lastname");
    String strTitlecharityowner2 =
        preferences.getString("charityELEstrTitlecharityowner2");
    String strcharityowner2firstname =
        preferences.getString("charityELEstrcharityowner2firstname");
    String strcharityowner2lastname =
        preferences.getString("charityELEstrcharityowner2lastname");
    String strchariryRegisterNo =
        preferences.getString("charityELEstrchariryRegisterNo");

    print('#####OwnerShip Details....$strTitlecharityowner1');
    if (strTitlecharityowner1 != null) {
      return new CharityBusinessCredential(
        strTitlecharityowner1: strTitlecharityowner1,
        strcharityowner1firstname: strcharityowner1firstname,
        strcharityowner1lastname: strcharityowner1lastname,
        strTitlecharityowner2: strTitlecharityowner2,
        strcharityowner2firstname: strcharityowner2firstname,
        strcharityowner2lastname: strcharityowner2lastname,
        strchariryRegisterNo: strchariryRegisterNo,
      );
    } else {
      return null;
    }
  }

  /// llp Business<Add-Prosp> set
  static void setLLPBusinessTypeAdd(
      LLPBusinessCredential businessTypeAddressCredential) async {
    print(businessTypeAddressCredential.toJson());
    print(businessTypeAddressCredential.strLLPowner1FirstName);

    final sharedPreferences = await SharedPreferences.getInstance();

    if (businessTypeAddressCredential.strTitleLLPowner1 != null) {
      sharedPreferences.setString("llpELEstrTitleLLPowner1",
          businessTypeAddressCredential.strTitleLLPowner1);
    }
    if (businessTypeAddressCredential.strLLPowner1FirstName != null) {
      sharedPreferences.setString("llpELEstrLLPowner1FirstName",
          businessTypeAddressCredential.strLLPowner1FirstName);
    }
    if (businessTypeAddressCredential.strLLPowner1LastName != null) {
      sharedPreferences.setString("llpELEstrLLPowner1LastName",
          businessTypeAddressCredential.strLLPowner1LastName);
    }
    if (businessTypeAddressCredential.strTitleLLPowner2 != null) {
      sharedPreferences.setString("llpELEstrTitleLLPowner2",
          businessTypeAddressCredential.strTitleLLPowner2);
    }
    if (businessTypeAddressCredential.strLLPowner2FirstName != null) {
      sharedPreferences.setString("llpELEstrLLPowner2FirstName",
          businessTypeAddressCredential.strLLPowner2FirstName);
    }
    if (businessTypeAddressCredential.strLLPowner2LastName != null) {
      sharedPreferences.setString("llpELEstrLLPowner2LastName",
          businessTypeAddressCredential.strLLPowner2LastName);
    }
  }

  static void clearELELLPBusiness() async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString("llpELEstrTitleLLPowner1", null);
  }

  ///llp Business<Add-Prosp> getMethod
  static Future<LLPBusinessCredential> getLLPBusinessTypeAdd() async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();

    String strTitleLLPowner1 = preferences.getString("llpELEstrTitleLLPowner1");
    String strLLPowner1FirstName =
        preferences.getString("llpELEstrLLPowner1FirstName");
    String strLLPowner1LastName =
        preferences.getString("llpELEstrLLPowner1LastName");
    String strTitleLLPowner2 = preferences.getString("llpELEstrTitleLLPowner2");
    String strLLPowner2FirstName =
        preferences.getString("llpELEstrLLPowner2FirstName");
    String strLLPowner2LastName =
        preferences.getString("llpELEstrLLPowner2LastName");

    print('#####LLP--OwnerShip Details....$strTitleLLPowner1');

    if (strTitleLLPowner1 != null) {
      return new LLPBusinessCredential(
        strTitleLLPowner1: strTitleLLPowner1,
        strLLPowner1FirstName: strLLPowner1FirstName,
        strLLPowner1LastName: strLLPowner1LastName,
        strTitleLLPowner2: strTitleLLPowner2,
        strLLPowner2FirstName: strLLPowner2FirstName,
        strLLPowner2LastName: strLLPowner2LastName,
      );
    } else {
      return null;
    }
  }

  /// llc Business<Add-Prosp> set
  static void setLLCBusinessTypeAdd(
      LLCBusinessCredential businessTypeAddressCredential) async {
    print(businessTypeAddressCredential.toJson());
    print(businessTypeAddressCredential.strLLcowner1FirstName);

    final sharedPreferences = await SharedPreferences.getInstance();

    if (businessTypeAddressCredential.strTitleLLcowner1 != null) {
      sharedPreferences.setString("llcELEstrTitleLLcowner1",
          businessTypeAddressCredential.strTitleLLcowner1);
    }
    if (businessTypeAddressCredential.strLLcowner1FirstName != null) {
      sharedPreferences.setString("llcELEstrLLcowner1FirstName",
          businessTypeAddressCredential.strLLcowner1FirstName);
    }
    if (businessTypeAddressCredential.strLLcowner1LastName != null) {
      sharedPreferences.setString("llcELEstrLLcowner1LastName",
          businessTypeAddressCredential.strLLcowner1LastName);
    }
    if (businessTypeAddressCredential.strTitleLLcowner2 != null) {
      sharedPreferences.setString("llcELEstrTitleLLcowner2",
          businessTypeAddressCredential.strTitleLLcowner2);
    }
    if (businessTypeAddressCredential.strLLcowner2FirstName != null) {
      sharedPreferences.setString("llcELEstrLLcowner2FirstName",
          businessTypeAddressCredential.strLLcowner2FirstName);
    }
    if (businessTypeAddressCredential.strLLcowner2LastName != null) {
      sharedPreferences.setString("llcELEstrLLcowner2LastName",
          businessTypeAddressCredential.strLLcowner2LastName);
    }
  }

  static void clearELELLCBusiness() async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString("llcELEstrTitleLLcowner1", null);
  }

  ///llc Business<Add-Prosp> getMethod
  static Future<LLCBusinessCredential> getLLCBusinessTypeAdd() async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();

    String strTitleLLcowner1 = preferences.getString("llcELEstrTitleLLcowner1");
    String strLLcowner1FirstName =
        preferences.getString("llcELEstrLLcowner1FirstName");
    String strLLcowner1LastName =
        preferences.getString("llcELEstrLLcowner1LastName");
    String strTitleLLcowner2 = preferences.getString("llcELEstrTitleLLcowner2");
    String strLLcowner2FirstName =
        preferences.getString("llcELEstrLLcowner2FirstName");
    String strLLcowner2LastName =
        preferences.getString("llcELEstrLLcowner2LastName");

    print('#####LLP--OwnerShip Details....$strTitleLLcowner1');
    if (strTitleLLcowner1 != null)
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
      sharedPreferences.setString("soleELEstrTitleQwner1",
          businessTypeAddressCredential.strTitleQwner1);
    }
    if (businessTypeAddressCredential.firstName != null) {
      sharedPreferences.setString(
          "soleELEfirstName", businessTypeAddressCredential.firstName);
    }
    if (businessTypeAddressCredential.lastName != null) {
      sharedPreferences.setString(
          "soleELElastName", businessTypeAddressCredential.lastName);
    }
    if (businessTypeAddressCredential.strTitleDirector2 != null) {
      sharedPreferences.setString("soleELEstrTitleDirector2",
          businessTypeAddressCredential.strTitleDirector2);
    }
    if (businessTypeAddressCredential.strDirector2Firstname != null) {
      sharedPreferences.setString("soleELEstrDirector2Firstname",
          businessTypeAddressCredential.strDirector2Firstname);
    }
    if (businessTypeAddressCredential.strDirector2Lastname != null) {
      sharedPreferences.setString("soleELEstrDirector2Lastname",
          businessTypeAddressCredential.strDirector2Lastname);
    }
    if (businessTypeAddressCredential.strDobOwner1 != null) {
      sharedPreferences.setString(
          "soleELEstrDobOwner1", businessTypeAddressCredential.strDobOwner1);
    }
    if (businessTypeAddressCredential.home_Address != null) {
      sharedPreferences.setString(
          "soleELEhome_Address", businessTypeAddressCredential.home_Address);
    }
    if (businessTypeAddressCredential.home_Address2 != null) {
      sharedPreferences.setString(
          "soleELEhome_Address2", businessTypeAddressCredential.home_Address2);
    }
    if (businessTypeAddressCredential.strHomeAdressPostCode != null) {
      sharedPreferences.setString("soleELEstrHomeAdressPostCode",
          businessTypeAddressCredential.strHomeAdressPostCode);
    }
    if (businessTypeAddressCredential.strHomeAdressCity != null) {
      sharedPreferences.setString("soleELEstrHomeAdressCity",
          businessTypeAddressCredential.strHomeAdressCity);
    }
    if (businessTypeAddressCredential.strHomeaddressLiveYear != null) {
      sharedPreferences.setString("soleELEstrHomeaddressLiveYear",
          businessTypeAddressCredential.strHomeaddressLiveYear);
    }
    if (businessTypeAddressCredential.strHomeaddressLiveMonth != null) {
      sharedPreferences.setString("soleELEstrHomeaddressLiveMonth",
          businessTypeAddressCredential.strHomeaddressLiveMonth);
    }
    if (businessTypeAddressCredential.strHomeaddress1 != null) {
      sharedPreferences.setString("soleELEstrHomeaddress1",
          businessTypeAddressCredential.strHomeaddress1);
    }
    if (businessTypeAddressCredential.strHomeaddress2 != null) {
      sharedPreferences.setString("soleELEstrHomeaddress2",
          businessTypeAddressCredential.strHomeaddress2);
    }
    if (businessTypeAddressCredential.strHomeaddressCity1 != null) {
      sharedPreferences.setString("soleELEstrHomeaddressCity1",
          businessTypeAddressCredential.strHomeaddressCity1);
    }
    if (businessTypeAddressCredential.strHomeaddressPostCode1 != null) {
      sharedPreferences.setString("soleELEstrHomeaddressPostCode1",
          businessTypeAddressCredential.strHomeaddressPostCode1);
    }
    if (businessTypeAddressCredential.strHomeaddressLiveYear1 != null) {
      sharedPreferences.setString("soleELEstrHomeaddressLiveYear1",
          businessTypeAddressCredential.strHomeaddressLiveYear1);
    }
    if (businessTypeAddressCredential.strHomeaddressLiveMonth1 != null) {
      sharedPreferences.setString("soleELEstrHomeaddressLiveMonth1",
          businessTypeAddressCredential.strHomeaddressLiveMonth1);
    }
    if (businessTypeAddressCredential.strHomeaddress3 != null) {
      sharedPreferences.setString("soleELEstrHomeaddress3",
          businessTypeAddressCredential.strHomeaddress3);
    }
    if (businessTypeAddressCredential.strHomeaddress4 != null) {
      sharedPreferences.setString("soleELEstrHomeaddress4",
          businessTypeAddressCredential.strHomeaddress4);
    }
    if (businessTypeAddressCredential.strHomeaddressCity2 != null) {
      sharedPreferences.setString("soleELEstrHomeaddressCity2",
          businessTypeAddressCredential.strHomeaddressCity2);
    }
    if (businessTypeAddressCredential.strHomeaddressPostCode2 != null) {
      sharedPreferences.setString("soleELEstrHomeaddressPostCode2",
          businessTypeAddressCredential.strHomeaddressPostCode2);
    }
    if (businessTypeAddressCredential.strHomeaddressPostLiveYear2 != null) {
      sharedPreferences.setString("soleELEstrHomeaddressPostLiveYear2",
          businessTypeAddressCredential.strHomeaddressPostLiveYear2);
    }
    if (businessTypeAddressCredential.strHomeaddressPostLiveMonth2 != null) {
      sharedPreferences.setString("soleELEstrHomeaddressPostLiveMonth2",
          businessTypeAddressCredential.strHomeaddressPostLiveMonth2);
    }
    if (businessTypeAddressCredential.strHomeaddress5 != null) {
      sharedPreferences.setString("soleELEstrHomeaddress5",
          businessTypeAddressCredential.strHomeaddress5);
    }
    if (businessTypeAddressCredential.strHomeaddress6 != null) {
      sharedPreferences.setString("soleELEstrHomeaddress6",
          businessTypeAddressCredential.strHomeaddress6);
    }
    if (businessTypeAddressCredential.strHomeaddressCity3 != null) {
      sharedPreferences.setString("soleELEstrHomeaddressCity3",
          businessTypeAddressCredential.strHomeaddressCity3);
    }
    if (businessTypeAddressCredential.strHomeaddressPostCode3 != null) {
      sharedPreferences.setString("soleELEstrHomeaddressPostCode3",
          businessTypeAddressCredential.strHomeaddressPostCode3);
    }
    if (businessTypeAddressCredential.strHomeaddressLiveYear3 != null) {
      sharedPreferences.setString("soleELEstrHomeaddressLiveYear3",
          businessTypeAddressCredential.strHomeaddressLiveYear3);
    }
    if (businessTypeAddressCredential.strHomeaddressLivemonth3 != null) {
      sharedPreferences.setString("soleELEstrHomeaddressLivemonth3",
          businessTypeAddressCredential.strHomeaddressLivemonth3);
    }
    if (businessTypeAddressCredential.strHomeaddress7 != null) {
      sharedPreferences.setString("soleELEstrHomeaddress7",
          businessTypeAddressCredential.strHomeaddress7);
    }
    if (businessTypeAddressCredential.strHomeaddress8 != null) {
      sharedPreferences.setString("soleELEstrHomeaddress8",
          businessTypeAddressCredential.strHomeaddress8);
    }
    if (businessTypeAddressCredential.strHomeaddressCity4 != null) {
      sharedPreferences.setString("soleELEstrHomeaddressCity4",
          businessTypeAddressCredential.strHomeaddressCity4);
    }
    if (businessTypeAddressCredential.strHomeaddressPostCode4 != null) {
      sharedPreferences.setString("soleELEstrHomeaddressPostCode4",
          businessTypeAddressCredential.strHomeaddressPostCode4);
    }
    if (businessTypeAddressCredential.strHomeaddressLiveYear4 != null) {
      sharedPreferences.setString("soleELEstrHomeaddressLiveYear4",
          businessTypeAddressCredential.strHomeaddressLiveYear4);
    }
    if (businessTypeAddressCredential.strHomeaddressLiveMonth4 != null) {
      sharedPreferences.setString("soleELEstrHomeaddressLiveMonth4",
          businessTypeAddressCredential.strHomeaddressLiveMonth4);
    }
    if (businessTypeAddressCredential.strHomeaddress9 != null) {
      sharedPreferences.setString("soleELEstrHomeaddress9",
          businessTypeAddressCredential.strHomeaddress9);
    }
    if (businessTypeAddressCredential.strHomeaddress10 != null) {
      sharedPreferences.setString("soleELEstrHomeaddress10",
          businessTypeAddressCredential.strHomeaddress10);
    }
    if (businessTypeAddressCredential.strHomeaddressCity5 != null) {
      sharedPreferences.setString("soleELEstrHomeaddressCity5",
          businessTypeAddressCredential.strHomeaddressCity5);
    }
    if (businessTypeAddressCredential.strHomeaddressPostCode5 != null) {
      sharedPreferences.setString("soleELEstrHomeaddressPostCode5",
          businessTypeAddressCredential.strHomeaddressPostCode5);
    }
    if (businessTypeAddressCredential.strHomeaddressLiveYear5 != null) {
      sharedPreferences.setString("soleELEstrHomeaddressLiveYear5",
          businessTypeAddressCredential.strHomeaddressLiveYear5);
    }
    if (businessTypeAddressCredential.strHomeaddressLiveMonth5owner != null) {
      sharedPreferences.setString("soleELEstrHomeaddressLiveMonth5owner",
          businessTypeAddressCredential.strHomeaddressLiveMonth5owner);
    }
  }

  static void clearELESoleBusiness() async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString("soleELEstrTitleQwner1", null);
  }

  ///Sole Business<Add-Prosp> getMethod
  static Future<SoleBusinessCredential> getSoleBusinessTypeAdd() async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();

    String strTitleQwner1 = preferences.getString("soleELEstrTitleQwner1");
    String firstName = preferences.getString("soleELEfirstName");
    String lastName = preferences.getString("soleELElastName");
    String strTitleDirector2 =
        preferences.getString("soleELEstrTitleDirector2");
    String strDirector2Firstname =
        preferences.getString("soleELEstrDirector2Firstname");
    String strDirector2Lastname =
        preferences.getString("soleELEstrDirector2Lastname");
    String strDobOwner1 = preferences.getString("soleELEstrDobOwner1");
    String home_Address = preferences.getString("soleELEhome_Address");
    String home_Address2 = preferences.getString("soleELEhome_Address2");
    String strHomeAdressPostCode =
        preferences.getString("soleELEstrHomeAdressPostCode");
    String strHomeAdressCity =
        preferences.getString("soleELEstrHomeAdressCity");
    String strHomeaddressLiveYear =
        preferences.getString("soleELEstrHomeaddressLiveYear");
    String strHomeaddressLiveMonth =
        preferences.getString("soleELEstrHomeaddressLiveMonth");
    String strHomeaddress1 = preferences.getString("soleELEstrHomeaddress1");
    String strHomeaddress2 = preferences.getString("soleELEstrHomeaddress2");
    String strHomeaddressCity1 =
        preferences.getString("soleELEstrHomeaddressCity1");
    String strHomeaddressPostCode1 =
        preferences.getString("soleELEstrHomeaddressPostCode1");
    String strHomeaddressLiveYear1 =
        preferences.getString("soleELEstrHomeaddressLiveYear1");
    String strHomeaddressLiveMonth1 =
        preferences.getString("soleELEstrHomeaddressLiveMonth1");
    String strHomeaddress3 = preferences.getString("soleELEstrHomeaddress3");
    String strHomeaddress4 = preferences.getString("soleELEstrHomeaddress4");
    String strHomeaddressCity2 =
        preferences.getString("soleELEstrHomeaddressCity2");
    String strHomeaddressPostCode2 =
        preferences.getString("soleELEstrHomeaddressPostCode2");
    String strHomeaddressPostLiveYear2 =
        preferences.getString("soleELEstrHomeaddressPostLiveYear2");
    String strHomeaddressPostLiveMonth2 =
        preferences.getString("soleELEstrHomeaddressPostLiveMonth2");
    String strHomeaddress5 = preferences.getString("soleELEstrHomeaddress5");
    String strHomeaddress6 = preferences.getString("soleELEstrHomeaddress6");
    String strHomeaddressCity3 =
        preferences.getString("soleELEstrHomeaddressCity3");
    String strHomeaddressPostCode3 =
        preferences.getString("soleELEstrHomeaddressPostCode3");
    String strHomeaddressLiveYear3 =
        preferences.getString("soleELEstrHomeaddressLiveYear3");
    String strHomeaddressLivemonth3 =
        preferences.getString("soleELEstrHomeaddressLivemonth3");
    String strHomeaddress7 = preferences.getString("soleELEstrHomeaddress7");
    String strHomeaddress8 = preferences.getString("soleELEstrHomeaddress8");
    String strHomeaddressCity4 =
        preferences.getString("soleELEstrHomeaddressCity4");
    String strHomeaddressPostCode4 =
        preferences.getString("soleELEstrHomeaddressPostCode4");
    String strHomeaddressLiveYear4 =
        preferences.getString("soleELEstrHomeaddressLiveYear4");
    String strHomeaddressLiveMonth4 =
        preferences.getString("soleELEstrHomeaddressLiveMonth4");
    String strHomeaddress9 = preferences.getString("soleELEstrHomeaddress9");
    String strHomeaddress10 = preferences.getString("soleELEstrHomeaddress10");
    String strHomeaddressCity5 =
        preferences.getString("soleELEstrHomeaddressCity5");
    String strHomeaddressPostCode5 =
        preferences.getString("soleELEstrHomeaddressPostCode5");
    String strHomeaddressLiveYear5 =
        preferences.getString("soleELEstrHomeaddressLiveYear5");
    String strHomeaddressLiveMonth5owner =
        preferences.getString("soleELEstrHomeaddressLiveMonth5owner");

    print('#####Sole--OwnerShip Details....$strTitleQwner1');
    if (strTitleQwner1 != null) {
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
    } else {
      return null;
    }
  }

  /// Partner Business<Add-Prosp> set
  static void setPartnerShipBusinessTypeAdd(
      PartnerShipBusinessCredential businessTypeAddressCredential) async {
    print(businessTypeAddressCredential.toJson());
    print(businessTypeAddressCredential.home_Address);

    final sharedPreferences = await SharedPreferences.getInstance();

    if (businessTypeAddressCredential.strTitleQwner1 != null) {
      sharedPreferences.setString("partnerELEstrTitleQwner1",
          businessTypeAddressCredential.strTitleQwner1);
    }
    if (businessTypeAddressCredential.firstName != null) {
      sharedPreferences.setString(
          "partnerELEfirstName", businessTypeAddressCredential.firstName);
    }
    if (businessTypeAddressCredential.lastName != null) {
      sharedPreferences.setString(
          "partnerELElastName", businessTypeAddressCredential.lastName);
    }
    if (businessTypeAddressCredential.strTitleDirector2 != null) {
      sharedPreferences.setString("partnerELEstrTitleDirector2",
          businessTypeAddressCredential.strTitleDirector2);
    }
    if (businessTypeAddressCredential.strDirector2Firstname != null) {
      sharedPreferences.setString("partnerELEstrDirector2Firstname",
          businessTypeAddressCredential.strDirector2Firstname);
    }
    if (businessTypeAddressCredential.strDirector2Lastname != null) {
      sharedPreferences.setString("partnerELEstrDirector2Lastname",
          businessTypeAddressCredential.strDirector2Lastname);
    }
    if (businessTypeAddressCredential.strDobOwner1 != null) {
      sharedPreferences.setString(
          "partnerELEstrDobOwner1", businessTypeAddressCredential.strDobOwner1);
    }
    if (businessTypeAddressCredential.home_Address != null) {
      sharedPreferences.setString(
          "partnerELEhome_Address", businessTypeAddressCredential.home_Address);
    }
    if (businessTypeAddressCredential.home_Address2 != null) {
      sharedPreferences.setString("partnerELEhome_Address2",
          businessTypeAddressCredential.home_Address2);
    }
    if (businessTypeAddressCredential.strHomeAdressPostCode != null) {
      sharedPreferences.setString("partnerELEstrHomeAdressPostCode",
          businessTypeAddressCredential.strHomeAdressPostCode);
    }
    if (businessTypeAddressCredential.strHomeAdressCity != null) {
      sharedPreferences.setString("partnerELEstrHomeAdressCity",
          businessTypeAddressCredential.strHomeAdressCity);
    }
    if (businessTypeAddressCredential.strHomeaddressLiveYear != null) {
      sharedPreferences.setString("partnerELEstrHomeaddressLiveYear",
          businessTypeAddressCredential.strHomeaddressLiveYear);
    }
    if (businessTypeAddressCredential.strHomeaddressLiveMonth != null) {
      sharedPreferences.setString("partnerELEstrHomeaddressLiveMonth",
          businessTypeAddressCredential.strHomeaddressLiveMonth);
    }
    if (businessTypeAddressCredential.strHomeaddress1 != null) {
      sharedPreferences.setString("partnerELEstrHomeaddress1",
          businessTypeAddressCredential.strHomeaddress1);
    }
    if (businessTypeAddressCredential.strHomeaddress2 != null) {
      sharedPreferences.setString("partnerELEstrHomeaddress2",
          businessTypeAddressCredential.strHomeaddress2);
    }
    if (businessTypeAddressCredential.strHomeaddressCity1 != null) {
      sharedPreferences.setString("partnerELEstrHomeaddressCity1",
          businessTypeAddressCredential.strHomeaddressCity1);
    }
    if (businessTypeAddressCredential.strHomeaddressPostCode1 != null) {
      sharedPreferences.setString("partnerELEstrHomeaddressPostCode1",
          businessTypeAddressCredential.strHomeaddressPostCode1);
    }
    if (businessTypeAddressCredential.strHomeaddressLiveYear1 != null) {
      sharedPreferences.setString("partnerELEstrHomeaddressLiveYear1",
          businessTypeAddressCredential.strHomeaddressLiveYear1);
    }
    if (businessTypeAddressCredential.strHomeaddressLiveMonth1 != null) {
      sharedPreferences.setString("partnerELEstrHomeaddressLiveMonth1",
          businessTypeAddressCredential.strHomeaddressLiveMonth1);
    }
    if (businessTypeAddressCredential.strHomeaddress3 != null) {
      sharedPreferences.setString("partnerELEstrHomeaddress3",
          businessTypeAddressCredential.strHomeaddress3);
    }
    if (businessTypeAddressCredential.strHomeaddress4 != null) {
      sharedPreferences.setString("partnerELEstrHomeaddress4",
          businessTypeAddressCredential.strHomeaddress4);
    }
    if (businessTypeAddressCredential.strHomeaddressCity2 != null) {
      sharedPreferences.setString("partnerELEstrHomeaddressCity2",
          businessTypeAddressCredential.strHomeaddressCity2);
    }
    if (businessTypeAddressCredential.strHomeaddressPostCode2 != null) {
      sharedPreferences.setString("partnerELEstrHomeaddressPostCode2",
          businessTypeAddressCredential.strHomeaddressPostCode2);
    }
    if (businessTypeAddressCredential.strHomeaddressPostLiveYear2 != null) {
      sharedPreferences.setString("partnerELEstrHomeaddressPostLiveYear2",
          businessTypeAddressCredential.strHomeaddressPostLiveYear2);
    }
    if (businessTypeAddressCredential.strHomeaddressPostLiveMonth2 != null) {
      sharedPreferences.setString("partnerELEstrHomeaddressPostLiveMonth2",
          businessTypeAddressCredential.strHomeaddressPostLiveMonth2);
    }
    if (businessTypeAddressCredential.strHomeaddress5 != null) {
      sharedPreferences.setString("partnerELEstrHomeaddress5",
          businessTypeAddressCredential.strHomeaddress5);
    }
    if (businessTypeAddressCredential.strHomeaddress6 != null) {
      sharedPreferences.setString("partnerELEstrHomeaddress6",
          businessTypeAddressCredential.strHomeaddress6);
    }
    if (businessTypeAddressCredential.strHomeaddressCity3 != null) {
      sharedPreferences.setString("partnerELEstrHomeaddressCity3",
          businessTypeAddressCredential.strHomeaddressCity3);
    }
    if (businessTypeAddressCredential.strHomeaddressPostCode3 != null) {
      sharedPreferences.setString("partnerELEstrHomeaddressPostCode3",
          businessTypeAddressCredential.strHomeaddressPostCode3);
    }
    if (businessTypeAddressCredential.strHomeaddressLiveYear3 != null) {
      sharedPreferences.setString("partnerELEstrHomeaddressLiveYear3",
          businessTypeAddressCredential.strHomeaddressLiveYear3);
    }
    if (businessTypeAddressCredential.strHomeaddressLivemonth3 != null) {
      sharedPreferences.setString("partnerELEstrHomeaddressLivemonth3",
          businessTypeAddressCredential.strHomeaddressLivemonth3);
    }
    if (businessTypeAddressCredential.strHomeaddress7 != null) {
      sharedPreferences.setString("partnerELEstrHomeaddress7",
          businessTypeAddressCredential.strHomeaddress7);
    }
    if (businessTypeAddressCredential.strHomeaddress8 != null) {
      sharedPreferences.setString("partnerELEstrHomeaddress8",
          businessTypeAddressCredential.strHomeaddress8);
    }
    if (businessTypeAddressCredential.strHomeaddressCity4 != null) {
      sharedPreferences.setString("partnerELEstrHomeaddressCity4",
          businessTypeAddressCredential.strHomeaddressCity4);
    }
    if (businessTypeAddressCredential.strHomeaddressPostCode4 != null) {
      sharedPreferences.setString("partnerELEstrHomeaddressPostCode4",
          businessTypeAddressCredential.strHomeaddressPostCode4);
    }
    if (businessTypeAddressCredential.strHomeaddressLiveYear4 != null) {
      sharedPreferences.setString("partnerELEstrHomeaddressLiveYear4",
          businessTypeAddressCredential.strHomeaddressLiveYear4);
    }
    if (businessTypeAddressCredential.strHomeaddressLiveMonth4 != null) {
      sharedPreferences.setString("partnerELEstrHomeaddressLiveMonth4",
          businessTypeAddressCredential.strHomeaddressLiveMonth4);
    }
    if (businessTypeAddressCredential.strHomeaddress9 != null) {
      sharedPreferences.setString("partnerELEstrHomeaddress9",
          businessTypeAddressCredential.strHomeaddress9);
    }
    if (businessTypeAddressCredential.strHomeaddress10 != null) {
      sharedPreferences.setString("partnerELEstrHomeaddress10",
          businessTypeAddressCredential.strHomeaddress10);
    }
    if (businessTypeAddressCredential.strHomeaddressCity5 != null) {
      sharedPreferences.setString("partnerELEstrHomeaddressCity5",
          businessTypeAddressCredential.strHomeaddressCity5);
    }
    if (businessTypeAddressCredential.strHomeaddressPostCode5 != null) {
      sharedPreferences.setString("partnerELEstrHomeaddressPostCode5",
          businessTypeAddressCredential.strHomeaddressPostCode5);
    }
    if (businessTypeAddressCredential.strHomeaddressLiveYear5 != null) {
      sharedPreferences.setString("partnerELEstrHomeaddressLiveYear5",
          businessTypeAddressCredential.strHomeaddressLiveYear5);
    }
    if (businessTypeAddressCredential.strTitleQwner2 != null) {
      sharedPreferences.setString("partnerELEstrTitleQwner2",
          businessTypeAddressCredential.strTitleQwner2);
    }
    if (businessTypeAddressCredential.strFirstNameowner != null) {
      sharedPreferences.setString("partnerELEstrFirstNameowner",
          businessTypeAddressCredential.strFirstNameowner);
    }
    if (businessTypeAddressCredential.strLastNameowner != null) {
      sharedPreferences.setString("partnerELEstrLastNameowner",
          businessTypeAddressCredential.strLastNameowner);
    }
    if (businessTypeAddressCredential.strDobOwner2 != null) {
      sharedPreferences.setString(
          "partnerELEstrDobOwner2", businessTypeAddressCredential.strDobOwner2);
    }
    if (businessTypeAddressCredential.home_Addressowner != null) {
      sharedPreferences.setString("partnerELEhome_Addressowner",
          businessTypeAddressCredential.home_Addressowner);
    }
    if (businessTypeAddressCredential.home_Address2owner != null) {
      sharedPreferences.setString("partnerELEhome_Address2owner",
          businessTypeAddressCredential.home_Address2owner);
    }
    if (businessTypeAddressCredential.strHomeAdressPostCodeowner != null) {
      sharedPreferences.setString("partnerELEstrHomeAdressPostCodeowner",
          businessTypeAddressCredential.strHomeAdressPostCodeowner);
    }
    if (businessTypeAddressCredential.strHomeAdressCityowner != null) {
      sharedPreferences.setString("partnerELEstrHomeAdressCityowner",
          businessTypeAddressCredential.strHomeAdressCityowner);
    }
    if (businessTypeAddressCredential.strHomeaddressLiveYearowner != null) {
      sharedPreferences.setString("partnerELEstrHomeaddressLiveYearowner",
          businessTypeAddressCredential.strHomeaddressLiveYearowner);
    }
    if (businessTypeAddressCredential.strHomeaddressLiveMonthowner != null) {
      sharedPreferences.setString("partnerELEstrHomeaddressLiveMonthowner",
          businessTypeAddressCredential.strHomeaddressLiveMonthowner);
    }
    if (businessTypeAddressCredential.strHomeaddress1owner != null) {
      sharedPreferences.setString("partnerELEstrHomeaddress1owner",
          businessTypeAddressCredential.strHomeaddress1owner);
    }
    if (businessTypeAddressCredential.strHomeaddress2owner != null) {
      sharedPreferences.setString("partnerELEstrHomeaddress2owner",
          businessTypeAddressCredential.strHomeaddress2owner);
    }
    if (businessTypeAddressCredential.strHomeaddressCity1owner != null) {
      sharedPreferences.setString("partnerELEstrHomeaddressCity1owner",
          businessTypeAddressCredential.strHomeaddressCity1owner);
    }
    if (businessTypeAddressCredential.strHomeaddressPostCode1owner != null) {
      sharedPreferences.setString("partnerELEstrHomeaddressPostCode1owner",
          businessTypeAddressCredential.strHomeaddressPostCode1owner);
    }
    if (businessTypeAddressCredential.strHomeaddressLiveYear1owner != null) {
      sharedPreferences.setString("partnerELEstrHomeaddressLiveYear1owner",
          businessTypeAddressCredential.strHomeaddressLiveYear1owner);
    }
    if (businessTypeAddressCredential.strHomeaddressLiveMonth1owner != null) {
      sharedPreferences.setString("partnerELEstrHomeaddressLiveMonth1owner",
          businessTypeAddressCredential.strHomeaddressLiveMonth1owner);
    }
    if (businessTypeAddressCredential.strHomeaddress3owner != null) {
      sharedPreferences.setString("partnerELEstrHomeaddress3owner",
          businessTypeAddressCredential.strHomeaddress3owner);
    }
    if (businessTypeAddressCredential.strHomeaddress4owner != null) {
      sharedPreferences.setString("partnerELEstrHomeaddress4owner",
          businessTypeAddressCredential.strHomeaddress4owner);
    }
    if (businessTypeAddressCredential.strHomeaddressCity2owner != null) {
      sharedPreferences.setString("partnerELEstrHomeaddressCity2owner",
          businessTypeAddressCredential.strHomeaddressCity2owner);
    }
    if (businessTypeAddressCredential.strHomeaddressPostCode2owner != null) {
      sharedPreferences.setString("partnerELEstrHomeaddressPostCode2owner",
          businessTypeAddressCredential.strHomeaddressPostCode2owner);
    }
    if (businessTypeAddressCredential.strHomeaddressPostLiveYear2owner !=
        null) {
      sharedPreferences.setString("partnerELEstrHomeaddressPostLiveYear2owner",
          businessTypeAddressCredential.strHomeaddressPostLiveYear2owner);
    }
    if (businessTypeAddressCredential.strHomeaddressPostLiveMonth2owner !=
        null) {
      sharedPreferences.setString("partnerELEstrHomeaddressPostLiveMonth2owner",
          businessTypeAddressCredential.strHomeaddressPostLiveMonth2owner);
    }
    if (businessTypeAddressCredential.strHomeaddress5owner != null) {
      sharedPreferences.setString("partnerELEstrHomeaddress5owner",
          businessTypeAddressCredential.strHomeaddress5owner);
    }
    if (businessTypeAddressCredential.strHomeaddress6owner != null) {
      sharedPreferences.setString("partnerELEstrHomeaddress6owner",
          businessTypeAddressCredential.strHomeaddress6owner);
    }
    if (businessTypeAddressCredential.strHomeaddressCity3owner != null) {
      sharedPreferences.setString("partnerELEstrHomeaddressCity3owner",
          businessTypeAddressCredential.strHomeaddressCity3owner);
    }
    if (businessTypeAddressCredential.strHomeaddressPostCode3owner != null) {
      sharedPreferences.setString("partnerELEstrHomeaddressPostCode3owner",
          businessTypeAddressCredential.strHomeaddressPostCode3owner);
    }
    if (businessTypeAddressCredential.strHomeaddressLiveYear3owner != null) {
      sharedPreferences.setString("partnerELEstrHomeaddressLiveYear3owner",
          businessTypeAddressCredential.strHomeaddressLiveYear3owner);
    }
    if (businessTypeAddressCredential.strHomeaddressLivemonth3owner != null) {
      sharedPreferences.setString("partnerELEstrHomeaddressLivemonth3owner",
          businessTypeAddressCredential.strHomeaddressLivemonth3owner);
    }
    if (businessTypeAddressCredential.strHomeaddress7owner != null) {
      sharedPreferences.setString("partnerELEstrHomeaddress7owner",
          businessTypeAddressCredential.strHomeaddress7owner);
    }
    if (businessTypeAddressCredential.strHomeaddress8owner != null) {
      sharedPreferences.setString("partnerELEstrHomeaddress8owner",
          businessTypeAddressCredential.strHomeaddress8owner);
    }
    if (businessTypeAddressCredential.strHomeaddressCity4owner != null) {
      sharedPreferences.setString("partnerELEstrHomeaddressCity4owner",
          businessTypeAddressCredential.strHomeaddressCity4owner);
    }
    if (businessTypeAddressCredential.strHomeaddressPostCode4owner != null) {
      sharedPreferences.setString("partnerELEstrHomeaddressPostCode4owner",
          businessTypeAddressCredential.strHomeaddressPostCode4owner);
    }
    if (businessTypeAddressCredential.strHomeaddressLiveYear4owner != null) {
      sharedPreferences.setString("partnerELEstrHomeaddressLiveYear4owner",
          businessTypeAddressCredential.strHomeaddressLiveYear4owner);
    }
    if (businessTypeAddressCredential.strHomeaddressLiveMonth4owner != null) {
      sharedPreferences.setString("partnerELEstrHomeaddressLiveMonth4owner",
          businessTypeAddressCredential.strHomeaddressLiveMonth4owner);
    }
    if (businessTypeAddressCredential.strHomeaddress9owner != null) {
      sharedPreferences.setString("partnerELEstrHomeaddress9owner",
          businessTypeAddressCredential.strHomeaddress9owner);
    }
    if (businessTypeAddressCredential.strHomeaddress10owner != null) {
      sharedPreferences.setString("partnerELEstrHomeaddress10owner",
          businessTypeAddressCredential.strHomeaddress10owner);
    }
    if (businessTypeAddressCredential.strHomeaddressCity5owner != null) {
      sharedPreferences.setString("partnerELEstrHomeaddressCity5owner",
          businessTypeAddressCredential.strHomeaddressCity5owner);
    }
    if (businessTypeAddressCredential.strHomeaddressPostCode5owner != null) {
      sharedPreferences.setString("partnerELEstrHomeaddressPostCode5owner",
          businessTypeAddressCredential.strHomeaddressPostCode5owner);
    }
    if (businessTypeAddressCredential.strHomeaddressLiveYear5owner != null) {
      sharedPreferences.setString("partnerELEstrHomeaddressLiveYear5owner",
          businessTypeAddressCredential.strHomeaddressLiveYear5owner);
    }
    if (businessTypeAddressCredential.strHomeaddressLiveMonth5owner != null) {
      sharedPreferences.setString("partnerELEstrHomeaddressLiveMonth5owner",
          businessTypeAddressCredential.strHomeaddressLiveMonth5owner);
    }
    if (businessTypeAddressCredential.strTitleQwner3 != null) {
      sharedPreferences.setString("partnerELEstrTitleQwner3",
          businessTypeAddressCredential.strTitleQwner3);
    }
    if (businessTypeAddressCredential.strFirstNameowner3 != null) {
      sharedPreferences.setString("partnerELEstrFirstNameowner3",
          businessTypeAddressCredential.strFirstNameowner3);
    }
    if (businessTypeAddressCredential.strLastNameowner3 != null) {
      sharedPreferences.setString("partnerELEstrLastNameowner3",
          businessTypeAddressCredential.strLastNameowner3);
    }
    if (businessTypeAddressCredential.strstrDobOwner3 != null) {
      sharedPreferences.setString("partnerELEstrstrDobOwner3",
          businessTypeAddressCredential.strstrDobOwner3);
    }
    if (businessTypeAddressCredential.home_Addressowner3 != null) {
      sharedPreferences.setString("partnerELEhome_Addressowner3",
          businessTypeAddressCredential.home_Addressowner3);
    }
    if (businessTypeAddressCredential.home_Address2owner3 != null) {
      sharedPreferences.setString("partnerELEhome_Address2owner3",
          businessTypeAddressCredential.home_Address2owner3);
    }
    if (businessTypeAddressCredential.strHomeAdressCityowner3 != null) {
      sharedPreferences.setString("partnerELEstrHomeAdressCityowner3",
          businessTypeAddressCredential.strHomeAdressCityowner3);
    }
    if (businessTypeAddressCredential.strHomeAdressPostCodeowner3 != null) {
      sharedPreferences.setString("partnerELEstrHomeAdressPostCodeowner3",
          businessTypeAddressCredential.strHomeAdressPostCodeowner3);
    }
    if (businessTypeAddressCredential.strHomeaddressLiveYearowner3 != null) {
      sharedPreferences.setString("partnerELEstrHomeaddressLiveYearowner3",
          businessTypeAddressCredential.strHomeaddressLiveYearowner3);
    }
    if (businessTypeAddressCredential.strHomeaddressLiveMonthowner3 != null) {
      sharedPreferences.setString("partnerELEstrHomeaddressLiveMonthowner3",
          businessTypeAddressCredential.strHomeaddressLiveMonthowner3);
    }
    if (businessTypeAddressCredential.strHomeaddress1owner3 != null) {
      sharedPreferences.setString("partnerELEstrHomeaddress1owner3",
          businessTypeAddressCredential.strHomeaddress1owner3);
    }
    if (businessTypeAddressCredential.strHomeaddress2owner3 != null) {
      sharedPreferences.setString("partnerELEstrHomeaddress2owner3",
          businessTypeAddressCredential.strHomeaddress2owner3);
    }
    if (businessTypeAddressCredential.strHomeaddressCity1owner3 != null) {
      sharedPreferences.setString("partnerELEstrHomeaddressCity1owner3",
          businessTypeAddressCredential.strHomeaddressCity1owner3);
    }
    if (businessTypeAddressCredential.strHomeaddressPostCode1owner3 != null) {
      sharedPreferences.setString("partnerELEstrHomeaddressPostCode1owner3",
          businessTypeAddressCredential.strHomeaddressPostCode1owner3);
    }
    if (businessTypeAddressCredential.strHomeaddressLiveYear1owner3 != null) {
      sharedPreferences.setString("partnerELEstrHomeaddressLiveYear1owner3",
          businessTypeAddressCredential.strHomeaddressLiveYear1owner3);
    }
    if (businessTypeAddressCredential.strHomeaddressLiveMonth1owner3 != null) {
      sharedPreferences.setString("partnerELEstrHomeaddressLiveMonth1owner3",
          businessTypeAddressCredential.strHomeaddressLiveMonth1owner3);
    }
    if (businessTypeAddressCredential.strHomeaddress3owner3 != null) {
      sharedPreferences.setString("partnerELEstrHomeaddress3owner3",
          businessTypeAddressCredential.strHomeaddress3owner3);
    }
    if (businessTypeAddressCredential.strHomeaddress4owner3 != null) {
      sharedPreferences.setString("partnerELEstrHomeaddress4owner3",
          businessTypeAddressCredential.strHomeaddress4owner3);
    }
    if (businessTypeAddressCredential.strHomeaddressCity2owner3 != null) {
      sharedPreferences.setString("partnerELEstrHomeaddressCity2owner3",
          businessTypeAddressCredential.strHomeaddressCity2owner3);
    }
    if (businessTypeAddressCredential.strHomeaddressPostCode2owner3 != null) {
      sharedPreferences.setString("partnerELEstrHomeaddressPostCode2owner3",
          businessTypeAddressCredential.strHomeaddressPostCode2owner3);
    }
    if (businessTypeAddressCredential.strHomeaddressPostLiveYear2owner3 !=
        null) {
      sharedPreferences.setString("partnerELEstrHomeaddressPostLiveYear2owner3",
          businessTypeAddressCredential.strHomeaddressPostLiveYear2owner3);
    }
    if (businessTypeAddressCredential.strHomeaddressPostLiveMonth2owner3 !=
        null) {
      sharedPreferences.setString(
          "partnerELEstrHomeaddressPostLiveMonth2owner3",
          businessTypeAddressCredential.strHomeaddressPostLiveMonth2owner3);
    }
    if (businessTypeAddressCredential.strHomeaddress5owner3 != null) {
      sharedPreferences.setString("partnerELEstrHomeaddress5owner3",
          businessTypeAddressCredential.strHomeaddress5owner3);
    }
    if (businessTypeAddressCredential.strHomeaddress6owner3 != null) {
      sharedPreferences.setString("partnerELEstrHomeaddress6owner3",
          businessTypeAddressCredential.strHomeaddress6owner3);
    }
    if (businessTypeAddressCredential.strHomeaddressCity3owner3 != null) {
      sharedPreferences.setString("partnerELEstrHomeaddressCity3owner3",
          businessTypeAddressCredential.strHomeaddressCity3owner3);
    }
    if (businessTypeAddressCredential.strHomeaddressPostCode3owner3 != null) {
      sharedPreferences.setString("partnerELEstrHomeaddressPostCode3owner3",
          businessTypeAddressCredential.strHomeaddressPostCode3owner3);
    }
    if (businessTypeAddressCredential.strHomeaddressLiveYear3owner3 != null) {
      sharedPreferences.setString("partnerELEstrHomeaddressLiveYear3owner3",
          businessTypeAddressCredential.strHomeaddressLiveYear3owner3);
    }
    if (businessTypeAddressCredential.strHomeaddressLivemonth3owner3 != null) {
      sharedPreferences.setString("partnerELEstrHomeaddressLivemonth3owner3",
          businessTypeAddressCredential.strHomeaddressLivemonth3owner3);
    }
    if (businessTypeAddressCredential.strHomeaddress7owner3 != null) {
      sharedPreferences.setString("partnerELEstrHomeaddress7owner3",
          businessTypeAddressCredential.strHomeaddress7owner3);
    }
    if (businessTypeAddressCredential.strHomeaddress8owner3 != null) {
      sharedPreferences.setString("partnerELEstrHomeaddress8owner3",
          businessTypeAddressCredential.strHomeaddress8owner3);
    }
    if (businessTypeAddressCredential.strHomeaddressCity4owner3 != null) {
      sharedPreferences.setString("partnerELEstrHomeaddressCity4owner3",
          businessTypeAddressCredential.strHomeaddressCity4owner3);
    }
    if (businessTypeAddressCredential.strHomeaddressPostCode4owner3 != null) {
      sharedPreferences.setString("partnerELEstrHomeaddressPostCode4owner3",
          businessTypeAddressCredential.strHomeaddressPostCode4owner3);
    }
    if (businessTypeAddressCredential.strHomeaddressLiveYear4owner3 != null) {
      sharedPreferences.setString("partnerELEstrHomeaddressLiveYear4owner3",
          businessTypeAddressCredential.strHomeaddressLiveYear4owner3);
    }
    if (businessTypeAddressCredential.strHomeaddressLiveMonth4owner3 != null) {
      sharedPreferences.setString("partnerELEstrHomeaddressLiveMonth4owner3",
          businessTypeAddressCredential.strHomeaddressLiveMonth4owner3);
    }
    if (businessTypeAddressCredential.strHomeaddress9owner3 != null) {
      sharedPreferences.setString("partnerELEstrHomeaddress9owner3",
          businessTypeAddressCredential.strHomeaddress9owner3);
    }
    if (businessTypeAddressCredential.strHomeaddress10owner3 != null) {
      sharedPreferences.setString("partnerELEstrHomeaddress10owner3",
          businessTypeAddressCredential.strHomeaddress10owner3);
    }
    if (businessTypeAddressCredential.strHomeaddressCity5owner3 != null) {
      sharedPreferences.setString("partnerELEstrHomeaddressCity5owner3",
          businessTypeAddressCredential.strHomeaddressCity5owner3);
    }
    if (businessTypeAddressCredential.strHomeaddressPostCode5owner3 != null) {
      sharedPreferences.setString("partnerELEstrHomeaddressPostCode5owner3",
          businessTypeAddressCredential.strHomeaddressPostCode5owner3);
    }
    if (businessTypeAddressCredential.strHomeaddressLiveYear5owner3 != null) {
      sharedPreferences.setString("partnerELEstrHomeaddressLiveYear5owner3",
          businessTypeAddressCredential.strHomeaddressLiveYear5owner3);
    }
    if (businessTypeAddressCredential.strHomeaddressLiveMonth5owner3 != null) {
      sharedPreferences.setString("partnerELEstrHomeaddressLiveMonth5owner3",
          businessTypeAddressCredential.strHomeaddressLiveMonth5owner3);
    }
    if (businessTypeAddressCredential.strTitleQwner4 != null) {
      sharedPreferences.setString("partnerELEstrTitleQwner4",
          businessTypeAddressCredential.strTitleQwner4);
    }
    if (businessTypeAddressCredential.strFirstNameowner4 != null) {
      sharedPreferences.setString("partnerELEstrFirstNameowner4",
          businessTypeAddressCredential.strFirstNameowner4);
    }
    if (businessTypeAddressCredential.strLastNameowner4 != null) {
      sharedPreferences.setString("partnerELEstrLastNameowner4",
          businessTypeAddressCredential.strLastNameowner4);
    }
    if (businessTypeAddressCredential.strstrDobOwner4 != null) {
      sharedPreferences.setString("partnerELEstrstrDobOwner4",
          businessTypeAddressCredential.strstrDobOwner4);
    }
    if (businessTypeAddressCredential.home_Addressowner4 != null) {
      sharedPreferences.setString("partnerELEhome_Addressowner4",
          businessTypeAddressCredential.home_Addressowner4);
    }
    if (businessTypeAddressCredential.home_Address2owner4 != null) {
      sharedPreferences.setString("partnerELEhome_Address2owner4",
          businessTypeAddressCredential.home_Address2owner4);
    }
    if (businessTypeAddressCredential.strHomeAdressCityowner4 != null) {
      sharedPreferences.setString("partnerELEstrHomeAdressCityowner4",
          businessTypeAddressCredential.strHomeAdressCityowner4);
    }
    if (businessTypeAddressCredential.strHomeAdressPostCodeowner4 != null) {
      sharedPreferences.setString("partnerELEstrHomeAdressPostCodeowner4",
          businessTypeAddressCredential.strHomeAdressPostCodeowner4);
    }
    if (businessTypeAddressCredential.strHomeaddressLiveYearowner4 != null) {
      sharedPreferences.setString("partnerELEstrHomeaddressLiveYearowner4",
          businessTypeAddressCredential.strHomeaddressLiveYearowner4);
    }
    if (businessTypeAddressCredential.strHomeaddressLiveMonthowner4 != null) {
      sharedPreferences.setString("partnerELEstrHomeaddressLiveMonthowner4",
          businessTypeAddressCredential.strHomeaddressLiveMonthowner4);
    }
    if (businessTypeAddressCredential.strHomeaddress1owner4 != null) {
      sharedPreferences.setString("partnerELEstrHomeaddress1owner4",
          businessTypeAddressCredential.strHomeaddress1owner4);
    }
    if (businessTypeAddressCredential.strHomeaddress2owner4 != null) {
      sharedPreferences.setString("partnerELEstrHomeaddress2owner4",
          businessTypeAddressCredential.strHomeaddress2owner4);
    }
    if (businessTypeAddressCredential.strHomeaddressCity1owner4 != null) {
      sharedPreferences.setString("partnerELEstrHomeaddressCity1owner4",
          businessTypeAddressCredential.strHomeaddressCity1owner4);
    }
    if (businessTypeAddressCredential.strHomeaddressPostCode1owner4 != null) {
      sharedPreferences.setString("partnerELEstrHomeaddressPostCode1owner4",
          businessTypeAddressCredential.strHomeaddressPostCode1owner4);
    }
    if (businessTypeAddressCredential.strHomeaddressLiveYear1owner4 != null) {
      sharedPreferences.setString("partnerELEstrHomeaddressLiveYear1owner4",
          businessTypeAddressCredential.strHomeaddressLiveYear1owner4);
    }
    if (businessTypeAddressCredential.strHomeaddressLiveMonth1owner4 != null) {
      sharedPreferences.setString("partnerELEstrHomeaddressLiveMonth1owner4",
          businessTypeAddressCredential.strHomeaddressLiveMonth1owner4);
    }
    if (businessTypeAddressCredential.strHomeaddress3owner4 != null) {
      sharedPreferences.setString("partnerELEstrHomeaddress3owner4",
          businessTypeAddressCredential.strHomeaddress3owner4);
    }
    if (businessTypeAddressCredential.strHomeaddress4owner4 != null) {
      sharedPreferences.setString("partnerELEstrHomeaddress4owner4",
          businessTypeAddressCredential.strHomeaddress4owner4);
    }
    if (businessTypeAddressCredential.strHomeaddressCity2owner4 != null) {
      sharedPreferences.setString("partnerELEstrHomeaddressCity2owner4",
          businessTypeAddressCredential.strHomeaddressCity2owner4);
    }
    if (businessTypeAddressCredential.strHomeaddressPostCode2owner4 != null) {
      sharedPreferences.setString("partnerELEstrHomeaddressPostCode2owner4",
          businessTypeAddressCredential.strHomeaddressPostCode2owner4);
    }
    if (businessTypeAddressCredential.strHomeaddressPostLiveYear2owner4 !=
        null) {
      sharedPreferences.setString("partnerELEstrHomeaddressPostLiveYear2owner4",
          businessTypeAddressCredential.strHomeaddressPostLiveYear2owner4);
    }
    if (businessTypeAddressCredential.strHomeaddressPostLiveMonth2owner4 !=
        null) {
      sharedPreferences.setString(
          "partnerELEstrHomeaddressPostLiveMonth2owner4",
          businessTypeAddressCredential.strHomeaddressPostLiveMonth2owner4);
    }
    if (businessTypeAddressCredential.strHomeaddress5owner4 != null) {
      sharedPreferences.setString("partnerELEstrHomeaddress5owner4",
          businessTypeAddressCredential.strHomeaddress5owner4);
    }
    if (businessTypeAddressCredential.strHomeaddress6owner4 != null) {
      sharedPreferences.setString("partnerELEstrHomeaddress6owner4",
          businessTypeAddressCredential.strHomeaddress6owner4);
    }
    if (businessTypeAddressCredential.strHomeaddressCity3owner4 != null) {
      sharedPreferences.setString("partnerELEstrHomeaddressCity3owner4",
          businessTypeAddressCredential.strHomeaddressCity3owner4);
    }
    if (businessTypeAddressCredential.strHomeaddressPostCode3owner4 != null) {
      sharedPreferences.setString("partnerELEstrHomeaddressPostCode3owner4",
          businessTypeAddressCredential.strHomeaddressPostCode3owner4);
    }
    if (businessTypeAddressCredential.strHomeaddressLiveYear3owner4 != null) {
      sharedPreferences.setString("partnerELEstrHomeaddressLiveYear3owner4",
          businessTypeAddressCredential.strHomeaddressLiveYear3owner4);
    }
    if (businessTypeAddressCredential.strHomeaddressLivemonth3owner4 != null) {
      sharedPreferences.setString("partnerELEstrHomeaddressLivemonth3owner4",
          businessTypeAddressCredential.strHomeaddressLivemonth3owner4);
    }
    if (businessTypeAddressCredential.strHomeaddress7owner4 != null) {
      sharedPreferences.setString("partnerELEstrHomeaddress7owner4",
          businessTypeAddressCredential.strHomeaddress7owner4);
    }
    if (businessTypeAddressCredential.strHomeaddress8owner4 != null) {
      sharedPreferences.setString("partnerELEstrHomeaddress8owner4",
          businessTypeAddressCredential.strHomeaddress8owner4);
    }
    if (businessTypeAddressCredential.strHomeaddressCity4owner4 != null) {
      sharedPreferences.setString("partnerELEstrHomeaddressCity4owner4",
          businessTypeAddressCredential.strHomeaddressCity4owner4);
    }
    if (businessTypeAddressCredential.strHomeaddressPostCode4owner4 != null) {
      sharedPreferences.setString("partnerELEstrHomeaddressPostCode4owner4",
          businessTypeAddressCredential.strHomeaddressPostCode4owner4);
    }
    if (businessTypeAddressCredential.strHomeaddressLiveYear4owner4 != null) {
      sharedPreferences.setString("partnerELEstrHomeaddressLiveYear4owner4",
          businessTypeAddressCredential.strHomeaddressLiveYear4owner4);
    }
    if (businessTypeAddressCredential.strHomeaddressLiveMonth4owner4 != null) {
      sharedPreferences.setString("partnerELEstrHomeaddressLiveMonth4owner4",
          businessTypeAddressCredential.strHomeaddressLiveMonth4owner4);
    }
    if (businessTypeAddressCredential.strHomeaddress9owner4 != null) {
      sharedPreferences.setString("partnerELEstrHomeaddress9owner4",
          businessTypeAddressCredential.strHomeaddress9owner4);
    }
    if (businessTypeAddressCredential.strHomeaddress10owner4 != null) {
      sharedPreferences.setString("partnerELEstrHomeaddress10owner4",
          businessTypeAddressCredential.strHomeaddress10owner4);
    }
    if (businessTypeAddressCredential.strHomeaddressCity5owner4 != null) {
      sharedPreferences.setString("partnerELEstrHomeaddressCity5owner4",
          businessTypeAddressCredential.strHomeaddressCity5owner4);
    }
    if (businessTypeAddressCredential.strHomeaddressPostCode5owner4 != null) {
      sharedPreferences.setString("partnerELEstrHomeaddressPostCode5owner4",
          businessTypeAddressCredential.strHomeaddressPostCode5owner4);
    }
    if (businessTypeAddressCredential.strHomeaddressLiveYear5owner4 != null) {
      sharedPreferences.setString("partnerELEstrHomeaddressLiveYear5owner4",
          businessTypeAddressCredential.strHomeaddressLiveYear5owner4);
    }
    if (businessTypeAddressCredential.strHomeaddressLiveMonth5owner4 != null) {
      sharedPreferences.setString("partnerELEstrHomeaddressLiveMonth5owner4",
          businessTypeAddressCredential.strHomeaddressLiveMonth5owner4);
    }
    if (businessTypeAddressCredential.strTitleQwner5 != null) {
      sharedPreferences.setString("partnerELEstrTitleQwner5",
          businessTypeAddressCredential.strTitleQwner5);
    }
    if (businessTypeAddressCredential.strFirstNameowner5 != null) {
      sharedPreferences.setString("partnerELEstrFirstNameowner5",
          businessTypeAddressCredential.strFirstNameowner5);
    }
    if (businessTypeAddressCredential.strLastNameowner5 != null) {
      sharedPreferences.setString("partnerELEstrLastNameowner5",
          businessTypeAddressCredential.strLastNameowner5);
    }
    if (businessTypeAddressCredential.strstrDobOwner5 != null) {
      sharedPreferences.setString("partnerELEstrstrDobOwner5",
          businessTypeAddressCredential.strstrDobOwner5);
    }
    if (businessTypeAddressCredential.home_Addressowner5 != null) {
      sharedPreferences.setString("partnerELEhome_Addressowner5",
          businessTypeAddressCredential.home_Addressowner5);
    }
    if (businessTypeAddressCredential.home_Address2owner5 != null) {
      sharedPreferences.setString("partnerELEhome_Address2owner5",
          businessTypeAddressCredential.home_Address2owner5);
    }
    if (businessTypeAddressCredential.strHomeAdressCityowner5 != null) {
      sharedPreferences.setString("partnerELEstrHomeAdressCityowner5",
          businessTypeAddressCredential.strHomeAdressCityowner5);
    }
    if (businessTypeAddressCredential.strHomeAdressPostCodeowner5 != null) {
      sharedPreferences.setString("partnerELEstrHomeAdressPostCodeowner5",
          businessTypeAddressCredential.strHomeAdressPostCodeowner5);
    }
    if (businessTypeAddressCredential.strHomeaddressLiveYearowner5 != null) {
      sharedPreferences.setString("partnerELEstrHomeaddressLiveYearowner5",
          businessTypeAddressCredential.strHomeaddressLiveYearowner5);
    }
    if (businessTypeAddressCredential.strHomeaddressLiveMonthowner5 != null) {
      sharedPreferences.setString("partnerELEstrHomeaddressLiveMonthowner5",
          businessTypeAddressCredential.strHomeaddressLiveMonthowner5);
    }
    if (businessTypeAddressCredential.strHomeaddress1owner5 != null) {
      sharedPreferences.setString("partnerELEstrHomeaddress1owner5",
          businessTypeAddressCredential.strHomeaddress1owner5);
    }
    if (businessTypeAddressCredential.strHomeaddress2owner5 != null) {
      sharedPreferences.setString("partnerELEstrHomeaddress2owner5",
          businessTypeAddressCredential.strHomeaddress2owner5);
    }
    if (businessTypeAddressCredential.strHomeaddressCity1owner5 != null) {
      sharedPreferences.setString("partnerELEstrHomeaddressCity1owner5",
          businessTypeAddressCredential.strHomeaddressCity1owner5);
    }
    if (businessTypeAddressCredential.strHomeaddressPostCode1owner5 != null) {
      sharedPreferences.setString("partnerELEstrHomeaddressPostCode1owner5",
          businessTypeAddressCredential.strHomeaddressPostCode1owner5);
    }
    if (businessTypeAddressCredential.strHomeaddressLiveYear1owner5 != null) {
      sharedPreferences.setString("partnerELEstrHomeaddressLiveYear1owner5",
          businessTypeAddressCredential.strHomeaddressLiveYear1owner5);
    }
    if (businessTypeAddressCredential.strHomeaddressLiveMonth1owner5 != null) {
      sharedPreferences.setString("partnerELEstrHomeaddressLiveMonth1owner5",
          businessTypeAddressCredential.strHomeaddressLiveMonth1owner5);
    }
    if (businessTypeAddressCredential.strHomeaddress3owner5 != null) {
      sharedPreferences.setString("partnerELEstrHomeaddress3owner5",
          businessTypeAddressCredential.strHomeaddress3owner5);
    }
    if (businessTypeAddressCredential.strHomeaddress4owner5 != null) {
      sharedPreferences.setString("partnerELEstrHomeaddress4owner5",
          businessTypeAddressCredential.strHomeaddress4owner5);
    }
    if (businessTypeAddressCredential.strHomeaddressCity2owner5 != null) {
      sharedPreferences.setString("partnerELEstrHomeaddressCity2owner5",
          businessTypeAddressCredential.strHomeaddressCity2owner5);
    }
    if (businessTypeAddressCredential.strHomeaddressPostCode2owner5 != null) {
      sharedPreferences.setString("partnerELEstrHomeaddressPostCode2owner5",
          businessTypeAddressCredential.strHomeaddressPostCode2owner5);
    }
    if (businessTypeAddressCredential.strHomeaddressPostLiveYear2owner5 !=
        null) {
      sharedPreferences.setString("partnerELEstrHomeaddressPostLiveYear2owner5",
          businessTypeAddressCredential.strHomeaddressPostLiveYear2owner5);
    }
    if (businessTypeAddressCredential.strHomeaddressPostLiveMonth2owner5 !=
        null) {
      sharedPreferences.setString(
          "partnerELEstrHomeaddressPostLiveMonth2owner5",
          businessTypeAddressCredential.strHomeaddressPostLiveMonth2owner5);
    }
    if (businessTypeAddressCredential.strHomeaddress5owner5 != null) {
      sharedPreferences.setString("partnerELEstrHomeaddress5owner5",
          businessTypeAddressCredential.strHomeaddress5owner5);
    }
    if (businessTypeAddressCredential.strHomeaddress6owner5 != null) {
      sharedPreferences.setString("partnerELEstrHomeaddress6owner5",
          businessTypeAddressCredential.strHomeaddress6owner5);
    }
    if (businessTypeAddressCredential.strHomeaddressCity3owner5 != null) {
      sharedPreferences.setString("partnerELEstrHomeaddressCity3owner5",
          businessTypeAddressCredential.strHomeaddressCity3owner5);
    }
    if (businessTypeAddressCredential.strHomeaddressPostCode3owner5 != null) {
      sharedPreferences.setString("partnerELEstrHomeaddressPostCode3owner5",
          businessTypeAddressCredential.strHomeaddressPostCode3owner5);
    }
    if (businessTypeAddressCredential.strHomeaddressLiveYear3owner5 != null) {
      sharedPreferences.setString("partnerELEstrHomeaddressLiveYear3owner5",
          businessTypeAddressCredential.strHomeaddressLiveYear3owner5);
    }
    if (businessTypeAddressCredential.strHomeaddressLivemonth3owner5 != null) {
      sharedPreferences.setString("partnerELEstrHomeaddressLivemonth3owner5",
          businessTypeAddressCredential.strHomeaddressLivemonth3owner5);
    }
    if (businessTypeAddressCredential.strHomeaddress7owner5 != null) {
      sharedPreferences.setString("partnerELEstrHomeaddress7owner5",
          businessTypeAddressCredential.strHomeaddress7owner5);
    }
    if (businessTypeAddressCredential.strHomeaddress8owner5 != null) {
      sharedPreferences.setString("partnerELEstrHomeaddress8owner5",
          businessTypeAddressCredential.strHomeaddress8owner5);
    }
    if (businessTypeAddressCredential.strHomeaddressCity4owner5 != null) {
      sharedPreferences.setString("partnerELEstrHomeaddressCity4owner5",
          businessTypeAddressCredential.strHomeaddressCity4owner5);
    }
    if (businessTypeAddressCredential.strHomeaddressPostCode4owner5 != null) {
      sharedPreferences.setString("partnerELEstrHomeaddressPostCode4owner5",
          businessTypeAddressCredential.strHomeaddressPostCode4owner5);
    }
    if (businessTypeAddressCredential.strHomeaddressLiveYear4owner5 != null) {
      sharedPreferences.setString("partnerELEstrHomeaddressLiveYear4owner5",
          businessTypeAddressCredential.strHomeaddressLiveYear4owner5);
    }
    if (businessTypeAddressCredential.strHomeaddressLiveMonth4owner5 != null) {
      sharedPreferences.setString("partnerELEstrHomeaddressLiveMonth4owner5",
          businessTypeAddressCredential.strHomeaddressLiveMonth4owner5);
    }
    if (businessTypeAddressCredential.strHomeaddress9owner5 != null) {
      sharedPreferences.setString("partnerELEstrHomeaddress9owner5",
          businessTypeAddressCredential.strHomeaddress9owner5);
    }
    if (businessTypeAddressCredential.strHomeaddress10owner5 != null) {
      sharedPreferences.setString("partnerELEstrHomeaddress10owner5",
          businessTypeAddressCredential.strHomeaddress10owner5);
    }
    if (businessTypeAddressCredential.strHomeaddressCity5owner5 != null) {
      sharedPreferences.setString("partnerELEstrHomeaddressCity5owner5",
          businessTypeAddressCredential.strHomeaddressCity5owner5);
    }
    if (businessTypeAddressCredential.strHomeaddressPostCode5owner5 != null) {
      sharedPreferences.setString("partnerELEstrHomeaddressPostCode5owner5",
          businessTypeAddressCredential.strHomeaddressPostCode5owner5);
    }
    if (businessTypeAddressCredential.strHomeaddressLiveYear5owner5 != null) {
      sharedPreferences.setString("partnerELEstrHomeaddressLiveYear5owner5",
          businessTypeAddressCredential.strHomeaddressLiveYear5owner5);
    }
    if (businessTypeAddressCredential.strHomeaddressLiveMonth5owner5 != null) {
      sharedPreferences.setString("partnerELEstrHomeaddressLiveMonth5owner5",
          businessTypeAddressCredential.strHomeaddressLiveMonth5owner5);
    }
    if (businessTypeAddressCredential.strTitleQwner6 != null) {
      sharedPreferences.setString("partnerELEstrTitleQwner6",
          businessTypeAddressCredential.strTitleQwner6);
    }
    if (businessTypeAddressCredential.strFirstNameowner6 != null) {
      sharedPreferences.setString("partnerELEstrFirstNameowner6",
          businessTypeAddressCredential.strFirstNameowner6);
    }
    if (businessTypeAddressCredential.strLastNameowner6 != null) {
      sharedPreferences.setString("partnerELEstrLastNameowner6",
          businessTypeAddressCredential.strLastNameowner6);
    }
    if (businessTypeAddressCredential.strstrDobOwner6 != null) {
      sharedPreferences.setString("partnerELEstrstrDobOwner6",
          businessTypeAddressCredential.strstrDobOwner6);
    }
    if (businessTypeAddressCredential.home_Addressowner6 != null) {
      sharedPreferences.setString("partnerELEhome_Addressowner6",
          businessTypeAddressCredential.home_Addressowner6);
    }
    if (businessTypeAddressCredential.home_Address2owner6 != null) {
      sharedPreferences.setString("partnerELEhome_Address2owner6",
          businessTypeAddressCredential.home_Address2owner6);
    }
    if (businessTypeAddressCredential.strHomeAdressCityowner6 != null) {
      sharedPreferences.setString("partnerELEstrHomeAdressCityowner6",
          businessTypeAddressCredential.strHomeAdressCityowner6);
    }
  }

  static void clearELEPartnerBusiness() async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString("partnerELEstrTitleQwner1", null);
  }

  ///Partner Business<Add-Prosp> getMethod
  static Future<PartnerShipBusinessCredential>
      getPartnerShipBusinessTypeAdd() async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();

    String strTitleQwner1 = preferences.getString("partnerELEstrTitleQwner1");
    String firstName = preferences.getString("firstNamepartnerELE");
    String lastName = preferences.getString("lastNamepartnerELE");
    String strTitleDirector2 =
        preferences.getString("partnerELEstrTitleDirector2");
    String strDirector2Firstname =
        preferences.getString("partnerELEstrDirector2Firstname");
    String strDirector2Lastname =
        preferences.getString("partnerELEstrDirector2Lastname");
    String strDobOwner1 = preferences.getString("partnerELEstrDobOwner1");
    String home_Address = preferences.getString("partnerELEhome_Address");
    String home_Address2 = preferences.getString("partnerELEhome_Address2");
    String strHomeAdressPostCode =
        preferences.getString("partnerELEstrHomeAdressPostCode");
    String strHomeAdressCity =
        preferences.getString("partnerELEstrHomeAdressCity");
    String strHomeaddressLiveYear =
        preferences.getString("partnerELEstrHomeaddressLiveYear");
    String strHomeaddressLiveMonth =
        preferences.getString("partnerELEstrHomeaddressLiveMonth");
    String strHomeaddress1 = preferences.getString("partnerELEstrHomeaddress1");
    String strHomeaddress2 = preferences.getString("partnerELEstrHomeaddress2");
    String strHomeaddressCity1 =
        preferences.getString("partnerELEstrHomeaddressCity1");
    String strHomeaddressPostCode1 =
        preferences.getString("partnerELEstrHomeaddressPostCode1");
    String strHomeaddressLiveYear1 =
        preferences.getString("partnerELEstrHomeaddressLiveYear1");
    String strHomeaddressLiveMonth1 =
        preferences.getString("partnerELEstrHomeaddressLiveMonth1");
    String strHomeaddress3 = preferences.getString("partnerELEstrHomeaddress3");
    String strHomeaddress4 = preferences.getString("partnerELEstrHomeaddress4");
    String strHomeaddressCity2 =
        preferences.getString("partnerELEstrHomeaddressCity2");
    String strHomeaddressPostCode2 =
        preferences.getString("partnerELEstrHomeaddressPostCode2");
    String strHomeaddressPostLiveYear2 =
        preferences.getString("partnerELEstrHomeaddressPostLiveYear2");
    String strHomeaddressPostLiveMonth2 =
        preferences.getString("partnerELEstrHomeaddressPostLiveMonth2");
    String strHomeaddress5 = preferences.getString("partnerELEstrHomeaddress5");
    String strHomeaddress6 = preferences.getString("partnerELEstrHomeaddress6");
    String strHomeaddressCity3 =
        preferences.getString("partnerELEstrHomeaddressCity3");
    String strHomeaddressPostCode3 =
        preferences.getString("partnerELEstrHomeaddressPostCode3");
    String strHomeaddressLiveYear3 =
        preferences.getString("partnerELEstrHomeaddressLiveYear3");
    String strHomeaddressLivemonth3 =
        preferences.getString("partnerELEstrHomeaddressLivemonth3");
    String strHomeaddress7 = preferences.getString("partnerELEstrHomeaddress7");
    String strHomeaddress8 = preferences.getString("partnerELEstrHomeaddress8");
    String strHomeaddressCity4 =
        preferences.getString("partnerELEstrHomeaddressCity4");
    String strHomeaddressPostCode4 =
        preferences.getString("partnerELEstrHomeaddressPostCode4");
    String strHomeaddressLiveYear4 =
        preferences.getString("partnerELEstrHomeaddressLiveYear4");
    String strHomeaddressLiveMonth4 =
        preferences.getString("partnerELEstrHomeaddressLiveMonth4");
    String strHomeaddress9 = preferences.getString("partnerELEstrHomeaddress9");
    String strHomeaddress10 =
        preferences.getString("partnerELEstrHomeaddress10");
    String strHomeaddressCity5 =
        preferences.getString("partnerELEstrHomeaddressCity5");
    String strHomeaddressPostCode5 =
        preferences.getString("partnerELEstrHomeaddressPostCode5");
    String strHomeaddressLiveYear5 =
        preferences.getString("partnerELEstrHomeaddressLiveYear5");
    String strTitleQwner2 = preferences.getString("partnerELEstrTitleQwner2");
    String strFirstNameowner =
        preferences.getString("partnerELEstrFirstNameowner");
    String strLastNameowner =
        preferences.getString("partnerELEstrLastNameowner");
    String strDobOwner2 = preferences.getString("partnerELEstrDobOwner2");
    String home_Addressowner =
        preferences.getString("partnerELEhome_Addressowner");
    String home_Address2owner =
        preferences.getString("partnerELEhome_Address2owner");
    String strHomeAdressPostCodeowner =
        preferences.getString("partnerELEstrHomeAdressPostCodeowner");
    String strHomeAdressCityowner =
        preferences.getString("partnerELEstrHomeAdressCityowner");
    String strHomeaddressLiveYearowner =
        preferences.getString("partnerELEstrHomeaddressLiveYearowner");
    String strHomeaddressLiveMonthowner =
        preferences.getString("partnerELEstrHomeaddressLiveMonthowner");
    String strHomeaddress1owner =
        preferences.getString("partnerELEstrHomeaddress1owner");
    String strHomeaddress2owner =
        preferences.getString("partnerELEstrHomeaddress2owner");
    String strHomeaddressCity1owner =
        preferences.getString("partnerELEstrHomeaddressCity1owner");
    String strHomeaddressPostCode1owner =
        preferences.getString("partnerELEstrHomeaddressPostCode1owner");
    String strHomeaddressLiveYear1owner =
        preferences.getString("partnerELEstrHomeaddressLiveYear1owner");
    String strHomeaddressLiveMonth1owner =
        preferences.getString("partnerELEstrHomeaddressLiveMonth1owner");
    String strHomeaddress3owner =
        preferences.getString("partnerELEstrHomeaddress3owner");
    String strHomeaddress4owner =
        preferences.getString("partnerELEstrHomeaddress4owner");
    String strHomeaddressCity2owner =
        preferences.getString("partnerELEstrHomeaddressCity2owner");
    String strHomeaddressPostCode2owner =
        preferences.getString("partnerELEstrHomeaddressPostCode2owner");
    String strHomeaddressPostLiveYear2owner =
        preferences.getString("partnerELEstrHomeaddressPostLiveYear2owner");
    String strHomeaddressPostLiveMonth2owner =
        preferences.getString("partnerELEstrHomeaddressPostLiveMonth2owner");
    String strHomeaddress5owner =
        preferences.getString("partnerELEstrHomeaddress5owner");
    String strHomeaddress6owner =
        preferences.getString("partnerELEstrHomeaddress6owner");
    String strHomeaddressCity3owner =
        preferences.getString("partnerELEstrHomeaddressCity3owner");
    String strHomeaddressPostCode3owner =
        preferences.getString("partnerELEstrHomeaddressPostCode3owner");
    String strHomeaddressLiveYear3owner =
        preferences.getString("partnerELEstrHomeaddressLiveYear3owner");
    String strHomeaddressLivemonth3owner =
        preferences.getString("partnerELEstrHomeaddressLivemonth3owner");
    String strHomeaddress7owner =
        preferences.getString("partnerELEstrHomeaddress7owner");
    String strHomeaddress8owner =
        preferences.getString("partnerELEstrHomeaddress8owner");
    String strHomeaddressCity4owner =
        preferences.getString("partnerELEstrHomeaddressCity4owner");
    String strHomeaddressPostCode4owner =
        preferences.getString("partnerELEstrHomeaddressPostCode4owner");
    String strHomeaddressLiveYear4owner =
        preferences.getString("partnerELEstrHomeaddressLiveYear4owner");
    String strHomeaddressLiveMonth4owner =
        preferences.getString("partnerELEstrHomeaddressLiveMonth4owner");
    String strHomeaddress9owner =
        preferences.getString("partnerELEstrHomeaddress9owner");
    String strHomeaddress10owner =
        preferences.getString("partnerELEstrHomeaddress10owner");
    String strHomeaddressCity5owner =
        preferences.getString("partnerELEstrHomeaddressCity5owner");
    String strHomeaddressPostCode5owner =
        preferences.getString("partnerELEstrHomeaddressPostCode5owner");
    String strHomeaddressLiveYear5owner =
        preferences.getString("partnerELEstrHomeaddressLiveYear5owner");
    String strHomeaddressLiveMonth5owner =
        preferences.getString("partnerELEstrHomeaddressLiveMonth5owner");
    String strTitleQwner3 = preferences.getString("partnerELEstrTitleQwner3");
    String strFirstNameowner3 =
        preferences.getString("partnerELEstrFirstNameowner3");
    String strLastNameowner3 =
        preferences.getString("partnerELEstrLastNameowner3");
    String strstrDobOwner3 = preferences.getString("partnerELEstrstrDobOwner3");
    String home_Addressowner3 =
        preferences.getString("partnerELEhome_Addressowner3");
    String home_Address2owner3 =
        preferences.getString("partnerELEhome_Address2owner3");
    String strHomeAdressCityowner3 =
        preferences.getString("partnerELEstrHomeAdressCityowner3");
    String strHomeAdressPostCodeowner3 =
        preferences.getString("partnerELEstrHomeAdressPostCodeowner3");
    String strHomeaddressLiveYearowner3 =
        preferences.getString("partnerELEstrHomeaddressLiveYearowner3");
    String strHomeaddressLiveMonthowner3 =
        preferences.getString("partnerELEstrHomeaddressLiveMonthowner3");
    String strHomeaddress1owner3 =
        preferences.getString("partnerELEstrHomeaddress1owner3");
    String strHomeaddress2owner3 =
        preferences.getString("partnerELEstrHomeaddress2owner3");
    String strHomeaddressCity1owner3 =
        preferences.getString("partnerELEstrHomeaddressCity1owner3");
    String strHomeaddressPostCode1owner3 =
        preferences.getString("partnerELEstrHomeaddressPostCode1owner3");
    String strHomeaddressLiveYear1owner3 =
        preferences.getString("partnerELEstrHomeaddressLiveYear1owner3");
    String strHomeaddressLiveMonth1owner3 =
        preferences.getString("partnerELEstrHomeaddressLiveMonth1owner3");
    String strHomeaddress3owner3 =
        preferences.getString("partnerELEstrHomeaddress3owner3");
    String strHomeaddress4owner3 =
        preferences.getString("partnerELEstrHomeaddress4owner3");
    String strHomeaddressCity2owner3 =
        preferences.getString("partnerELEstrHomeaddressCity2owner3");
    String strHomeaddressPostCode2owner3 =
        preferences.getString("partnerELEstrHomeaddressPostCode2owner3");
    String strHomeaddressPostLiveYear2owner3 =
        preferences.getString("partnerELEstrHomeaddressPostLiveYear2owner3");
    String strHomeaddressPostLiveMonth2owner3 =
        preferences.getString("partnerELEstrHomeaddressPostLiveMonth2owner3");
    String strHomeaddress5owner3 =
        preferences.getString("partnerELEstrHomeaddress5owner3");
    String strHomeaddress6owner3 =
        preferences.getString("partnerELEstrHomeaddress6owner3");
    String strHomeaddressCity3owner3 =
        preferences.getString("partnerELEstrHomeaddressCity3owner3");
    String strHomeaddressPostCode3owner3 =
        preferences.getString("partnerELEstrHomeaddressPostCode3owner3");
    String strHomeaddressLiveYear3owner3 =
        preferences.getString("partnerELEstrHomeaddressLiveYear3owner3");
    String strHomeaddressLivemonth3owner3 =
        preferences.getString("partnerELEstrHomeaddressLivemonth3owner3");
    String strHomeaddress7owner3 =
        preferences.getString("partnerELEstrHomeaddress7owner3");
    String strHomeaddress8owner3 =
        preferences.getString("partnerELEstrHomeaddress8owner3");
    String strHomeaddressCity4owner3 =
        preferences.getString("partnerELEstrHomeaddressCity4owner3");
    String strHomeaddressPostCode4owner3 =
        preferences.getString("partnerELEstrHomeaddressPostCode4owner3");
    String strHomeaddressLiveYear4owner3 =
        preferences.getString("partnerELEstrHomeaddressLiveYear4owner3");
    String strHomeaddressLiveMonth4owner3 =
        preferences.getString("partnerELEstrHomeaddressLiveMonth4owner3");
    String strHomeaddress9owner3 =
        preferences.getString("partnerELEstrHomeaddress9owner3");
    String strHomeaddress10owner3 =
        preferences.getString("partnerELEstrHomeaddress10owner3");
    String strHomeaddressCity5owner3 =
        preferences.getString("partnerELEstrHomeaddressCity5owner3");
    String strHomeaddressPostCode5owner3 =
        preferences.getString("partnerELEstrHomeaddressPostCode5owner3");
    String strHomeaddressLiveYear5owner3 =
        preferences.getString("partnerELEstrHomeaddressLiveYear5owner3");
    String strHomeaddressLiveMonth5owner3 =
        preferences.getString("partnerELEstrHomeaddressLiveMonth5owner3");
    String strTitleQwner4 = preferences.getString("partnerELEstrTitleQwner4");
    String strFirstNameowner4 =
        preferences.getString("partnerELEstrFirstNameowner4");
    String strLastNameowner4 =
        preferences.getString("partnerELEstrLastNameowner4");
    String strstrDobOwner4 = preferences.getString("partnerELEstrstrDobOwner4");
    String home_Addressowner4 =
        preferences.getString("partnerELEhome_Addressowner4");
    String home_Address2owner4 =
        preferences.getString("partnerELEhome_Address2owner4");
    String strHomeAdressCityowner4 =
        preferences.getString("partnerELEstrHomeAdressCityowner4");
    String strHomeAdressPostCodeowner4 =
        preferences.getString("partnerELEstrHomeAdressPostCodeowner4");
    String strHomeaddressLiveYearowner4 =
        preferences.getString("partnerELEstrHomeaddressLiveYearowner4");
    String strHomeaddressLiveMonthowner4 =
        preferences.getString("partnerELEstrHomeaddressLiveMonthowner4");
    String strHomeaddress1owner4 =
        preferences.getString("partnerELEstrHomeaddress1owner4");
    String strHomeaddress2owner4 =
        preferences.getString("partnerELEstrHomeaddress2owner4");
    String strHomeaddressCity1owner4 =
        preferences.getString("partnerELEstrHomeaddressCity1owner4");
    String strHomeaddressPostCode1owner4 =
        preferences.getString("partnerELEstrHomeaddressPostCode1owner4");
    String strHomeaddressLiveYear1owner4 =
        preferences.getString("partnerELEstrHomeaddressLiveYear1owner4");
    String strHomeaddressLiveMonth1owner4 =
        preferences.getString("partnerELEstrHomeaddressLiveMonth1owner4");
    String strHomeaddress3owner4 =
        preferences.getString("partnerELEstrHomeaddress3owner4");
    String strHomeaddress4owner4 =
        preferences.getString("partnerELEstrHomeaddress4owner4");
    String strHomeaddressCity2owner4 =
        preferences.getString("partnerELEstrHomeaddressCity2owner4");
    String strHomeaddressPostCode2owner4 =
        preferences.getString("partnerELEstrHomeaddressPostCode2owner4");
    String strHomeaddressPostLiveYear2owner4 =
        preferences.getString("partnerELEstrHomeaddressPostLiveYear2owner4");
    String strHomeaddressPostLiveMonth2owner4 =
        preferences.getString("partnerELEstrHomeaddressPostLiveMonth2owner4");
    String strHomeaddress5owner4 =
        preferences.getString("partnerELEstrHomeaddress5owner4");
    String strHomeaddress6owner4 =
        preferences.getString("partnerELEstrHomeaddress6owner4");
    String strHomeaddressCity3owner4 =
        preferences.getString("partnerELEstrHomeaddressCity3owner4");
    String strHomeaddressPostCode3owner4 =
        preferences.getString("partnerELEstrHomeaddressPostCode3owner4");
    String strHomeaddressLiveYear3owner4 =
        preferences.getString("partnerELEstrHomeaddressLiveYear3owner4");
    String strHomeaddressLivemonth3owner4 =
        preferences.getString("partnerELEstrHomeaddressLivemonth3owner4");
    String strHomeaddress7owner4 =
        preferences.getString("partnerELEstrHomeaddress7owner4");
    String strHomeaddress8owner4 =
        preferences.getString("partnerELEstrHomeaddress8owner4");
    String strHomeaddressCity4owner4 =
        preferences.getString("partnerELEstrHomeaddressCity4owner4");
    String strHomeaddressPostCode4owner4 =
        preferences.getString("partnerELEstrHomeaddressPostCode4owner4");
    String strHomeaddressLiveYear4owner4 =
        preferences.getString("partnerELEstrHomeaddressLiveYear4owner4");
    String strHomeaddressLiveMonth4owner4 =
        preferences.getString("partnerELEstrHomeaddressLiveMonth4owner4");
    String strHomeaddress9owner4 =
        preferences.getString("partnerELEstrHomeaddress9owner4");
    String strHomeaddress10owner4 =
        preferences.getString("partnerELEstrHomeaddress10owner4");
    String strHomeaddressCity5owner4 =
        preferences.getString("partnerELEstrHomeaddressCity5owner4");
    String strHomeaddressPostCode5owner4 =
        preferences.getString("partnerELEstrHomeaddressPostCode5owner4");
    String strHomeaddressLiveYear5owner4 =
        preferences.getString("partnerELEstrHomeaddressLiveYear5owner4");
    String strHomeaddressLiveMonth5owner4 =
        preferences.getString("partnerELEstrHomeaddressLiveMonth5owner4");
    String strTitleQwner5 = preferences.getString("partnerELEstrTitleQwner5");
    String strFirstNameowner5 =
        preferences.getString("partnerELEstrFirstNameowner5");
    String strLastNameowner5 =
        preferences.getString("partnerELEstrLastNameowner5");
    String strstrDobOwner5 = preferences.getString("partnerELEstrstrDobOwner5");
    String home_Addressowner5 =
        preferences.getString("partnerELEhome_Addressowner5");
    String home_Address2owner5 =
        preferences.getString("partnerELEhome_Address2owner5");
    String strHomeAdressCityowner5 =
        preferences.getString("partnerELEstrHomeAdressCityowner5");
    String strHomeAdressPostCodeowner5 =
        preferences.getString("partnerELEstrHomeAdressPostCodeowner5");
    String strHomeaddressLiveYearowner5 =
        preferences.getString("partnerELEstrHomeaddressLiveYearowner5");
    String strHomeaddressLiveMonthowner5 =
        preferences.getString("partnerELEstrHomeaddressLiveMonthowner5");
    String strHomeaddress1owner5 =
        preferences.getString("partnerELEstrHomeaddress1owner5");
    String strHomeaddress2owner5 =
        preferences.getString("partnerELEstrHomeaddress2owner5");
    String strHomeaddressCity1owner5 =
        preferences.getString("partnerELEstrHomeaddressCity1owner5");
    String strHomeaddressPostCode1owner5 =
        preferences.getString("partnerELEstrHomeaddressPostCode1owner5");
    String strHomeaddressLiveYear1owner5 =
        preferences.getString("partnerELEstrHomeaddressLiveYear1owner5");
    String strHomeaddressLiveMonth1owner5 =
        preferences.getString("partnerELEstrHomeaddressLiveMonth1owner5");
    String strHomeaddress3owner5 =
        preferences.getString("partnerELEstrHomeaddress3owner5");
    String strHomeaddress4owner5 =
        preferences.getString("partnerELEstrHomeaddress4owner5");
    String strHomeaddressCity2owner5 =
        preferences.getString("partnerELEstrHomeaddressCity2owner5");
    String strHomeaddressPostCode2owner5 =
        preferences.getString("partnerELEstrHomeaddressPostCode2owner5");
    String strHomeaddressPostLiveYear2owner5 =
        preferences.getString("partnerELEstrHomeaddressPostLiveYear2owner5");
    String strHomeaddressPostLiveMonth2owner5 =
        preferences.getString("partnerELEstrHomeaddressPostLiveMonth2owner5");
    String strHomeaddress5owner5 =
        preferences.getString("partnerELEstrHomeaddress5owner5");
    String strHomeaddress6owner5 =
        preferences.getString("partnerELEstrHomeaddress6owner5");
    String strHomeaddressCity3owner5 =
        preferences.getString("partnerELEstrHomeaddressCity3owner5");
    String strHomeaddressPostCode3owner5 =
        preferences.getString("partnerELEstrHomeaddressPostCode3owner5");
    String strHomeaddressLiveYear3owner5 =
        preferences.getString("partnerELEstrHomeaddressLiveYear3owner5");
    String strHomeaddressLivemonth3owner5 =
        preferences.getString("partnerELEstrHomeaddressLivemonth3owner5");
    String strHomeaddress7owner5 =
        preferences.getString("partnerELEstrHomeaddress7owner5");
    String strHomeaddress8owner5 =
        preferences.getString("partnerELEstrHomeaddress8owner5");
    String strHomeaddressCity4owner5 =
        preferences.getString("partnerELEstrHomeaddressCity4owner5");
    String strHomeaddressPostCode4owner5 =
        preferences.getString("partnerELEstrHomeaddressPostCode4owner5");
    String strHomeaddressLiveYear4owner5 =
        preferences.getString("partnerELEstrHomeaddressLiveYear4owner5");
    String strHomeaddressLiveMonth4owner5 =
        preferences.getString("partnerELEstrHomeaddressLiveMonth4owner5");
    String strHomeaddress9owner5 =
        preferences.getString("partnerELEstrHomeaddress9owner5");
    String strHomeaddress10owner5 =
        preferences.getString("partnerELEstrHomeaddress10owner5");
    String strHomeaddressCity5owner5 =
        preferences.getString("partnerELEstrHomeaddressCity5owner5");
    String strHomeaddressPostCode5owner5 =
        preferences.getString("partnerELEstrHomeaddressPostCode5owner5");
    String strHomeaddressLiveYear5owner5 =
        preferences.getString("partnerELEstrHomeaddressLiveYear5owner5");
    String strHomeaddressLiveMonth5owner5 =
        preferences.getString("partnerELEstrHomeaddressLiveMonth5owner5");
    String strTitleQwner6 = preferences.getString("partnerELEstrTitleQwner6");
    String strFirstNameowner6 =
        preferences.getString("partnerELEstrFirstNameowner6");
    String strLastNameowner6 =
        preferences.getString("partnerELEstrLastNameowner6");
    String strstrDobOwner6 = preferences.getString("partnerELEstrstrDobOwner6");
    String home_Addressowner6 =
        preferences.getString("partnerELEhome_Addressowner6");
    String home_Address2owner6 =
        preferences.getString("partnerELEhome_Address2owner6");
    String strHomeAdressCityowner6 =
        preferences.getString("partnerELEstrHomeAdressCityowner6");
    String strHomeAdressPostCodeowner6 =
        preferences.getString("partnerELEstrHomeAdressPostCodeowner6");
    String strHomeaddressLiveYearowner6 =
        preferences.getString("partnerELEstrHomeaddressLiveYearowner6");
    String strHomeaddressLiveMonthowner6 =
        preferences.getString("partnerELEstrHomeaddressLiveMonthowner6");
    String strHomeaddress1owner6 =
        preferences.getString("partnerELEstrHomeaddress1owner6");
    String strHomeaddress2owner6 =
        preferences.getString("partnerELEstrHomeaddress2owner6");
    String strHomeaddressCity1owner6 =
        preferences.getString("partnerELEstrHomeaddressCity1owner6");
    String strHomeaddressPostCode1owner6 =
        preferences.getString("partnerELEstrHomeaddressPostCode1owner6");
    String strHomeaddressLiveYear1owner6 =
        preferences.getString("partnerELEstrHomeaddressLiveYear1owner6");
    String strHomeaddressLiveMonth1owner6 =
        preferences.getString("partnerELEstrHomeaddressLiveMonth1owner6");
    String strHomeaddress3owner6 =
        preferences.getString("partnerELEstrHomeaddress3owner6");
    String strHomeaddress4owner6 =
        preferences.getString("partnerELEstrHomeaddress4owner6");
    String strHomeaddressCity2owner6 =
        preferences.getString("partnerELEstrHomeaddressCity2owner6");
    String strHomeaddressPostCode2owner6 =
        preferences.getString("partnerELEstrHomeaddressPostCode2owner6");
    String strHomeaddressPostLiveYear2owner6 =
        preferences.getString("partnerELEstrHomeaddressPostLiveYear2owner6");
    String strHomeaddressPostLiveMonth2owner6 =
        preferences.getString("partnerELEstrHomeaddressPostLiveMonth2owner6");
    String strHomeaddress5owner6 =
        preferences.getString("partnerELEstrHomeaddress5owner6");
    String strHomeaddress6owner6 =
        preferences.getString("partnerELEstrHomeaddress6owner6");
    String strHomeaddressCity3owner6 =
        preferences.getString("partnerELEstrHomeaddressCity3owner6");
    String strHomeaddressPostCode3owner6 =
        preferences.getString("partnerELEstrHomeaddressPostCode3owner6");
    String strHomeaddressLiveYear3owner6 =
        preferences.getString("partnerELEstrHomeaddressLiveYear3owner6");
    String strHomeaddressLivemonth3owner6 =
        preferences.getString("partnerELEstrHomeaddressLivemonth3owner6");
    String strHomeaddress7owner6 =
        preferences.getString("partnerELEstrHomeaddress7owner6");
    String strHomeaddress8owner6 =
        preferences.getString("partnerELEstrHomeaddress8owner6");
    String strHomeaddressCity4owner6 =
        preferences.getString("partnerELEstrHomeaddressCity4owner6");
    String strHomeaddressPostCode4owner6 =
        preferences.getString("partnerELEstrHomeaddressPostCode4owner6");
    String strHomeaddressLiveYear4owner6 =
        preferences.getString("partnerELEstrHomeaddressLiveYear4owner6");
    String strHomeaddressLiveMonth4owner6 =
        preferences.getString("partnerELEstrHomeaddressLiveMonth4owner6");
    String strHomeaddress9owner6 =
        preferences.getString("partnerELEstrHomeaddress9owner6");
    String strHomeaddress10owner6 =
        preferences.getString("partnerELEstrHomeaddress10owner6");
    String strHomeaddressCity5owner6 =
        preferences.getString("partnerELEstrHomeaddressCity5owner6");
    String strHomeaddressPostCode5owner6 =
        preferences.getString("partnerELEstrHomeaddressPostCode5owner6");
    String strHomeaddressLiveYear5owner6 =
        preferences.getString("partnerELEstrHomeaddressLiveYear5owner6");
    String strHomeaddressLiveMonth5owner6 =
        preferences.getString("partnerELEstrHomeaddressLiveMonth5owner6");

    print('#####Partner--OwnerShip Details....$strTitleQwner1');
    if (strTitleQwner1 != null) {
      return new PartnerShipBusinessCredential(
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
        strTitleQwner2: strTitleQwner2,
        strFirstNameowner: strFirstNameowner,
        strLastNameowner: strLastNameowner,
        strDobOwner2: strDobOwner2,
        home_Addressowner: home_Addressowner,
        home_Address2owner: home_Address2owner,
        strHomeAdressPostCodeowner: strHomeAdressPostCodeowner,
        strHomeAdressCityowner: strHomeAdressCityowner,
        strHomeaddressLiveYearowner: strHomeaddressLiveYearowner,
        strHomeaddressLiveMonthowner: strHomeaddressLiveMonthowner,
        strHomeaddress1owner: strHomeaddress1owner,
        strHomeaddress2owner: strHomeaddress2owner,
        strHomeaddressCity1owner: strHomeaddressCity1owner,
        strHomeaddressPostCode1owner: strHomeaddressPostCode1owner,
        strHomeaddressLiveYear1owner: strHomeaddressLiveYear1owner,
        strHomeaddressLiveMonth1owner: strHomeaddressLiveMonth1owner,
        strHomeaddress3owner: strHomeaddress3owner,
        strHomeaddress4owner: strHomeaddress4owner,
        strHomeaddressCity2owner: strHomeaddressCity2owner,
        strHomeaddressPostCode2owner: strHomeaddressPostCode2owner,
        strHomeaddressPostLiveYear2owner: strHomeaddressPostLiveYear2owner,
        strHomeaddressPostLiveMonth2owner: strHomeaddressPostLiveMonth2owner,
        strHomeaddress5owner: strHomeaddress5owner,
        strHomeaddress6owner: strHomeaddress6owner,
        strHomeaddressCity3owner: strHomeaddressCity3owner,
        strHomeaddressPostCode3owner: strHomeaddressPostCode3owner,
        strHomeaddressLiveYear3owner: strHomeaddressLiveYear3owner,
        strHomeaddressLivemonth3owner: strHomeaddressLivemonth3owner,
        strHomeaddress7owner: strHomeaddress7owner,
        strHomeaddress8owner: strHomeaddress8owner,
        strHomeaddressCity4owner: strHomeaddressCity4owner,
        strHomeaddressPostCode4owner: strHomeaddressPostCode4owner,
        strHomeaddressLiveYear4owner: strHomeaddressLiveYear4owner,
        strHomeaddressLiveMonth4owner: strHomeaddressLiveMonth4owner,
        strHomeaddress9owner: strHomeaddress9owner,
        strHomeaddress10owner: strHomeaddress10owner,
        strHomeaddressCity5owner: strHomeaddressCity5owner,
        strHomeaddressPostCode5owner: strHomeaddressPostCode5owner,
        strHomeaddressLiveYear5owner: strHomeaddressLiveYear5owner,
        strHomeaddressLiveMonth5owner: strHomeaddressLiveMonth5owner,
        strTitleQwner3: strTitleQwner3,
        strFirstNameowner3: strFirstNameowner3,
        strLastNameowner3: strLastNameowner3,
        strstrDobOwner3: strstrDobOwner3,
        home_Addressowner3: home_Addressowner3,
        home_Address2owner3: home_Address2owner3,
        strHomeAdressCityowner3: strHomeAdressCityowner3,
        strHomeAdressPostCodeowner3: strHomeAdressPostCodeowner3,
        strHomeaddressLiveYearowner3: strHomeaddressLiveYearowner3,
        strHomeaddressLiveMonthowner3: strHomeaddressLiveMonthowner3,
        strHomeaddress1owner3: strHomeaddress1owner3,
        strHomeaddress2owner3: strHomeaddress2owner3,
        strHomeaddressCity1owner3: strHomeaddressCity1owner3,
        strHomeaddressPostCode1owner3: strHomeaddressPostCode1owner3,
        strHomeaddressLiveYear1owner3: strHomeaddressLiveYear1owner3,
        strHomeaddressLiveMonth1owner3: strHomeaddressLiveMonth1owner3,
        strHomeaddress3owner3: strHomeaddress3owner3,
        strHomeaddress4owner3: strHomeaddress4owner3,
        strHomeaddressCity2owner3: strHomeaddressCity2owner3,
        strHomeaddressPostCode2owner3: strHomeaddressPostCode2owner3,
        strHomeaddressPostLiveYear2owner3: strHomeaddressPostLiveYear2owner3,
        strHomeaddressPostLiveMonth2owner3: strHomeaddressPostLiveMonth2owner3,
        strHomeaddress5owner3: strHomeaddress5owner3,
        strHomeaddress6owner3: strHomeaddress6owner3,
        strHomeaddressCity3owner3: strHomeaddressCity3owner3,
        strHomeaddressPostCode3owner3: strHomeaddressPostCode3owner3,
        strHomeaddressLiveYear3owner3: strHomeaddressLiveYear3owner3,
        strHomeaddressLivemonth3owner3: strHomeaddressLivemonth3owner3,
        strHomeaddress7owner3: strHomeaddress7owner3,
        strHomeaddress8owner3: strHomeaddress8owner3,
        strHomeaddressCity4owner3: strHomeaddressCity4owner3,
        strHomeaddressPostCode4owner3: strHomeaddressPostCode4owner3,
        strHomeaddressLiveYear4owner3: strHomeaddressLiveYear4owner3,
        strHomeaddressLiveMonth4owner3: strHomeaddressLiveMonth4owner3,
        strHomeaddress9owner3: strHomeaddress9owner3,
        strHomeaddress10owner3: strHomeaddress10owner3,
        strHomeaddressCity5owner3: strHomeaddressCity5owner3,
        strHomeaddressPostCode5owner3: strHomeaddressPostCode5owner3,
        strHomeaddressLiveYear5owner3: strHomeaddressLiveYear5owner3,
        strHomeaddressLiveMonth5owner3: strHomeaddressLiveMonth5owner3,
        strTitleQwner4: strTitleQwner4,
        strFirstNameowner4: strFirstNameowner4,
        strLastNameowner4: strLastNameowner4,
        strstrDobOwner4: strstrDobOwner4,
        home_Addressowner4: home_Addressowner4,
        home_Address2owner4: home_Address2owner4,
        strHomeAdressCityowner4: strHomeAdressCityowner4,
        strHomeAdressPostCodeowner4: strHomeAdressPostCodeowner4,
        strHomeaddressLiveYearowner4: strHomeaddressLiveYearowner4,
        strHomeaddressLiveMonthowner4: strHomeaddressLiveMonthowner4,
        strHomeaddress1owner4: strHomeaddress1owner4,
        strHomeaddress2owner4: strHomeaddress2owner4,
        strHomeaddressCity1owner4: strHomeaddressCity1owner4,
        strHomeaddressPostCode1owner4: strHomeaddressPostCode1owner4,
        strHomeaddressLiveYear1owner4: strHomeaddressLiveYear1owner4,
        strHomeaddressLiveMonth1owner4: strHomeaddressLiveMonth1owner4,
        strHomeaddress3owner4: strHomeaddress3owner4,
        strHomeaddress4owner4: strHomeaddress4owner4,
        strHomeaddressCity2owner4: strHomeaddressCity2owner4,
        strHomeaddressPostCode2owner4: strHomeaddressPostCode2owner4,
        strHomeaddressPostLiveYear2owner4: strHomeaddressPostLiveYear2owner4,
        strHomeaddressPostLiveMonth2owner4: strHomeaddressPostLiveMonth2owner4,
        strHomeaddress5owner4: strHomeaddress5owner4,
        strHomeaddress6owner4: strHomeaddress6owner4,
        strHomeaddressCity3owner4: strHomeaddressCity3owner4,
        strHomeaddressPostCode3owner4: strHomeaddressPostCode3owner4,
        strHomeaddressLiveYear3owner4: strHomeaddressLiveYear3owner4,
        strHomeaddressLivemonth3owner4: strHomeaddressLivemonth3owner4,
        strHomeaddress7owner4: strHomeaddress7owner4,
        strHomeaddress8owner4: strHomeaddress8owner4,
        strHomeaddressCity4owner4: strHomeaddressCity4owner4,
        strHomeaddressPostCode4owner4: strHomeaddressPostCode4owner4,
        strHomeaddressLiveYear4owner4: strHomeaddressLiveYear4owner4,
        strHomeaddressLiveMonth4owner4: strHomeaddressLiveMonth4owner4,
        strHomeaddress9owner4: strHomeaddress9owner4,
        strHomeaddress10owner4: strHomeaddress10owner4,
        strHomeaddressCity5owner4: strHomeaddressCity5owner4,
        strHomeaddressPostCode5owner4: strHomeaddressPostCode5owner4,
        strHomeaddressLiveYear5owner4: strHomeaddressLiveYear5owner4,
        strHomeaddressLiveMonth5owner4: strHomeaddressLiveMonth5owner4,
        strTitleQwner5: strTitleQwner5,
        strFirstNameowner5: strFirstNameowner5,
        strLastNameowner5: strLastNameowner5,
        strstrDobOwner5: strstrDobOwner5,
        home_Addressowner5: home_Addressowner5,
        home_Address2owner5: home_Address2owner5,
        strHomeAdressCityowner5: strHomeAdressCityowner5,
        strHomeAdressPostCodeowner5: strHomeAdressPostCodeowner5,
        strHomeaddressLiveYearowner5: strHomeaddressLiveYearowner5,
        strHomeaddressLiveMonthowner5: strHomeaddressLiveMonthowner5,
        strHomeaddress1owner5: strHomeaddress1owner5,
        strHomeaddress2owner5: strHomeaddress2owner5,
        strHomeaddressCity1owner5: strHomeaddressCity1owner5,
        strHomeaddressPostCode1owner5: strHomeaddressPostCode1owner5,
        strHomeaddressLiveYear1owner5: strHomeaddressLiveYear1owner5,
        strHomeaddressLiveMonth1owner5: strHomeaddressLiveMonth1owner5,
        strHomeaddress3owner5: strHomeaddress3owner5,
        strHomeaddress4owner5: strHomeaddress4owner5,
        strHomeaddressCity2owner5: strHomeaddressCity2owner5,
        strHomeaddressPostCode2owner5: strHomeaddressPostCode2owner5,
        strHomeaddressPostLiveYear2owner5: strHomeaddressPostLiveYear2owner5,
        strHomeaddressPostLiveMonth2owner5: strHomeaddressPostLiveMonth2owner5,
        strHomeaddress5owner5: strHomeaddress5owner5,
        strHomeaddress6owner5: strHomeaddress6owner5,
        strHomeaddressCity3owner5: strHomeaddressCity3owner5,
        strHomeaddressPostCode3owner5: strHomeaddressPostCode3owner5,
        strHomeaddressLiveYear3owner5: strHomeaddressLiveYear3owner5,
        strHomeaddressLivemonth3owner5: strHomeaddressLivemonth3owner5,
        strHomeaddress7owner5: strHomeaddress7owner5,
        strHomeaddress8owner5: strHomeaddress8owner5,
        strHomeaddressCity4owner5: strHomeaddressCity4owner5,
        strHomeaddressPostCode4owner5: strHomeaddressPostCode4owner5,
        strHomeaddressLiveYear4owner5: strHomeaddressLiveYear4owner5,
        strHomeaddressLiveMonth4owner5: strHomeaddressLiveMonth4owner5,
        strHomeaddress9owner5: strHomeaddress9owner5,
        strHomeaddress10owner5: strHomeaddress10owner5,
        strHomeaddressCity5owner5: strHomeaddressCity5owner5,
        strHomeaddressPostCode5owner5: strHomeaddressPostCode5owner5,
        strHomeaddressLiveYear5owner5: strHomeaddressLiveYear5owner5,
        strHomeaddressLiveMonth5owner5: strHomeaddressLiveMonth5owner5,
        strTitleQwner6: strTitleQwner6,
        strFirstNameowner6: strFirstNameowner6,
        strLastNameowner6: strLastNameowner6,
        strstrDobOwner6: strstrDobOwner6,
        home_Addressowner6: home_Addressowner6,
        home_Address2owner6: home_Address2owner6,
        strHomeAdressCityowner6: strHomeAdressCityowner6,
        strHomeAdressPostCodeowner6: strHomeAdressPostCodeowner6,
        strHomeaddressLiveYearowner6: strHomeaddressLiveYearowner6,
        strHomeaddressLiveMonthowner6: strHomeaddressLiveMonthowner6,
        strHomeaddress1owner6: strHomeaddress1owner6,
        strHomeaddress2owner6: strHomeaddress2owner6,
        strHomeaddressCity1owner6: strHomeaddressCity1owner6,
        strHomeaddressPostCode1owner6: strHomeaddressPostCode1owner6,
        strHomeaddressLiveYear1owner6: strHomeaddressLiveYear1owner6,
        strHomeaddressLiveMonth1owner6: strHomeaddressLiveMonth1owner6,
        strHomeaddress3owner6: strHomeaddress3owner6,
        strHomeaddress4owner6: strHomeaddress4owner6,
        strHomeaddressCity2owner6: strHomeaddressCity2owner6,
        strHomeaddressPostCode2owner6: strHomeaddressPostCode2owner6,
        strHomeaddressPostLiveYear2owner6: strHomeaddressPostLiveYear2owner6,
        strHomeaddressPostLiveMonth2owner6: strHomeaddressPostLiveMonth2owner6,
        strHomeaddress5owner6: strHomeaddress5owner6,
        strHomeaddress6owner6: strHomeaddress6owner6,
        strHomeaddressCity3owner6: strHomeaddressCity3owner6,
        strHomeaddressPostCode3owner6: strHomeaddressPostCode3owner6,
        strHomeaddressLiveYear3owner6: strHomeaddressLiveYear3owner6,
        strHomeaddressLivemonth3owner6: strHomeaddressLivemonth3owner6,
        strHomeaddress7owner6: strHomeaddress7owner6,
        strHomeaddress8owner6: strHomeaddress8owner6,
        strHomeaddressCity4owner6: strHomeaddressCity4owner6,
        strHomeaddressPostCode4owner6: strHomeaddressPostCode4owner6,
        strHomeaddressLiveYear4owner6: strHomeaddressLiveYear4owner6,
        strHomeaddressLiveMonth4owner6: strHomeaddressLiveMonth4owner6,
        strHomeaddress9owner6: strHomeaddress9owner6,
        strHomeaddress10owner6: strHomeaddress10owner6,
        strHomeaddressCity5owner6: strHomeaddressCity5owner6,
        strHomeaddressPostCode5owner6: strHomeaddressPostCode5owner6,
        strHomeaddressLiveYear5owner6: strHomeaddressLiveYear5owner6,
        strHomeaddressLiveMonth5owner6: strHomeaddressLiveMonth5owner6,
      );
    } else {
      return null;
    }
  }
}
