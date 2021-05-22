import 'package:pozitive/Core/Model/Api/DualFuel-InsertAddProspect/ElectricityCredential.dart';
import 'package:get_it/get_it.dart';
import 'package:pozitive/Core/Services/database.dart';
import 'package:pozitive/Core/ViewModel/baseModel.dart';
import 'package:pozitive/Core/enums/view_state.dart';
import 'package:flutter/material.dart';
import 'package:pozitive/Util/global.dart' as globals;
import 'package:intl/intl.dart';
import 'package:pozitive/Util/dualFuel_Pref.dart';
import 'package:flutter/material.dart';

GetIt getIt = GetIt.instance;

class DualFuelAddProspectViewModel extends BaseModel {
  bool autovalidation = false;

  TextEditingController standingCharge = TextEditingController();
  TextEditingController rhtDFstandingCharge = TextEditingController();
  TextEditingController dayUnitCharge = TextEditingController();
  TextEditingController nightUnitCharge = TextEditingController();
  TextEditingController rhtDFnightUnitCharge = TextEditingController();
  TextEditingController eweUnitCharge = TextEditingController();
  TextEditingController capacityCharge = TextEditingController();
  TextEditingController excessCapacityCharge = TextEditingController();
  TextEditingController emrCharge = TextEditingController();
  TextEditingController energizationStatus = TextEditingController();
  TextEditingController dayEAC = TextEditingController();
  TextEditingController nightEAC = TextEditingController();
  TextEditingController rhtDFnightEAC = TextEditingController();
  TextEditingController eweEAC = TextEditingController();
  TextEditingController siteCapacity = TextEditingController();
  TextEditingController reactiveCharge = TextEditingController();
  TextEditingController fitCharge = TextEditingController();
  TextEditingController newConnection = TextEditingController();

  TextEditingController businessnamecontroller1 = TextEditingController();
  TextEditingController businessnamecontroller2 = TextEditingController();
  TextEditingController businessnamecontroller3 = TextEditingController();
  TextEditingController businessnamecontroller4 = TextEditingController();
  TextEditingController businessnamecontroller5 = TextEditingController();
  TextEditingController businessnamecontroller6 = TextEditingController();
  TextEditingController mpancodecontroller = TextEditingController();

  TextEditingController rhtDFBusinessnamecontroller1 = TextEditingController();
  TextEditingController rhtDFBusinessnamecontroller2 = TextEditingController();
  TextEditingController rhtDFBusinessnamecontroller3 = TextEditingController();
  TextEditingController rhtDFBusinessnamecontroller4 = TextEditingController();
  TextEditingController rhtDFBusinessnamecontroller5 = TextEditingController();
  TextEditingController rhtDFBusinessnamecontroller6 = TextEditingController();
  TextEditingController rhtDFMpancodecontroller = TextEditingController();

  TextEditingController contractstartdatecontroller = TextEditingController();
  TextEditingController energizationcontroller = TextEditingController();
  TextEditingController contractEndDateOther = TextEditingController();

  bool rhtMeter = false;
  String rhtError = '';
  bool mopContract = false;
  bool da_dc_contract = false;
  int contractEndDateSelected = 1;
  int newConnectionSelected = 0;
  int energizationSelected = 0;

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

  void onChangeMPanCode(String val) {
    setState(ViewState.BUSY);
    mpancodecontroller.text = val;
    setState(ViewState.IDLE);
  }

  void onChangeRHTMPanCode(String val) {
    setState(ViewState.BUSY);
    rhtDFMpancodecontroller.text = val;
    setState(ViewState.IDLE);
  }

  DateTime selectedDate = DateTime.now();

  /*DateTime selectedDate = DateTime(
      DateTime.now().year, DateTime.now().month, DateTime.now().day + 21);*/
  DateFormat dateFormat = DateFormat("dd/MM/yyyy");

