import 'package:intl/intl.dart';
import 'package:pozitive/Core/Model/Api/Electricity-InsertAddProspect/EleBusCredential.dart';
import 'package:pozitive/Util/electricity_pref.dart';
import 'package:pozitive/Core/Services/database.dart';
import 'package:pozitive/Core/ViewModel/baseModel.dart';
import 'package:pozitive/Core/enums/view_state.dart';
import 'package:flutter/material.dart';
import 'package:pozitive/Core/AppConstact/app_data.dart';
import '../../baseview.dart';
import 'package:pozitive/Util/global.dart' as globals;

Database database = getIt<DatabaseImplementation>();

EleBusCredential credential = EleBusCredential();

class EleBusAddProspectViewModel extends BaseModel {
  TextEditingController businessnamecontroller = TextEditingController();
  TextEditingController businessTypeController = TextEditingController();
  TextEditingController landline = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController nameOnBill = TextEditingController();
  TextEditingController supplyName = TextEditingController();
  TextEditingController companyRegNo = TextEditingController();
  TextEditingController mobile = TextEditingController();
  TextEditingController companyName = TextEditingController();
  TextEditingController customerRefId = TextEditingController();
  TextEditingController charityRegNo = TextEditingController();

  TextEditingController ownerTitle = TextEditingController();
  TextEditingController ownerFirstName = TextEditingController();
  TextEditingController ownerLastName = TextEditingController();
  TextEditingController contractstartdatecontroller = TextEditingController();

  TextEditingController address1Controller = TextEditingController();
  TextEditingController address2Controller = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController postcode = TextEditingController();
  TextEditingController yearListController = TextEditingController();
  TextEditingController monthhListController = TextEditingController();
  TextEditingController strTitleDirector1 = TextEditingController();
  TextEditingController strDirector1Firstname = TextEditingController();
  TextEditingController strDirector1Lastname = TextEditingController();
  TextEditingController strTitleQwner1 = TextEditingController();
  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController strTitlecharityowner1 = TextEditingController();
  TextEditingController strcharityowner1firstname = TextEditingController();
  TextEditingController strcharityowner1lastname = TextEditingController();
  TextEditingController strchariryRegisterNo = TextEditingController();
  TextEditingController strTitleLLPowner1 = TextEditingController();
  TextEditingController strLLPowner1FirstName = TextEditingController();
  TextEditingController strLLPowner1LastName = TextEditingController();
  TextEditingController strTitleLLcowner1 = TextEditingController();
  TextEditingController strLLcowner1FirstName = TextEditingController();
  TextEditingController strLLcowner1LastName = TextEditingController();
  TextEditingController strTitleOtherowner1 = TextEditingController();
  TextEditingController strOtherowner1FirstName = TextEditingController();
  TextEditingController strOtherowner1LastName = TextEditingController();
  TextEditingController strTitleDirector2 = TextEditingController();
  TextEditingController strDirector2Firstname = TextEditingController();
  TextEditingController strDirector2Lastname = TextEditingController();
  TextEditingController strTitleQwner2 = TextEditingController();
  TextEditingController firstName2 = TextEditingController();
  TextEditingController lastName2 = TextEditingController();
  TextEditingController strTitlecharityowner2 = TextEditingController();
  TextEditingController strcharityowner2firstname = TextEditingController();
  TextEditingController strcharityowner2lastname = TextEditingController();
  TextEditingController strchariryRegisterNo2 = TextEditingController();
  TextEditingController strTitleLLPowner2 = TextEditingController();
  TextEditingController strLLPowner2FirstName = TextEditingController();
  TextEditingController strLLPowner2LastName = TextEditingController();
  TextEditingController strTitleLLcowner2 = TextEditingController();
  TextEditingController strLLcowner2FirstName = TextEditingController();
  TextEditingController strLLcowner2LastName = TextEditingController();
  TextEditingController strTitleOtherowner2 = TextEditingController();
  TextEditingController strOtherowner2FirstName = TextEditingController();
  TextEditingController strOtherowner2LastName = TextEditingController();

  DateTime selectedDate = DateTime(
      DateTime.now().year, DateTime.now().month, DateTime.now().day + 21);

