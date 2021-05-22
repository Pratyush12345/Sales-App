import 'package:pozitive/Core/ViewModel/baseModel.dart';
import 'package:pozitive/Core/Services/database.dart';
import 'package:get_it/get_it.dart';
import 'package:pozitive/Core/enums/view_state.dart';
import 'package:flutter/material.dart';
import 'package:pozitive/Core/Model/sharePrefModel/SaveAndGenerateContractIndividualModel.dart';
import 'package:pozitive/Util/IndividualContractPref.dart';
import 'package:pozitive/Core/Model/Api/SaveAndGenerateContractAddMethodCredential.dart';
import 'package:pozitive/Util/global.dart' as globals;
import 'package:intl/intl.dart';

GetIt getIt = GetIt.instance;

class GasViewModel extends BaseModel {
  Database database = getIt<DatabaseImplementation>();
  TextEditingController contractMprn = TextEditingController();
  TextEditingController contractSc = TextEditingController();
  TextEditingController contractUnitPrice = TextEditingController();
  TextEditingController contractStartDate = TextEditingController();
  TextEditingController contractEndDate = TextEditingController();

  void onSaveAndNext() {
    setState(ViewState.BUSY);
    IndividualContractPref.setContractGas(
      SaveAndGenerateContractAddMethodCredential(
        strMPRN: contractMprn.text,
        strSCG: contractSc.text,
        strDayUnitG: contractUnitPrice.text,
        strContractStartDateGas: contractStartDate.text,
        strContractEndDateGas: contractEndDate.text,
      ),
    );
    setState(ViewState.IDLE);
    globals.tabController6.animateTo(7);
  }

  DateTime selectedDate = DateTime.now();
  DateFormat dateFormat = DateFormat("yyyy-MM-dd");
  Future selectDate(BuildContext context, String fromfield) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null) {
      if (fromfield == "Required") {
        setState(ViewState.BUSY);
        contractStartDate.text = dateFormat.format(picked);
        setState(ViewState.IDLE);
      } else {
        setState(ViewState.BUSY);
        contractStartDate.text = dateFormat.format(picked);
        setState(ViewState.IDLE);
      }
    }
  }

  Future selectDate2(BuildContext context, String fromfield) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null) {
      if (fromfield == "Required") {
        setState(ViewState.BUSY);
        contractEndDate.text = dateFormat.format(picked);
        setState(ViewState.IDLE);
      } else {
        setState(ViewState.BUSY);
        contractEndDate.text = dateFormat.format(picked);
        setState(ViewState.IDLE);
      }
    }
  }

  void setDetails(SaveAndGenerateContractIndividualModel individualModel) {
    setState(ViewState.BUSY);
    contractMprn.text = individualModel.strMPRN;
    contractSc.text = individualModel.strSCG;
    contractUnitPrice.text = individualModel.strDayUnitG;
    contractStartDate.text = individualModel.strContractStartDateGas;
    contractEndDate.text = individualModel.strContractEndDateGas;
    setState(ViewState.IDLE);
  }
}
