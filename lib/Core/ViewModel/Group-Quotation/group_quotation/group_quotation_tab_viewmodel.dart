import 'dart:convert';
import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pozitive/Core/AppConstact/appConstant.dart';
import 'package:pozitive/Core/AppConstact/appString.dart';
import 'package:pozitive/Core/Model/Api/Download-Contract-Credential.dart';
import 'package:pozitive/Core/Model/Api/UploadHHFileCredential.dart';
import 'package:pozitive/Core/Model/Api/profileIdModel.dart';
import 'package:pozitive/Core/Model/response_model.dart';
import 'package:pozitive/Core/Model/user.dart';
import 'package:pozitive/Core/Services/database.dart';
import 'package:pozitive/Core/ViewModel/baseModel.dart';
import 'package:pozitive/Core/ViewModel/group_quotation_viewmodel.dart';
import 'package:pozitive/Core/enums/view_state.dart';
import 'package:pozitive/Core/Model/Api/GroupAddPartnerAddQuickLeadCredential.dart';
import 'package:pozitive/Core/Model/Group-addPartner-addQuickLeadQuotes.dart';
import 'package:pozitive/Util/Pref.dart';
import 'package:pozitive/Util/PrefGroupQuote/PrefQuoteGroup.dart';
import 'package:excel/excel.dart';
import 'package:pozitive/Util/global.dart' as globals;
import 'package:pozitive/Core/Model/ApiResponse/add_quote_response.dart';
import 'package:get_it/get_it.dart';

GetIt getIt = GetIt.instance;

class GroupQuotationTabViewModel extends BaseModel {
  Database database = getIt<DatabaseImplementation>();
  TextEditingController groupNameController = TextEditingController();
  TextEditingController requireByDateController = TextEditingController();
  TextEditingController companyRegNoController = TextEditingController();
  TextEditingController companyNameController = TextEditingController();
  TextEditingController preferredEndDateController = TextEditingController();
  TextEditingController businessNameController = TextEditingController();

  DateTime selectedDate = DateTime.now();
  DateFormat dateFormat = DateFormat("dd/MM/yyyy");
  DateFormat dateFormatD = DateFormat("dd/MM/yyyy hh:mm");
  int tpm = 0, green = 0;
  bool daDc = false;
  bool setCommonEndDate = false;
  bool starkDaDc = false;
  bool prevSingleRate = false;
  bool mop = false;
  String path;
  String getFilePath;
  File pdfFile;
  int termSelected = 0;
  bool other = false;
  bool isFileChosen = false;
  String otherString;
  bool autoValidation = false;

  bool oneYear = false;
  bool twoYear = false;
  bool threeYear = false;
  bool fourYear = false;
  bool fiveYear = false;
  bool all = false;
  String hHSampleFileAttachmentDownloadUrl;
  String uploadhHFileAttachmentDownloadUrl;
  String downloadGroupContract;
  String otherYearDateString;
  String base64Image;
  String downloadTemplate;
  var prevBusinessName;
  var prevPostCode;
  var prevMpan;
  var prevEacDay;
  var prevEacNight;
  var prevEacEwe;
  var prevMprn;
  var prevEacGas;
  var prevPrefStartDate;
  var prevPrefEndDate;
  var prevSupplyAdd1;
  var prevSupplyAdd2;
  var prevSupplytown;
  var prevSupplypost;
  var prevBillAdd1;
  var prevBillAdd2;
  var prevBillTown;
  var prevBillpost;

  String otherWidget = 'hello';
  List excelData = [];
  List excelDataBname = [];
  List excelDataMPAN1 = [];
  List excelDataMPAN2 = [];
  List excelRows = [];

  List excelPrefStartDate = [];
  List excelPrefEndDate = [];