  DateFormat dateFormat = DateFormat("yyyy-MM-dd");
  Future selectDate(BuildContext context, String fromfield) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(1900),
        lastDate: DateTime(2101));
    if (picked != null) {
      if (fromfield == "Required") {
        setState(ViewState.BUSY);
        print("picked");

        contractstartdatecontroller.text = dateFormat.format(picked);
      } else {
        setState(ViewState.BUSY);
        print("not picke");
        contractstartdatecontroller.text = dateFormat.format(picked);
      }
    }
  }

  bool autovalidation = false;
  //List businessTypelist = AppData.businessTypes;

  List<AppData> businessList = <AppData>[
    AppData(businessType: 'Ltd'),
    AppData(businessType: 'Sole Proprietor'),
    AppData(businessType: 'Partnership'),
    AppData(businessType: 'Charity'),
    AppData(businessType: 'LLP'),
    AppData(businessType: 'LLC'),
    AppData(businessType: 'Other'),
  ];

  Widget ownernameList() {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: nameTitle.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            child: ListTile(
              title: Text(
                nameTitle[index],
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              onTap: () {
                setState(ViewState.BUSY);
                strTitleDirector1.text = nameTitle[index];

                Navigator.pop(context);
              },
            ),
          );
        });
  }

  Widget ownername1List() {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: nameTitle.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            child: ListTile(
              title: Text(
                nameTitle[index],
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              onTap: () {
                setState(ViewState.BUSY);
                strTitleDirector2.text = nameTitle[index];

                Navigator.pop(context);
              },
            ),
          );
        });
  }

  List year = [
    "01",
    "02",
    "03",
    "04",
    "05",
    "06",
    "07",
    "08",
    "09",
    "10",
    "More than 10 year"
  ];

  List month = [
    "01",
    "02",
    "03",
    "04",
    "05",
    "06",
    "07",
    "08",
    "09",
    "10",
    "11",
    "12"
  ];

  Widget yearList1() {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: year.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            child: ListTile(
              title: Text(
                year[index],
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              onTap: () {
                setState(ViewState.BUSY);
                yearListController.text = year[index];

                Navigator.pop(context);
              },
            ),
          );
        });
  }

  Widget monthList1() {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: month.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            child: ListTile(
              title: Text(
                month[index],
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              onTap: () {
                setState(ViewState.BUSY);
                monthhListController.text = month[index];

                Navigator.pop(context);
              },
            ),
          );
        });
  }

  Widget yearList2() {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: year.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            child: ListTile(
              title: Text(
                year[index],
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              onTap: () {
                setState(ViewState.BUSY);
                yearListController.text = year[index];

                Navigator.pop(context);
              },
            ),
          );
        });
  }

  Widget monthList2() {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: month.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            child: ListTile(
              title: Text(
                month[index],
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              onTap: () {
                setState(ViewState.BUSY);
                monthhListController.text = month[index];

                Navigator.pop(context);
              },
            ),
          );
        });
  }

  List nameTitle = ["Mr", "Mrs", "Miss", "Ms", "Sir", "Dr"];

  Widget nameList() {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: nameTitle.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            child: ListTile(
              title: Text(
                nameTitle[index],
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              onTap: () {
                setState(ViewState.BUSY);
                ownerTitle.text = nameTitle[index];

                Navigator.pop(context);
              },
            ),
          );
        });
  }

  String getNumberBusinessType(String val) {
    // 'Ltd','Sole Proprietor','Partnership','Charity','LLP','LLC','Other'
    if (val == 'Ltd') {
      return '1';
    } else if (val == 'Sole Proprietor') {
      return '2';
    } else if (val == 'Partnership') {
      return '3';
    } else if (val == 'Charity') {
      return '4';
    } else if (val == 'LLP') {
      return '5';
    } else if (val == 'LLC') {
      return '6';
    } else if (val == 'Other') {
      return '7';
    }
    return '1';
  }

  int payperbill = 2;
  int microbusiness = 2;
  int propetyOwnership = 1;

  Widget businessTypeView() {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: businessList.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            child: ListTile(
              title: Text(
                businessList[index].businessType,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              onTap: () {
                setState(ViewState.BUSY);
                businessTypeController.text = businessList[index].businessType;

                Navigator.pop(context);
              },
            ),
          );
        });
  }

  void initialData(Function increment) async { 
    final data = await ElectricityPref.getElectricityBusValues();
    setState(ViewState.BUSY);

    if (data != null) {
      businessnamecontroller.text = data.business_Name;
      businessTypeController.text = data.business_Type;
      landline.text = data.alternative_Number;
      email.text = data.email;
      nameOnBill.text = data.strNameOfBill;
      supplyName.text = data.strSupplyName;
      companyRegNo.text = data.strCompanyRegNo;
      mobile.text = data.strEAMobileNo;
      companyName.text = data.registeredCompanyName;
      customerRefId.text = data.strCustomerRefNo;
      payperbill = data.btePaperBill != null ? int.parse(data.btePaperBill) : 0;
      microbusiness =
          data.btemicrobuisnes != null ? int.parse(data.btemicrobuisnes) : 0;
      propetyOwnership = data.strPropertOwnerShip != null
          ? int.parse(data.strPropertOwnerShip)
          : 0;
      //businessTypelist =(Map<data.business_Type>) as List;
    }
    if (data?.business_Type != null) {
      print(data?.business_Type.toString() + 'This is  ele business type');
      if (globals.tabController1.length == 9) {
        increment();
      }
    }


  

    setState(ViewState.IDLE);
  }

  void onSaveAndNext() {
    setState(ViewState.BUSY);
    ElectricityPref.setElectricityBusValues(
      EleBusCredential(
        business_Name: businessnamecontroller.text,
        business_Type: businessTypeController.text,
        //business_Type:getNumberBusinessType(businessTypeController.text).toString(),
        alternative_Number: landline.text,
        email: email.text,
        strNameOfBill: nameOnBill.text,
        strSupplyName: supplyName.text,
        strCompanyRegNo: companyRegNo.text,
        strEAMobileNo: mobile.text,
        registeredCompanyName: companyRegNo.text,
        strCustomerRefNo: customerRefId.text,
        btePaperBill: payperbill.toString(),
        btemicrobuisnes: microbusiness.toString(),
        strPropertOwnerShip: propetyOwnership.toString(),
        //businessTypelist:businessTypelist.toString(),
      ),
    );
    setState(ViewState.IDLE);
  }
}
