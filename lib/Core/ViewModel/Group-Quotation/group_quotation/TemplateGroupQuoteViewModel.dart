import 'dart:io';
import 'dart:convert' show base64, base64Encode, utf8;
import 'package:flutter/material.dart';
import 'package:pozitive/Core/Model/Api/Group-Quotation/TemplateGroupQuoteCredential.dart';
import 'package:pozitive/Core/Model/Api/profileIdModel.dart';
import 'package:pozitive/Core/Model/TemplateGroupQuoteSaveandGenerateContractModel.dart';
import 'package:pozitive/Core/Model/user.dart';
import 'package:pozitive/Core/Services/database.dart';
import 'package:pozitive/Core/Services/DownloadService.dart';
import 'package:pozitive/Core/ViewModel/baseModel.dart';
import 'package:pozitive/Core/enums/view_state.dart';
import 'package:pozitive/Util/Pref.dart';
import 'package:pozitive/Util/theme.dart';

import '../../../baseview.dart';

class TemplateQuotationGroupViewModel extends BaseModel {
  Database database = getIt<DatabaseImplementation>();
  String downloadUrl;
  SaveAndGenerateGroup saveAndGenerateGroup = SaveAndGenerateGroup();

  File pdffile;
  var path;
  var pathData;
  String img64;

  ThemeApp themeApp = ThemeApp();
  bool autovalidation = false;
  TextEditingController uniqueRefCode = TextEditingController();
  TextEditingController businessName = TextEditingController();
  TextEditingController regCompName = TextEditingController();
  TextEditingController regCompNo = TextEditingController();
  TextEditingController charityRegNo = TextEditingController();
  TextEditingController billingAddress = TextEditingController();
  TextEditingController billingtown = TextEditingController();
  TextEditingController billingpostCode = TextEditingController();
  TextEditingController EAname = TextEditingController();
  TextEditingController EAEmail = TextEditingController();
  TextEditingController EAPhone = TextEditingController();
  TextEditingController EAMobile = TextEditingController();
  TextEditingController signature1 = TextEditingController();
  TextEditingController date1 = TextEditingController();
  TextEditingController name1 = TextEditingController();
  TextEditingController signature2 = TextEditingController();
  TextEditingController date2 = TextEditingController();
  TextEditingController name2 = TextEditingController();

  bool all = false;
  bool ltd = false;
  bool plc = false;
  bool charity = false;
  bool publicSec = false;
  bool soleProperty = false;
  bool partner = false;
  bool limitedLiab = false;
  bool llc = false;
  bool microBusines = false;
  bool microBusines1 = false;

  String hHSampleFileUrl;
  void initializeData() async {
    User user = await Prefs.getUser();
    setState(ViewState.BUSY);
    hHSampleFileUrl = await database
        .getHHSampleFileAttachment(ProfileId(accountId: user.accountId));
    setState(ViewState.IDLE);
  }

  Future onSaveAndGenerateContract(
      String accountID, BuildContext context) async {
    setState(ViewState.BUSY);
    if (accountID != null) {
      saveAndGenerateGroup = await database.getTemplateGroupQuotation(
          TemplateGroupQuoteCredential(
              AccountId: accountID,
              Type: "",
              intGroupid: "",
              bitLtdPPC: ltd.toString(),
              bitPlcPPC: plc.toString(),
              bitCharityPPC: charity.toString(),
              bitPublicSectorPPC: publicSec.toString(),
              bitSTPPC: soleProperty.toString(),
              bitLlpPPC: limitedLiab.toString(),
              bitpPPC: partner.toString(),
              bitLlc: llc.toString(),
              bteMicroBusiness: microBusines.toString(),
              chkBillAddr: "",
              strUniqueRefNoPPC: uniqueRefCode.text,
              strBusinessNamePPC: businessName.text,
              RegisterCompanyNamePPC: regCompName.text,
              RegisterCompanyNoPPC: regCompNo.text,
              RegisterCharityNoPPC: charityRegNo.text,
              strAddress1PPC: billingAddress.text,
              strTownPPC: billingtown.text,
              strPostcodeHomePPC1bb: billingpostCode.text,
              strName1PPC: EAname.text,
              strEmailBusinessPPC: EAEmail.text,
              strPhoneBusinessPPC: EAPhone.text,
              MobileNoPPC: EAMobile.text,
              Imagebase64Premisescontract: img64,
              signature1: signature1.text,
              name1: name1.text,
              date1: date1.text,
              signature2: signature2.text,
              name2: name2.text,
              date2: date2.text));

      print(saveAndGenerateGroup.filepath);

      downloadUrl = saveAndGenerateGroup.filepath;
    }

    setState(ViewState.IDLE);
  }

  void onClickDownloadTemplate(String accountId, BuildContext context) {
    // print(downloadUrl);
    DownloadService.downloadFromUrl(downloadUrl);
  }
}
