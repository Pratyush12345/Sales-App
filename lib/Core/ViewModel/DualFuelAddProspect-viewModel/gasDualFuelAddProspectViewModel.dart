import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:pozitive/Core/Model/Api/DualFuel-InsertAddProspect/GasCredential.dart';
import 'package:pozitive/Core/Services/database.dart';
import 'package:pozitive/Core/ViewModel/baseModel.dart';
import 'package:pozitive/Core/enums/view_state.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pozitive/Core/Model/Api/DualFuel-InsertAddProspect/ElectricityCredential.dart';
import 'package:pozitive/Core/Model/Api/DualFuel-InsertAddProspect/DualFuelBusinessCredential.dart';
import 'package:pozitive/Core/Model/Api/DualFuel-InsertAddProspect/DualFuelSiteAddressCredential.dart';
import 'package:pozitive/Core/Model/Api/DualFuel-InsertAddProspect/DualFuelPaymentCredential.dart';
import 'package:pozitive/Core/Model/Api/DualFuel-InsertAddProspect/DualFuelBillingAddressCredential.dart';
import 'package:pozitive/Core/Model/Api/DualFuel-InsertAddProspect/DualFuelAccountManagerCredential.dart';
import 'package:pozitive/Util/dualFuel_Pref.dart';
import '../../baseview.dart';

Database database = getIt<DatabaseImplementation>();

DualFuelGasCredential credential = DualFuelGasCredential();

class DualFuelGasAddProspectViewModel extends BaseModel {
  var mprnController = MaskedTextController(mask: '0000000000');
  bool autovalidation = false;

  TextEditingController contractStartDateController = TextEditingController();
  TextEditingController standingCharge = TextEditingController();
  TextEditingController unitCharge = TextEditingController();
  TextEditingController aq = TextEditingController();
  DateTime selectedDate = DateTime.now();
  TextEditingController contractEndDate = TextEditingController();

  int contractEndDateSelected = 1;

  DateFormat dateFormat = DateFormat("dd/MM/yyyy");
  Future selectDate(BuildContext context, String fromfield) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: selectedDate.add(new Duration(days: 21)),
        firstDate: selectedDate.add(new Duration(days: 21)),
        lastDate: DateTime(2101));
    if (picked != null) {
      if (fromfield == "Contract Start Date") {
        setState(ViewState.BUSY);
        contractStartDateController.text = dateFormat.format(picked);
      } else if (fromfield == "Preferred") {
      } else {}
    }
  }

  Future otherSelectDate(BuildContext context, String fromfield) async {
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

  void initialData() async {
    final data = await DFPref.getDualFuelGasValues();
    setState(ViewState.BUSY);

    if (data != null) {
      mprnController.text = data.fullMprn;
      contractStartDateController.text = data.dfdteGasStartDate;
      standingCharge.text = data.strStandingChargeGas;
      unitCharge.text = data.strUnitPriceGas;
      aq.text = data.aqCharge;
      contractEndDateSelected =
          data.dfgasEndDate != null ? int.parse(data.dfgasEndDate) : 0;
      contractEndDate.text = data.dfgascontractEndDate;
    }
    setState(ViewState.IDLE);
  }

  void onSaveAndNext() {
    setState(ViewState.BUSY);
    DFPref.setDualFuelGasValues(DualFuelGasCredential(
      fullMprn: mprnController.text,
      dfdteGasStartDate: contractStartDateController.text,
      dfgasEndDate: contractEndDateSelected.toString(),
      dfgascontractEndDate: contractEndDate.text,
      //enddate
      strStandingChargeGas: standingCharge.text,
      strUnitPriceGas: unitCharge.text,
      aqCharge: aq.text,
      //aq
    ));
    setState(ViewState.IDLE);
  }

  DualFuelELECTRICITYCredential electricity;
  DualFuelGasCredential gas;
  DualFuelBusinessCredential business;
  DualFuelSiteAddressCredential siteAdd;
  DualFuelBillingAddressCredential billingadd;
  DualFuelAccountManagerCredential acManager;
  DualFuelPaymentCredential paymentDetail;

  void getDataFromPref() async {
    setState(ViewState.BUSY);
    electricity = await DFPref.getDualFuelEleValues();
    gas = await DFPref.getDualFuelGasValues();
    business = await DFPref.getDualFuelBusinessDetailsValues();
    siteAdd = await DFPref.getDualFuelSiteAddressValues();
    billingadd = await DFPref.getDualFuelBillingAddressValues();
    acManager = await DFPref.getDualFuelAccountManagerValues();
    paymentDetail = await DFPref.getDualFuelPaymentDetails();

    setState(ViewState.IDLE);
  }
}
