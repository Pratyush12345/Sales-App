import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pozitive/Core/Model/Api/ask_for_requote_credential..dart';
import 'package:pozitive/Core/Model/request_quote_viewbutton_model.dart';
import 'package:pozitive/Core/Model/sharePrefModel/quotation_individual_model.dart';
import 'package:pozitive/Core/Services/database.dart';
import 'package:pozitive/Core/ViewModel/baseModel.dart';
import 'package:pozitive/Core/enums/view_state.dart';
import 'package:pozitive/Util/Pref.dart';
import 'package:pozitive/Util/theme.dart';
import 'package:pozitive/Util/global.dart' as globals;
import '../../baseview.dart';

class QuotationIndividualViewModel extends BaseModel {
  Database database = getIt<DatabaseImplementation>();
  RequestQuoteViewButtonModel requestQuoteViewButtonModel =
      RequestQuoteViewButtonModel();

  TextEditingController partnerController = TextEditingController();
  TextEditingController businessNameController = TextEditingController();
  TextEditingController postCodeController = TextEditingController();
  TextEditingController requireByDateController = TextEditingController();
  TextEditingController preferredDateController = TextEditingController();
  TextEditingController otherDateController = TextEditingController();

  String errorMsg;
  //String otherString;
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
  bool fourYear = false;
  bool fiveYear = false;
  bool other = false;
  bool all = false;
  bool customerThirdPartyMop = false;
  bool dcDA = false;
  bool starkDcDa = false;
  bool singleRate = false;
  bool enableField = true;

  void getViewQuoteViewButtonDetails(String accountId, String type,
      String quoteId, BuildContext context) async {
    setState(ViewState.BUSY);

    RequestQuoteViewButtonModel requestQuoteViewButtonModel =
        await database.getRequestQuoteViewButtonDetails(
      RequestQuoteViewButtonCredential(
        accountId: accountId,
        type: type,
        quoteId: quoteId,
      ),
    );
  }

  bool termsSelect;
  bool checkTerms() {
    if (oneYear ||
        twoYear ||
        threeYear ||
        fourYear ||
        fiveYear ||
        other ||
        all) {
      setState(ViewState.BUSY);

      errorMsg = null;
      termsSelect = true;
      setState(ViewState.IDLE);
    } else {
      setState(ViewState.BUSY);

      termsSelect = false;
      setState(ViewState.BUSY);
    }

    setState(ViewState.IDLE);
    return termsSelect;
  }

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
    if (fourYear) {
      return 'Four';
    }
    if (fiveYear) {
      return 'Five';
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
      //tpm = data.rateType != null ? int.tryParse(data.rateType) : 0;
      if (data.isforOtheryear != null && data.isforOtheryear != '') {
        other = true;

        // otherString = data.isforOtheryear;
      }
      // if (data.isforOtheryear == 'true') {
      //   otherString = data.otherString;
      // }
      if (data.isforFirstyear == 'true') {
        oneYear = true;
      }
      if (data.isforSecondyear == 'true') {
        twoYear = true;
      }
      if (data.isforThirdyear == 'true') {
        threeYear = true;
      }
      if (data.isforFourthyear == 'true') {
        fourYear = true;
      }
      if (data.isForFifthyear == 'true') {
        fiveYear = true;
      }
      if (data.isforOtheryear == 'true') {
        other = true;
        otherDateController.text = data.endDate;
      }
      if (data.isForAllYearTerms == 'true') {
        all = true;
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

  void toggleFourYear() {
    setState(ViewState.BUSY);

    fourYear = !fourYear;
    setState(ViewState.IDLE);
  }

  void toggleFiveYear() {
    setState(ViewState.BUSY);

    fiveYear = !fiveYear;
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
      fourYear = true;
      fiveYear = true;
    }
    if (!all) {
      oneYear = false;
      twoYear = false;
      threeYear = false;
      fourYear = false;
      fiveYear = false;
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
    DateTime picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime.now(),
        lastDate: DateTime(2101));
    if (picked != null) {
      if (fromfield == "Required") {
        print(requireByDateController.text);
        requireByDateController.text = dateRFormat.format(picked);
      }
      if (fromfield == "Preferred") {
        preferredDateController.text = dateFormat.format(picked);
      }
      if (fromfield == 'others') {
        otherDateController.text = dateFormat.format(picked);
      }
      // else {
      //   preferredDateController.text = dateFormat.format(DateTime.now());
      //   requireByDateController.text = dateRFormat.format(DateTime.now());
      //   // }
      // }
      // if (picked == null) {
      //   requireByDateController.text = dateRFormat.format(DateTime.now());
      //   preferredDateController.text = dateFormat.format(DateTime.now());
      // }
      setState(ViewState.IDLE);
    }
  }

  void onSaveAnNext(
      String quoteID, String accountID, BuildContext context) async {
    setState(ViewState.BUSY);
    if (requireByDateController.text == '') {
      requireByDateController.text =
          dateRFormat.format(DateTime.now()).toString();
    }
    if (preferredDateController.text.isEmpty) {
      preferredDateController.text =
          dateFormat.format(DateTime.now()).toString();
    }

    Prefs.setQuotationInvidualDetails(QuotationIndividualModel(
        businessName: businessNameController.text,
        postCode: postCodeController.text,
        preferredByDate: preferredDateController.text,
        requireByDate: requireByDateController.text,
        endDate: otherDateController.text,
        //rateType: tpm.toString(),
        terms: getYear,
        isforFirstyear: oneYear.toString(),
        isforSecondyear: twoYear.toString(),
        isforThirdyear: threeYear.toString(),
        isforFourthyear: fourYear.toString(),
        isForFifthyear: fiveYear.toString(),
        // isforOtheryear: other ? otherDateController.text : 'false',
        // isforOtheryear: other ? otherDateController.text : "",
        isforOtheryear: other.toString() ?? "false",
        isForAllYearTerms: all.toString(),
        singleRate: singleRate.toString(),
        isStarkDADC: starkDcDa.toString(),
        intDADCId: dcDA ? '1' : '0',
        thirdPartyMOP: customerThirdPartyMop.toString(),
        thirdPartyDADC: dcDA.toString()));
    print(all.toString());
    setState(ViewState.IDLE);

    globals.tabController7.animateTo(1);
  }
}
