import 'package:intl/intl.dart';
import 'package:pozitive/Core/AppConstact/app_data.dart';
import 'package:pozitive/Core/Model/Api/Gas-Insert-AddProspect/Gas_Business_Credential.dart';
import 'package:pozitive/Util/gas_Pref.dart';
import 'package:pozitive/Core/Services/database.dart';
import 'package:pozitive/Core/ViewModel/baseModel.dart';
import 'package:pozitive/Core/enums/view_state.dart';
import 'package:flutter/material.dart';
import '../../baseview.dart';
import 'package:pozitive/Util/global.dart' as globals;

Database database = getIt<DatabaseImplementation>();

GasBusinessCredential credential = GasBusinessCredential();

class GasBusinessAddProspectViewModel extends BaseModel {
  TextEditingController gasbusinessnamecontroller = TextEditingController();
  TextEditingController gasbusinessTypeController = TextEditingController();
  TextEditingController gaslandline = TextEditingController();
  TextEditingController gasemail = TextEditingController();
  TextEditingController gasnameOnBill = TextEditingController();
  TextEditingController gassupplyName = TextEditingController();
  TextEditingController gascompanyRegNo = TextEditingController();
  TextEditingController gasmobile = TextEditingController();
  TextEditingController gascompanyName = TextEditingController();
  TextEditingController gascustomerRefId = TextEditingController();
  TextEditingController gascharityRegNo = TextEditingController();

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

  bool isBusinessTabSelected = false;

  DateTime selectedDate = DateTime(
      DateTime.now().year, DateTime.now().month, DateTime.now().day + 21);
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

  DateFormat dateFormat = DateFormat("yyyy-MM-dd");
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

  bool autovalidation = false;
  List<AppData> businessList = <AppData>[
    AppData(businessType: 'Ltd'),
    AppData(businessType: 'Sole Proprietor'),
    AppData(businessType: 'Partnership'),
    AppData(businessType: 'Charity'),
    AppData(businessType: 'LLP'),
    AppData(businessType: 'LLC'),
    AppData(businessType: 'Other'),
  ];
  int payperbill = 2;
  int microbusiness = 2;
  int propetyOwnership = 1;
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
                gasbusinessTypeController.text =
                    businessList[index].businessType;

                Navigator.pop(context);
              },
            ),
          );
        });
  }

  void initialData(Function increment) async {
    final data = await GasPref.getGasBusinessValues();
    setState(ViewState.BUSY);

    if (data != null) {
      gasbusinessnamecontroller.text = data.gbusiness_Name;
      gasbusinessTypeController.text = data.gbusiness_Type;
      gaslandline.text = data.galternative_Number;
      gasemail.text = data.gemail;
      gasnameOnBill.text = data.gstrNameOfBill;
      gassupplyName.text = data.gstrSupplyName;
      gascompanyRegNo.text = data.gstrCompanyRegNo;
      gasmobile.text = data.gstrEAMobileNo;
      gascompanyName.text = data.gregisteredCompanyName;
      payperbill =
          data.gbtePaperBill != null ? int.parse(data.gbtePaperBill) : 0;
      microbusiness =
          data.gbtemicrobuisnes != null ? int.parse(data.gbtemicrobuisnes) : 0;
      propetyOwnership = data.gstrPropertOwnerShip != null
          ? int.parse(data.gstrPropertOwnerShip)
          : 0;
      gascustomerRefId.text = data.gstrCustomerRefNo;
    }

    if (data?.gbusiness_Type != null) {
      print(data?.gbusiness_Type.toString() + 'This is business type');
      if (globals.tabController.length == 9) {
        increment();
      }
    }

    setState(ViewState.IDLE);
  }

  void onSaveAndNext() {
    setState(ViewState.BUSY);
    GasPref.setGasBusinessValues(GasBusinessCredential(
      gbusiness_Name: gasbusinessnamecontroller.text,
      gbusiness_Type: gasbusinessTypeController.text,
      galternative_Number: gaslandline.text.toString(),
      gemail: gasemail.text,
      gstrNameOfBill: gasnameOnBill.text,
      gstrSupplyName: gassupplyName.text,
      gstrCompanyRegNo: gascompanyRegNo.text,
      gstrEAMobileNo: gasmobile.text,
      gregisteredCompanyName: gascompanyName.text,
      gbtePaperBill: payperbill.toString(),
      gbtemicrobuisnes: microbusiness.toString(),
      gstrPropertOwnerShip: propetyOwnership.toString(),
      gstrCustomerRefNo: gascustomerRefId.text,
    ));

    setState(ViewState.IDLE);
  }
}
