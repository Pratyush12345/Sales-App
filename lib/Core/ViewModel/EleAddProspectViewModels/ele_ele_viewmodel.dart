import 'dart:convert';
import 'package:pozitive/Core/Model/Api/Electricity-InsertAddProspect/EleEleCredentials.dart';
import 'package:pozitive/Util/electricity_pref.dart';
import 'package:pozitive/Core/Model/InsertAddProspect/insert-Add-prospect.dart';
import 'package:pozitive/Core/Services/database.dart';
import 'package:pozitive/Core/ViewModel/baseModel.dart';
import 'package:pozitive/Core/enums/view_state.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pozitive/Util/theme.dart';
import 'package:pozitive/Util/global.dart' as globals;

import '../../baseview.dart';

Database database = getIt<DatabaseImplementation>();

EleEleCredentials credential = EleEleCredentials();

class EleEleAddProspectViewModel extends BaseModel {
  bool autovalidation = false;
  TextEditingController rhtEstandingCharge = TextEditingController();
  TextEditingController rhtEnightUnitCharge = TextEditingController();
  TextEditingController rhtEnightEAC = TextEditingController();

  TextEditingController standingCharge = TextEditingController();
  TextEditingController dayUnitCharge = TextEditingController();
  TextEditingController nightUnitCharge = TextEditingController();
  TextEditingController eweUnitCharge = TextEditingController();
  TextEditingController capacityCharge = TextEditingController();
  TextEditingController excessCapacityCharge = TextEditingController();
  TextEditingController emrCharge = TextEditingController();
  TextEditingController energizationStatus = TextEditingController();
  TextEditingController dayEAC = TextEditingController();
  TextEditingController nightEAC = TextEditingController();
  TextEditingController eweEAC = TextEditingController();
  TextEditingController siteCapacity = TextEditingController();
  TextEditingController reactiveCharge = TextEditingController();
  TextEditingController fitCharge = TextEditingController();
  TextEditingController newConnection = TextEditingController();
  TextEditingController elebusinessnamecontroller1 = TextEditingController();
  TextEditingController elebusinessnamecontroller2 = TextEditingController();
  TextEditingController elebusinessnamecontroller3 = TextEditingController();
  TextEditingController elebusinessnamecontroller4 = TextEditingController();
  TextEditingController elebusinessnamecontroller5 = TextEditingController();
  TextEditingController elebusinessnamecontroller6 = TextEditingController();
  TextEditingController elempancodecontroller = TextEditingController();
  TextEditingController contractstartdatecontroller = TextEditingController();
  TextEditingController energizationcontroller = TextEditingController();
  TextEditingController contractEndDate = TextEditingController();
  TextEditingController rhtElebusinessnamecontroller1 = TextEditingController();
  TextEditingController rhtElebusinessnamecontroller2 = TextEditingController();
  TextEditingController rhtElebusinessnamecontroller3 = TextEditingController();
  TextEditingController rhtElebusinessnamecontroller4 = TextEditingController();
  TextEditingController rhtElebusinessnamecontroller5 = TextEditingController();
  TextEditingController rhtElebusinessnamecontroller6 = TextEditingController();
  TextEditingController rhtElempancodecontroller = TextEditingController();
  ThemeApp themeApp = ThemeApp();

  int newConnectionSelected = 1;
  int energizationSelected = 1;
  bool rhtMeter = false;
  String rhtError = '';

  bool mopContract = false;
  bool da_dc_contract = false;
  int contractEndDateSelected = 1;

