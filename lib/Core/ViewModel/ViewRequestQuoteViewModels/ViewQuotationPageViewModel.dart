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
import 'package:pozitive/Core/Services/DownloadService.dart';
import 'package:pozitive/Core/Model/Api/quotation_invidual/supply_point_credentials.dart';
import 'package:pozitive/Core/Model/response_model.dart';
import 'package:pozitive/Core/AppConstact/appConstant.dart';
import 'package:pozitive/Core/Model/Api/account_credential.dart';
import 'dart:io';
import '../../baseview.dart';

class ViewRequestQuoteViewModel extends BaseModel {
  Database database = getIt<DatabaseImplementation>();
  RequestQuoteViewButtonModel requestQuoteViewButtonModel =
      RequestQuoteViewButtonModel();

  TextEditingController partnerController = TextEditingController();
  // TextEditingController businessNameController = TextEditingController();
  String businessNameController;
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

  int noOfTabs = 0;
  int oneYearTabs = 0;
  int twoYearTabs = 0;
  int threeYearTabs = 0;
  int fourYearTabs = 0;
  int fiveYearTabs = 0;

  int requiredTabs() {
    if (requestQuoteViewButtonModel.isforFirstyear) {
      noOfTabs = noOfTabs + 2;
      oneYearTabs = 2;
    }
    if (requestQuoteViewButtonModel.isforSecondyear) {
      noOfTabs = noOfTabs + 2;
      twoYearTabs = 2;
    }
    if (requestQuoteViewButtonModel.isforThirdyear) {
      noOfTabs = noOfTabs + 2;
      threeYearTabs = 2;
    }
    if (requestQuoteViewButtonModel.isforFourthyear) {
      noOfTabs = noOfTabs + 2;
      fourYearTabs = 2;
    }
    if (requestQuoteViewButtonModel.isforFifthyear) {
      noOfTabs = noOfTabs + 2;
      fiveYearTabs = 2;
    }
    print('No of tabs needed $noOfTabs');
    return noOfTabs;
  }

  void onChangeMPanCode(String val) {
    setState(ViewState.BUSY);
    mpancodecontroller.text = val;
    setState(ViewState.IDLE);
  }

  void getViewQuoteViewButtonDetails(
      String type, String quoteId, BuildContext context) async {
    setState(ViewState.BUSY);
    print('reached here');
    User _user = await Prefs.getUser();

    requestQuoteViewButtonModel =
        await database.getRequestQuoteViewButtonDetails(
      RequestQuoteViewButtonCredential(
        accountId: _user.accountId,
        type: type,
        quoteId: quoteId,
      ),
    );

    setState(ViewState.IDLE);
  }

  void onDownloadSampleFile(String accountID) async {
    sampleFileUrl = await database.getIndividulHHSampleFileAttachmentUrl(
        AccountCredential(accountID: accountID));
    print('object=$sampleFileUrl');
    DownloadService.downloadFromUrl(sampleFileUrl);
  }

  void onClickSupplyPointDetails(String accountID, BuildContext context) async {
    setState(ViewState.BUSY);
    ResponseMessage response = await database.submitSupplyPointDetails(
        SupplyPointCredentials(
            strMPANMPRN: mpancodecontroller.text +
                mpanOneController.text +
                mpanTwoController.text +
                mpanThreeController.text +
                mpanFourController.text +
                mpanFiveController.text +
                mpanSixController.text,
            fuelType: 'electricity',
            accountId: accountID));

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
    //Gas data
    mprn.text = requestQuoteViewButtonModel.mPRN ?? "";
    aqCharge.text = requestQuoteViewButtonModel.aQ ?? "";

    //Elec data
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

    //Individual Data
    businessNameController = requestQuoteViewButtonModel.businessName ?? '';
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
    mprn.text = requestQuoteViewButtonModel.mPRN ?? '';
    aqCharge.text = requestQuoteViewButtonModel.aQ ?? '';
    setState(ViewState.IDLE);
  }
}