  Future selectDate(BuildContext context, String fromfield) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: selectedDate.add(new Duration(days: 4)),
        firstDate: selectedDate.add(new Duration(days: 4)),
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

  Future endContractselectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: selectedDate.add(new Duration(days: 5)),
        firstDate: selectedDate.add(new Duration(days: 5)),
        lastDate: DateTime(2101));

    if (picked != null) {
      contractEndDateOther.text = dateFormat.format(picked);
    } else {
      print("not picke");
      contractEndDateOther.text = dateFormat.format(picked);
    }
  }

  Database database = getIt<DatabaseImplementation>();

  DualFuelELECTRICITYCredential credential = DualFuelELECTRICITYCredential();

  void initialData(Function increment) async {
    setState(ViewState.BUSY);
    final data = await DFPref.getDualFuelEleValues();
    final dataBus = await DFPref.getDualFuelBusinessDetailsValues();

    if (data != null) {
      standingCharge.text = data.dfstrStandingCharge;
      dayUnitCharge.text = data.dfstrDayUnit;
      nightUnitCharge.text = data.dfstrNightUnit;
      eweUnitCharge.text = data.dfstrEWEUnit;
      capacityCharge.text = data.dfstrCapacitycharges;
      excessCapacityCharge.text = data.dfstrExceesCapacityCharegs;
      emrCharge.text = data.dfstrEMRCFD;
      //energizationStatus.text = data.strEnergizationstatus;
      energizationcontroller.text = data.dfstrEnergizationstatus;
      dayEAC.text = data.dfelectricityDay_EAC;
      nightEAC.text = data.dfelectricityNight_EAC;
      eweEAC.text = data.dfelectricityEvening_EAC;
      siteCapacity.text = data.dfstrSiteCharge;
      reactiveCharge.text = data.dfstrReactiveCharges;
      fitCharge.text = data.dfstrFITcharge;
      newConnection.text = data.dfstrNewConnection;

      mpancodecontroller.text = data.dfmpanCodeController;

      businessnamecontroller1.text = data.dfbusinessController1;
      businessnamecontroller2.text = data.dfbusinessController2;
      businessnamecontroller3.text = data.dfbusinessController3;
      businessnamecontroller4.text = data.dfbusinessController4;
      businessnamecontroller5.text = data.dfbusinessController5;
      businessnamecontroller6.text = data.dfbusinessController6;

      rhtDFMpancodecontroller.text = data.dffullMpanRHT;

      rhtDFBusinessnamecontroller1.text = data.dfrhtBusinessController1;
      rhtDFBusinessnamecontroller2.text = data.dfrhtBusinessController2;
      rhtDFBusinessnamecontroller3.text = data.dfrhtBusinessController3;
      rhtDFBusinessnamecontroller4.text = data.dfrhtBusinessController4;
      rhtDFBusinessnamecontroller5.text = data.dfrhtBusinessController5;
      rhtDFBusinessnamecontroller6.text = data.dfrhtBusinessController6;
      rhtDFstandingCharge.text = data.rhtStandingCharge;
      rhtDFnightUnitCharge.text = data.rhtNightUnit;
      rhtDFnightEAC.text = data.rhtNightEac;

      contractEndDateOther.text = data.dfOthercontractEndDate;
      contractstartdatecontroller.text = data.dfdteElecStartDate;

      contractEndDateSelected = data.dfdtContractEndDateEle != null
          ? int.tryParse(data.dfdtContractEndDateEle)
          : 0;

      if (data.dfrhtcheckbox == 'true') {
        rhtMeter = true;
      }
      if (data.dfbteMopCustomer == 'true') {
        mopContract = true;
      }
      if (data.dfbteMopDADCCustomer == 'true') {
        da_dc_contract = true;
      }
    }
    setState(ViewState.IDLE);
    setState(ViewState.BUSY);

    if (dataBus?.business_Type != null) {
      print(dataBus?.business_Type.toString() + 'This is business type');
      if (globals.tabController2.length == 10) {
        increment();
      }
    }
    setState(ViewState.IDLE);
  } 

  void onSaveAndNext(BuildContext context) {
    //setState(ViewState.BUSY);
    print('Dual Fuel Save and Next method called');
    print(contractEndDateOther.text + 'hiiiiiiiiiiiiiiiiiiiiiiii');
    DFPref.setDualFuelEleValues(DualFuelELECTRICITYCredential(
      dfwholeMpan: (mpancodecontroller.text +
          businessnamecontroller1.text +
          businessnamecontroller2.text +
          businessnamecontroller3.text +
          businessnamecontroller4.text +
          businessnamecontroller5.text +
          businessnamecontroller6.text),

      dfmpanCodeController: mpancodecontroller.text,

      dffullMpan: mpancodecontroller.text,

      dfbusinessController1: businessnamecontroller1.text,
      dfbusinessController2: businessnamecontroller2.text,
      dfbusinessController3: businessnamecontroller3.text,
      dfbusinessController4: businessnamecontroller4.text,
      dfbusinessController5: businessnamecontroller5.text,
      dfbusinessController6: businessnamecontroller6.text,

      dfwholeRHTMpan: (rhtDFMpancodecontroller.text +
          rhtDFBusinessnamecontroller1.text +
          rhtDFBusinessnamecontroller2.text +
          rhtDFBusinessnamecontroller3.text +
          rhtDFBusinessnamecontroller4.text +
          rhtDFBusinessnamecontroller5.text +
          rhtDFBusinessnamecontroller6.text),
      dffullMpanRHT: rhtDFMpancodecontroller.text,

      dfrhtBusinessController1: rhtDFBusinessnamecontroller1.text,
      dfrhtBusinessController2: rhtDFBusinessnamecontroller2.text,
      dfrhtBusinessController3: rhtDFBusinessnamecontroller3.text,
      dfrhtBusinessController4: rhtDFBusinessnamecontroller4.text,
      dfrhtBusinessController5: rhtDFBusinessnamecontroller5.text,
      dfrhtBusinessController6: rhtDFBusinessnamecontroller6.text,
      rhtStandingCharge: rhtDFstandingCharge.text,
      rhtNightUnit: rhtDFnightUnitCharge.text,
      rhtNightEac: rhtDFnightEAC.text,
      dfOthercontractEndDate: contractEndDateOther.text,
      dfdteElecStartDate: contractstartdatecontroller.text,

      dfdtContractEndDateEle: contractEndDateSelected.toString() != null
          ? contractEndDateSelected.toString()
          : '0',

      //dtContractEndDateEle: contractEndDateSelected.toString(),
      dfstrStandingCharge: standingCharge.text,
      dfstrDayUnit: dayUnitCharge.text,
      dfstrNightUnit: nightUnitCharge.text.toString(),
      dfstrEWEUnit: eweUnitCharge.text.toString(),
      dfstrCapacitycharges: capacityCharge.text.toString(),
      dfstrExceesCapacityCharegs: excessCapacityCharge.text.toString(),
      dfstrEMRCFD: emrCharge.text.toString(),
      dfstrEnergizationstatus: energizationcontroller.text.toString(),
      dfelectricityDay_EAC: dayEAC.text.toString(),
      dfelectricityNight_EAC: nightEAC.text.toString(),
      dfelectricityEvening_EAC: eweEAC.text.toString(),
      dfstrSiteCharge: siteCapacity.text.toString(),
      dfstrReactiveCharges: reactiveCharge.text.toString(),
      dfstrFITcharge: fitCharge.text.toString(),
      dfstrNewConnection: newConnection.text.toString(),
      dfrhtcheckbox: rhtMeter.toString(),
      dfbteMopCustomer: mopContract.toString(),
      dfbteMopDADCCustomer: da_dc_contract.toString(),
    ));
    globals.tabController2.animateTo(1);

    // setState(ViewState.IDLE);
  }
}
