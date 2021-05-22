import 'package:pozitive/Core/Model/Api/DualFuel-InsertAddProspect/DualFuelBusinessCredential.dart';
import 'package:get_it/get_it.dart';
import 'package:pozitive/Core/Services/database.dart';
import 'package:pozitive/Core/ViewModel/baseModel.dart';
import 'package:pozitive/Core/enums/view_state.dart';
import 'package:pozitive/Core/AppConstact/app_data.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pozitive/Util/dualFuel_Pref.dart';
import 'package:pozitive/Util/global.dart' as globals;
import 'package:pozitive/Util/PrefBusinessType/PrefBusinessType.dart';
import 'package:pozitive/Core/Model/Api/DualFuel-InsertAddProspect/BusinessOwnershipDetailsCredential.dart';

GetIt getIt = GetIt.instance;

class DualFuelAddProspectBusinessViewModel extends BaseModel {
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
  TextEditingController ownerTitle = TextEditingController();
  TextEditingController ownerFirstName = TextEditingController();
  TextEditingController ownerLastName = TextEditingController();
  TextEditingController charityRegNo = TextEditingController();
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

  bool isBusinessSelected = false;
  DateTime selectedDate = DateTime(
      DateTime.now().year, DateTime.now().month, DateTime.now().day + 21);

  DateFormat dateFormat = DateFormat("yyyy-MM-dd");

  bool autovalidation = false;
  List<AppData> businessList = <AppData>[
    AppData(businessType: 'Select Business Type'),
    AppData(businessType: 'Ltd'),
    AppData(businessType: 'Sole Proprietor'),
    AppData(businessType: 'Partnership'),
    AppData(businessType: 'Charity'),
    AppData(businessType: 'LLP'),
    AppData(businessType: 'LLC'),
    AppData(businessType: 'Other'),
  ];
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

  Widget yearList() {
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

  Widget monthList() {
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

  int payperbill = 2;
  int microbusiness = 2;
  int propetyOwnership = 1;

  Future dobSelect(BuildContext context, String fromfield) async {
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
                print(businessTypeController.text + 'business type.........');

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

  Database database = getIt<DatabaseImplementation>();

  void initialData(Function increment) async {
    final data = await DFPref.getDualFuelBusinessDetailsValues();
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
      payperbill =
          data.btePaperBill != null ? int.parse(data.btemicrobuisnes) : 0;
      microbusiness =
          data.btemicrobuisnes != null ? int.parse(data.btemicrobuisnes) : 0;
      propetyOwnership = data.strPropertOwnerShip != null
          ? int.parse(data.btemicrobuisnes)
          : 0; 

      customerRefId.text = data.strCustomerRefNo;

      if (data.business_Type != null) {
        print(data.business_Type.toString() + 'This is business type');
        if (globals.tabController2.length == 10) {
          increment();
        }
      }
    }

    setState(ViewState.IDLE);
  }

  void onSaveAndNext() {
    setState(ViewState.BUSY);

    DFPref.setDualFuelBusinessDetailsValues(DualFuelBusinessCredential(
      business_Name: businessnamecontroller.text,
      business_Type: businessTypeController.text,
      alternative_Number: landline.text,
      email: email.text,
      strNameOfBill: nameOnBill.text,
      strSupplyName: supplyName.text,
      strCompanyRegNo: companyRegNo.text,
      strEAMobileNo: mobile.text,
      registeredCompanyName: companyName.text,
      btePaperBill: payperbill.toString(),
      btemicrobuisnes: microbusiness.toString(),
      strPropertOwnerShip: propetyOwnership.toString(),
      strCustomerRefNo: customerRefId.text,
    ));
    setState(ViewState.IDLE);
  }

  void otherAddressInitialData() async {
    final data = await BusinessTypePref.getOtherBusinessTypeAdd();
    setState(ViewState.BUSY);
    if (data != null) {
      strTitleOtherowner1.text = data.strTitleOtherowner1;
      strOtherowner1FirstName.text = data.strOtherowner1FirstName;
      strOtherowner1LastName.text = data.strOtherowner1LastName;
      strTitleOtherowner2.text = data.strTitleOtherowner2;
      strOtherowner2FirstName.text = data.strOtherowner2FirstName;
      strOtherowner2LastName.text = data.strOtherowner2LastName;
    }
    setState(ViewState.IDLE);
  }

  void otherAddressOnSaveAndNext() {
    setState(ViewState.BUSY);
    BusinessTypePref.setOtherBusinessTypeAdd(OtherBusinessCredential(
      strTitleOtherowner1: strTitleOtherowner1.text,
      strOtherowner1FirstName: strOtherowner1FirstName.text,
      strOtherowner1LastName: strOtherowner1LastName.text,
      strTitleOtherowner2: strTitleOtherowner2.text,
      strOtherowner2FirstName: strOtherowner2FirstName.text,
      strOtherowner2LastName: strOtherowner2LastName.text,
    ));
    setState(ViewState.IDLE);
  }
}