  List newConnectionlist = ["F", "T"];
  Widget NotificationView() {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: newConnectionlist.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            child: ListTile(
              title: Text(
                newConnectionlist[index],
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              onTap: () {
                setState(ViewState.BUSY);
                newConnection.text = newConnectionlist[index];

                Navigator.pop(context);
              },
            ),
          );
        });
  }

  List energizationlist = ["Energization", "De-Energization"];
  void onChangeMPanCode(String val) {
    setState(ViewState.BUSY);
    elempancodecontroller.text = val;
    setState(ViewState.IDLE);
  }

  void onChangeRHTMPanCode(String val) {
    setState(ViewState.BUSY);
    rhtElempancodecontroller.text = val;
    setState(ViewState.IDLE);
  }

  Widget EnergizationView() {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: energizationlist.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            child: ListTile(
              title: Text(
                energizationlist[index],
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              onTap: () {
                setState(ViewState.BUSY);
                energizationcontroller.text = energizationlist[index];

                Navigator.pop(context);
              },
            ),
          );
        });
  }

  List mpancodelist = ["00", "01", "02", "03", "04", "05", "06", "07", "08"];

  DateTime selectedDate = DateTime.now();
  DateFormat dateFormat = DateFormat("dd-MM-yyyy");

  Future selectDate(BuildContext context, String fromfield) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: selectedDate.add(new Duration(days: 4)),
        firstDate: selectedDate.add(new Duration(days: 4)),
        lastDate: DateTime(2101));
    if (picked != null) {
      setState(ViewState.BUSY);
      contractstartdatecontroller.text = dateFormat.format(picked);
    } else {
      return 'please select date';
    }
  }

  Future endContractselectDate(BuildContext context, String fromfield) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: selectedDate.add(new Duration(days: 5)),
        firstDate: selectedDate.add(new Duration(days: 5)),
        lastDate: DateTime(2101));
    if (picked != null) {
      if (fromfield == "Required") {
        setState(ViewState.BUSY);
        print("picked");

        contractEndDate.text = dateFormat.format(picked);
      } else {
        setState(ViewState.BUSY);
        print("not picke");
        contractEndDate.text = dateFormat.format(picked);
      }
    }
  }

  Future getEleEleProspect() async {
    setState(ViewState.BUSY);

    credential = await ElectricityPref.getElectricityEleValues();

    final response =
        await database.eleEleInsertAddProspectService(EleEleCredentials());

    if (isNotError(response)) {
      var res = jsonDecode(response.body);
      print(res['data']);
      EleEleCredentials _user =
          DuelFuelInsertAddProspectModel.fromJson(res['data'])
              as EleEleCredentials;

      credential = _user;
      print('#########electriccccccccccc${credential.strDayUnit}');
      ElectricityPref.setElectricityEleValues(credential);
      setState(ViewState.IDLE);
    } else {
      print("error");
      setState(ViewState.IDLE);
    }
  }

  void initialData(Function increment) async { 
    setState(ViewState.BUSY);
    final data = await ElectricityPref.getElectricityEleValues();
    final dataBusiness = await ElectricityPref.getElectricityBusValues();

    if (data != null) {
      standingCharge.text = data.strStandingCharge;
      dayUnitCharge.text = data.strDayUnit;
      nightUnitCharge.text = data.strNightUnit;
      eweUnitCharge.text = data.strEWEUnit;
      capacityCharge.text = data.strCapacitycharges;
      excessCapacityCharge.text = data.strExceesCapacityCharegs;
      emrCharge.text = data.strEMRCFD;
      //energizationStatus.text = data.strEnergizationstatus;
      energizationcontroller.text = data.strEnergizationstatus;
      dayEAC.text = data.electricityDay_EAC;
      nightEAC.text = data.electricityNight_EAC;
      eweEAC.text = data.electricityEvening_EAC;
      siteCapacity.text = data.strSiteCharge;
      reactiveCharge.text = data.strReactiveCharges;
      fitCharge.text = data.strFITcharge;
      newConnection.text = data.strNewConnection;

      elempancodecontroller.text = data.mpanCodeController;

      elebusinessnamecontroller1.text = data.businessController1;
      elebusinessnamecontroller2.text = data.businessController2;
      elebusinessnamecontroller3.text = data.businessController3;
      elebusinessnamecontroller4.text = data.businessController4;
      elebusinessnamecontroller5.text = data.businessController5;
      elebusinessnamecontroller6.text = data.businessController6;

      rhtElempancodecontroller.text = data.fullMpanRHT;

      rhtElebusinessnamecontroller1.text = data.rhtBusinessController1;
      rhtElebusinessnamecontroller2.text = data.rhtBusinessController2;
      rhtElebusinessnamecontroller3.text = data.rhtBusinessController3;
      rhtElebusinessnamecontroller4.text = data.rhtBusinessController4;
      rhtElebusinessnamecontroller5.text = data.rhtBusinessController5;
      rhtElebusinessnamecontroller6.text = data.rhtBusinessController6;

      rhtEstandingCharge.text = data.rhtStandingCharge;
      rhtEnightUnitCharge.text = data.rhtNightUnitCharge;
      rhtEnightEAC.text = data.rhtNightEac;
      contractEndDate.text = data.contractEndDate;

      contractstartdatecontroller.text = data.dteElecStartDate;

      contractEndDateSelected = data.dtContractEndDateEle != null
          ? int.parse(data.dtContractEndDateEle)
          : 0;
      if (data.rhtcheckbox == 'true') {
        rhtMeter = true;
      }
      if (data.bteMopCustomer == 'true') {
        mopContract = true;
      }
      if (data.bteMopDADCCustomer == 'true') {
        da_dc_contract = true;
      }
    }
    setState(ViewState.IDLE);
    setState(ViewState.BUSY);

    if (dataBusiness?.business_Type != null) {
      print(dataBusiness?.business_Type.toString() + 'This is business type');
      if (globals.tabController1.length == 9) {
        increment();
      }
    }
    setState(ViewState.IDLE);
  }

  void onSaveAndNext() {
   // setState(ViewState.BUSY);
    ElectricityPref.setElectricityEleValues( 
      EleEleCredentials(
        wholeMpan: (elempancodecontroller.text +
            elebusinessnamecontroller1.text +
            elebusinessnamecontroller2.text +
            elebusinessnamecontroller3.text +
            elebusinessnamecontroller4.text +
            elebusinessnamecontroller5.text +
            elebusinessnamecontroller6.text),

        mpanCodeController: elempancodecontroller.text,

        fullMpan: elempancodecontroller.text,

        businessController1: elebusinessnamecontroller1.text,
        businessController2: elebusinessnamecontroller2.text,
        businessController3: elebusinessnamecontroller3.text,
        businessController4: elebusinessnamecontroller4.text,
        businessController5: elebusinessnamecontroller5.text,
        businessController6: elebusinessnamecontroller6.text,

        wholeRHTMpan: (rhtElempancodecontroller.text +
            rhtElebusinessnamecontroller1.text +
            rhtElebusinessnamecontroller2.text +
            rhtElebusinessnamecontroller3.text +
            rhtElebusinessnamecontroller4.text +
            rhtElebusinessnamecontroller5.text +
            rhtElebusinessnamecontroller6.text),
        fullMpanRHT: rhtElempancodecontroller.text,
        rhtBusinessController1: rhtElebusinessnamecontroller1.text,
        rhtBusinessController2: rhtElebusinessnamecontroller2.text,
        rhtBusinessController3: rhtElebusinessnamecontroller3.text,
        rhtBusinessController4: rhtElebusinessnamecontroller4.text,
        rhtBusinessController5: rhtElebusinessnamecontroller5.text,
        rhtBusinessController6: rhtElebusinessnamecontroller6.text,

        rhtStandingCharge: rhtEstandingCharge.text,
        rhtNightUnitCharge: rhtEnightUnitCharge.text,
        rhtNightEac: rhtEnightEAC.text,
        contractEndDate: contractEndDate.text,
        dteElecStartDate: contractstartdatecontroller.text,

        dtContractEndDateEle: contractEndDateSelected.toString() != null
            ? contractEndDateSelected.toString()
            : '0',

        strStandingCharge: standingCharge.text,
        strDayUnit: dayUnitCharge.text,
        strNightUnit: nightUnitCharge.text,
        strEWEUnit: eweUnitCharge.text,
        strCapacitycharges: capacityCharge.text,
        strExceesCapacityCharegs: excessCapacityCharge.text,
        strEMRCFD: emrCharge.text,
        //strEnergizationstatus: energizationStatus.text,
        strEnergizationstatus: energizationcontroller.text,
        electricityDay_EAC: dayEAC.text,
        electricityNight_EAC: nightEAC.text,
        electricityEvening_EAC: eweEAC.text,
        strSiteCharge: siteCapacity.text,
        strReactiveCharges: reactiveCharge.text,
        strFITcharge: fitCharge.text,
        strNewConnection: newConnection.text,
        bteMopCustomer: mopContract.toString(),
        bteMopDADCCustomer: da_dc_contract.toString(),
        rhtcheckbox: rhtMeter.toString(),
      ),
    );
    //int index = globals.tabController1.index;
    //globals.tabController1.animateTo(index + 1);
    globals.tabController1.animateTo(1);
    //setState(ViewState.IDLE);
  }
}