  String id;
  String symbol;
  String open;
  //---------------------------------//
  void toggleOther(BuildContext context) {
    setState(ViewState.BUSY);
    other = !other;

    // if (other) {
    //   selectDate(context, 'others');
    // }
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

  void toggleAll() {
    setState(ViewState.BUSY);
    all = !all;
    if (all) {
      oneYear = true;
      twoYear = true;
      threeYear = true;
      fourYear = true;
      fiveYear = true;
    } else if (!all) {
      oneYear = false;
      twoYear = false;
      threeYear = false;
      fourYear = false;
      fiveYear = false;
    }
    setState(ViewState.IDLE);
  }

  void onAddQuoteButtonGroup(BuildContext context) async {
    setState(ViewState.BUSY);
    User _user = await Prefs.getUser();
    AddQuoteResponse response =
        await database.addQuoteGroup(ProfileId(accountId: _user.accountId));
    if (response.status == '1') {
      print('Add Quote Group Api Calling Successfull');
      downloadTemplate = response.data.hHSampleFileAttachment;
    } else {
      print('Add Quote Group Api Calling Failed ');
    }

    setState(ViewState.IDLE);
  }

  GroupAddPartnerAddQuickLeadQuote addQuickLeadQuoteModel =
      GroupAddPartnerAddQuickLeadQuote();

  Future askForQuote(
      String groupID, BuildContext context, String apiCommand) async {
    User _user = await Prefs.getUser();

    setState(ViewState.BUSY);
    if (requireByDateController.text == '') {
      requireByDateController.text =
          dateFormatD.format(DateTime.now()).toString();
    }
    ResponseMessage response = await database.groupAddPartnerAddQuickLead(
      GroupAddPartnerAddQuickLeadCrential(
          accountId: _user.accountId,
          command: apiCommand,
          intCompanyUserId: "7257",
          intCompanyId: "1",
          groupId: groupID,
          qouteNotesGroup: 'testing for ApI',
          image64GroupFile: base64Image,
          groupname: groupNameController.text,
          basketName: businessNameController.text,
          thirdPartyMOP: '$mop' /*"model.mop.toString()"*/,
          thirdPartyDADC: '$daDc' /*model.daDc.toString()*/,
          isforFirstyearGroup: "$oneYear" /*model.termSelected.toString()*/,
          isforSecondyearGroup:
              twoYear.toString() /*model.termSelected.toString()*/,
          isforThirdyearGroup: "$threeYear" /*model.termSelected.toString()*/,
          isforFiveyearGroup: '$fourYear',
          isforFouryearGroup: '$fiveYear',
          intDADCId: "",
          bteIsStarkDADC: '$daDc',
          isforOtheryearGroup: "$other" /*model.termSelected.toString()*/,
          blHHstatus: "",
          isCommonEnddate: "false",
          requiredByDate: requireByDateController
              .text /*model.requireByDateController.text*/,
          contractEndDateGroup: "",
          filePath: ""),
    );

    print(response.msg);
    if (response.status == 1) {
      print('Api calling successful');

      setState(ViewState.BUSY);

      AppConstant.showSuccessToast(context, "success");

      PrefGroupQuote.setQuotationGroupDetailsRq(
          GroupAddPartnerAddQuickLeadCrential(
              basketName: businessNameController.text,
              groupname: groupNameController.text,
              isforFirstyearGroup: oneYear.toString(),
              isforSecondyearGroup: twoYear.toString(),
              isforThirdyearGroup: threeYear.toString(),
              isforFouryearGroup: fourYear.toString(),
              isforFiveyearGroup: fiveYear.toString(),
              isforOtheryearGroup: other ? otherString : 'false',
              blHHstatus: hHSampleFileAttachmentDownloadUrl.toString(),
              requiredByDate: requireByDateController.text.toString(),
              image64GroupFile: base64Image,
              //intDADCId: daDc.toString(),
              thirdPartyMOP: mop.toString(),
              thirdPartyDADC: daDc.toString(),
              bteIsStarkDADC: starkDaDc.toString(),
              filePath: path.toString() ?? ''));

      //setPrevData();
      print(otherWidget);
      globals.tabController3.animateTo(1);

      setState(ViewState.IDLE);
    } else {
      AppConstant.showFailToast(context, response.msg);
    }
    setState(ViewState.IDLE);
  }

  void initializeData(String accountID) async {
    setState(ViewState.BUSY);

    User user = await Prefs.getUser();
    print('staring downlaod');
    hHSampleFileAttachmentDownloadUrl = await database
        .getHHSampleFileAttachment(ProfileId(accountId: user.accountId));

    print('object$hHSampleFileAttachmentDownloadUrl');

    setState(ViewState.IDLE);

    ///
    setState(ViewState.BUSY);
    final data = await PrefGroupQuote.getQuotationGroupDetails();
    if (data != null) {
      businessNameController.text = data.basketName;
      groupNameController.text = data.groupname;
      //preferredDateController.text = data.preferredByDate;

      if (data.isforOtheryearGroup != null && data.isforOtheryearGroup != '') {
        other = true;
        otherString = data.isforOtheryearGroup;
      }
      // if (data.isforOtheryear == 'true') {
      //   otherString = data.otherString;
      // }
      if (data.isforFirstyearGroup == 'true') {
        oneYear = true;
      }
      if (data.isforSecondyearGroup == 'true') {
        twoYear = true;
      }
      if (data.isforThirdyearGroup == 'true') {
        threeYear = true;
      }
      if (data.isforFouryearGroup == 'true') {
        fourYear = true;
      }
      if (data.isforFiveyearGroup == 'true') {
        fiveYear = true;
      }
      requireByDateController.text = data.requiredByDate;
      base64Image = data.image64GroupFile;

      if (data.thirdPartyDADC == 'true') {
        daDc = true;
      }

      if (data.thirdPartyMOP == 'true') {
        mop = true;
      }

      if (data.bteIsStarkDADC == 'true') {
        starkDaDc = true;
      }
    }
    setState(ViewState.IDLE);
  }

  void selectDate(BuildContext context, String fromField) async {
    setState(ViewState.BUSY);
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null) {
      if (fromField == AppString.required) {
        requireByDateController.text = dateFormatD.format(picked).toString();
      } else if (fromField == AppString.preferred) {
        preferredEndDateController.text = dateFormat.format(picked);
      }
    }
    setState(ViewState.IDLE);
  }

