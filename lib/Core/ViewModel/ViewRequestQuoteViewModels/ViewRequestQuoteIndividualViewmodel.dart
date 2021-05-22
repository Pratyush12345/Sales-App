import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pozitive/Core/Model/Api/ask_for_requote_credential..dart';
import 'package:pozitive/Core/Model/request_quote_viewbutton_model.dart';
import 'package:pozitive/Core/Model/user.dart';
import 'package:pozitive/Core/Services/database.dart';
import 'package:pozitive/Core/ViewModel/baseModel.dart';
import 'package:pozitive/Core/enums/view_state.dart';
import 'package:pozitive/Util/Pref.dart';
import 'package:pozitive/Util/theme.dart';
import 'dart:io';
import 'package:pozitive/Core/AppConstact/appConstant.dart';
import '../../baseview.dart';
import 'package:pozitive/Core/Model/Api/quotation_invidual/supply_point_credentials.dart';
import 'package:pozitive/Core/Model/response_model.dart';

class ViewRequestQuoteIndividualViewModel extends BaseModel {
  Database database = getIt<DatabaseImplementation>();
  RequestQuoteViewButtonModel requestQuoteViewButtonModel =
      RequestQuoteViewButtonModel();

  //

  TextEditingController partnerController = TextEditingController();
  TextEditingController businessNameController = TextEditingController();
  TextEditingController postCodeController = TextEditingController();
  TextEditingController requireByDateController = TextEditingController();
  TextEditingController preferredDateController = TextEditingController();
  TextEditingController mprn = TextEditingController();
  TextEditingController aqCharge = TextEditingController();
  //--------------------
  TextEditingController mpancodecontroller = TextEditingController();
  TextEditingController mpanOneController = TextEditingController();
  TextEditingController mpanTwoController = TextEditingController();
  TextEditingController mpanThreeController = TextEditingController();
  TextEditingController mpanFourController = TextEditingController();
  TextEditingController mpanFiveController = TextEditingController();
  TextEditingController mpanSixController = TextEditingController();
  TextEditingController dayEacController = TextEditingController();
  TextEditingController nightEacController = TextEditingController();
  TextEditingController eweEacController = TextEditingController();
  String wholeMpan;

  File pdfFile;
  String path;
  String sampleFileUrl;

  String otherString;

  DateTime selectedDate = DateTime.now();
  DateFormat dateFormat = DateFormat("dd/MM/yyyy");
  DateFormat dateRFormat = DateFormat("dd/MM/yyyy hh:mm");
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
  ThemeApp themeApp = ThemeApp();
  bool autovalidation = false;
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

  void onChangeMPanCode(String val) {
    setState(ViewState.BUSY);
    mpancodecontroller.text = val;
    setState(ViewState.IDLE);
  }

  void getViewQuoteViewButtonDetails(String accountId, String type,
      String quoteId, BuildContext context) async {
    setState(ViewState.BUSY);
    print('reached here');

    requestQuoteViewButtonModel =
        await database.getRequestQuoteViewButtonDetails(
      RequestQuoteViewButtonCredential(
        accountId: '7257',
        type: 'individual',
        quoteId: '54550',
      ),
    );

    setDetails();
    setElecDetails();
    setState(ViewState.IDLE);
  }

  void onClickSupplyPointDetails(String accountID, BuildContext context) async {
    setState(ViewState.BUSY);
    User _user = await Prefs.getUser();
    ResponseMessage response = await database.submitSupplyPointDetails(
        SupplyPointCredentials(
            strMPANMPRN: mpancodecontroller.text +
                mpanOneController.text +
                mpanTwoController.text +
                mpanThreeController.text +
                mpanFourController.text +
                mpanFiveController.text +
                mpanSixController.text,
            fuelType: 'individual',
            accountId: _user.accountId));

    if (response.status == 1) {
      AppConstant.showSuccessToast(context, response.msg);
    } else {
      AppConstant.showFailToast(context, response.msg);
    }

    setState(ViewState.IDLE);
  }

  void setDetails() {
    setState(ViewState.BUSY);
    print('reached on set detaills');
    mpancodecontroller.text = requestQuoteViewButtonModel.mPAN1 ?? "";
    mpanOneController.text = requestQuoteViewButtonModel.mPAN2 ?? "";
    mpanTwoController.text = requestQuoteViewButtonModel.mPAN3 ?? "";
    mpanThreeController.text = requestQuoteViewButtonModel.mPAN4 ?? "";
    mpanFourController.text = requestQuoteViewButtonModel.mPAN5 ?? "";
    mpanFiveController.text = requestQuoteViewButtonModel.mPAN6 ?? "";
    mpanSixController.text = requestQuoteViewButtonModel.mPAN7 ?? "";
    dayEacController.text = requestQuoteViewButtonModel.eACDay ?? "";
    nightEacController.text = requestQuoteViewButtonModel.eACNight ?? "";
    eweEacController.text = requestQuoteViewButtonModel.eACEWE ?? "";
    pdfFile = requestQuoteViewButtonModel.image64HHFile;
    businessNameController.text =
        requestQuoteViewButtonModel.businessName ?? "";
    postCodeController.text = requestQuoteViewButtonModel.postCode ?? '';
    oneYear = requestQuoteViewButtonModel.isforFirstyear ?? '';
    twoYear = requestQuoteViewButtonModel.isforSecondyear ?? '';
    threeYear = requestQuoteViewButtonModel.isforThirdyear ?? '';
    fourYear = requestQuoteViewButtonModel.isforFourthyear ?? '';
    fiveYear = requestQuoteViewButtonModel.isforFifthyear ?? '';
    other = requestQuoteViewButtonModel.isforOtheryear ?? '';
    requireByDateController.text =
        requestQuoteViewButtonModel.requiredByDate ?? '';
    preferredDateController.text =
        requestQuoteViewButtonModel.preferredStartDate ?? '';
    customerThirdPartyMop = requestQuoteViewButtonModel.thirdPartyMOP ?? '';
    dcDA = requestQuoteViewButtonModel.thirdPartyDADC ?? '';
    starkDcDa = requestQuoteViewButtonModel.isStarkDADC ?? '';
    singleRate = requestQuoteViewButtonModel.singleRate ?? '';
    //
    mprn.text = requestQuoteViewButtonModel.mPRN ?? '';
    aqCharge.text = requestQuoteViewButtonModel.aQ ?? '';
    setState(ViewState.IDLE);
  }

  void setElecDetails() {
    setState(ViewState.BUSY);
    print('i m here');
    mpancodecontroller.text = requestQuoteViewButtonModel.mPAN1 ?? "";
    mpanOneController.text = requestQuoteViewButtonModel.mPAN2 ?? "";
    mpanTwoController.text = requestQuoteViewButtonModel.mPAN3 ?? "";
    mpanThreeController.text = requestQuoteViewButtonModel.mPAN4 ?? "";
    mpanFourController.text = requestQuoteViewButtonModel.mPAN5 ?? "";
    mpanFiveController.text = requestQuoteViewButtonModel.mPAN6 ?? "";
    mpanSixController.text = requestQuoteViewButtonModel.mPAN7 ?? "";
    dayEacController.text = requestQuoteViewButtonModel.eACDay ?? "";
    nightEacController.text = requestQuoteViewButtonModel.eACNight ?? "";
    eweEacController.text = requestQuoteViewButtonModel.eACEWE ?? "";
    setState(ViewState.IDLE);
  }
}
