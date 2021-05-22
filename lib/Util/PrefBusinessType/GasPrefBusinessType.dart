import 'package:pozitive/Core/Model/Api/Gas-Insert-AddProspect/GasBusinessOwnershipDetailsCredential.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GasBusinessTypePref {
  /// other Business<Add-Prosp> set
  static void setOtherBusinessTypeAdd(
      GasOtherBusinessCredential businessTypeAddressCredential) async {
    print(businessTypeAddressCredential.toJson());
    print(businessTypeAddressCredential.gasstrTitleOtherowner1);

    final sharedPreferences = await SharedPreferences.getInstance();

    if (businessTypeAddressCredential.gasstrTitleOtherowner1 != null) {
      sharedPreferences.setString("otherGasTitleOtherowner1",
          businessTypeAddressCredential.gasstrTitleOtherowner1);
    }
    if (businessTypeAddressCredential.gasstrOtherowner1FirstName != null) {
      sharedPreferences.setString("otherGasOtherowner1FirstName",
          businessTypeAddressCredential.gasstrOtherowner1FirstName);
    }
    if (businessTypeAddressCredential.gasstrOtherowner1LastName != null) {
      sharedPreferences.setString("otherGasOtherowner1LastName",
          businessTypeAddressCredential.gasstrOtherowner1LastName);
    }
    if (businessTypeAddressCredential.gasstrTitleOtherowner2 != null) {
      sharedPreferences.setString("otherGasTitleOtherowner2",
          businessTypeAddressCredential.gasstrTitleOtherowner2);
    }
    if (businessTypeAddressCredential.gasstrOtherowner2FirstName != null) {
      sharedPreferences.setString("otherGasOtherowner2FirstName",
          businessTypeAddressCredential.gasstrOtherowner2FirstName);
    }
    if (businessTypeAddressCredential.gasstrOtherowner2LastName != null) {
      sharedPreferences.setString("otherGasOtherowner2LastName",
          businessTypeAddressCredential.gasstrOtherowner2LastName);
    }
  }

  static void clearGASOtherBusiness() async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString("otherGasTitleOtherowner1", null);
  }

  //other Business<Add-Prosp> getMethod

  static Future<GasOtherBusinessCredential> getOtherBusinessTypeAdd() async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();

    String gasstrTitleOtherowner1 =
        preferences.getString("otherGasTitleOtherowner1");
    String gasstrOtherowner1FirstName =
        preferences.getString("otherGasOtherowner1FirstName");
    String gasstrOtherowner1LastName =
        preferences.getString("otherGasOtherowner1LastName");
    String gasstrTitleOtherowner2 =
        preferences.getString("otherGasTitleOtherowner2");
    String gasstrOtherowner2FirstName =
        preferences.getString("otherGasOtherowner2FirstName");
    String gasstrOtherowner2LastName =
        preferences.getString("otherGasOtherowner2LastName");
    if (gasstrTitleOtherowner1 != null) {
      return new GasOtherBusinessCredential(
        gasstrTitleOtherowner1: gasstrTitleOtherowner1,
        gasstrOtherowner1FirstName: gasstrOtherowner1FirstName,
        gasstrOtherowner1LastName: gasstrOtherowner1LastName,
        gasstrTitleOtherowner2: gasstrTitleOtherowner2,
        gasstrOtherowner2FirstName: gasstrOtherowner2FirstName,
        gasstrOtherowner2LastName: gasstrOtherowner2LastName,
      );
    } else
      return null;
  }

  /// ltd Business<Add-Prosp> set
  static void setltdBusinessTypeAdd(
      LtdBusinessCredential businessTypeAddressCredential) async {
    print(businessTypeAddressCredential.toJson());
    print(businessTypeAddressCredential.strTitleDirector1);

    final sharedPreferences = await SharedPreferences.getInstance();

    if (businessTypeAddressCredential.strTitleDirector1 != null) {
      sharedPreferences.setString("ltdGASstrTitleDirector1",
          businessTypeAddressCredential.strTitleDirector1);
    }
    if (businessTypeAddressCredential.strDirector1Firstname != null) {
      sharedPreferences.setString("ltdGASstrDirector1Firstname",
          businessTypeAddressCredential.strDirector1Firstname);
    }
    if (businessTypeAddressCredential.strDirector1Lastname != null) {
      sharedPreferences.setString("ltdGASstrDirector1Lastname",
          businessTypeAddressCredential.strDirector1Lastname);
    }
    if (businessTypeAddressCredential.strTitleDirector2 != null) {
      sharedPreferences.setString("ltdGASstrTitleDirector2",
          businessTypeAddressCredential.strTitleDirector2);
    }
    if (businessTypeAddressCredential.strDirector2Firstname != null) {
      sharedPreferences.setString("ltdGASstrDirector2Firstname",
          businessTypeAddressCredential.strDirector2Firstname);
    }
    if (businessTypeAddressCredential.strDirector2Lastname != null) {
      sharedPreferences.setString("ltdGASstrDirector2Lastname",
          businessTypeAddressCredential.strDirector2Lastname);
    }
  }

  static void clearGASLTDBusiness() async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString("ltdGASstrTitleDirector1", null);
  }

  ///ltd Business<Add-Prosp> getMethod
  static Future<LtdBusinessCredential> getltdBusinessTypeAdd() async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();

    String gasstrTitleDirector1 =
        preferences.getString("ltdGASstrTitleDirector1");
    String gasstrDirector1Firstname =
        preferences.getString("ltdGASstrDirector1Firstname");
    String gasstrDirector1Lastname =
        preferences.getString("ltdGASstrDirector1Lastname");
    String gasstrTitleDirector2 =
        preferences.getString("ltdGASstrTitleDirector2");
    String gasstrDirector2Firstname =
        preferences.getString("ltdGASstrDirector2Firstname");
    String gasstrDirector2Lastname =
        preferences.getString("ltdGASstrDirector2Lastname");
    if (gasstrTitleDirector1 != null) {
      return new LtdBusinessCredential(
        strTitleDirector1: gasstrTitleDirector1,
        strDirector1Firstname: gasstrDirector1Firstname,
        strDirector1Lastname: gasstrDirector1Lastname,
        strTitleDirector2: gasstrTitleDirector2,
        strDirector2Firstname: gasstrDirector2Firstname,
        strDirector2Lastname: gasstrDirector2Lastname,
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
      sharedPreferences.setString("charityGASstrTitlecharityowner1",
          businessTypeAddressCredential.strTitlecharityowner1);
    }
    if (businessTypeAddressCredential.strcharityowner1firstname != null) {
      sharedPreferences.setString("charityGASstrcharityowner1firstname",
          businessTypeAddressCredential.strcharityowner1firstname);
    }
    if (businessTypeAddressCredential.strcharityowner1lastname != null) {
      sharedPreferences.setString("charityGASstrcharityowner1lastname",
          businessTypeAddressCredential.strcharityowner1lastname);
    }
    if (businessTypeAddressCredential.strTitlecharityowner2 != null) {
      sharedPreferences.setString("charityGASstrTitlecharityowner2",
          businessTypeAddressCredential.strTitlecharityowner2);
    }
    if (businessTypeAddressCredential.strcharityowner2firstname != null) {
      sharedPreferences.setString("charityGASstrcharityowner2firstname",
          businessTypeAddressCredential.strcharityowner2firstname);
    }
    if (businessTypeAddressCredential.strcharityowner2lastname != null) {
      sharedPreferences.setString("charityGASstrcharityowner2lastname",
          businessTypeAddressCredential.strcharityowner2lastname);
    }
    if (businessTypeAddressCredential.strchariryRegisterNo != null) {
      sharedPreferences.setString("charityGASstrchariryRegisterNo",
          businessTypeAddressCredential.strchariryRegisterNo);
    }
  }

  static void clearGASCharityBusiness() async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString("charityGASstrTitlecharityowner1", null);
  }

  ///Charity Business<Add-Prosp> getMethod
  static Future<CharityBusinessCredential> getCharityBusinessTypeAdd() async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();

    String gasstrTitlecharityowner1 =
        preferences.getString("charityGASstrTitlecharityowner1");
    String gasstrcharityowner1firstname =
        preferences.getString("charityGASstrcharityowner1firstname");
    String gasstrcharityowner1lastname =
        preferences.getString("charityGASstrcharityowner1lastname");
    String gasstrTitlecharityowner2 =
        preferences.getString("charityGASstrTitlecharityowner2");
    String gasstrcharityowner2firstname =
        preferences.getString("charityGASstrcharityowner2firstname");
    String gasstrcharityowner2lastname =
        preferences.getString("charityGASstrcharityowner2lastname");
    String gasstrchariryRegisterNo =
        preferences.getString("charityGASstrchariryRegisterNo");

    print('#####OwnerShip Details....$gasstrTitlecharityowner1');
    if (gasstrTitlecharityowner1 != null) {
      return new CharityBusinessCredential(
        strTitlecharityowner1: gasstrTitlecharityowner1,
        strcharityowner1firstname: gasstrcharityowner1firstname,
        strcharityowner1lastname: gasstrcharityowner1lastname,
        strTitlecharityowner2: gasstrTitlecharityowner2,
        strcharityowner2firstname: gasstrcharityowner2firstname,
        strcharityowner2lastname: gasstrcharityowner2lastname,
        strchariryRegisterNo: gasstrchariryRegisterNo,
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
      sharedPreferences.setString("llpGASstrTitleLLPowner1",
          businessTypeAddressCredential.strTitleLLPowner1);
    }
    if (businessTypeAddressCredential.strLLPowner1FirstName != null) {
      sharedPreferences.setString("llpGASstrLLPowner1FirstName",
          businessTypeAddressCredential.strLLPowner1FirstName);
    }
    if (businessTypeAddressCredential.strLLPowner1LastName != null) {
      sharedPreferences.setString("llpGASstrLLPowner1LastName",
          businessTypeAddressCredential.strLLPowner1LastName);
    }
    if (businessTypeAddressCredential.strTitleLLPowner2 != null) {
      sharedPreferences.setString("llpGASstrTitleLLPowner2",
          businessTypeAddressCredential.strTitleLLPowner2);
    }
    if (businessTypeAddressCredential.strLLPowner2FirstName != null) {
      sharedPreferences.setString("llpGASstrLLPowner2FirstName",
          businessTypeAddressCredential.strLLPowner2FirstName);
    }
    if (businessTypeAddressCredential.strLLPowner2LastName != null) {
      sharedPreferences.setString("llpGASstrLLPowner2LastName",
          businessTypeAddressCredential.strLLPowner2LastName);
    }
  }

  static void clearGASLLPBusiness() async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString("llpGASstrTitleLLPowner1", null);
  }

  ///llp Business<Add-Prosp> getMethod
  static Future<LLPBusinessCredential> getLLPBusinessTypeAdd() async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();

    String gasstrTitleLLPowner1 =
        preferences.getString("llpGASstrTitleLLPowner1");
    String gasstrLLPowner1FirstName =
        preferences.getString("llpGASstrLLPowner1FirstName");
    String gasstrLLPowner1LastName =
        preferences.getString("llpGASstrLLPowner1LastName");
    String gasstrTitleLLPowner2 =
        preferences.getString("llpGASstrTitleLLPowner2");
    String gasstrLLPowner2FirstName =
        preferences.getString("llpGASstrLLPowner2FirstName");
    String gasstrLLPowner2LastName =
        preferences.getString("llpGASstrLLPowner2LastName");

    print('#####LLP--OwnerShip Details....$gasstrTitleLLPowner1');
    if (gasstrTitleLLPowner1 != null) {
      return new LLPBusinessCredential(
        strTitleLLPowner1: gasstrTitleLLPowner1,
        strLLPowner1FirstName: gasstrLLPowner1FirstName,
        strLLPowner1LastName: gasstrLLPowner1LastName,
        strTitleLLPowner2: gasstrTitleLLPowner2,
        strLLPowner2FirstName: gasstrLLPowner2FirstName,
        strLLPowner2LastName: gasstrLLPowner2LastName,
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
      sharedPreferences.setString("llcGASstrTitleLLcowner1",
          businessTypeAddressCredential.strTitleLLcowner1);
    }
    if (businessTypeAddressCredential.strLLcowner1FirstName != null) {
      sharedPreferences.setString("llcGASstrLLcowner1FirstName",
          businessTypeAddressCredential.strLLcowner1FirstName);
    }
    if (businessTypeAddressCredential.strLLcowner1LastName != null) {
      sharedPreferences.setString("llcGASstrLLcowner1LastName",
          businessTypeAddressCredential.strLLcowner1LastName);
    }
    if (businessTypeAddressCredential.strTitleLLcowner2 != null) {
      sharedPreferences.setString("llcGASstrTitleLLcowner2",
          businessTypeAddressCredential.strTitleLLcowner2);
    }
    if (businessTypeAddressCredential.strLLcowner2FirstName != null) {
      sharedPreferences.setString("llcGASstrLLcowner2FirstName",
          businessTypeAddressCredential.strLLcowner2FirstName);
    }
    if (businessTypeAddressCredential.strLLcowner2LastName != null) {
      sharedPreferences.setString("llcGASstrLLcowner2LastName",
          businessTypeAddressCredential.strLLcowner2LastName);
    }
  }

  static void clearGASLLCBusiness() async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString("llcGASstrTitleLLcowner1", null);
  }

  ///llc Business<Add-Prosp> getMethod
  static Future<LLCBusinessCredential> getLLCBusinessTypeAdd() async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();

    String strTitleLLcowner1 = preferences.getString("llcGASstrTitleLLcowner1");
    String strLLcowner1FirstName =
        preferences.getString("llcGASstrLLcowner1FirstName");
    String strLLcowner1LastName =
        preferences.getString("llcGASstrLLcowner1LastName");
    String strTitleLLcowner2 = preferences.getString("llcGASstrTitleLLcowner2");
    String strLLcowner2FirstName =
        preferences.getString("llcGASstrLLcowner2FirstName");
    String strLLcowner2LastName =
        preferences.getString("llcGASstrLLcowner2LastName");

    print('#####LLP--OwnerShip Details....$strTitleLLcowner1');
    if (strTitleLLcowner1 != null) {
      return new LLCBusinessCredential(
        strTitleLLcowner1: strTitleLLcowner1,
        strLLcowner1FirstName: strLLcowner1FirstName,
        strLLcowner1LastName: strLLcowner1LastName,
        strTitleLLcowner2: strTitleLLcowner2,
        strLLcowner2FirstName: strLLcowner2FirstName,
        strLLcowner2LastName: strLLcowner2LastName,
      );
    } else {
      return null;
    }
  }

  /// Sole Business<Add-Prosp> set
  static void setSoleBusinessTypeAdd(
      SoleBusinessCredential businessTypeAddressCredential) async {
    print(businessTypeAddressCredential.toJson());
    print(businessTypeAddressCredential.home_Address);

    final sharedPreferences = await SharedPreferences.getInstance();

    if (businessTypeAddressCredential.strTitleQwner1 != null) {
      sharedPreferences.setString("soleGASstrTitleQwner1",
          businessTypeAddressCredential.strTitleQwner1);
    }
    if (businessTypeAddressCredential.firstName != null) {
      sharedPreferences.setString(
          "soleGASfirstName", businessTypeAddressCredential.firstName);
    }
    if (businessTypeAddressCredential.lastName != null) {
      sharedPreferences.setString(
          "soleGASlastName", businessTypeAddressCredential.lastName);
    }
    if (businessTypeAddressCredential.strTitleDirector2 != null) {
      sharedPreferences.setString("soleGASstrTitleDirector2",
          businessTypeAddressCredential.strTitleDirector2);
    }
    if (businessTypeAddressCredential.strDirector2Firstname != null) {
      sharedPreferences.setString("soleGASstrDirector2Firstname",
          businessTypeAddressCredential.strDirector2Firstname);
    }
    if (businessTypeAddressCredential.strDirector2Lastname != null) {
      sharedPreferences.setString("soleGASstrDirector2Lastname",
          businessTypeAddressCredential.strDirector2Lastname);
    }
    if (businessTypeAddressCredential.strDobOwner1 != null) {
      sharedPreferences.setString(
          "soleGASstrDobOwner1", businessTypeAddressCredential.strDobOwner1);
    }
    if (businessTypeAddressCredential.home_Address != null) {
      sharedPreferences.setString(
          "soleGAShome_Address", businessTypeAddressCredential.home_Address);
    }
    if (businessTypeAddressCredential.home_Address2 != null) {
      sharedPreferences.setString(
          "soleGAShome_Address2", businessTypeAddressCredential.home_Address2);
    }
    if (businessTypeAddressCredential.strHomeAdressPostCode != null) {
      sharedPreferences.setString("soleGASstrHomeAdressPostCode",
          businessTypeAddressCredential.strHomeAdressPostCode);
    }
    if (businessTypeAddressCredential.strHomeAdressCity != null) {
      sharedPreferences.setString("soleGASstrHomeAdressCity",
          businessTypeAddressCredential.strHomeAdressCity);
    }
    if (businessTypeAddressCredential.strHomeaddressLiveYear != null) {
      sharedPreferences.setString("soleGASstrHomeaddressLiveYear",
          businessTypeAddressCredential.strHomeaddressLiveYear);
    }
    if (businessTypeAddressCredential.strHomeaddressLiveMonth != null) {
      sharedPreferences.setString("soleGASstrHomeaddressLiveMonth",
          businessTypeAddressCredential.strHomeaddressLiveMonth);
    }
    if (businessTypeAddressCredential.strHomeaddress1 != null) {
      sharedPreferences.setString("soleGASstrHomeaddress1",
          businessTypeAddressCredential.strHomeaddress1);
    }
    if (businessTypeAddressCredential.strHomeaddress2 != null) {
      sharedPreferences.setString("soleGASstrHomeaddress2",
          businessTypeAddressCredential.strHomeaddress2);
    }
    if (businessTypeAddressCredential.strHomeaddressCity1 != null) {
      sharedPreferences.setString("soleGASstrHomeaddressCity1",
          businessTypeAddressCredential.strHomeaddressCity1);
    }
    if (businessTypeAddressCredential.strHomeaddressPostCode1 != null) {
      sharedPreferences.setString("soleGASstrHomeaddressPostCode1",
          businessTypeAddressCredential.strHomeaddressPostCode1);
    }
    if (businessTypeAddressCredential.strHomeaddressLiveYear1 != null) {
      sharedPreferences.setString("soleGASstrHomeaddressLiveYear1",
          businessTypeAddressCredential.strHomeaddressLiveYear1);
    }
    if (businessTypeAddressCredential.strHomeaddressLiveMonth1 != null) {
      sharedPreferences.setString("soleGASstrHomeaddressLiveMonth1",
          businessTypeAddressCredential.strHomeaddressLiveMonth1);
    }
    if (businessTypeAddressCredential.strHomeaddress3 != null) {
      sharedPreferences.setString("soleGASstrHomeaddress3",
          businessTypeAddressCredential.strHomeaddress3);
    }
    if (businessTypeAddressCredential.strHomeaddress4 != null) {
      sharedPreferences.setString("soleGASstrHomeaddress4",
          businessTypeAddressCredential.strHomeaddress4);
    }
    if (businessTypeAddressCredential.strHomeaddressCity2 != null) {
      sharedPreferences.setString("soleGASstrHomeaddressCity2",
          businessTypeAddressCredential.strHomeaddressCity2);
    }
    if (businessTypeAddressCredential.strHomeaddressPostCode2 != null) {
      sharedPreferences.setString("soleGASstrHomeaddressPostCode2",
          businessTypeAddressCredential.strHomeaddressPostCode2);
    }
    if (businessTypeAddressCredential.strHomeaddressPostLiveYear2 != null) {
      sharedPreferences.setString("soleGASstrHomeaddressPostLiveYear2",
          businessTypeAddressCredential.strHomeaddressPostLiveYear2);
    }
    if (businessTypeAddressCredential.strHomeaddressPostLiveMonth2 != null) {
      sharedPreferences.setString("soleGASstrHomeaddressPostLiveMonth2",
          businessTypeAddressCredential.strHomeaddressPostLiveMonth2);
    }
    if (businessTypeAddressCredential.strHomeaddress5 != null) {
      sharedPreferences.setString("soleGASstrHomeaddress5",
          businessTypeAddressCredential.strHomeaddress5);
    }
    if (businessTypeAddressCredential.strHomeaddress6 != null) {
      sharedPreferences.setString("soleGASstrHomeaddress6",
          businessTypeAddressCredential.strHomeaddress6);
    }
    if (businessTypeAddressCredential.strHomeaddressCity3 != null) {
      sharedPreferences.setString("soleGASstrHomeaddressCity3",
          businessTypeAddressCredential.strHomeaddressCity3);
    }
    if (businessTypeAddressCredential.strHomeaddressPostCode3 != null) {
      sharedPreferences.setString("soleGASstrHomeaddressPostCode3",
          businessTypeAddressCredential.strHomeaddressPostCode3);
    }
    if (businessTypeAddressCredential.strHomeaddressLiveYear3 != null) {
      sharedPreferences.setString("soleGASstrHomeaddressLiveYear3",
          businessTypeAddressCredential.strHomeaddressLiveYear3);
    }
    if (businessTypeAddressCredential.strHomeaddressLivemonth3 != null) {
      sharedPreferences.setString("soleGASstrHomeaddressLivemonth3",
          businessTypeAddressCredential.strHomeaddressLivemonth3);
    }
    if (businessTypeAddressCredential.strHomeaddress7 != null) {
      sharedPreferences.setString("soleGASstrHomeaddress7",
          businessTypeAddressCredential.strHomeaddress7);
    }
    if (businessTypeAddressCredential.strHomeaddress8 != null) {
      sharedPreferences.setString("soleGASstrHomeaddress8",
          businessTypeAddressCredential.strHomeaddress8);
    }
    if (businessTypeAddressCredential.strHomeaddressCity4 != null) {
      sharedPreferences.setString("soleGASstrHomeaddressCity4",
          businessTypeAddressCredential.strHomeaddressCity4);
    }
    if (businessTypeAddressCredential.strHomeaddressPostCode4 != null) {
      sharedPreferences.setString("soleGASstrHomeaddressPostCode4",
          businessTypeAddressCredential.strHomeaddressPostCode4);
    }
    if (businessTypeAddressCredential.strHomeaddressLiveYear4 != null) {
      sharedPreferences.setString("soleGASstrHomeaddressLiveYear4",
          businessTypeAddressCredential.strHomeaddressLiveYear4);
    }
    if (businessTypeAddressCredential.strHomeaddressLiveMonth4 != null) {
      sharedPreferences.setString("soleGASstrHomeaddressLiveMonth4",
          businessTypeAddressCredential.strHomeaddressLiveMonth4);
    }
    if (businessTypeAddressCredential.strHomeaddress9 != null) {
      sharedPreferences.setString("soleGASstrHomeaddress9",
          businessTypeAddressCredential.strHomeaddress9);
    }
    if (businessTypeAddressCredential.strHomeaddress10 != null) {
      sharedPreferences.setString("soleGASstrHomeaddress10",
          businessTypeAddressCredential.strHomeaddress10);
    }
    if (businessTypeAddressCredential.strHomeaddressCity5 != null) {
      sharedPreferences.setString("soleGASstrHomeaddressCity5",
          businessTypeAddressCredential.strHomeaddressCity5);
    }
    if (businessTypeAddressCredential.strHomeaddressPostCode5 != null) {
      sharedPreferences.setString("soleGASstrHomeaddressPostCode5",
          businessTypeAddressCredential.strHomeaddressPostCode5);
    }
    if (businessTypeAddressCredential.strHomeaddressLiveYear5 != null) {
      sharedPreferences.setString("soleGASstrHomeaddressLiveYear5",
          businessTypeAddressCredential.strHomeaddressLiveYear5);
    }
    if (businessTypeAddressCredential.strHomeaddressLiveMonth5owner != null) {
      sharedPreferences.setString("soleGASstrHomeaddressLiveMonth5owner",
          businessTypeAddressCredential.strHomeaddressLiveMonth5owner);
    }
  }

  static void clearGASSoleBusiness() async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString("soleGASstrTitleQwner1", null);
  }

  ///Sole Business<Add-Prosp> getMethod
  static Future<SoleBusinessCredential> getSoleBusinessTypeAdd() async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();

    String strTitleQwner1 = preferences.getString("soleGASstrTitleQwner1");
    String firstName = preferences.getString("soleGASfirstName");
    String lastName = preferences.getString("soleGASlastName");
    String strTitleDirector2 =
        preferences.getString("soleGASstrTitleDirector2");
    String strDirector2Firstname =
        preferences.getString("soleGASstrDirector2Firstname");
    String strDirector2Lastname =
        preferences.getString("soleGASstrDirector2Lastname");
    String strDobOwner1 = preferences.getString("soleGASstrDobOwner1");
    String home_Address = preferences.getString("soleGAShome_Address");
    String home_Address2 = preferences.getString("soleGAShome_Address2");
    String strHomeAdressPostCode =
        preferences.getString("soleGASstrHomeAdressPostCode");
    String strHomeAdressCity =
        preferences.getString("soleGASstrHomeAdressCity");
    String strHomeaddressLiveYear =
        preferences.getString("soleGASstrHomeaddressLiveYear");
    String strHomeaddressLiveMonth =
        preferences.getString("soleGASstrHomeaddressLiveMonth");
    String strHomeaddress1 = preferences.getString("soleGASstrHomeaddress1");
    String strHomeaddress2 = preferences.getString("soleGASstrHomeaddress2");
    String strHomeaddressCity1 =
        preferences.getString("soleGASstrHomeaddressCity1");
    String strHomeaddressPostCode1 =
        preferences.getString("soleGASstrHomeaddressPostCode1");
    String strHomeaddressLiveYear1 =
        preferences.getString("soleGASstrHomeaddressLiveYear1");
    String strHomeaddressLiveMonth1 =
        preferences.getString("soleGASstrHomeaddressLiveMonth1");
    String strHomeaddress3 = preferences.getString("soleGASstrHomeaddress3");
    String strHomeaddress4 = preferences.getString("soleGASstrHomeaddress4");
    String strHomeaddressCity2 =
        preferences.getString("soleGASstrHomeaddressCity2");
    String strHomeaddressPostCode2 =
        preferences.getString("soleGASstrHomeaddressPostCode2");
    String strHomeaddressPostLiveYear2 =
        preferences.getString("soleGASstrHomeaddressPostLiveYear2");
    String strHomeaddressPostLiveMonth2 =
        preferences.getString("soleGASstrHomeaddressPostLiveMonth2");
    String strHomeaddress5 = preferences.getString("soleGASstrHomeaddress5");
    String strHomeaddress6 = preferences.getString("soleGASstrHomeaddress6");
    String strHomeaddressCity3 =
        preferences.getString("soleGASstrHomeaddressCity3");
    String strHomeaddressPostCode3 =
        preferences.getString("soleGASstrHomeaddressPostCode3");
    String strHomeaddressLiveYear3 =
        preferences.getString("soleGASstrHomeaddressLiveYear3");
    String strHomeaddressLivemonth3 =
        preferences.getString("soleGASstrHomeaddressLivemonth3");
    String strHomeaddress7 = preferences.getString("soleGASstrHomeaddress7");
    String strHomeaddress8 = preferences.getString("soleGASstrHomeaddress8");
    String strHomeaddressCity4 =
        preferences.getString("soleGASstrHomeaddressCity4");
    String strHomeaddressPostCode4 =
        preferences.getString("soleGASstrHomeaddressPostCode4");
    String strHomeaddressLiveYear4 =
        preferences.getString("soleGASstrHomeaddressLiveYear4");
    String strHomeaddressLiveMonth4 =
        preferences.getString("soleGASstrHomeaddressLiveMonth4");
    String strHomeaddress9 = preferences.getString("soleGASstrHomeaddress9");
    String strHomeaddress10 = preferences.getString("soleGASstrHomeaddress10");
    String strHomeaddressCity5 =
        preferences.getString("soleGASstrHomeaddressCity5");
    String strHomeaddressPostCode5 =
        preferences.getString("soleGASstrHomeaddressPostCode5");
    String strHomeaddressLiveYear5 =
        preferences.getString("soleGASstrHomeaddressLiveYear5");
    String strHomeaddressLiveMonth5owner =
        preferences.getString("soleGASstrHomeaddressLiveMonth5owner");

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
      sharedPreferences.setString("partnerGASstrTitleQwner1",
          businessTypeAddressCredential.strTitleQwner1);
    }
    if (businessTypeAddressCredential.firstName != null) {
      sharedPreferences.setString(
          "partnerGASfirstName", businessTypeAddressCredential.firstName);
    }
    if (businessTypeAddressCredential.lastName != null) {
      sharedPreferences.setString(
          "partnerGASlastName", businessTypeAddressCredential.lastName);
    }
    if (businessTypeAddressCredential.strTitleDirector2 != null) {
      sharedPreferences.setString("partnerGASstrTitleDirector2",
          businessTypeAddressCredential.strTitleDirector2);
    }
    if (businessTypeAddressCredential.strDirector2Firstname != null) {
      sharedPreferences.setString("partnerGASstrDirector2Firstname",
          businessTypeAddressCredential.strDirector2Firstname);
    }
    if (businessTypeAddressCredential.strDirector2Lastname != null) {
      sharedPreferences.setString("partnerGASstrDirector2Lastname",
          businessTypeAddressCredential.strDirector2Lastname);
    }
    if (businessTypeAddressCredential.strDobOwner1 != null) {
      sharedPreferences.setString(
          "partnerGASstrDobOwner1", businessTypeAddressCredential.strDobOwner1);
    }
    if (businessTypeAddressCredential.home_Address != null) {
      sharedPreferences.setString(
          "partnerGAShome_Address", businessTypeAddressCredential.home_Address);
    }
    if (businessTypeAddressCredential.home_Address2 != null) {
      sharedPreferences.setString("partnerGAShome_Address2",
          businessTypeAddressCredential.home_Address2);
    }
    if (businessTypeAddressCredential.strHomeAdressPostCode != null) {
      sharedPreferences.setString("partnerGASstrHomeAdressPostCode",
          businessTypeAddressCredential.strHomeAdressPostCode);
    }
    if (businessTypeAddressCredential.strHomeAdressCity != null) {
      sharedPreferences.setString("partnerGASstrHomeAdressCity",
          businessTypeAddressCredential.strHomeAdressCity);
    }
    if (businessTypeAddressCredential.strHomeaddressLiveYear != null) {
      sharedPreferences.setString("partnerGASstrHomeaddressLiveYear",
          businessTypeAddressCredential.strHomeaddressLiveYear);
    }
    if (businessTypeAddressCredential.strHomeaddressLiveMonth != null) {
      sharedPreferences.setString("partnerGASstrHomeaddressLiveMonth",
          businessTypeAddressCredential.strHomeaddressLiveMonth);
    }
    if (businessTypeAddressCredential.strHomeaddress1 != null) {
      sharedPreferences.setString("partnerGASstrHomeaddress1",
          businessTypeAddressCredential.strHomeaddress1);
    }
    if (businessTypeAddressCredential.strHomeaddress2 != null) {
      sharedPreferences.setString("partnerGASstrHomeaddress2",
          businessTypeAddressCredential.strHomeaddress2);
    }
    if (businessTypeAddressCredential.strHomeaddressCity1 != null) {
      sharedPreferences.setString("partnerGASstrHomeaddressCity1",
          businessTypeAddressCredential.strHomeaddressCity1);
    }
    if (businessTypeAddressCredential.strHomeaddressPostCode1 != null) {
      sharedPreferences.setString("partnerGASstrHomeaddressPostCode1",
          businessTypeAddressCredential.strHomeaddressPostCode1);
    }
    if (businessTypeAddressCredential.strHomeaddressLiveYear1 != null) {
      sharedPreferences.setString("partnerGASstrHomeaddressLiveYear1",
          businessTypeAddressCredential.strHomeaddressLiveYear1);
    }
    if (businessTypeAddressCredential.strHomeaddressLiveMonth1 != null) {
      sharedPreferences.setString("partnerGASstrHomeaddressLiveMonth1",
          businessTypeAddressCredential.strHomeaddressLiveMonth1);
    }
    if (businessTypeAddressCredential.strHomeaddress3 != null) {
      sharedPreferences.setString("partnerGASstrHomeaddress3",
          businessTypeAddressCredential.strHomeaddress3);
    }
    if (businessTypeAddressCredential.strHomeaddress4 != null) {
      sharedPreferences.setString("partnerGASstrHomeaddress4",
          businessTypeAddressCredential.strHomeaddress4);
    }
    if (businessTypeAddressCredential.strHomeaddressCity2 != null) {
      sharedPreferences.setString("partnerGASstrHomeaddressCity2",
          businessTypeAddressCredential.strHomeaddressCity2);
    }
    if (businessTypeAddressCredential.strHomeaddressPostCode2 != null) {
      sharedPreferences.setString("partnerGASstrHomeaddressPostCode2",
          businessTypeAddressCredential.strHomeaddressPostCode2);
    }
    if (businessTypeAddressCredential.strHomeaddressPostLiveYear2 != null) {
      sharedPreferences.setString("partnerGASstrHomeaddressPostLiveYear2",
          businessTypeAddressCredential.strHomeaddressPostLiveYear2);
    }
    if (businessTypeAddressCredential.strHomeaddressPostLiveMonth2 != null) {
      sharedPreferences.setString("partnerGASstrHomeaddressPostLiveMonth2",
          businessTypeAddressCredential.strHomeaddressPostLiveMonth2);
    }
    if (businessTypeAddressCredential.strHomeaddress5 != null) {
      sharedPreferences.setString("partnerGASstrHomeaddress5",
          businessTypeAddressCredential.strHomeaddress5);
    }
    if (businessTypeAddressCredential.strHomeaddress6 != null) {
      sharedPreferences.setString("partnerGASstrHomeaddress6",
          businessTypeAddressCredential.strHomeaddress6);
    }
    if (businessTypeAddressCredential.strHomeaddressCity3 != null) {
      sharedPreferences.setString("partnerGASstrHomeaddressCity3",
          businessTypeAddressCredential.strHomeaddressCity3);
    }
    if (businessTypeAddressCredential.strHomeaddressPostCode3 != null) {
      sharedPreferences.setString("partnerGASstrHomeaddressPostCode3",
          businessTypeAddressCredential.strHomeaddressPostCode3);
    }
    if (businessTypeAddressCredential.strHomeaddressLiveYear3 != null) {
      sharedPreferences.setString("partnerGASstrHomeaddressLiveYear3",
          businessTypeAddressCredential.strHomeaddressLiveYear3);
    }
    if (businessTypeAddressCredential.strHomeaddressLivemonth3 != null) {
      sharedPreferences.setString("partnerGASstrHomeaddressLivemonth3",
          businessTypeAddressCredential.strHomeaddressLivemonth3);
    }
    if (businessTypeAddressCredential.strHomeaddress7 != null) {
      sharedPreferences.setString("partnerGASstrHomeaddress7",
          businessTypeAddressCredential.strHomeaddress7);
    }
    if (businessTypeAddressCredential.strHomeaddress8 != null) {
      sharedPreferences.setString("partnerGASstrHomeaddress8",
          businessTypeAddressCredential.strHomeaddress8);
    }
    if (businessTypeAddressCredential.strHomeaddressCity4 != null) {
      sharedPreferences.setString("partnerGASstrHomeaddressCity4",
          businessTypeAddressCredential.strHomeaddressCity4);
    }
    if (businessTypeAddressCredential.strHomeaddressPostCode4 != null) {
      sharedPreferences.setString("partnerGASstrHomeaddressPostCode4",
          businessTypeAddressCredential.strHomeaddressPostCode4);
    }
    if (businessTypeAddressCredential.strHomeaddressLiveYear4 != null) {
      sharedPreferences.setString("partnerGASstrHomeaddressLiveYear4",
          businessTypeAddressCredential.strHomeaddressLiveYear4);
    }
    if (businessTypeAddressCredential.strHomeaddressLiveMonth4 != null) {
      sharedPreferences.setString("partnerGASstrHomeaddressLiveMonth4",
          businessTypeAddressCredential.strHomeaddressLiveMonth4);
    }
    if (businessTypeAddressCredential.strHomeaddress9 != null) {
      sharedPreferences.setString("partnerGASstrHomeaddress9",
          businessTypeAddressCredential.strHomeaddress9);
    }
    if (businessTypeAddressCredential.strHomeaddress10 != null) {
      sharedPreferences.setString("partnerGASstrHomeaddress10",
          businessTypeAddressCredential.strHomeaddress10);
    }
    if (businessTypeAddressCredential.strHomeaddressCity5 != null) {
      sharedPreferences.setString("partnerGASstrHomeaddressCity5",
          businessTypeAddressCredential.strHomeaddressCity5);
    }
    if (businessTypeAddressCredential.strHomeaddressPostCode5 != null) {
      sharedPreferences.setString("partnerGASstrHomeaddressPostCode5",
          businessTypeAddressCredential.strHomeaddressPostCode5);
    }
    if (businessTypeAddressCredential.strHomeaddressLiveYear5 != null) {
      sharedPreferences.setString("partnerGASstrHomeaddressLiveYear5",
          businessTypeAddressCredential.strHomeaddressLiveYear5);
    }
    if (businessTypeAddressCredential.strTitleQwner2 != null) {
      sharedPreferences.setString("partnerGASstrTitleQwner2",
          businessTypeAddressCredential.strTitleQwner2);
    }
    if (businessTypeAddressCredential.strFirstNameowner != null) {
      sharedPreferences.setString("partnerGASstrFirstNameowner",
          businessTypeAddressCredential.strFirstNameowner);
    }
    if (businessTypeAddressCredential.strLastNameowner != null) {
      sharedPreferences.setString("partnerGASstrLastNameowner",
          businessTypeAddressCredential.strLastNameowner);
    }
    if (businessTypeAddressCredential.strDobOwner2 != null) {
      sharedPreferences.setString(
          "partnerGASstrDobOwner2", businessTypeAddressCredential.strDobOwner2);
    }
    if (businessTypeAddressCredential.home_Addressowner != null) {
      sharedPreferences.setString("partnerGAShome_Addressowner",
          businessTypeAddressCredential.home_Addressowner);
    }
    if (businessTypeAddressCredential.home_Address2owner != null) {
      sharedPreferences.setString("partnerGAShome_Address2owner",
          businessTypeAddressCredential.home_Address2owner);
    }
    if (businessTypeAddressCredential.strHomeAdressPostCodeowner != null) {
      sharedPreferences.setString("partnerGASstrHomeAdressPostCodeowner",
          businessTypeAddressCredential.strHomeAdressPostCodeowner);
    }
    if (businessTypeAddressCredential.strHomeAdressCityowner != null) {
      sharedPreferences.setString("partnerGASstrHomeAdressCityowner",
          businessTypeAddressCredential.strHomeAdressCityowner);
    }
    if (businessTypeAddressCredential.strHomeaddressLiveYearowner != null) {
      sharedPreferences.setString("partnerGASstrHomeaddressLiveYearowner",
          businessTypeAddressCredential.strHomeaddressLiveYearowner);
    }
    if (businessTypeAddressCredential.strHomeaddressLiveMonthowner != null) {
      sharedPreferences.setString("partnerGASstrHomeaddressLiveMonthowner",
          businessTypeAddressCredential.strHomeaddressLiveMonthowner);
    }
    if (businessTypeAddressCredential.strHomeaddress1owner != null) {
      sharedPreferences.setString("partnerGASstrHomeaddress1owner",
          businessTypeAddressCredential.strHomeaddress1owner);
    }
    if (businessTypeAddressCredential.strHomeaddress2owner != null) {
      sharedPreferences.setString("partnerGASstrHomeaddress2owner",
          businessTypeAddressCredential.strHomeaddress2owner);
    }
    if (businessTypeAddressCredential.strHomeaddressCity1owner != null) {
      sharedPreferences.setString("partnerGASstrHomeaddressCity1owner",
          businessTypeAddressCredential.strHomeaddressCity1owner);
    }
    if (businessTypeAddressCredential.strHomeaddressPostCode1owner != null) {
      sharedPreferences.setString("partnerGASstrHomeaddressPostCode1owner",
          businessTypeAddressCredential.strHomeaddressPostCode1owner);
    }
    if (businessTypeAddressCredential.strHomeaddressLiveYear1owner != null) {
      sharedPreferences.setString("partnerGASstrHomeaddressLiveYear1owner",
          businessTypeAddressCredential.strHomeaddressLiveYear1owner);
    }
    if (businessTypeAddressCredential.strHomeaddressLiveMonth1owner != null) {
      sharedPreferences.setString("partnerGASstrHomeaddressLiveMonth1owner",
          businessTypeAddressCredential.strHomeaddressLiveMonth1owner);
    }
    if (businessTypeAddressCredential.strHomeaddress3owner != null) {
      sharedPreferences.setString("partnerGASstrHomeaddress3owner",
          businessTypeAddressCredential.strHomeaddress3owner);
    }
    if (businessTypeAddressCredential.strHomeaddress4owner != null) {
      sharedPreferences.setString("partnerGASstrHomeaddress4owner",
          businessTypeAddressCredential.strHomeaddress4owner);
    }
    if (businessTypeAddressCredential.strHomeaddressCity2owner != null) {
      sharedPreferences.setString("partnerGASstrHomeaddressCity2owner",
          businessTypeAddressCredential.strHomeaddressCity2owner);
    }
    if (businessTypeAddressCredential.strHomeaddressPostCode2owner != null) {
      sharedPreferences.setString("partnerGASstrHomeaddressPostCode2owner",
          businessTypeAddressCredential.strHomeaddressPostCode2owner);
    }
    if (businessTypeAddressCredential.strHomeaddressPostLiveYear2owner !=
        null) {
      sharedPreferences.setString("partnerGASstrHomeaddressPostLiveYear2owner",
          businessTypeAddressCredential.strHomeaddressPostLiveYear2owner);
    }
    if (businessTypeAddressCredential.strHomeaddressPostLiveMonth2owner !=
        null) {
      sharedPreferences.setString("partnerGASstrHomeaddressPostLiveMonth2owner",
          businessTypeAddressCredential.strHomeaddressPostLiveMonth2owner);
    }
    if (businessTypeAddressCredential.strHomeaddress5owner != null) {
      sharedPreferences.setString("partnerGASstrHomeaddress5owner",
          businessTypeAddressCredential.strHomeaddress5owner);
    }
    if (businessTypeAddressCredential.strHomeaddress6owner != null) {
      sharedPreferences.setString("partnerGASstrHomeaddress6owner",
          businessTypeAddressCredential.strHomeaddress6owner);
    }
    if (businessTypeAddressCredential.strHomeaddressCity3owner != null) {
      sharedPreferences.setString("partnerGASstrHomeaddressCity3owner",
          businessTypeAddressCredential.strHomeaddressCity3owner);
    }
    if (businessTypeAddressCredential.strHomeaddressPostCode3owner != null) {
      sharedPreferences.setString("partnerGASstrHomeaddressPostCode3owner",
          businessTypeAddressCredential.strHomeaddressPostCode3owner);
    }
    if (businessTypeAddressCredential.strHomeaddressLiveYear3owner != null) {
      sharedPreferences.setString("partnerGASstrHomeaddressLiveYear3owner",
          businessTypeAddressCredential.strHomeaddressLiveYear3owner);
    }
    if (businessTypeAddressCredential.strHomeaddressLivemonth3owner != null) {
      sharedPreferences.setString("partnerGASstrHomeaddressLivemonth3owner",
          businessTypeAddressCredential.strHomeaddressLivemonth3owner);
    }
    if (businessTypeAddressCredential.strHomeaddress7owner != null) {
      sharedPreferences.setString("partnerGASstrHomeaddress7owner",
          businessTypeAddressCredential.strHomeaddress7owner);
    }
    if (businessTypeAddressCredential.strHomeaddress8owner != null) {
      sharedPreferences.setString("partnerGASstrHomeaddress8owner",
          businessTypeAddressCredential.strHomeaddress8owner);
    }
    if (businessTypeAddressCredential.strHomeaddressCity4owner != null) {
      sharedPreferences.setString("partnerGASstrHomeaddressCity4owner",
          businessTypeAddressCredential.strHomeaddressCity4owner);
    }
    if (businessTypeAddressCredential.strHomeaddressPostCode4owner != null) {
      sharedPreferences.setString("partnerGASstrHomeaddressPostCode4owner",
          businessTypeAddressCredential.strHomeaddressPostCode4owner);
    }
    if (businessTypeAddressCredential.strHomeaddressLiveYear4owner != null) {
      sharedPreferences.setString("partnerGASstrHomeaddressLiveYear4owner",
          businessTypeAddressCredential.strHomeaddressLiveYear4owner);
    }
    if (businessTypeAddressCredential.strHomeaddressLiveMonth4owner != null) {
      sharedPreferences.setString("partnerGASstrHomeaddressLiveMonth4owner",
          businessTypeAddressCredential.strHomeaddressLiveMonth4owner);
    }
    if (businessTypeAddressCredential.strHomeaddress9owner != null) {
      sharedPreferences.setString("partnerGASstrHomeaddress9owner",
          businessTypeAddressCredential.strHomeaddress9owner);
    }
    if (businessTypeAddressCredential.strHomeaddress10owner != null) {
      sharedPreferences.setString("partnerGASstrHomeaddress10owner",
          businessTypeAddressCredential.strHomeaddress10owner);
    }
    if (businessTypeAddressCredential.strHomeaddressCity5owner != null) {
      sharedPreferences.setString("partnerGASstrHomeaddressCity5owner",
          businessTypeAddressCredential.strHomeaddressCity5owner);
    }
    if (businessTypeAddressCredential.strHomeaddressPostCode5owner != null) {
      sharedPreferences.setString("partnerGASstrHomeaddressPostCode5owner",
          businessTypeAddressCredential.strHomeaddressPostCode5owner);
    }
    if (businessTypeAddressCredential.strHomeaddressLiveYear5owner != null) {
      sharedPreferences.setString("partnerGASstrHomeaddressLiveYear5owner",
          businessTypeAddressCredential.strHomeaddressLiveYear5owner);
    }
    if (businessTypeAddressCredential.strHomeaddressLiveMonth5owner != null) {
      sharedPreferences.setString("partnerGASstrHomeaddressLiveMonth5owner",
          businessTypeAddressCredential.strHomeaddressLiveMonth5owner);
    }
    if (businessTypeAddressCredential.strTitleQwner3 != null) {
      sharedPreferences.setString("partnerGASstrTitleQwner3",
          businessTypeAddressCredential.strTitleQwner3);
    }
    if (businessTypeAddressCredential.strFirstNameowner3 != null) {
      sharedPreferences.setString("partnerGASstrFirstNameowner3",
          businessTypeAddressCredential.strFirstNameowner3);
    }
    if (businessTypeAddressCredential.strLastNameowner3 != null) {
      sharedPreferences.setString("partnerGASstrLastNameowner3",
          businessTypeAddressCredential.strLastNameowner3);
    }
    if (businessTypeAddressCredential.strstrDobOwner3 != null) {
      sharedPreferences.setString("partnerGASstrstrDobOwner3",
          businessTypeAddressCredential.strstrDobOwner3);
    }
    if (businessTypeAddressCredential.home_Addressowner3 != null) {
      sharedPreferences.setString("partnerGAShome_Addressowner3",
          businessTypeAddressCredential.home_Addressowner3);
    }
    if (businessTypeAddressCredential.home_Address2owner3 != null) {
      sharedPreferences.setString("partnerGAShome_Address2owner3",
          businessTypeAddressCredential.home_Address2owner3);
    }
    if (businessTypeAddressCredential.strHomeAdressCityowner3 != null) {
      sharedPreferences.setString("partnerGASstrHomeAdressCityowner3",
          businessTypeAddressCredential.strHomeAdressCityowner3);
    }
    if (businessTypeAddressCredential.strHomeAdressPostCodeowner3 != null) {
      sharedPreferences.setString("partnerGASstrHomeAdressPostCodeowner3",
          businessTypeAddressCredential.strHomeAdressPostCodeowner3);
    }
    if (businessTypeAddressCredential.strHomeaddressLiveYearowner3 != null) {
      sharedPreferences.setString("partnerGASstrHomeaddressLiveYearowner3",
          businessTypeAddressCredential.strHomeaddressLiveYearowner3);
    }
    if (businessTypeAddressCredential.strHomeaddressLiveMonthowner3 != null) {
      sharedPreferences.setString("partnerGASstrHomeaddressLiveMonthowner3",
          businessTypeAddressCredential.strHomeaddressLiveMonthowner3);
    }
    if (businessTypeAddressCredential.strHomeaddress1owner3 != null) {
      sharedPreferences.setString("partnerGASstrHomeaddress1owner3",
          businessTypeAddressCredential.strHomeaddress1owner3);
    }
    if (businessTypeAddressCredential.strHomeaddress2owner3 != null) {
      sharedPreferences.setString("partnerGASstrHomeaddress2owner3",
          businessTypeAddressCredential.strHomeaddress2owner3);
    }
    if (businessTypeAddressCredential.strHomeaddressCity1owner3 != null) {
      sharedPreferences.setString("partnerGASstrHomeaddressCity1owner3",
          businessTypeAddressCredential.strHomeaddressCity1owner3);
    }
    if (businessTypeAddressCredential.strHomeaddressPostCode1owner3 != null) {
      sharedPreferences.setString("partnerGASstrHomeaddressPostCode1owner3",
          businessTypeAddressCredential.strHomeaddressPostCode1owner3);
    }
    if (businessTypeAddressCredential.strHomeaddressLiveYear1owner3 != null) {
      sharedPreferences.setString("partnerGASstrHomeaddressLiveYear1owner3",
          businessTypeAddressCredential.strHomeaddressLiveYear1owner3);
    }
    if (businessTypeAddressCredential.strHomeaddressLiveMonth1owner3 != null) {
      sharedPreferences.setString("partnerGASstrHomeaddressLiveMonth1owner3",
          businessTypeAddressCredential.strHomeaddressLiveMonth1owner3);
    }
    if (businessTypeAddressCredential.strHomeaddress3owner3 != null) {
      sharedPreferences.setString("partnerGASstrHomeaddress3owner3",
          businessTypeAddressCredential.strHomeaddress3owner3);
    }
    if (businessTypeAddressCredential.strHomeaddress4owner3 != null) {
      sharedPreferences.setString("partnerGASstrHomeaddress4owner3",
          businessTypeAddressCredential.strHomeaddress4owner3);
    }
    if (businessTypeAddressCredential.strHomeaddressCity2owner3 != null) {
      sharedPreferences.setString("partnerGASstrHomeaddressCity2owner3",
          businessTypeAddressCredential.strHomeaddressCity2owner3);
    }
    if (businessTypeAddressCredential.strHomeaddressPostCode2owner3 != null) {
      sharedPreferences.setString("partnerGASstrHomeaddressPostCode2owner3",
          businessTypeAddressCredential.strHomeaddressPostCode2owner3);
    }
    if (businessTypeAddressCredential.strHomeaddressPostLiveYear2owner3 !=
        null) {
      sharedPreferences.setString("partnerGASstrHomeaddressPostLiveYear2owner3",
          businessTypeAddressCredential.strHomeaddressPostLiveYear2owner3);
    }
    if (businessTypeAddressCredential.strHomeaddressPostLiveMonth2owner3 !=
        null) {
      sharedPreferences.setString(
          "partnerGASstrHomeaddressPostLiveMonth2owner3",
          businessTypeAddressCredential.strHomeaddressPostLiveMonth2owner3);
    }
    if (businessTypeAddressCredential.strHomeaddress5owner3 != null) {
      sharedPreferences.setString("partnerGASstrHomeaddress5owner3",
          businessTypeAddressCredential.strHomeaddress5owner3);
    }
    if (businessTypeAddressCredential.strHomeaddress6owner3 != null) {
      sharedPreferences.setString("partnerGASstrHomeaddress6owner3",
          businessTypeAddressCredential.strHomeaddress6owner3);
    }
    if (businessTypeAddressCredential.strHomeaddressCity3owner3 != null) {
      sharedPreferences.setString("partnerGASstrHomeaddressCity3owner3",
          businessTypeAddressCredential.strHomeaddressCity3owner3);
    }
    if (businessTypeAddressCredential.strHomeaddressPostCode3owner3 != null) {
      sharedPreferences.setString("partnerGASstrHomeaddressPostCode3owner3",
          businessTypeAddressCredential.strHomeaddressPostCode3owner3);
    }
    if (businessTypeAddressCredential.strHomeaddressLiveYear3owner3 != null) {
      sharedPreferences.setString("partnerGASstrHomeaddressLiveYear3owner3",
          businessTypeAddressCredential.strHomeaddressLiveYear3owner3);
    }
    if (businessTypeAddressCredential.strHomeaddressLivemonth3owner3 != null) {
      sharedPreferences.setString("partnerGASstrHomeaddressLivemonth3owner3",
          businessTypeAddressCredential.strHomeaddressLivemonth3owner3);
    }
    if (businessTypeAddressCredential.strHomeaddress7owner3 != null) {
      sharedPreferences.setString("partnerGASstrHomeaddress7owner3",
          businessTypeAddressCredential.strHomeaddress7owner3);
    }
    if (businessTypeAddressCredential.strHomeaddress8owner3 != null) {
      sharedPreferences.setString("partnerGASstrHomeaddress8owner3",
          businessTypeAddressCredential.strHomeaddress8owner3);
    }
    if (businessTypeAddressCredential.strHomeaddressCity4owner3 != null) {
      sharedPreferences.setString("partnerGASstrHomeaddressCity4owner3",
          businessTypeAddressCredential.strHomeaddressCity4owner3);
    }
    if (businessTypeAddressCredential.strHomeaddressPostCode4owner3 != null) {
      sharedPreferences.setString("partnerGASstrHomeaddressPostCode4owner3",
          businessTypeAddressCredential.strHomeaddressPostCode4owner3);
    }
    if (businessTypeAddressCredential.strHomeaddressLiveYear4owner3 != null) {
      sharedPreferences.setString("partnerGASstrHomeaddressLiveYear4owner3",
          businessTypeAddressCredential.strHomeaddressLiveYear4owner3);
    }
    if (businessTypeAddressCredential.strHomeaddressLiveMonth4owner3 != null) {
      sharedPreferences.setString("partnerGASstrHomeaddressLiveMonth4owner3",
          businessTypeAddressCredential.strHomeaddressLiveMonth4owner3);
    }
    if (businessTypeAddressCredential.strHomeaddress9owner3 != null) {
      sharedPreferences.setString("partnerGASstrHomeaddress9owner3",
          businessTypeAddressCredential.strHomeaddress9owner3);
    }
    if (businessTypeAddressCredential.strHomeaddress10owner3 != null) {
      sharedPreferences.setString("partnerGASstrHomeaddress10owner3",
          businessTypeAddressCredential.strHomeaddress10owner3);
    }
    if (businessTypeAddressCredential.strHomeaddressCity5owner3 != null) {
      sharedPreferences.setString("partnerGASstrHomeaddressCity5owner3",
          businessTypeAddressCredential.strHomeaddressCity5owner3);
    }
    if (businessTypeAddressCredential.strHomeaddressPostCode5owner3 != null) {
      sharedPreferences.setString("partnerGASstrHomeaddressPostCode5owner3",
          businessTypeAddressCredential.strHomeaddressPostCode5owner3);
    }
    if (businessTypeAddressCredential.strHomeaddressLiveYear5owner3 != null) {
      sharedPreferences.setString("partnerGASstrHomeaddressLiveYear5owner3",
          businessTypeAddressCredential.strHomeaddressLiveYear5owner3);
    }
    if (businessTypeAddressCredential.strHomeaddressLiveMonth5owner3 != null) {
      sharedPreferences.setString("partnerGASstrHomeaddressLiveMonth5owner3",
          businessTypeAddressCredential.strHomeaddressLiveMonth5owner3);
    }
    if (businessTypeAddressCredential.strTitleQwner4 != null) {
      sharedPreferences.setString("partnerGASstrTitleQwner4",
          businessTypeAddressCredential.strTitleQwner4);
    }
    if (businessTypeAddressCredential.strFirstNameowner4 != null) {
      sharedPreferences.setString("partnerGASstrFirstNameowner4",
          businessTypeAddressCredential.strFirstNameowner4);
    }
    if (businessTypeAddressCredential.strLastNameowner4 != null) {
      sharedPreferences.setString("partnerGASstrLastNameowner4",
          businessTypeAddressCredential.strLastNameowner4);
    }
    if (businessTypeAddressCredential.strstrDobOwner4 != null) {
      sharedPreferences.setString("partnerGASstrstrDobOwner4",
          businessTypeAddressCredential.strstrDobOwner4);
    }
    if (businessTypeAddressCredential.home_Addressowner4 != null) {
      sharedPreferences.setString("partnerGAShome_Addressowner4",
          businessTypeAddressCredential.home_Addressowner4);
    }
    if (businessTypeAddressCredential.home_Address2owner4 != null) {
      sharedPreferences.setString("partnerGAShome_Address2owner4",
          businessTypeAddressCredential.home_Address2owner4);
    }
    if (businessTypeAddressCredential.strHomeAdressCityowner4 != null) {
      sharedPreferences.setString("partnerGASstrHomeAdressCityowner4",
          businessTypeAddressCredential.strHomeAdressCityowner4);
    }
    if (businessTypeAddressCredential.strHomeAdressPostCodeowner4 != null) {
      sharedPreferences.setString("partnerGASstrHomeAdressPostCodeowner4",
          businessTypeAddressCredential.strHomeAdressPostCodeowner4);
    }
    if (businessTypeAddressCredential.strHomeaddressLiveYearowner4 != null) {
      sharedPreferences.setString("partnerGASstrHomeaddressLiveYearowner4",
          businessTypeAddressCredential.strHomeaddressLiveYearowner4);
    }
    if (businessTypeAddressCredential.strHomeaddressLiveMonthowner4 != null) {
      sharedPreferences.setString("partnerGASstrHomeaddressLiveMonthowner4",
          businessTypeAddressCredential.strHomeaddressLiveMonthowner4);
    }
    if (businessTypeAddressCredential.strHomeaddress1owner4 != null) {
      sharedPreferences.setString("partnerGASstrHomeaddress1owner4",
          businessTypeAddressCredential.strHomeaddress1owner4);
    }
    if (businessTypeAddressCredential.strHomeaddress2owner4 != null) {
      sharedPreferences.setString("partnerGASstrHomeaddress2owner4",
          businessTypeAddressCredential.strHomeaddress2owner4);
    }
    if (businessTypeAddressCredential.strHomeaddressCity1owner4 != null) {
      sharedPreferences.setString("partnerGASstrHomeaddressCity1owner4",
          businessTypeAddressCredential.strHomeaddressCity1owner4);
    }
    if (businessTypeAddressCredential.strHomeaddressPostCode1owner4 != null) {
      sharedPreferences.setString("partnerGASstrHomeaddressPostCode1owner4",
          businessTypeAddressCredential.strHomeaddressPostCode1owner4);
    }
    if (businessTypeAddressCredential.strHomeaddressLiveYear1owner4 != null) {
      sharedPreferences.setString("partnerGASstrHomeaddressLiveYear1owner4",
          businessTypeAddressCredential.strHomeaddressLiveYear1owner4);
    }
    if (businessTypeAddressCredential.strHomeaddressLiveMonth1owner4 != null) {
      sharedPreferences.setString("partnerGASstrHomeaddressLiveMonth1owner4",
          businessTypeAddressCredential.strHomeaddressLiveMonth1owner4);
    }
    if (businessTypeAddressCredential.strHomeaddress3owner4 != null) {
      sharedPreferences.setString("partnerGASstrHomeaddress3owner4",
          businessTypeAddressCredential.strHomeaddress3owner4);
    }
    if (businessTypeAddressCredential.strHomeaddress4owner4 != null) {
      sharedPreferences.setString("partnerGASstrHomeaddress4owner4",
          businessTypeAddressCredential.strHomeaddress4owner4);
    }
    if (businessTypeAddressCredential.strHomeaddressCity2owner4 != null) {
      sharedPreferences.setString("partnerGASstrHomeaddressCity2owner4",
          businessTypeAddressCredential.strHomeaddressCity2owner4);
    }
    if (businessTypeAddressCredential.strHomeaddressPostCode2owner4 != null) {
      sharedPreferences.setString("partnerGASstrHomeaddressPostCode2owner4",
          businessTypeAddressCredential.strHomeaddressPostCode2owner4);
    }
    if (businessTypeAddressCredential.strHomeaddressPostLiveYear2owner4 !=
        null) {
      sharedPreferences.setString("partnerGASstrHomeaddressPostLiveYear2owner4",
          businessTypeAddressCredential.strHomeaddressPostLiveYear2owner4);
    }
    if (businessTypeAddressCredential.strHomeaddressPostLiveMonth2owner4 !=
        null) {
      sharedPreferences.setString(
          "partnerGASstrHomeaddressPostLiveMonth2owner4",
          businessTypeAddressCredential.strHomeaddressPostLiveMonth2owner4);
    }
    if (businessTypeAddressCredential.strHomeaddress5owner4 != null) {
      sharedPreferences.setString("partnerGASstrHomeaddress5owner4",
          businessTypeAddressCredential.strHomeaddress5owner4);
    }
    if (businessTypeAddressCredential.strHomeaddress6owner4 != null) {
      sharedPreferences.setString("partnerGASstrHomeaddress6owner4",
          businessTypeAddressCredential.strHomeaddress6owner4);
    }
    if (businessTypeAddressCredential.strHomeaddressCity3owner4 != null) {
      sharedPreferences.setString("partnerGASstrHomeaddressCity3owner4",
          businessTypeAddressCredential.strHomeaddressCity3owner4);
    }
    if (businessTypeAddressCredential.strHomeaddressPostCode3owner4 != null) {
      sharedPreferences.setString("partnerGASstrHomeaddressPostCode3owner4",
          businessTypeAddressCredential.strHomeaddressPostCode3owner4);
    }
    if (businessTypeAddressCredential.strHomeaddressLiveYear3owner4 != null) {
      sharedPreferences.setString("partnerGASstrHomeaddressLiveYear3owner4",
          businessTypeAddressCredential.strHomeaddressLiveYear3owner4);
    }
    if (businessTypeAddressCredential.strHomeaddressLivemonth3owner4 != null) {
      sharedPreferences.setString("partnerGASstrHomeaddressLivemonth3owner4",
          businessTypeAddressCredential.strHomeaddressLivemonth3owner4);
    }
    if (businessTypeAddressCredential.strHomeaddress7owner4 != null) {
      sharedPreferences.setString("partnerGASstrHomeaddress7owner4",
          businessTypeAddressCredential.strHomeaddress7owner4);
    }
    if (businessTypeAddressCredential.strHomeaddress8owner4 != null) {
      sharedPreferences.setString("partnerGASstrHomeaddress8owner4",
          businessTypeAddressCredential.strHomeaddress8owner4);
    }
    if (businessTypeAddressCredential.strHomeaddressCity4owner4 != null) {
      sharedPreferences.setString("partnerGASstrHomeaddressCity4owner4",
          businessTypeAddressCredential.strHomeaddressCity4owner4);
    }
    if (businessTypeAddressCredential.strHomeaddressPostCode4owner4 != null) {
      sharedPreferences.setString("partnerGASstrHomeaddressPostCode4owner4",
          businessTypeAddressCredential.strHomeaddressPostCode4owner4);
    }
    if (businessTypeAddressCredential.strHomeaddressLiveYear4owner4 != null) {
      sharedPreferences.setString("partnerGASstrHomeaddressLiveYear4owner4",
          businessTypeAddressCredential.strHomeaddressLiveYear4owner4);
    }
    if (businessTypeAddressCredential.strHomeaddressLiveMonth4owner4 != null) {
      sharedPreferences.setString("partnerGASstrHomeaddressLiveMonth4owner4",
          businessTypeAddressCredential.strHomeaddressLiveMonth4owner4);
    }
    if (businessTypeAddressCredential.strHomeaddress9owner4 != null) {
      sharedPreferences.setString("partnerGASstrHomeaddress9owner4",
          businessTypeAddressCredential.strHomeaddress9owner4);
    }
    if (businessTypeAddressCredential.strHomeaddress10owner4 != null) {
      sharedPreferences.setString("partnerGASstrHomeaddress10owner4",
          businessTypeAddressCredential.strHomeaddress10owner4);
    }
    if (businessTypeAddressCredential.strHomeaddressCity5owner4 != null) {
      sharedPreferences.setString("partnerGASstrHomeaddressCity5owner4",
          businessTypeAddressCredential.strHomeaddressCity5owner4);
    }
    if (businessTypeAddressCredential.strHomeaddressPostCode5owner4 != null) {
      sharedPreferences.setString("partnerGASstrHomeaddressPostCode5owner4",
          businessTypeAddressCredential.strHomeaddressPostCode5owner4);
    }
    if (businessTypeAddressCredential.strHomeaddressLiveYear5owner4 != null) {
      sharedPreferences.setString("partnerGASstrHomeaddressLiveYear5owner4",
          businessTypeAddressCredential.strHomeaddressLiveYear5owner4);
    }
    if (businessTypeAddressCredential.strHomeaddressLiveMonth5owner4 != null) {
      sharedPreferences.setString("partnerGASstrHomeaddressLiveMonth5owner4",
          businessTypeAddressCredential.strHomeaddressLiveMonth5owner4);
    }
    if (businessTypeAddressCredential.strTitleQwner5 != null) {
      sharedPreferences.setString("partnerGASstrTitleQwner5",
          businessTypeAddressCredential.strTitleQwner5);
    }
    if (businessTypeAddressCredential.strFirstNameowner5 != null) {
      sharedPreferences.setString("partnerGASstrFirstNameowner5",
          businessTypeAddressCredential.strFirstNameowner5);
    }
    if (businessTypeAddressCredential.strLastNameowner5 != null) {
      sharedPreferences.setString("partnerGASstrLastNameowner5",
          businessTypeAddressCredential.strLastNameowner5);
    }
    if (businessTypeAddressCredential.strstrDobOwner5 != null) {
      sharedPreferences.setString("partnerGASstrstrDobOwner5",
          businessTypeAddressCredential.strstrDobOwner5);
    }
    if (businessTypeAddressCredential.home_Addressowner5 != null) {
      sharedPreferences.setString("partnerGAShome_Addressowner5",
          businessTypeAddressCredential.home_Addressowner5);
    }
    if (businessTypeAddressCredential.home_Address2owner5 != null) {
      sharedPreferences.setString("partnerGAShome_Address2owner5",
          businessTypeAddressCredential.home_Address2owner5);
    }
    if (businessTypeAddressCredential.strHomeAdressCityowner5 != null) {
      sharedPreferences.setString("partnerGASstrHomeAdressCityowner5",
          businessTypeAddressCredential.strHomeAdressCityowner5);
    }
    if (businessTypeAddressCredential.strHomeAdressPostCodeowner5 != null) {
      sharedPreferences.setString("partnerGASstrHomeAdressPostCodeowner5",
          businessTypeAddressCredential.strHomeAdressPostCodeowner5);
    }
    if (businessTypeAddressCredential.strHomeaddressLiveYearowner5 != null) {
      sharedPreferences.setString("partnerGASstrHomeaddressLiveYearowner5",
          businessTypeAddressCredential.strHomeaddressLiveYearowner5);
    }
    if (businessTypeAddressCredential.strHomeaddressLiveMonthowner5 != null) {
      sharedPreferences.setString("partnerGASstrHomeaddressLiveMonthowner5",
          businessTypeAddressCredential.strHomeaddressLiveMonthowner5);
    }
    if (businessTypeAddressCredential.strHomeaddress1owner5 != null) {
      sharedPreferences.setString("partnerGASstrHomeaddress1owner5",
          businessTypeAddressCredential.strHomeaddress1owner5);
    }
    if (businessTypeAddressCredential.strHomeaddress2owner5 != null) {
      sharedPreferences.setString("partnerGASstrHomeaddress2owner5",
          businessTypeAddressCredential.strHomeaddress2owner5);
    }
    if (businessTypeAddressCredential.strHomeaddressCity1owner5 != null) {
      sharedPreferences.setString("partnerGASstrHomeaddressCity1owner5",
          businessTypeAddressCredential.strHomeaddressCity1owner5);
    }
    if (businessTypeAddressCredential.strHomeaddressPostCode1owner5 != null) {
      sharedPreferences.setString("partnerGASstrHomeaddressPostCode1owner5",
          businessTypeAddressCredential.strHomeaddressPostCode1owner5);
    }
    if (businessTypeAddressCredential.strHomeaddressLiveYear1owner5 != null) {
      sharedPreferences.setString("partnerGASstrHomeaddressLiveYear1owner5",
          businessTypeAddressCredential.strHomeaddressLiveYear1owner5);
    }
    if (businessTypeAddressCredential.strHomeaddressLiveMonth1owner5 != null) {
      sharedPreferences.setString("partnerGASstrHomeaddressLiveMonth1owner5",
          businessTypeAddressCredential.strHomeaddressLiveMonth1owner5);
    }
    if (businessTypeAddressCredential.strHomeaddress3owner5 != null) {
      sharedPreferences.setString("partnerGASstrHomeaddress3owner5",
          businessTypeAddressCredential.strHomeaddress3owner5);
    }
    if (businessTypeAddressCredential.strHomeaddress4owner5 != null) {
      sharedPreferences.setString("partnerGASstrHomeaddress4owner5",
          businessTypeAddressCredential.strHomeaddress4owner5);
    }
    if (businessTypeAddressCredential.strHomeaddressCity2owner5 != null) {
      sharedPreferences.setString("partnerGASstrHomeaddressCity2owner5",
          businessTypeAddressCredential.strHomeaddressCity2owner5);
    }
    if (businessTypeAddressCredential.strHomeaddressPostCode2owner5 != null) {
      sharedPreferences.setString("partnerGASstrHomeaddressPostCode2owner5",
          businessTypeAddressCredential.strHomeaddressPostCode2owner5);
    }
    if (businessTypeAddressCredential.strHomeaddressPostLiveYear2owner5 !=
        null) {
      sharedPreferences.setString("partnerGASstrHomeaddressPostLiveYear2owner5",
          businessTypeAddressCredential.strHomeaddressPostLiveYear2owner5);
    }
    if (businessTypeAddressCredential.strHomeaddressPostLiveMonth2owner5 !=
        null) {
      sharedPreferences.setString(
          "partnerGASstrHomeaddressPostLiveMonth2owner5",
          businessTypeAddressCredential.strHomeaddressPostLiveMonth2owner5);
    }
    if (businessTypeAddressCredential.strHomeaddress5owner5 != null) {
      sharedPreferences.setString("partnerGASstrHomeaddress5owner5",
          businessTypeAddressCredential.strHomeaddress5owner5);
    }
    if (businessTypeAddressCredential.strHomeaddress6owner5 != null) {
      sharedPreferences.setString("partnerGASstrHomeaddress6owner5",
          businessTypeAddressCredential.strHomeaddress6owner5);
    }
    if (businessTypeAddressCredential.strHomeaddressCity3owner5 != null) {
      sharedPreferences.setString("partnerGASstrHomeaddressCity3owner5",
          businessTypeAddressCredential.strHomeaddressCity3owner5);
    }
    if (businessTypeAddressCredential.strHomeaddressPostCode3owner5 != null) {
      sharedPreferences.setString("partnerGASstrHomeaddressPostCode3owner5",
          businessTypeAddressCredential.strHomeaddressPostCode3owner5);
    }
    if (businessTypeAddressCredential.strHomeaddressLiveYear3owner5 != null) {
      sharedPreferences.setString("partnerGASstrHomeaddressLiveYear3owner5",
          businessTypeAddressCredential.strHomeaddressLiveYear3owner5);
    }
    if (businessTypeAddressCredential.strHomeaddressLivemonth3owner5 != null) {
      sharedPreferences.setString("partnerGASstrHomeaddressLivemonth3owner5",
          businessTypeAddressCredential.strHomeaddressLivemonth3owner5);
    }
    if (businessTypeAddressCredential.strHomeaddress7owner5 != null) {
      sharedPreferences.setString("partnerGASstrHomeaddress7owner5",
          businessTypeAddressCredential.strHomeaddress7owner5);
    }
    if (businessTypeAddressCredential.strHomeaddress8owner5 != null) {
      sharedPreferences.setString("partnerGASstrHomeaddress8owner5",
          businessTypeAddressCredential.strHomeaddress8owner5);
    }
    if (businessTypeAddressCredential.strHomeaddressCity4owner5 != null) {
      sharedPreferences.setString("partnerGASstrHomeaddressCity4owner5",
          businessTypeAddressCredential.strHomeaddressCity4owner5);
    }
    if (businessTypeAddressCredential.strHomeaddressPostCode4owner5 != null) {
      sharedPreferences.setString("partnerGASstrHomeaddressPostCode4owner5",
          businessTypeAddressCredential.strHomeaddressPostCode4owner5);
    }
    if (businessTypeAddressCredential.strHomeaddressLiveYear4owner5 != null) {
      sharedPreferences.setString("partnerGASstrHomeaddressLiveYear4owner5",
          businessTypeAddressCredential.strHomeaddressLiveYear4owner5);
    }
    if (businessTypeAddressCredential.strHomeaddressLiveMonth4owner5 != null) {
      sharedPreferences.setString("partnerGASstrHomeaddressLiveMonth4owner5",
          businessTypeAddressCredential.strHomeaddressLiveMonth4owner5);
    }
    if (businessTypeAddressCredential.strHomeaddress9owner5 != null) {
      sharedPreferences.setString("partnerGASstrHomeaddress9owner5",
          businessTypeAddressCredential.strHomeaddress9owner5);
    }
    if (businessTypeAddressCredential.strHomeaddress10owner5 != null) {
      sharedPreferences.setString("partnerGASstrHomeaddress10owner5",
          businessTypeAddressCredential.strHomeaddress10owner5);
    }
    if (businessTypeAddressCredential.strHomeaddressCity5owner5 != null) {
      sharedPreferences.setString("partnerGASstrHomeaddressCity5owner5",
          businessTypeAddressCredential.strHomeaddressCity5owner5);
    }
    if (businessTypeAddressCredential.strHomeaddressPostCode5owner5 != null) {
      sharedPreferences.setString("partnerGASstrHomeaddressPostCode5owner5",
          businessTypeAddressCredential.strHomeaddressPostCode5owner5);
    }
    if (businessTypeAddressCredential.strHomeaddressLiveYear5owner5 != null) {
      sharedPreferences.setString("partnerGASstrHomeaddressLiveYear5owner5",
          businessTypeAddressCredential.strHomeaddressLiveYear5owner5);
    }
    if (businessTypeAddressCredential.strHomeaddressLiveMonth5owner5 != null) {
      sharedPreferences.setString("partnerGASstrHomeaddressLiveMonth5owner5",
          businessTypeAddressCredential.strHomeaddressLiveMonth5owner5);
    }
    if (businessTypeAddressCredential.strTitleQwner6 != null) {
      sharedPreferences.setString("partnerGASstrTitleQwner6",
          businessTypeAddressCredential.strTitleQwner6);
    }
    if (businessTypeAddressCredential.strFirstNameowner6 != null) {
      sharedPreferences.setString("partnerGASstrFirstNameowner6",
          businessTypeAddressCredential.strFirstNameowner6);
    }
    if (businessTypeAddressCredential.strLastNameowner6 != null) {
      sharedPreferences.setString("partnerGASstrLastNameowner6",
          businessTypeAddressCredential.strLastNameowner6);
    }
    if (businessTypeAddressCredential.strstrDobOwner6 != null) {
      sharedPreferences.setString("partnerGASstrstrDobOwner6",
          businessTypeAddressCredential.strstrDobOwner6);
    }
    if (businessTypeAddressCredential.home_Addressowner6 != null) {
      sharedPreferences.setString("partnerGAShome_Addressowner6",
          businessTypeAddressCredential.home_Addressowner6);
    }
    if (businessTypeAddressCredential.home_Address2owner6 != null) {
      sharedPreferences.setString("partnerGAShome_Address2owner6",
          businessTypeAddressCredential.home_Address2owner6);
    }
    if (businessTypeAddressCredential.strHomeAdressCityowner6 != null) {
      sharedPreferences.setString("partnerGASstrHomeAdressCityowner6",
          businessTypeAddressCredential.strHomeAdressCityowner6);
    }
  }

  static void clearGASPartnerBusiness() async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString("partnerGASstrTitleQwner1", null);
  }

  ///Partner Business<Add-Prosp> getMethod
  static Future<PartnerShipBusinessCredential>
      getPartnerShipBusinessTypeAdd() async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();

    String gasstrTitleQwner1 =
        preferences.getString("partnerGASstrTitleQwner1");
    String gasfirstName = preferences.getString("partnerGASfirstName");
    String gaslastName = preferences.getString("partnerGASlastName");
    String gasstrTitleDirector2 =
        preferences.getString("partnerGASstrTitleDirector2");
    String gasstrDirector2Firstname =
        preferences.getString("partnerGASstrDirector2Firstname");
    String gasstrDirector2Lastname =
        preferences.getString("partnerGASstrDirector2Lastname");
    String gasstrDobOwner1 = preferences.getString("partnerGASstrDobOwner1");
    String gashome_Address = preferences.getString("partnerGAShome_Address");
    String gashome_Address2 = preferences.getString("partnerGAShome_Address2");
    String gasstrHomeAdressPostCode =
        preferences.getString("partnerGASstrHomeAdressPostCode");
    String gasstrHomeAdressCity =
        preferences.getString("partnerGASstrHomeAdressCity");
    String gasstrHomeaddressLiveYear =
        preferences.getString("partnerGASstrHomeaddressLiveYear");
    String gasstrHomeaddressLiveMonth =
        preferences.getString("partnerGASstrHomeaddressLiveMonth");
    String gasstrHomeaddress1 =
        preferences.getString("partnerGASstrHomeaddress1");
    String gasstrHomeaddress2 =
        preferences.getString("partnerGASstrHomeaddress2");
    String gasstrHomeaddressCity1 =
        preferences.getString("partnerGASstrHomeaddressCity1");
    String gasstrHomeaddressPostCode1 =
        preferences.getString("partnerGASstrHomeaddressPostCode1");
    String gasstrHomeaddressLiveYear1 =
        preferences.getString("partnerGASstrHomeaddressLiveYear1");
    String gasstrHomeaddressLiveMonth1 =
        preferences.getString("partnerGASstrHomeaddressLiveMonth1");
    String gasstrHomeaddress3 =
        preferences.getString("partnerGASstrHomeaddress3");
    String gasstrHomeaddress4 =
        preferences.getString("partnerGASstrHomeaddress4");
    String gasstrHomeaddressCity2 =
        preferences.getString("partnerGASstrHomeaddressCity2");
    String gasstrHomeaddressPostCode2 =
        preferences.getString("partnerGASstrHomeaddressPostCode2");
    String gasstrHomeaddressPostLiveYear2 =
        preferences.getString("partnerGASstrHomeaddressPostLiveYear2");
    String gasstrHomeaddressPostLiveMonth2 =
        preferences.getString("partnerGASstrHomeaddressPostLiveMonth2");
    String gasstrHomeaddress5 =
        preferences.getString("partnerGASstrHomeaddress5");
    String gasstrHomeaddress6 =
        preferences.getString("partnerGASstrHomeaddress6");
    String gasstrHomeaddressCity3 =
        preferences.getString("partnerGASstrHomeaddressCity3");
    String gasstrHomeaddressPostCode3 =
        preferences.getString("partnerGASstrHomeaddressPostCode3");
    String gasstrHomeaddressLiveYear3 =
        preferences.getString("partnerGASstrHomeaddressLiveYear3");
    String gasstrHomeaddressLivemonth3 =
        preferences.getString("partnerGASstrHomeaddressLivemonth3");
    String gasstrHomeaddress7 =
        preferences.getString("partnerGASstrHomeaddress7");
    String gasstrHomeaddress8 =
        preferences.getString("partnerGASstrHomeaddress8");
    String gasstrHomeaddressCity4 =
        preferences.getString("partnerGASstrHomeaddressCity4");
    String gasstrHomeaddressPostCode4 =
        preferences.getString("partnerGASstrHomeaddressPostCode4");
    String gasstrHomeaddressLiveYear4 =
        preferences.getString("partnerGASstrHomeaddressLiveYear4");
    String gasstrHomeaddressLiveMonth4 =
        preferences.getString("partnerGASstrHomeaddressLiveMonth4");
    String gasstrHomeaddress9 =
        preferences.getString("partnerGASstrHomeaddress9");
    String gasstrHomeaddress10 =
        preferences.getString("partnerGASstrHomeaddress10");
    String gasstrHomeaddressCity5 =
        preferences.getString("partnerGASstrHomeaddressCity5");
    String gasstrHomeaddressPostCode5 =
        preferences.getString("partnerGASstrHomeaddressPostCode5");
    String gasstrHomeaddressLiveYear5 =
        preferences.getString("partnerGASstrHomeaddressLiveYear5");
    String gasstrTitleQwner2 =
        preferences.getString("partnerGASstrTitleQwner2");
    String gasstrFirstNameowner =
        preferences.getString("partnerGASstrFirstNameowner");
    String gasstrLastNameowner =
        preferences.getString("partnerGASstrLastNameowner");
    String gasstrDobOwner2 = preferences.getString("partnerGASstrDobOwner2");
    String gashome_Addressowner =
        preferences.getString("partnerGAShome_Addressowner");
    String gashome_Address2owner =
        preferences.getString("partnerGAShome_Address2owner");
    String gasstrHomeAdressPostCodeowner =
        preferences.getString("partnerGASstrHomeAdressPostCodeowner");
    String gasstrHomeAdressCityowner =
        preferences.getString("partnerGASstrHomeAdressCityowner");
    String gasstrHomeaddressLiveYearowner =
        preferences.getString("partnerGASstrHomeaddressLiveYearowner");
    String gasstrHomeaddressLiveMonthowner =
        preferences.getString("partnerGASstrHomeaddressLiveMonthowner");
    String gasstrHomeaddress1owner =
        preferences.getString("partnerGASstrHomeaddress1owner");
    String gasstrHomeaddress2owner =
        preferences.getString("partnerGASstrHomeaddress2owner");
    String gasstrHomeaddressCity1owner =
        preferences.getString("partnerGASstrHomeaddressCity1owner");
    String gasstrHomeaddressPostCode1owner =
        preferences.getString("partnerGASstrHomeaddressPostCode1owner");
    String gasstrHomeaddressLiveYear1owner =
        preferences.getString("partnerGASstrHomeaddressLiveYear1owner");
    String gasstrHomeaddressLiveMonth1owner =
        preferences.getString("partnerGASstrHomeaddressLiveMonth1owner");
    String gasstrHomeaddress3owner =
        preferences.getString("partnerGASstrHomeaddress3owner");
    String gasstrHomeaddress4owner =
        preferences.getString("partnerGASstrHomeaddress4owner");
    String gasstrHomeaddressCity2owner =
        preferences.getString("partnerGASstrHomeaddressCity2owner");
    String gasstrHomeaddressPostCode2owner =
        preferences.getString("partnerGASstrHomeaddressPostCode2owner");
    String gasstrHomeaddressPostLiveYear2owner =
        preferences.getString("partnerGASstrHomeaddressPostLiveYear2owner");
    String gasstrHomeaddressPostLiveMonth2owner =
        preferences.getString("partnerGASstrHomeaddressPostLiveMonth2owner");
    String gasstrHomeaddress5owner =
        preferences.getString("partnerGASstrHomeaddress5owner");
    String gasstrHomeaddress6owner =
        preferences.getString("partnerGASstrHomeaddress6owner");
    String gasstrHomeaddressCity3owner =
        preferences.getString("partnerGASstrHomeaddressCity3owner");
    String gasstrHomeaddressPostCode3owner =
        preferences.getString("partnerGASstrHomeaddressPostCode3owner");
    String gasstrHomeaddressLiveYear3owner =
        preferences.getString("partnerGASstrHomeaddressLiveYear3owner");
    String gasstrHomeaddressLivemonth3owner =
        preferences.getString("partnerGASstrHomeaddressLivemonth3owner");
    String gasstrHomeaddress7owner =
        preferences.getString("partnerGASstrHomeaddress7owner");
    String gasstrHomeaddress8owner =
        preferences.getString("partnerGASstrHomeaddress8owner");
    String gasstrHomeaddressCity4owner =
        preferences.getString("partnerGASstrHomeaddressCity4owner");
    String gasstrHomeaddressPostCode4owner =
        preferences.getString("partnerGASstrHomeaddressPostCode4owner");
    String gasstrHomeaddressLiveYear4owner =
        preferences.getString("partnerGASstrHomeaddressLiveYear4owner");
    String gasstrHomeaddressLiveMonth4owner =
        preferences.getString("partnerGASstrHomeaddressLiveMonth4owner");
    String gasstrHomeaddress9owner =
        preferences.getString("partnerGASstrHomeaddress9owner");
    String gasstrHomeaddress10owner =
        preferences.getString("partnerGASstrHomeaddress10owner");
    String gasstrHomeaddressCity5owner =
        preferences.getString("partnerGASstrHomeaddressCity5owner");
    String gasstrHomeaddressPostCode5owner =
        preferences.getString("partnerGASstrHomeaddressPostCode5owner");
    String gasstrHomeaddressLiveYear5owner =
        preferences.getString("partnerGASstrHomeaddressLiveYear5owner");
    String gasstrHomeaddressLiveMonth5owner =
        preferences.getString("partnerGASstrHomeaddressLiveMonth5owner");
    String gasstrTitleQwner3 =
        preferences.getString("partnerGASstrTitleQwner3");
    String gasstrFirstNameowner3 =
        preferences.getString("partnerGASstrFirstNameowner3");
    String gasstrLastNameowner3 =
        preferences.getString("partnerGASstrLastNameowner3");
    String gasstrstrDobOwner3 =
        preferences.getString("partnerGASstrstrDobOwner3");
    String gashome_Addressowner3 =
        preferences.getString("partnerGAShome_Addressowner3");
    String gashome_Address2owner3 =
        preferences.getString("partnerGAShome_Address2owner3");
    String gasstrHomeAdressCityowner3 =
        preferences.getString("partnerGASstrHomeAdressCityowner3");
    String gasstrHomeAdressPostCodeowner3 =
        preferences.getString("partnerGASstrHomeAdressPostCodeowner3");
    String gasstrHomeaddressLiveYearowner3 =
        preferences.getString("partnerGASstrHomeaddressLiveYearowner3");
    String gasstrHomeaddressLiveMonthowner3 =
        preferences.getString("partnerGASstrHomeaddressLiveMonthowner3");
    String gasstrHomeaddress1owner3 =
        preferences.getString("partnerGASstrHomeaddress1owner3");
    String gasstrHomeaddress2owner3 =
        preferences.getString("partnerGASstrHomeaddress2owner3");
    String gasstrHomeaddressCity1owner3 =
        preferences.getString("partnerGASstrHomeaddressCity1owner3");
    String gasstrHomeaddressPostCode1owner3 =
        preferences.getString("partnerGASstrHomeaddressPostCode1owner3");
    String gasstrHomeaddressLiveYear1owner3 =
        preferences.getString("partnerGASstrHomeaddressLiveYear1owner3");
    String gasstrHomeaddressLiveMonth1owner3 =
        preferences.getString("partnerGASstrHomeaddressLiveMonth1owner3");
    String gasstrHomeaddress3owner3 =
        preferences.getString("partnerGASstrHomeaddress3owner3");
    String gasstrHomeaddress4owner3 =
        preferences.getString("partnerGASstrHomeaddress4owner3");
    String gasstrHomeaddressCity2owner3 =
        preferences.getString("partnerGASstrHomeaddressCity2owner3");
    String gasstrHomeaddressPostCode2owner3 =
        preferences.getString("partnerGASstrHomeaddressPostCode2owner3");
    String gasstrHomeaddressPostLiveYear2owner3 =
        preferences.getString("partnerGASstrHomeaddressPostLiveYear2owner3");
    String gasstrHomeaddressPostLiveMonth2owner3 =
        preferences.getString("partnerGASstrHomeaddressPostLiveMonth2owner3");
    String gasstrHomeaddress5owner3 =
        preferences.getString("partnerGASstrHomeaddress5owner3");
    String gasstrHomeaddress6owner3 =
        preferences.getString("partnerGASstrHomeaddress6owner3");
    String gasstrHomeaddressCity3owner3 =
        preferences.getString("partnerGASstrHomeaddressCity3owner3");
    String gasstrHomeaddressPostCode3owner3 =
        preferences.getString("partnerGASstrHomeaddressPostCode3owner3");
    String gasstrHomeaddressLiveYear3owner3 =
        preferences.getString("partnerGASstrHomeaddressLiveYear3owner3");
    String gasstrHomeaddressLivemonth3owner3 =
        preferences.getString("partnerGASstrHomeaddressLivemonth3owner3");
    String gasstrHomeaddress7owner3 =
        preferences.getString("partnerGASstrHomeaddress7owner3");
    String gasstrHomeaddress8owner3 =
        preferences.getString("partnerGASstrHomeaddress8owner3");
    String gasstrHomeaddressCity4owner3 =
        preferences.getString("partnerGASstrHomeaddressCity4owner3");
    String gasstrHomeaddressPostCode4owner3 =
        preferences.getString("partnerGASstrHomeaddressPostCode4owner3");
    String gasstrHomeaddressLiveYear4owner3 =
        preferences.getString("partnerGASstrHomeaddressLiveYear4owner3");
    String gasstrHomeaddressLiveMonth4owner3 =
        preferences.getString("partnerGASstrHomeaddressLiveMonth4owner3");
    String gasstrHomeaddress9owner3 =
        preferences.getString("partnerGASstrHomeaddress9owner3");
    String gasstrHomeaddress10owner3 =
        preferences.getString("partnerGASstrHomeaddress10owner3");
    String gasstrHomeaddressCity5owner3 =
        preferences.getString("partnerGASstrHomeaddressCity5owner3");
    String gasstrHomeaddressPostCode5owner3 =
        preferences.getString("partnerGASstrHomeaddressPostCode5owner3");
    String gasstrHomeaddressLiveYear5owner3 =
        preferences.getString("partnerGASstrHomeaddressLiveYear5owner3");
    String gasstrHomeaddressLiveMonth5owner3 =
        preferences.getString("partnerGASstrHomeaddressLiveMonth5owner3");
    String gasstrTitleQwner4 =
        preferences.getString("partnerGASstrTitleQwner4");
    String gasstrFirstNameowner4 =
        preferences.getString("partnerGASstrFirstNameowner4");
    String gasstrLastNameowner4 =
        preferences.getString("partnerGASstrLastNameowner4");
    String gasstrstrDobOwner4 =
        preferences.getString("partnerGASstrstrDobOwner4");
    String gashome_Addressowner4 =
        preferences.getString("partnerGAShome_Addressowner4");
    String gashome_Address2owner4 =
        preferences.getString("partnerGAShome_Address2owner4");
    String gasstrHomeAdressCityowner4 =
        preferences.getString("partnerGASstrHomeAdressCityowner4");
    String gasstrHomeAdressPostCodeowner4 =
        preferences.getString("partnerGASstrHomeAdressPostCodeowner4");
    String gasstrHomeaddressLiveYearowner4 =
        preferences.getString("partnerGASstrHomeaddressLiveYearowner4");
    String gasstrHomeaddressLiveMonthowner4 =
        preferences.getString("partnerGASstrHomeaddressLiveMonthowner4");
    String gasstrHomeaddress1owner4 =
        preferences.getString("partnerGASstrHomeaddress1owner4");
    String gasstrHomeaddress2owner4 =
        preferences.getString("partnerGASstrHomeaddress2owner4");
    String gasstrHomeaddressCity1owner4 =
        preferences.getString("partnerGASstrHomeaddressCity1owner4");
    String gasstrHomeaddressPostCode1owner4 =
        preferences.getString("partnerGASstrHomeaddressPostCode1owner4");
    String gasstrHomeaddressLiveYear1owner4 =
        preferences.getString("partnerGASstrHomeaddressLiveYear1owner4");
    String gasstrHomeaddressLiveMonth1owner4 =
        preferences.getString("partnerGASstrHomeaddressLiveMonth1owner4");
    String gasstrHomeaddress3owner4 =
        preferences.getString("partnerGASstrHomeaddress3owner4");
    String gasstrHomeaddress4owner4 =
        preferences.getString("partnerGASstrHomeaddress4owner4");
    String gasstrHomeaddressCity2owner4 =
        preferences.getString("partnerGASstrHomeaddressCity2owner4");
    String gasstrHomeaddressPostCode2owner4 =
        preferences.getString("partnerGASstrHomeaddressPostCode2owner4");
    String gasstrHomeaddressPostLiveYear2owner4 =
        preferences.getString("partnerGASstrHomeaddressPostLiveYear2owner4");
    String gasstrHomeaddressPostLiveMonth2owner4 =
        preferences.getString("partnerGASstrHomeaddressPostLiveMonth2owner4");
    String gasstrHomeaddress5owner4 =
        preferences.getString("partnerGASstrHomeaddress5owner4");
    String gasstrHomeaddress6owner4 =
        preferences.getString("partnerGASstrHomeaddress6owner4");
    String gasstrHomeaddressCity3owner4 =
        preferences.getString("partnerGASstrHomeaddressCity3owner4");
    String gasstrHomeaddressPostCode3owner4 =
        preferences.getString("partnerGASstrHomeaddressPostCode3owner4");
    String gasstrHomeaddressLiveYear3owner4 =
        preferences.getString("partnerGASstrHomeaddressLiveYear3owner4");
    String gasstrHomeaddressLivemonth3owner4 =
        preferences.getString("partnerGASstrHomeaddressLivemonth3owner4");
    String gasstrHomeaddress7owner4 =
        preferences.getString("partnerGASstrHomeaddress7owner4");
    String gasstrHomeaddress8owner4 =
        preferences.getString("partnerGASstrHomeaddress8owner4");
    String gasstrHomeaddressCity4owner4 =
        preferences.getString("partnerGASstrHomeaddressCity4owner4");
    String gasstrHomeaddressPostCode4owner4 =
        preferences.getString("partnerGASstrHomeaddressPostCode4owner4");
    String gasstrHomeaddressLiveYear4owner4 =
        preferences.getString("partnerGASstrHomeaddressLiveYear4owner4");
    String gasstrHomeaddressLiveMonth4owner4 =
        preferences.getString("partnerGASstrHomeaddressLiveMonth4owner4");
    String gasstrHomeaddress9owner4 =
        preferences.getString("partnerGASstrHomeaddress9owner4");
    String gasstrHomeaddress10owner4 =
        preferences.getString("partnerGASstrHomeaddress10owner4");
    String gasstrHomeaddressCity5owner4 =
        preferences.getString("partnerGASstrHomeaddressCity5owner4");
    String gasstrHomeaddressPostCode5owner4 =
        preferences.getString("partnerGASstrHomeaddressPostCode5owner4");
    String gasstrHomeaddressLiveYear5owner4 =
        preferences.getString("partnerGASstrHomeaddressLiveYear5owner4");
    String gasstrHomeaddressLiveMonth5owner4 =
        preferences.getString("partnerGASstrHomeaddressLiveMonth5owner4");
    String gasstrTitleQwner5 =
        preferences.getString("partnerGASstrTitleQwner5");
    String gasstrFirstNameowner5 =
        preferences.getString("partnerGASstrFirstNameowner5");
    String gasstrLastNameowner5 =
        preferences.getString("partnerGASstrLastNameowner5");
    String gasstrstrDobOwner5 =
        preferences.getString("partnerGASstrstrDobOwner5");
    String gashome_Addressowner5 =
        preferences.getString("partnerGAShome_Addressowner5");
    String gashome_Address2owner5 =
        preferences.getString("partnerGAShome_Address2owner5");
    String gasstrHomeAdressCityowner5 =
        preferences.getString("partnerGASstrHomeAdressCityowner5");
    String gasstrHomeAdressPostCodeowner5 =
        preferences.getString("partnerGASstrHomeAdressPostCodeowner5");
    String gasstrHomeaddressLiveYearowner5 =
        preferences.getString("partnerGASstrHomeaddressLiveYearowner5");
    String gasstrHomeaddressLiveMonthowner5 =
        preferences.getString("partnerGASstrHomeaddressLiveMonthowner5");
    String gasstrHomeaddress1owner5 =
        preferences.getString("partnerGASstrHomeaddress1owner5");
    String gasstrHomeaddress2owner5 =
        preferences.getString("partnerGASstrHomeaddress2owner5");
    String gasstrHomeaddressCity1owner5 =
        preferences.getString("partnerGASstrHomeaddressCity1owner5");
    String gasstrHomeaddressPostCode1owner5 =
        preferences.getString("partnerGASstrHomeaddressPostCode1owner5");
    String gasstrHomeaddressLiveYear1owner5 =
        preferences.getString("partnerGASstrHomeaddressLiveYear1owner5");
    String gasstrHomeaddressLiveMonth1owner5 =
        preferences.getString("partnerGASstrHomeaddressLiveMonth1owner5");
    String gasstrHomeaddress3owner5 =
        preferences.getString("partnerGASstrHomeaddress3owner5");
    String gasstrHomeaddress4owner5 =
        preferences.getString("partnerGASstrHomeaddress4owner5");
    String gasstrHomeaddressCity2owner5 =
        preferences.getString("partnerGASstrHomeaddressCity2owner5");
    String gasstrHomeaddressPostCode2owner5 =
        preferences.getString("partnerGASstrHomeaddressPostCode2owner5");
    String gasstrHomeaddressPostLiveYear2owner5 =
        preferences.getString("partnerGASstrHomeaddressPostLiveYear2owner5");
    String gasstrHomeaddressPostLiveMonth2owner5 =
        preferences.getString("partnerGASstrHomeaddressPostLiveMonth2owner5");
    String gasstrHomeaddress5owner5 =
        preferences.getString("partnerGASstrHomeaddress5owner5");
    String gasstrHomeaddress6owner5 =
        preferences.getString("partnerGASstrHomeaddress6owner5");
    String gasstrHomeaddressCity3owner5 =
        preferences.getString("partnerGASstrHomeaddressCity3owner5");
    String gasstrHomeaddressPostCode3owner5 =
        preferences.getString("partnerGASstrHomeaddressPostCode3owner5");
    String gasstrHomeaddressLiveYear3owner5 =
        preferences.getString("partnerGASstrHomeaddressLiveYear3owner5");
    String gasstrHomeaddressLivemonth3owner5 =
        preferences.getString("partnerGASstrHomeaddressLivemonth3owner5");
    String gasstrHomeaddress7owner5 =
        preferences.getString("partnerGASstrHomeaddress7owner5");
    String gasstrHomeaddress8owner5 =
        preferences.getString("partnerGASstrHomeaddress8owner5");
    String gasstrHomeaddressCity4owner5 =
        preferences.getString("partnerGASstrHomeaddressCity4owner5");
    String gasstrHomeaddressPostCode4owner5 =
        preferences.getString("partnerGASstrHomeaddressPostCode4owner5");
    String gasstrHomeaddressLiveYear4owner5 =
        preferences.getString("partnerGASstrHomeaddressLiveYear4owner5");
    String gasstrHomeaddressLiveMonth4owner5 =
        preferences.getString("partnerGASstrHomeaddressLiveMonth4owner5");
    String gasstrHomeaddress9owner5 =
        preferences.getString("partnerGASstrHomeaddress9owner5");
    String gasstrHomeaddress10owner5 =
        preferences.getString("partnerGASstrHomeaddress10owner5");
    String gasstrHomeaddressCity5owner5 =
        preferences.getString("partnerGASstrHomeaddressCity5owner5");
    String gasstrHomeaddressPostCode5owner5 =
        preferences.getString("partnerGASstrHomeaddressPostCode5owner5");
    String gasstrHomeaddressLiveYear5owner5 =
        preferences.getString("partnerGASstrHomeaddressLiveYear5owner5");
    String gasstrHomeaddressLiveMonth5owner5 =
        preferences.getString("partnerGASstrHomeaddressLiveMonth5owner5");
    String gasstrTitleQwner6 =
        preferences.getString("partnerGASstrTitleQwner6");
    String gasstrFirstNameowner6 =
        preferences.getString("partnerGASstrFirstNameowner6");
    String gasstrLastNameowner6 =
        preferences.getString("partnerGASstrLastNameowner6");
    String gasstrstrDobOwner6 =
        preferences.getString("partnerGASstrstrDobOwner6");
    String gashome_Addressowner6 =
        preferences.getString("partnerGAShome_Addressowner6");
    String gashome_Address2owner6 =
        preferences.getString("partnerGAShome_Address2owner6");
    String gasstrHomeAdressCityowner6 =
        preferences.getString("partnerGASstrHomeAdressCityowner6");
    String gasstrHomeAdressPostCodeowner6 =
        preferences.getString("partnerGASstrHomeAdressPostCodeowner6");
    String gasstrHomeaddressLiveYearowner6 =
        preferences.getString("partnerGASstrHomeaddressLiveYearowner6");
    String gasstrHomeaddressLiveMonthowner6 =
        preferences.getString("partnerGASstrHomeaddressLiveMonthowner6");
    String gasstrHomeaddress1owner6 =
        preferences.getString("partnerGASstrHomeaddress1owner6");
    String gasstrHomeaddress2owner6 =
        preferences.getString("partnerGASstrHomeaddress2owner6");
    String gasstrHomeaddressCity1owner6 =
        preferences.getString("partnerGASstrHomeaddressCity1owner6");
    String gasstrHomeaddressPostCode1owner6 =
        preferences.getString("partnerGASstrHomeaddressPostCode1owner6");
    String gasstrHomeaddressLiveYear1owner6 =
        preferences.getString("partnerGASstrHomeaddressLiveYear1owner6");
    String gasstrHomeaddressLiveMonth1owner6 =
        preferences.getString("partnerGASstrHomeaddressLiveMonth1owner6");
    String gasstrHomeaddress3owner6 =
        preferences.getString("partnerGASstrHomeaddress3owner6");
    String gasstrHomeaddress4owner6 =
        preferences.getString("partnerGASstrHomeaddress4owner6");
    String gasstrHomeaddressCity2owner6 =
        preferences.getString("partnerGASstrHomeaddressCity2owner6");
    String gasstrHomeaddressPostCode2owner6 =
        preferences.getString("partnerGASstrHomeaddressPostCode2owner6");
    String gasstrHomeaddressPostLiveYear2owner6 =
        preferences.getString("partnerGASstrHomeaddressPostLiveYear2owner6");
    String gasstrHomeaddressPostLiveMonth2owner6 =
        preferences.getString("partnerGASstrHomeaddressPostLiveMonth2owner6");
    String gasstrHomeaddress5owner6 =
        preferences.getString("partnerGASstrHomeaddress5owner6");
    String gasstrHomeaddress6owner6 =
        preferences.getString("partnerGASstrHomeaddress6owner6");
    String gasstrHomeaddressCity3owner6 =
        preferences.getString("partnerGASstrHomeaddressCity3owner6");
    String gasstrHomeaddressPostCode3owner6 =
        preferences.getString("partnerGASstrHomeaddressPostCode3owner6");
    String gasstrHomeaddressLiveYear3owner6 =
        preferences.getString("partnerGASstrHomeaddressLiveYear3owner6");
    String gasstrHomeaddressLivemonth3owner6 =
        preferences.getString("partnerGASstrHomeaddressLivemonth3owner6");
    String gasstrHomeaddress7owner6 =
        preferences.getString("partnerGASstrHomeaddress7owner6");
    String gasstrHomeaddress8owner6 =
        preferences.getString("partnerGASstrHomeaddress8owner6");
    String gasstrHomeaddressCity4owner6 =
        preferences.getString("partnerGASstrHomeaddressCity4owner6");
    String gasstrHomeaddressPostCode4owner6 =
        preferences.getString("partnerGASstrHomeaddressPostCode4owner6");
    String gasstrHomeaddressLiveYear4owner6 =
        preferences.getString("partnerGASstrHomeaddressLiveYear4owner6");
    String gasstrHomeaddressLiveMonth4owner6 =
        preferences.getString("partnerGASstrHomeaddressLiveMonth4owner6");
    String gasstrHomeaddress9owner6 =
        preferences.getString("partnerGASstrHomeaddress9owner6");
    String gasstrHomeaddress10owner6 =
        preferences.getString("partnerGASstrHomeaddress10owner6");
    String gasstrHomeaddressCity5owner6 =
        preferences.getString("partnerGASstrHomeaddressCity5owner6");
    String gasstrHomeaddressPostCode5owner6 =
        preferences.getString("partnerGASstrHomeaddressPostCode5owner6");
    String gasstrHomeaddressLiveYear5owner6 =
        preferences.getString("partnerGASstrHomeaddressLiveYear5owner6");
    String gasstrHomeaddressLiveMonth5owner6 =
        preferences.getString("partnerGASstrHomeaddressLiveMonth5owner6");

    print('#####Partner--OwnerShip Details....$gasstrTitleQwner1');
    if (gasstrTitleQwner1 != null) {
      return new PartnerShipBusinessCredential(
        strTitleQwner1: gasstrTitleQwner1,
        firstName: gasfirstName,
        lastName: gaslastName,
        strTitleDirector2: gasstrTitleDirector2,
        strDirector2Firstname: gasstrDirector2Firstname,
        strDirector2Lastname: gasstrDirector2Lastname,
        strDobOwner1: gasstrDobOwner1,
        home_Address: gashome_Address,
        home_Address2: gashome_Address2,
        strHomeAdressPostCode: gasstrHomeAdressPostCode,
        strHomeAdressCity: gasstrHomeAdressCity,
        strHomeaddressLiveYear: gasstrHomeaddressLiveYear,
        strHomeaddressLiveMonth: gasstrHomeaddressLiveMonth,
        strHomeaddress1: gasstrHomeaddress1,
        strHomeaddress2: gasstrHomeaddress2,
        strHomeaddressCity1: gasstrHomeaddressCity1,
        strHomeaddressPostCode1: gasstrHomeaddressPostCode1,
        strHomeaddressLiveYear1: gasstrHomeaddressLiveYear1,
        strHomeaddressLiveMonth1: gasstrHomeaddressLiveMonth1,
        strHomeaddress3: gasstrHomeaddress3,
        strHomeaddress4: gasstrHomeaddress4,
        strHomeaddressCity2: gasstrHomeaddressCity2,
        strHomeaddressPostCode2: gasstrHomeaddressPostCode2,
        strHomeaddressPostLiveYear2: gasstrHomeaddressPostLiveYear2,
        strHomeaddressPostLiveMonth2: gasstrHomeaddressPostLiveMonth2,
        strHomeaddress5: gasstrHomeaddress5,
        strHomeaddress6: gasstrHomeaddress6,
        strHomeaddressCity3: gasstrHomeaddressCity3,
        strHomeaddressPostCode3: gasstrHomeaddressPostCode3,
        strHomeaddressLiveYear3: gasstrHomeaddressLiveYear3,
        strHomeaddressLivemonth3: gasstrHomeaddressLivemonth3,
        strHomeaddress7: gasstrHomeaddress7,
        strHomeaddress8: gasstrHomeaddress8,
        strHomeaddressCity4: gasstrHomeaddressCity4,
        strHomeaddressPostCode4: gasstrHomeaddressPostCode4,
        strHomeaddressLiveYear4: gasstrHomeaddressLiveYear4,
        strHomeaddressLiveMonth4: gasstrHomeaddressLiveMonth4,
        strHomeaddress9: gasstrHomeaddress9,
        strHomeaddress10: gasstrHomeaddress10,
        strHomeaddressCity5: gasstrHomeaddressCity5,
        strHomeaddressPostCode5: gasstrHomeaddressPostCode5,
        strHomeaddressLiveYear5: gasstrHomeaddressLiveYear5,
        strTitleQwner2: gasstrTitleQwner2,
        strFirstNameowner: gasstrFirstNameowner,
        strLastNameowner: gasstrLastNameowner,
        strDobOwner2: gasstrDobOwner2,
        home_Addressowner: gashome_Addressowner,
        home_Address2owner: gashome_Address2owner,
        strHomeAdressPostCodeowner: gasstrHomeAdressPostCodeowner,
        strHomeAdressCityowner: gasstrHomeAdressCityowner,
        strHomeaddressLiveYearowner: gasstrHomeaddressLiveYearowner,
        strHomeaddressLiveMonthowner: gasstrHomeaddressLiveMonthowner,
        strHomeaddress1owner: gasstrHomeaddress1owner,
        strHomeaddress2owner: gasstrHomeaddress2owner,
        strHomeaddressCity1owner: gasstrHomeaddressCity1owner,
        strHomeaddressPostCode1owner: gasstrHomeaddressPostCode1owner,
        strHomeaddressLiveYear1owner: gasstrHomeaddressLiveYear1owner,
        strHomeaddressLiveMonth1owner: gasstrHomeaddressLiveMonth1owner,
        strHomeaddress3owner: gasstrHomeaddress3owner,
        strHomeaddress4owner: gasstrHomeaddress4owner,
        strHomeaddressCity2owner: gasstrHomeaddressCity2owner,
        strHomeaddressPostCode2owner: gasstrHomeaddressPostCode2owner,
        strHomeaddressPostLiveYear2owner: gasstrHomeaddressPostLiveYear2owner,
        strHomeaddressPostLiveMonth2owner: gasstrHomeaddressPostLiveMonth2owner,
        strHomeaddress5owner: gasstrHomeaddress5owner,
        strHomeaddress6owner: gasstrHomeaddress6owner,
        strHomeaddressCity3owner: gasstrHomeaddressCity3owner,
        strHomeaddressPostCode3owner: gasstrHomeaddressPostCode3owner,
        strHomeaddressLiveYear3owner: gasstrHomeaddressLiveYear3owner,
        strHomeaddressLivemonth3owner: gasstrHomeaddressLivemonth3owner,
        strHomeaddress7owner: gasstrHomeaddress7owner,
        strHomeaddress8owner: gasstrHomeaddress8owner,
        strHomeaddressCity4owner: gasstrHomeaddressCity4owner,
        strHomeaddressPostCode4owner: gasstrHomeaddressPostCode4owner,
        strHomeaddressLiveYear4owner: gasstrHomeaddressLiveYear4owner,
        strHomeaddressLiveMonth4owner: gasstrHomeaddressLiveMonth4owner,
        strHomeaddress9owner: gasstrHomeaddress9owner,
        strHomeaddress10owner: gasstrHomeaddress10owner,
        strHomeaddressCity5owner: gasstrHomeaddressCity5owner,
        strHomeaddressPostCode5owner: gasstrHomeaddressPostCode5owner,
        strHomeaddressLiveYear5owner: gasstrHomeaddressLiveYear5owner,
        strHomeaddressLiveMonth5owner: gasstrHomeaddressLiveMonth5owner,
        strTitleQwner3: gasstrTitleQwner3,
        strFirstNameowner3: gasstrFirstNameowner3,
        strLastNameowner3: gasstrLastNameowner3,
        strstrDobOwner3: gasstrstrDobOwner3,
        home_Addressowner3: gashome_Addressowner3,
        home_Address2owner3: gashome_Address2owner3,
        strHomeAdressCityowner3: gasstrHomeAdressCityowner3,
        strHomeAdressPostCodeowner3: gasstrHomeAdressPostCodeowner3,
        strHomeaddressLiveYearowner3: gasstrHomeaddressLiveYearowner3,
        strHomeaddressLiveMonthowner3: gasstrHomeaddressLiveMonthowner3,
        strHomeaddress1owner3: gasstrHomeaddress1owner3,
        strHomeaddress2owner3: gasstrHomeaddress2owner3,
        strHomeaddressCity1owner3: gasstrHomeaddressCity1owner3,
        strHomeaddressPostCode1owner3: gasstrHomeaddressPostCode1owner3,
        strHomeaddressLiveYear1owner3: gasstrHomeaddressLiveYear1owner3,
        strHomeaddressLiveMonth1owner3: gasstrHomeaddressLiveMonth1owner3,
        strHomeaddress3owner3: gasstrHomeaddress3owner3,
        strHomeaddress4owner3: gasstrHomeaddress4owner3,
        strHomeaddressCity2owner3: gasstrHomeaddressCity2owner3,
        strHomeaddressPostCode2owner3: gasstrHomeaddressPostCode2owner3,
        strHomeaddressPostLiveYear2owner3: gasstrHomeaddressPostLiveYear2owner3,
        strHomeaddressPostLiveMonth2owner3:
            gasstrHomeaddressPostLiveMonth2owner3,
        strHomeaddress5owner3: gasstrHomeaddress5owner3,
        strHomeaddress6owner3: gasstrHomeaddress6owner3,
        strHomeaddressCity3owner3: gasstrHomeaddressCity3owner3,
        strHomeaddressPostCode3owner3: gasstrHomeaddressPostCode3owner3,
        strHomeaddressLiveYear3owner3: gasstrHomeaddressLiveYear3owner3,
        strHomeaddressLivemonth3owner3: gasstrHomeaddressLivemonth3owner3,
        strHomeaddress7owner3: gasstrHomeaddress7owner3,
        strHomeaddress8owner3: gasstrHomeaddress8owner3,
        strHomeaddressCity4owner3: gasstrHomeaddressCity4owner3,
        strHomeaddressPostCode4owner3: gasstrHomeaddressPostCode4owner3,
        strHomeaddressLiveYear4owner3: gasstrHomeaddressLiveYear4owner3,
        strHomeaddressLiveMonth4owner3: gasstrHomeaddressLiveMonth4owner3,
        strHomeaddress9owner3: gasstrHomeaddress9owner3,
        strHomeaddress10owner3: gasstrHomeaddress10owner3,
        strHomeaddressCity5owner3: gasstrHomeaddressCity5owner3,
        strHomeaddressPostCode5owner3: gasstrHomeaddressPostCode5owner3,
        strHomeaddressLiveYear5owner3: gasstrHomeaddressLiveYear5owner3,
        strHomeaddressLiveMonth5owner3: gasstrHomeaddressLiveMonth5owner3,
        strTitleQwner4: gasstrTitleQwner4,
        strFirstNameowner4: gasstrFirstNameowner4,
        strLastNameowner4: gasstrLastNameowner4,
        strstrDobOwner4: gasstrstrDobOwner4,
        home_Addressowner4: gashome_Addressowner4,
        home_Address2owner4: gashome_Address2owner4,
        strHomeAdressCityowner4: gasstrHomeAdressCityowner4,
        strHomeAdressPostCodeowner4: gasstrHomeAdressPostCodeowner4,
        strHomeaddressLiveYearowner4: gasstrHomeaddressLiveYearowner4,
        strHomeaddressLiveMonthowner4: gasstrHomeaddressLiveMonthowner4,
        strHomeaddress1owner4: gasstrHomeaddress1owner4,
        strHomeaddress2owner4: gasstrHomeaddress2owner4,
        strHomeaddressCity1owner4: gasstrHomeaddressCity1owner4,
        strHomeaddressPostCode1owner4: gasstrHomeaddressPostCode1owner4,
        strHomeaddressLiveYear1owner4: gasstrHomeaddressLiveYear1owner4,
        strHomeaddressLiveMonth1owner4: gasstrHomeaddressLiveMonth1owner4,
        strHomeaddress3owner4: gasstrHomeaddress3owner4,
        strHomeaddress4owner4: gasstrHomeaddress4owner4,
        strHomeaddressCity2owner4: gasstrHomeaddressCity2owner4,
        strHomeaddressPostCode2owner4: gasstrHomeaddressPostCode2owner4,
        strHomeaddressPostLiveYear2owner4: gasstrHomeaddressPostLiveYear2owner4,
        strHomeaddressPostLiveMonth2owner4:
            gasstrHomeaddressPostLiveMonth2owner4,
        strHomeaddress5owner4: gasstrHomeaddress5owner4,
        strHomeaddress6owner4: gasstrHomeaddress6owner4,
        strHomeaddressCity3owner4: gasstrHomeaddressCity3owner4,
        strHomeaddressPostCode3owner4: gasstrHomeaddressPostCode3owner4,
        strHomeaddressLiveYear3owner4: gasstrHomeaddressLiveYear3owner4,
        strHomeaddressLivemonth3owner4: gasstrHomeaddressLivemonth3owner4,
        strHomeaddress7owner4: gasstrHomeaddress7owner4,
        strHomeaddress8owner4: gasstrHomeaddress8owner4,
        strHomeaddressCity4owner4: gasstrHomeaddressCity4owner4,
        strHomeaddressPostCode4owner4: gasstrHomeaddressPostCode4owner4,
        strHomeaddressLiveYear4owner4: gasstrHomeaddressLiveYear4owner4,
        strHomeaddressLiveMonth4owner4: gasstrHomeaddressLiveMonth4owner4,
        strHomeaddress9owner4: gasstrHomeaddress9owner4,
        strHomeaddress10owner4: gasstrHomeaddress10owner4,
        strHomeaddressCity5owner4: gasstrHomeaddressCity5owner4,
        strHomeaddressPostCode5owner4: gasstrHomeaddressPostCode5owner4,
        strHomeaddressLiveYear5owner4: gasstrHomeaddressLiveYear5owner4,
        strHomeaddressLiveMonth5owner4: gasstrHomeaddressLiveMonth5owner4,
        strTitleQwner5: gasstrTitleQwner5,
        strFirstNameowner5: gasstrFirstNameowner5,
        strLastNameowner5: gasstrLastNameowner5,
        strstrDobOwner5: gasstrstrDobOwner5,
        home_Addressowner5: gashome_Addressowner5,
        home_Address2owner5: gashome_Address2owner5,
        strHomeAdressCityowner5: gasstrHomeAdressCityowner5,
        strHomeAdressPostCodeowner5: gasstrHomeAdressPostCodeowner5,
        strHomeaddressLiveYearowner5: gasstrHomeaddressLiveYearowner5,
        strHomeaddressLiveMonthowner5: gasstrHomeaddressLiveMonthowner5,
        strHomeaddress1owner5: gasstrHomeaddress1owner5,
        strHomeaddress2owner5: gasstrHomeaddress2owner5,
        strHomeaddressCity1owner5: gasstrHomeaddressCity1owner5,
        strHomeaddressPostCode1owner5: gasstrHomeaddressPostCode1owner5,
        strHomeaddressLiveYear1owner5: gasstrHomeaddressLiveYear1owner5,
        strHomeaddressLiveMonth1owner5: gasstrHomeaddressLiveMonth1owner5,
        strHomeaddress3owner5: gasstrHomeaddress3owner5,
        strHomeaddress4owner5: gasstrHomeaddress4owner5,
        strHomeaddressCity2owner5: gasstrHomeaddressCity2owner5,
        strHomeaddressPostCode2owner5: gasstrHomeaddressPostCode2owner5,
        strHomeaddressPostLiveYear2owner5: gasstrHomeaddressPostLiveYear2owner5,
        strHomeaddressPostLiveMonth2owner5:
            gasstrHomeaddressPostLiveMonth2owner5,
        strHomeaddress5owner5: gasstrHomeaddress5owner5,
        strHomeaddress6owner5: gasstrHomeaddress6owner5,
        strHomeaddressCity3owner5: gasstrHomeaddressCity3owner5,
        strHomeaddressPostCode3owner5: gasstrHomeaddressPostCode3owner5,
        strHomeaddressLiveYear3owner5: gasstrHomeaddressLiveYear3owner5,
        strHomeaddressLivemonth3owner5: gasstrHomeaddressLivemonth3owner5,
        strHomeaddress7owner5: gasstrHomeaddress7owner5,
        strHomeaddress8owner5: gasstrHomeaddress8owner5,
        strHomeaddressCity4owner5: gasstrHomeaddressCity4owner5,
        strHomeaddressPostCode4owner5: gasstrHomeaddressPostCode4owner5,
        strHomeaddressLiveYear4owner5: gasstrHomeaddressLiveYear4owner5,
        strHomeaddressLiveMonth4owner5: gasstrHomeaddressLiveMonth4owner5,
        strHomeaddress9owner5: gasstrHomeaddress9owner5,
        strHomeaddress10owner5: gasstrHomeaddress10owner5,
        strHomeaddressCity5owner5: gasstrHomeaddressCity5owner5,
        strHomeaddressPostCode5owner5: gasstrHomeaddressPostCode5owner5,
        strHomeaddressLiveYear5owner5: gasstrHomeaddressLiveYear5owner5,
        strHomeaddressLiveMonth5owner5: gasstrHomeaddressLiveMonth5owner5,
        strTitleQwner6: gasstrTitleQwner6,
        strFirstNameowner6: gasstrFirstNameowner6,
        strLastNameowner6: gasstrLastNameowner6,
        strstrDobOwner6: gasstrstrDobOwner6,
        home_Addressowner6: gashome_Addressowner6,
        home_Address2owner6: gashome_Address2owner6,
        strHomeAdressCityowner6: gasstrHomeAdressCityowner6,
        strHomeAdressPostCodeowner6: gasstrHomeAdressPostCodeowner6,
        strHomeaddressLiveYearowner6: gasstrHomeaddressLiveYearowner6,
        strHomeaddressLiveMonthowner6: gasstrHomeaddressLiveMonthowner6,
        strHomeaddress1owner6: gasstrHomeaddress1owner6,
        strHomeaddress2owner6: gasstrHomeaddress2owner6,
        strHomeaddressCity1owner6: gasstrHomeaddressCity1owner6,
        strHomeaddressPostCode1owner6: gasstrHomeaddressPostCode1owner6,
        strHomeaddressLiveYear1owner6: gasstrHomeaddressLiveYear1owner6,
        strHomeaddressLiveMonth1owner6: gasstrHomeaddressLiveMonth1owner6,
        strHomeaddress3owner6: gasstrHomeaddress3owner6,
        strHomeaddress4owner6: gasstrHomeaddress4owner6,
        strHomeaddressCity2owner6: gasstrHomeaddressCity2owner6,
        strHomeaddressPostCode2owner6: gasstrHomeaddressPostCode2owner6,
        strHomeaddressPostLiveYear2owner6: gasstrHomeaddressPostLiveYear2owner6,
        strHomeaddressPostLiveMonth2owner6:
            gasstrHomeaddressPostLiveMonth2owner6,
        strHomeaddress5owner6: gasstrHomeaddress5owner6,
        strHomeaddress6owner6: gasstrHomeaddress6owner6,
        strHomeaddressCity3owner6: gasstrHomeaddressCity3owner6,
        strHomeaddressPostCode3owner6: gasstrHomeaddressPostCode3owner6,
        strHomeaddressLiveYear3owner6: gasstrHomeaddressLiveYear3owner6,
        strHomeaddressLivemonth3owner6: gasstrHomeaddressLivemonth3owner6,
        strHomeaddress7owner6: gasstrHomeaddress7owner6,
        strHomeaddress8owner6: gasstrHomeaddress8owner6,
        strHomeaddressCity4owner6: gasstrHomeaddressCity4owner6,
        strHomeaddressPostCode4owner6: gasstrHomeaddressPostCode4owner6,
        strHomeaddressLiveYear4owner6: gasstrHomeaddressLiveYear4owner6,
        strHomeaddressLiveMonth4owner6: gasstrHomeaddressLiveMonth4owner6,
        strHomeaddress9owner6: gasstrHomeaddress9owner6,
        strHomeaddress10owner6: gasstrHomeaddress10owner6,
        strHomeaddressCity5owner6: gasstrHomeaddressCity5owner6,
        strHomeaddressPostCode5owner6: gasstrHomeaddressPostCode5owner6,
        strHomeaddressLiveYear5owner6: gasstrHomeaddressLiveYear5owner6,
        strHomeaddressLiveMonth5owner6: gasstrHomeaddressLiveMonth5owner6,
      );
    } else {
      return null;
    }
  }
}