  void onChooseFile(BuildContext context, String accountId, String groupId,
      File imagePick, GroupQuotationViewModel groupModel) async {
    setState(ViewState.BUSY);
    FocusScope.of(context).requestFocus(FocusNode());
    FilePickerResult result = await FilePicker.platform.pickFiles(
      type: FileType.any,
    );
    if (result != null) {
      path = result.files.first.path;
      getFilePath = path;
      var bytes = File(path).readAsBytesSync();
      var excel = Excel.decodeBytes(bytes);
      excelDataBname.clear();
      excelDataMPAN1.clear();
      excelDataMPAN2.clear();
      excelPrefStartDate.clear();
      excelPrefEndDate.clear();
      excelRows.clear();
      for (var table in excel.tables.keys) {
        // print(table);
        //print(excel.tables[table].maxCols);

        for (var row in excel.tables[table].rows) {
          print("ghfddddddgh$row[index]");
          excelData.add(row.toString());
          //prevBusinessName = excelData.length.toString();
          prevPostCode = excelData.iterator;

          excelDataBname.add(row[0].toString());
          excelDataMPAN1.add(row[2].toString());
          excelDataMPAN2.add(row[3].toString());
          excelPrefStartDate.add(row[9].toString());
          excelPrefEndDate.add(row[10].toString());

          excelRows.add(row);
        }
        print('rows$excelRows');
        print('prevvv$prevPostCode');
      }
      excelDataBname.removeAt(0);
      excelDataMPAN1.removeAt(0);
      excelDataMPAN2.removeAt(0);
      excelPrefStartDate.removeAt(0);
      excelPrefEndDate.removeAt(0);

      excelRows.removeAt(0);
      print('ghdfgdh$excelRows');

      groupModel.onGetExcelData(excelData, excelDataBname, excelDataMPAN1,
          excelDataMPAN2, excelRows, excelPrefStartDate, excelPrefEndDate);
      // groupModel.onGetExcelData(excelDataBname);
      //excelDataBname.removeAt(0);

      base64Image = base64Encode(result.toString().codeUnits);
      if (base64Image != null) {
        path = result.files.first.path;
        pdfFile = File(path);
        isFileChosen = true;
        final response = await database.uploadHHFileAttachment(
            UploadHHFileCredential(
                accountId: accountId,
                groupid: groupId,
                imageFile: base64Image));
      }
    }

    setState(ViewState.IDLE);
  }

  void onDownloadGroupContract(String accountID, String fileName) async {
    setState(ViewState.BUSY);
    downloadGroupContract = await database.getDownloadContractGroup(
        DownloadContractGroupCredentials(
            accountID: accountID, Filename: fileName));
    print('object$downloadGroupContract');
    setState(ViewState.IDLE);
  }

  void onSelectTerm(int val) {
    setState(ViewState.BUSY);
    termSelected = val;
    setState(ViewState.IDLE);
  }

  void onToggleThirdPartyMop() {
    setState(ViewState.BUSY);
    mop = !mop;
    setState(ViewState.IDLE);
  }

  void onToggleThirdPartyDADCContract() {
    setState(ViewState.BUSY);
    daDc = !daDc;
    setState(ViewState.IDLE);
  }

  void onToggleSetCommonEndDate() {
    setState(ViewState.BUSY);
    setCommonEndDate = !setCommonEndDate;
    setState(ViewState.IDLE);
  }

  void onToggleStarkDa() {
    setState(ViewState.BUSY);
    starkDaDc = !starkDaDc;
    setState(ViewState.IDLE);
  }

  void onTogglePrevSingleRate() {
    setState(ViewState.BUSY);
    prevSingleRate = !prevSingleRate;
    setState(ViewState.IDLE);
  }
}
