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

class ElectricityViewModel extends BaseModel {
  Database database = getIt<DatabaseImplementation>();

  TextEditingController contractMpanCode = TextEditingController();
  TextEditingController contractMpan1 = TextEditingController();
  TextEditingController contractMpan2 = TextEditingController();
  TextEditingController contractMpan3 = TextEditingController();
  TextEditingController contractMpan4 = TextEditingController();
  TextEditingController contractMpan5 = TextEditingController();
  TextEditingController contractMpan6 = TextEditingController();
  TextEditingController contractStandingCharge = TextEditingController();
  TextEditingController contractDayCharge = TextEditingController();
  TextEditingController contractNightCharge = TextEditingController();
  TextEditingController contractEweCharge = TextEditingController();
  TextEditingController contractCapacityCharge = TextEditingController();
  TextEditingController contractSupplyCapacityCharge = TextEditingController();
  TextEditingController contractExcessCapacityCharge = TextEditingController();
  TextEditingController contractReactiveCharge = TextEditingController();
  TextEditingController contractStartDate = TextEditingController();
  TextEditingController contractEndDate = TextEditingController();

  List mpancodelist = ["00", "01", "02", "03", "04", "05", "06", "07", "08"];

  Widget mpancodeview() {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: mpancodelist.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            child: ListTile(
              title: Text(
                mpancodelist[index],
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              onTap: () {
                onChangeMPanCode(mpancodelist[index]);

                Navigator.pop(context);
              },
            ),
          );
        });
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

  void onChangeMPanCode(String val) {
    setState(ViewState.BUSY);
    contractMpanCode.text = val;
    setState(ViewState.IDLE);
  }

  void onSaveAndNext() {
    setState(ViewState.BUSY);
    IndividualContractPref.setContractElectricity(
      SaveAndGenerateContractAddMethodCredential(
        strMPAN1: contractMpanCode.text,
        strMPAN2: contractMpan1.text,
        strMPAN3: contractMpan2.text,
        strMPAN4: contractMpan3.text,
        strMPAN5: contractMpan4.text,
        strMPAN6: contractMpan5.text,
        strMPAN7: contractMpan6.text,
        strSCE: contractStandingCharge.text,
        strDayUnitE: contractDayCharge.text,
        strNightUnit: contractNightCharge.text,
        strEweUnit: contractEweCharge.text,
        strcapacitycharge: contractCapacityCharge.text,
        strexcesscapacity: contractExcessCapacityCharge.text,
        strreactivecharge: contractReactiveCharge.text,
        strContractStartDate: contractStartDate.text,
        strContractEndDate: contractEndDate.text,
      ),
    );
    setState(ViewState.IDLE);
    globals.tabController6.animateTo(6);
  }

  void setElectricityDetails(
      SaveAndGenerateContractIndividualModel individualModel) {
    setState(ViewState.BUSY);
    contractMpanCode.text = individualModel.strMPAN1;
    contractMpan1.text = individualModel.strMPAN2;
    contractMpan2.text = individualModel.strMPAN3;
    contractMpan3.text = individualModel.strMPAN4;
    contractMpan4.text = individualModel.strMPAN5;
    contractMpan5.text = individualModel.strMPAN6;
    contractMpan6.text = individualModel.strMPAN7;
    contractStandingCharge.text = individualModel.strSCE;
    contractDayCharge.text = individualModel.strDayUnitE;
    contractNightCharge.text = individualModel.strNightUnit;
    contractEweCharge.text = individualModel.strEweUnit;
    contractCapacityCharge.text = individualModel.strcapacitycharge;
    contractSupplyCapacityCharge.text = individualModel.strSupplyCapacity;
    contractExcessCapacityCharge.text = individualModel.strexcesscapacity;
    contractReactiveCharge.text = individualModel.strreactivecharge;
    contractStartDate.text = individualModel.strContractStartDate;
    contractEndDate.text = individualModel.strContractEndDate;
    setState(ViewState.IDLE);
  }
}
