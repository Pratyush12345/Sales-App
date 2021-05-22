import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:pozitive/Core/AppConstact/appConstant.dart';
import 'package:pozitive/Core/Model/Api/account_credential.dart';
import 'package:pozitive/Core/Model/Api/quotation_invidual/supply_point_credentials.dart';
import 'package:pozitive/Core/Model/response_model.dart';
import 'package:pozitive/Core/Model/sharePrefModel/quotation_electricity_model.dart';
import 'package:pozitive/Core/Model/user.dart';
import 'package:pozitive/Core/Services/database.dart';
import 'package:pozitive/Core/Services/DownloadService.dart';
import 'package:pozitive/Core/ViewModel/baseModel.dart';
import 'package:pozitive/Core/enums/view_state.dart';
import 'package:pozitive/Util/Pref.dart';
import 'package:pozitive/Util/global.dart' as globals;

import '../../baseview.dart';

class QuotationElectricityViewModel extends BaseModel {
  Database database = getIt<DatabaseImplementation>();
  TextEditingController mpancodecontroller = TextEditingController();
  TextEditingController mpanOneController = TextEditingController();
  TextEditingController mpanTwoController = TextEditingController();
  TextEditingController mpanThreeController = TextEditingController();
  TextEditingController mpanFourController = TextEditingController();
  TextEditingController mpanFiveController = TextEditingController();
  TextEditingController mpanSixController = TextEditingController();
  TextEditingController dayController = TextEditingController();
  TextEditingController nightController = TextEditingController();
  TextEditingController eweController = TextEditingController();
  String wholeMpan;
  String errorMsg1;
  String errorMsg2;
  File pdfFile;
  String path;
  String sampleFileUrl;
  bool fileUploaded = false;
  bool isMpanCode = false;
  bool isMpanOne = false;
  bool isMpanTwo = false;
  bool isMpanThree = false;
  bool isMpanFour = false;
  bool isMpanFive = false;
  bool isMpanSix = false;
  bool isOne = false;
  bool isTwo = false;
  bool isThree = false;
  bool isFour = false;
  bool isFive = false;
  bool isSix = false;

  void initializeData(String accountID) async {
    setState(ViewState.BUSY);
    final data = await Prefs.getQuotationElectricityDetails();
    if (data != null) {
      mpancodecontroller.text = data.mPanCode;
      mpanOneController.text = data.mPanOne;
      mpanTwoController.text = data.mPanTwo;
      mpanThreeController.text = data.mPanThree;
      mpanFourController.text = data.mPanFour;
      mpanFiveController.text = data.mPanFive;
      mpanSixController.text = data.mPanSix;
      dayController.text = data.eACDay;
      nightController.text = data.eACNight;
      eweController.text = data.eWE;
      path = data.hhFilePath;
    }
    setState(ViewState.IDLE);
  }

  void onChangeMPanCode(String val) {
    setState(ViewState.BUSY);
    mpancodecontroller.text = val;
    setState(ViewState.IDLE);
  }

  void onUploadFile() async {
    FilePickerResult result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['xlsx', 'csv'],
    );
    PlatformFile file = result.files.first;
    if (file.extension == 'xlsx' || file.extension == 'csv') {
      path = result.files.first.path;
      pdfFile = File(path);
      fileUploaded = true;
      setState(ViewState.IDLE);
    } else {
      SnackBar(
        content: Text('Invalid File Format'),
      );
      print('Invalid File format');
    }
  }

  void onSaveAndNext() {
    setState(ViewState.BUSY);
    Prefs.setQuotationElectricityDetails(QuotationElectricityModel(
        wholeMpan: mpancodecontroller.text +
            mpanOneController.text +
            mpanTwoController.text +
            mpanThreeController.text +
            mpanFourController.text +
            mpanFiveController.text +
            mpanSixController.text,
        mPanCode: mpancodecontroller.text,
        mPanOne: mpanOneController.text,
        mPanTwo: mpanTwoController.text,
        mPanThree: mpanThreeController.text,
        mPanFour: mpanFourController.text,
        mPanFive: mpanFiveController.text,
        mPanSix: mpanSixController.text,
        eACDay: dayController.text,
        eACNight: nightController.text,
        eWE: eweController.text,
        hhFilePath: path));
    setState(ViewState.IDLE);
    globals.tabController7.animateTo(2);
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

  void onDownloadSampleFile(String accountID) async {
    User _user = await Prefs.getUser();
    sampleFileUrl = await database.getIndividulHHSampleFileAttachmentUrl(
        AccountCredential(accountID: _user.accountId));
    print('object=$sampleFileUrl');
    DownloadService.downloadFromUrl(sampleFileUrl);
  }
}
