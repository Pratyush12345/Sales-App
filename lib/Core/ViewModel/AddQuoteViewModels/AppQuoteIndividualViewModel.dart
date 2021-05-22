import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pozitive/Core/Model/sharePrefModel/quotation_individual_model.dart';
import 'package:pozitive/Core/Services/database.dart';
import 'package:pozitive/Core/ViewModel/baseModel.dart';
import 'package:pozitive/Core/enums/view_state.dart';
import 'package:pozitive/Util/Pref.dart';
import 'package:pozitive/Util/theme.dart';

import '../../baseview.dart';

class AddQuoteIndividualViewModel extends BaseModel {
  Database database = getIt<DatabaseImplementation>();
  TextEditingController partnerController = TextEditingController();
  TextEditingController businessNameController = TextEditingController();
  TextEditingController postCodeController = TextEditingController();
  TextEditingController requireByDateController = TextEditingController();
  TextEditingController preferredDateController = TextEditingController();

  String otherString;

  DateTime selectedDate = DateTime.now();
  DateFormat dateFormat = DateFormat("dd/MM/yyyy");
  DateFormat dateRFormat = DateFormat("dd/MM/yyyy hh:mm");
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  ThemeApp themeApp = ThemeApp();
  bool _autovalidation = false;
  int tpm = 0, green = 0;
  int termSelected = 0;
  bool oneYear = false;
  bool twoYear = false;
  bool threeYear = false;
  bool other = false;
  bool all = false;
  bool customerThirdPartyMop = false;
  bool dcDA = false;
  bool starkDcDa = false;
  bool singleRate = false;
  void toggleThirdPartyMop() {
    setState(ViewState.BUSY);
    customerThirdPartyMop = !customerThirdPartyMop;
    setState(ViewState.IDLE);
  }

  void toggleDcDa() {
    setState(ViewState.BUSY);
    dcDA = !dcDA;
    setState(ViewState.IDLE);
  }

  void toggleStarkDcDa() {
    setState(ViewState.BUSY);
    starkDcDa = !starkDcDa;
    setState(ViewState.IDLE);
  }

  void toggleSingleRate() {
    setState(ViewState.BUSY);
    singleRate = !singleRate;
    setState(ViewState.IDLE);
  }

  String get getYear {
    if (oneYear) {
      return 'One year';
    }
    if (twoYear) {
      return 'Two year';
    }
    if (threeYear) {
      return 'Three';
    }
    if (other) {
      return 'Others';
    }
    if (all) {
      return 'all';
    }
    return '';
  }

  void initializeData() async {
    setState(ViewState.BUSY);
    final data = await Prefs.getQuotationInvidualDetails();
    if (data != null) {
      businessNameController.text = data.businessName;
      postCodeController.text = data.postCode;
      requireByDateController.text = data.requireByDate;
      preferredDateController.text = data.preferredByDate;
      // tpm = data.rateType != null ? int.tryParse(data.rateType) : 0;
      if (data.isforOtheryear != null && data.isforOtheryear != '') {
        other = true;
        otherString = data.isforOtheryear;
      }
      if (data.isforFirstyear == 'true') {
        oneYear = true;
      }
      if (data.isforSecondyear == 'true') {
        twoYear = true;
      }
      if (data.isforThirdyear == 'true') {
        threeYear = true;
      }
      if (data.intDADCId == '1') {
        dcDA = true;
      }

      if (data.thirdPartyMOP == 'true') {
        customerThirdPartyMop = true;
      }
      if (data.singleRate == 'true') {
        singleRate = true;
      }
      if (data.isStarkDADC == 'true') {
        starkDcDa = true;
      }
    }
    setState(ViewState.IDLE);
  }

  void toggleOneYear() {
    setState(ViewState.BUSY);
    oneYear = !oneYear;
    setState(ViewState.IDLE);
  }

  void toggleTwoYear() {
    setState(ViewState.BUSY);
    twoYear = !twoYear;
    setState(ViewState.IDLE);
  }

  void toggleThreeYear() {
    setState(ViewState.BUSY);
    threeYear = !threeYear;
    setState(ViewState.IDLE);
  }

  void toggleOther(BuildContext context) {
    setState(ViewState.BUSY);
    other = !other;
    if (other) {
      selectDate(context, 'others');
    }
    setState(ViewState.IDLE);
  }

  void toggleAll() {
    setState(ViewState.BUSY);
    all = !all;
    if (all) {
      oneYear = true;
      twoYear = true;
      threeYear = true;
    }
    setState(ViewState.IDLE);
  }

  // void onChangeTpm(int val) {
  //   setState(ViewState.BUSY);
  //   tpm = val;
  //   setState(ViewState.IDLE);
  // }

  void onChangeGreen(int val) {
    setState(ViewState.BUSY);
    green = val;
    setState(ViewState.IDLE);
  }

  Future selectDate(BuildContext context, String fromfield) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null) {
      if (fromfield == "Required") {
        requireByDateController.text = dateRFormat.format(picked);
      } else if (fromfield == 'others') {
        otherString = dateFormat.format(picked);
      } else {
        preferredDateController.text = dateFormat.format(picked);
      }
      setState(ViewState.IDLE);
    }
  }

  void onSaveAnNext(String quoteID, String accountID) async {
    setState(ViewState.BUSY);
    Prefs.setQuotationInvidualDetails(QuotationIndividualModel(
        businessName: businessNameController.text,
        postCode: postCodeController.text,
        preferredByDate: preferredDateController.text,
        requireByDate: requireByDateController.text,
        // rateType: tpm.toString(),
        terms: getYear,
        isforFirstyear: oneYear.toString(),
        isforSecondyear: twoYear.toString(),
        isforThirdyear: threeYear.toString(),
        isforOtheryear: other ? otherString : 'false',
        singleRate: singleRate.toString(),
        isStarkDADC: starkDcDa.toString(),
        intDADCId: dcDA ? '1' : '0',
        thirdPartyMOP: customerThirdPartyMop.toString(),
        thirdPartyDADC: dcDA.toString()));
//    SaveButtonResponse response=await database.updateRequestQuoteIndividual(UpdateButtonCredentials(
//      accountId: accountID,
//      quoteid: quoteID,
//      preferredStartDate: preferredDateController.text,
//      businessName: businessNameController.text,
//      postCode: postCodeController.text,
//      requiredByDate: requireByDateController.text,
//      isforFirstyear: oneYear.toString(),
//      isforSecondyear: twoYear.toString(),
//      isforThirdyear: threeYear.toString(),
//      isforOtheryear: other.toString(),
//      singleRate:singleRate.toString(),
//      isStarkDADC: starkDcDa.toString(),
//      intDADCId: dcDA?'1':'0',
//      thirdPartyMOP: customerThirdPartyMop.toString(),
//        thirdPartyDADC: dcDA.toString()
//
//
//    ));
//    print(response.toJson());
//    SaveButtonResponse response=await database.saveRequestQuoteIndividual(SaveButtonCredentials(
//      accountID: accountID,
//      quoteID: quoteID,
//      nextPreferredStartDate: preferredDateController.text,
//      termType: getYear,
//
//
//    ));

    setState(ViewState.IDLE);
  }
}
