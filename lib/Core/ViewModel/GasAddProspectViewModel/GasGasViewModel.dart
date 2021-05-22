import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:pozitive/Core/Model/Api/Gas-Insert-AddProspect/Gas_Gas_Credential.dart';
import 'package:pozitive/Util/gas_Pref.dart';
import 'package:pozitive/Core/Services/database.dart';
import 'package:pozitive/Core/ViewModel/baseModel.dart';
import 'package:pozitive/Core/enums/view_state.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pozitive/Util/global.dart' as globals;

import '../../baseview.dart';

Database database = getIt<DatabaseImplementation>();

GasGasCredential credential = GasGasCredential();

class GasGasAddProspectViewModel extends BaseModel {
  bool autovalidation = false;
  String contractStartDate;
  var mprnController = MaskedTextController(mask: '0000000000');
  TextEditingController contractStartDateController = TextEditingController();
  TextEditingController standingCharge = TextEditingController();
  TextEditingController unitCharge = TextEditingController();
  TextEditingController aq = TextEditingController();
  TextEditingController contractEndDate = TextEditingController();

  DateTime selectedDate = DateTime.now();
  DateFormat dateFormat = DateFormat("dd/MM/yyyy");

  Future selectDateContractStart(BuildContext context, String fromfield) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: selectedDate.add(new Duration(days: 21)),
        firstDate: selectedDate.add(new Duration(days: 21)),
        lastDate: DateTime(2101));
    if (picked != null) {
      setState(ViewState.BUSY);
      contractStartDateController.text = dateFormat.format(picked);
      contractStartDate = "";
    } else {
      contractStartDate = "please select date";
      //  return 'please select date';
    }
  }

  Future endContractselectDate(BuildContext context, String fromfield) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: selectedDate.add(new Duration(days: 22)),
        firstDate: selectedDate.add(new Duration(days: 22)),
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

  int contractEndDateSelected = 1;

  void initialData(Function increment) async {
    final busData = await GasPref.getGasBusinessValues();
    final data = await GasPref.getGasGasValues();

    setState(ViewState.BUSY);

    if (data != null) {
      mprnController.text = data.fullMprn;
      contractStartDateController.text = data.dteGasStartDate;
      contractEndDateSelected = data.intContractEndDateSelected != null
          ? int.parse(data.intContractEndDateSelected)
          : 0;
      standingCharge.text = data.strStandingChargeGas;
      unitCharge.text = data.strUnitPriceGas;
      aq.text = data.aqGasCharge;
      contractEndDate.text = data.endDate.toString();
    }
    setState(ViewState.IDLE);

    setState(ViewState.BUSY);

    if (busData?.gbusiness_Type != null) {
      print(busData?.gbusiness_Type.toString() + 'This is business type');
      if (globals.tabController.length == 9) {
        increment();
      }
    }
    setState(ViewState.IDLE);
  }

  void onSaveAndNextFinal() {
    setState(ViewState.BUSY);
    GasPref.setGasGasValues(GasGasCredential(
      fullMprn: mprnController.text,
      dteGasStartDate: contractStartDateController.text,
      intContractEndDateSelected: contractEndDateSelected.toString() != null
          ? contractEndDateSelected.toString()
          : '',
      endDate: contractEndDate.text,
      strStandingChargeGas: standingCharge.text,
      strUnitPriceGas: unitCharge.text,
      aqGasCharge: aq.text,
    ));
    setState(ViewState.IDLE);
  }
}
