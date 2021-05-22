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
import 'package:pozitive/Core/Model/user.dart';
import 'package:pozitive/Core/Services/database.dart';
import 'package:pozitive/Core/ViewModel/baseModel.dart';
import 'package:pozitive/Core/ViewModel/group_quotation_viewmodel.dart';
import 'package:pozitive/Core/enums/view_state.dart';
import 'package:pozitive/Core/Model/Group-addPartner-addQuickLeadQuotes.dart';
import 'package:pozitive/Util/Pref.dart';
import 'package:pozitive/Util/PrefGroupQuote/PrefQuoteGroup.dart';
import 'package:excel/excel.dart';
import 'package:pozitive/Util/global.dart' as globals;
import 'package:pozitive/Core/Model/ApiResponse/add_quote_response.dart';
import 'package:pozitive/Core/Model/get_company_name_list_model.dart';
import 'package:pozitive/Core/Model/Api/Group-Quotation/GroupAddPartnerAddQuickLeadNewCredential.dart';
import 'package:get_it/get_it.dart';
import 'package:pozitive/Pages/Group-Quotation-addButton/common_wids_group/site_controller_model.dart';
import 'package:pozitive/Core/Model/GroupQuotation/GroupAddPartnerAddQuickLeadNewModel.dart';
import 'package:http/http.dart' as htp;
import 'package:pozitive/Core/Model/site_list_model.dart';
import 'package:pozitive/providers/site_list_provider.dart';
import 'package:pozitive/providers/quotation_detail_provider.dart';
import 'package:pozitive/Core/Model/quotation_details_data_model.dart';

GetIt getIt = GetIt.instance;

class GroupQuotationTabViewModelNew extends BaseModel {
  Database database = getIt<DatabaseImplementation>();
  // TextEditingController groupNameController = TextEditingController();
  // TextEditingController requireByDateController = TextEditingController();
  // TextEditingController companyRegNoController = TextEditingController();
  // TextEditingController companyNameController = TextEditingController();
  // TextEditingController preferredEndDateController = TextEditingController();
  // TextEditingController businessNameController = TextEditingController();

  // DateTime selectedDate = DateTime.now();
  // DateFormat dateFormat = DateFormat("dd/MM/yyyy");
  // DateFormat dateFormatD = DateFormat("dd/MM/yyyy hh:mm");
  // int tpm = 0, green = 0;
  // bool daDc = false;
  // bool setCommonEndDate = false;
  // bool starkDaDc = false;
  // bool prevSingleRate = false;
  // bool mop = false;
  // String path;
  // String getFilePath;
  // File pdfFile;
  // int termSelected = 0;
  // bool other = false;
  // bool isFileChosen = false;
  // String otherString;
  // bool autoValidation = false;

  // bool oneYear = false;
  // bool twoYear = false;
  // bool threeYear = false;
  // bool fourYear = false;
  // bool fiveYear = false;
  // bool all = false;
  // String hHSampleFileAttachmentDownloadUrl;
  // String uploadhHFileAttachmentDownloadUrl;
  // String downloadGroupContract;
  // String otherYearDateString;
  // String base64Image;
  // String downloadTemplate;
  // var prevBusinessName;
  // var prevPostCode;
  // var prevMpan;
  // var prevEacDay;
  // var prevEacNight;
  // var prevEacEwe;
  // var prevMprn;
  // var prevEacGas;
  // var prevPrefStartDate;
  // var prevPrefEndDate;
  // var prevSupplyAdd1;
  // var prevSupplyAdd2;
  // var prevSupplytown;
  // var prevSupplypost;
  // var prevBillAdd1;
  // var prevBillAdd2;
  // var prevBillTown;
  // var prevBillpost;

  // CompanyListModel model;
  // List<CompanyListData> suggestions = <CompanyListData>[];

  // String otherWidget = 'hello';
  // List excelData = [];
  // List excelDataBname = [];
  // List excelDataMPAN1 = [];
  // List excelDataMPAN2 = [];
  // List excelRows = [];

  // List excelPrefStartDate = [];
  // List excelPrefEndDate = [];

  // String id;
  // String symbol;
  // String open;

  // String errorMsg = '';
  // bool termsSelect = true;

  // List<ListFormSiteList> allSites = [];
  // List<SiteListModel> siteListReceived = [];

  // //---------------------------------//
  // void toggleOther(BuildContext context) {
  //   setState(ViewState.BUSY);
  //   other = !other;
  //   setState(ViewState.IDLE);
  // }

  // void toggleOneYear() {
  //   setState(ViewState.BUSY);
  //   oneYear = !oneYear;
  //   setState(ViewState.IDLE);
  // }

  // void toggleTwoYear() {
  //   setState(ViewState.BUSY);
  //   twoYear = !twoYear;
  //   setState(ViewState.IDLE);
  // }

  // void toggleThreeYear() {
  //   setState(ViewState.BUSY);
  //   threeYear = !threeYear;
  //   setState(ViewState.IDLE);
  // }

  // void toggleFourYear() {
  //   setState(ViewState.BUSY);
  //   fourYear = !fourYear;
  //   setState(ViewState.IDLE);
  // }

  // void toggleFiveYear() {
  //   setState(ViewState.BUSY);
  //   fiveYear = !fiveYear;
  //   setState(ViewState.IDLE);
  // }

  // bool checkTerms() {
  //   if (oneYear ||
  //       twoYear ||
  //       threeYear ||
  //       fourYear ||
  //       fiveYear ||
  //       other ||
  //       all) {
  //     setState(ViewState.BUSY);

  //     errorMsg = null;
  //     termsSelect = true;
  //   } else {
  //     termsSelect = false;
  //   }

  //   setState(ViewState.IDLE);
  //   return termsSelect;
  // }

  // void toggleAll() {
  //   setState(ViewState.BUSY);
  //   all = !all;
  //   if (all) {
  //     oneYear = true;
  //     twoYear = true;
  //     threeYear = true;
  //     fourYear = true;
  //     fiveYear = true;
  //   } else if (!all) {
  //     oneYear = false;
  //     twoYear = false;
  //     threeYear = false;
  //     fourYear = false;
  //     fiveYear = false;
  //   }
  //   setState(ViewState.IDLE);
  // }

  // void getCompanyName() async {
  //   setState(ViewState.BUSY);

  //   final response = await database.getCompanyNameList();
  //   model = response;
  //   if (model.companyList[0].text == 'Select') {
  //     model.companyList.removeAt(0);
  //   }
  //   suggestions = model.companyList;
  //   setState(ViewState.IDLE);
  // }

  // // void onAddQuoteButtonGroup(BuildContext context) async {
  // //   setState(ViewState.BUSY);
  // //   User _user = await Prefs.getUser();
  // //   AddQuoteResponse response =
  // //       await database.addQuoteGroup(ProfileId(accountId: _user.accountId));
  // //   if (response.status == '1') {
  // //     print('Add Quote Group Api Calling Successfull');
  // //     downloadTemplate = response.data.hHSampleFileAttachment;
  // //     getCompanyName();
  // //   } else {
  // //     print('Add Quote Group Api Calling Failed ');
  // //   }
  // //   setState(ViewState.IDLE);
  // // }

  // GroupAddPartnerAddQuickLeadQuote addQuickLeadQuoteModel =
  //     GroupAddPartnerAddQuickLeadQuote();
  // GroupAddPartnerAddQuickLeadNewModel groupAddPartnerAddQuickLeadNewModel =
  //     GroupAddPartnerAddQuickLeadNewModel();

  // List<ListFormSiteList> getAllSites(
  //     {@required List<TextContollerList> textlist}) {
  //   allSites.clear();
  //   for (int i = 0; i < textlist.length; i++) {
  //     allSites.add(
  //       ListFormSiteList(
  //         businessName: textlist[i].businessNameCont.text ?? "",
  //         mPANCore: textlist[i].mpanCoreCont.text ?? "",
  //         mPRN: textlist[i].mprnCont.text ?? "",
  //         preferedStartDate: textlist[i].prefStartDateCont.text ?? "",
  //       ),
  //     );
  //   }

  //   return allSites;
  // }

  // Future askForQuote(
  //     {@required GroupQuotaionDetailsProvider quotaionDetailsProvider,
  //     @required SiteListProvider siteListProviderData,
  //     @required BuildContext context,
  //     @required String apiCommand,
  //     @required List<TextContollerList> textlist}) async {
  //   setState(ViewState.BUSY);
  //   if (requireByDateController.text == '') {
  //     requireByDateController.text =
  //         dateFormatD.format(DateTime.now()).toString();
  //   }
  //   User _user = await Prefs.getUser();

  //   List<GroupAddPartnerAddQuickLeadNewCredential> list = [];
  //   list.add(
  //     GroupAddPartnerAddQuickLeadNewCredential(
  //       accountId: _user.accountId,
  //       command: apiCommand,
  //       intCompanyUserId: _user.accountId,
  //       intCompanyId: "1",
  //       groupId: '0',
  //       groupname: groupNameController.text ?? "",
  //       basketName: businessNameController.text ?? "",
  //       thirdPartyMOP: "$mop",
  //       thirdPartyDADC: "$daDc",
  //       bteIsStarkDADC: "$starkDaDc",
  //       isforFirstyearGroup: "$oneYear",
  //       isforSecondyearGroup: "$twoYear",
  //       isforThirdyearGroup: "$threeYear",
  //       isforFouryearGroup: "$fourYear",
  //       isforFiveyearGroup: "$fiveYear",
  //       isforOtheryearGroup: "$other",
  //       isCommonEnddate: "$setCommonEndDate",
  //       requiredByDate: requireByDateController.text ?? "",
  //       contractEndDateGroup: "",
  //       requestedDateGroup: requireByDateController.text ?? "",
  //       companyName: companyNameController.text ?? "",
  //       cRN: companyRegNoController.text ?? "",
  //       lstFormSiteList: getAllSites(textlist: textlist),
  //     ),
  //   );
  //   String json1 = jsonEncode(list.map((e) => e.toJson()).toList());
  //   int lstLength = json1.length;
  //   AppConstant.printWrapped(json1.substring(1, lstLength - 1));
  //   print(json1.substring(1, lstLength - 1));

  //   htp.Response response = await htp.post(
  //     Uri.parse(
  //         'https://api.boshposh.com/api/Partner/AddPartnerAddQuickLeadQuoteGroup_New'),
  //     headers: {"Content-Type": "application/json"},
  //     body: json1.substring(1, lstLength - 1),
  //   );
  //   var res = jsonDecode(response.body);

  //   if (res['status'] == '1') {
  //     siteListReceived.clear();
  //     print('Api Calling successfull');
  //     print(res['data']['Sitelist'].length);
  //     for (int i = 0; i < res['data']['Sitelist'].length; i++) {
  //       siteListReceived.add(
  //         SiteListModel(
  //           businessName: res['data']['Sitelist'][i]['Business_Name'],
  //           strPostCode: res['data']['Sitelist'][i]['strPostCode'],
  //           fullMpanNumber: res['data']['Sitelist'][i]['Full_Mpan_Number'],
  //           eACDay: res['data']['Sitelist'][i]['EAC_Day'],
  //           eACEWE: res['data']['Sitelist'][i]['EAC_EWE'],
  //           eACNight: res['data']['Sitelist'][i]['EAC_Night'],
  //           gasMprn: res['data']['Sitelist'][i]['Gas_Mprn'],
  //           eACGAS: res['data']['Sitelist'][i]['GAS_EAC'],
  //           dteContractStartDate: res['data']['Sitelist'][i]
  //               ['dteContractStartDate'],
  //           preferedStartDate: res['data']['Sitelist'][i]['PreferedStartDate'],
  //           preferedEndDate: res['data']['Sitelist'][i]['PreferedEndDate'],
  //           bIsSingleRate: res['data']['Sitelist'][i]['bIsSingleRate'] == 'true'
  //               ? true
  //               : false,
  //           bisGreenCertificate:
  //               res['data']['Sitelist'][i]['bisGreenCertificate'] == 'true'
  //                   ? true
  //                   : false,
  //           businessNameErr: res['data']['Sitelist'][i]['Business_NameErr'],
  //           postCodeErr: res['data']['Sitelist'][i]['PostCodeErr'],
  //           mpanErr: res['data']['Sitelist'][i]['MpanErr'],
  //           dayEACErr: res['data']['Sitelist'][i]['Day_EACErr'],
  //           eveningEACErr: res['data']['Sitelist'][i]['Evening_EACErr'],
  //           nightEACErr: res['data']['Sitelist'][i]['Night_EACErr'],
  //           gASEACErr: res['data']['Sitelist'][i]['GAS_EACErr'],
  //           startDateErr: res['data']['Sitelist'][i]['StartDateErr'],
  //           endDateErr: res['data']['Sitelist'][i]['EndDateErr'],
  //           singleRateErr: res['data']['Sitelist'][i]['SingleRateErr'],
  //         ),
  //       );
  //     }
  //     siteListProviderData.siteListProvider = siteListReceived;
  //     quotaionDetailsProvider.groupQuotaionDetailsProvider =
  //         QuotationDetailsDataModel(
  //       basketName: res['data']['BasketName'],
  //       companyName: res['data']['CompanyName'],
  //       bteIsStarkDADC: res['data']['bteIsStarkDADC'] == 'true' ? true : false,
  //       cRN: res['CRN'],
  //       contractEndDateGroup: res['data']['ContractEndDateGroup'],
  //       groupId: res['data']['GroupId'].toString(),
  //       groupname: res['data']['Groupname'],
  //       isCommonEnddate:
  //           res['data']['IsCommonEnddate'] == 'true' ? true : false,
  //       isforFirstyearGroup:
  //           res['data']['IsforFirstyearGroup'] == 'true' ? true : false,
  //       isforFiveyearGroup:
  //           res['data']['IsforFiveyearGroup'] == 'true' ? true : false,
  //       isforFouryearGroup:
  //           res['data']['IsforFouryearGroup'] == 'true' ? true : false,
  //       isforOtheryearGroup:
  //           res['data']['IsforOtheryearGroup'] == 'true' ? true : false,
  //       isforSecondyearGroup:
  //           res['data']['IsforSecondyearGroup'] == 'true' ? true : false,
  //       isforThirdyearGroup:
  //           res['data']['IsforThirdyearGroup'] == 'true' ? true : false,
  //       requestedDateGroup: res['data']['RequestedDateGroup'],
  //       requiredByDate: res['data']['RequiredByDate'],
  //       thirdPartyDADC: res['data']['ThirdPartyDADC'] == 'true' ? true : false,
  //       thirdPartyMOP: res['data']['ThirdPartyMOP '] == 'true' ? true : false,
  //     );

  //     setState(ViewState.IDLE);
  //     setPrefData();
  //     globals.tabController3.animateTo(1);
  //   } else {
  //     setState(ViewState.IDLE);
  //     print(res['Error']);
  //     AppConstant.showFailToast(context, res['Error']);
  //   }
  // }

  // void setPrefData() async {
  //   PrefGroupQuote.setQuotationGroupDetailsAddQuote(
  //     GroupAddPartnerAddQuickLeadNewCredential(
  //       basketName: businessNameController.text ?? "",
  //       groupname: groupNameController.text ?? "",
  //       companyName: companyNameController.text ?? "",
  //       cRN: companyRegNoController.text ?? "",
  //       isforFirstyearGroup: oneYear.toString() ?? 'false',
  //       isforSecondyearGroup: twoYear.toString() ?? 'false',
  //       isforThirdyearGroup: threeYear.toString() ?? 'false',
  //       isforFouryearGroup: fourYear.toString() ?? 'false',
  //       isforFiveyearGroup: fiveYear.toString() ?? 'false',
  //       isforOtheryearGroup: other.toString() ?? 'false',
  //       requiredByDate: requireByDateController.text ?? "",
  //       isCommonEnddate: setCommonEndDate.toString() ?? 'false',
  //       contractEndDateGroup: preferredEndDateController.text ?? '',
  //       thirdPartyMOP: mop.toString() ?? 'false',
  //       thirdPartyDADC: daDc.toString() ?? 'false',
  //       bteIsStarkDADC: starkDaDc.toString() ?? 'false',
  //     ),
  //   );
  // }

  // void checkSiteListData() {
  //   setState(ViewState.BUSY);
  //   siteListReceived.forEach((element) {
  //     print(element.businessName);
  //   });
  //   setState(ViewState.IDLE);
  // }

  // void initializeData() async {
  //   setState(ViewState.BUSY);
  //   getCompanyName();
  //   final data = await PrefGroupQuote.getQuotationGroupDetailsAddQuote();
  //   if (data != null) {
  //     businessNameController.text = data.basketName ?? '';
  //     groupNameController.text = data.groupname ?? '';
  //     companyNameController.text = data.companyName ?? '';
  //     companyRegNoController.text = data.cRN ?? '';
  //     if (data.isforFirstyearGroup == 'true') {
  //       oneYear = true;
  //     }
  //     if (data.isforSecondyearGroup == 'true') {
  //       twoYear = true;
  //     }
  //     if (data.isforThirdyearGroup == 'true') {
  //       threeYear = true;
  //     }
  //     if (data.isforFouryearGroup == 'true') {
  //       fourYear = true;
  //     }
  //     if (data.isforFiveyearGroup == 'true') {
  //       fiveYear = true;
  //     }

  //     if (data.isforOtheryearGroup == 'true') {
  //       other = true;
  //     }

  //     if (data.thirdPartyDADC == 'true') {
  //       daDc = true;
  //     }

  //     if (data.thirdPartyMOP == 'true') {
  //       mop = true;
  //     }

  //     if (data.bteIsStarkDADC == 'true') {
  //       starkDaDc = true;
  //     }
  //     requireByDateController.text = data.requiredByDate ??
  //         dateFormat.format(
  //           DateTime.now(),
  //         );
  //     if (data.isCommonEnddate == 'true') {
  //       setCommonEndDate = true;
  //     }
  //     preferredEndDateController.text = data.contractEndDateGroup ?? "";
  //   }
  //   setState(ViewState.IDLE);
  // }

  // void selectDate(BuildContext context, String fromField) async {
  //   setState(ViewState.BUSY);
  //   final DateTime picked = await showDatePicker(
  //       context: context,
  //       initialDate: selectedDate,
  //       firstDate: DateTime(2015, 8),
  //       lastDate: DateTime(2101));
  //   if (picked != null) {
  //     if (fromField == AppString.required) {
  //       requireByDateController.text = dateFormatD.format(picked).toString();
  //     } else if (fromField == AppString.preferred) {
  //       preferredEndDateController.text = dateFormat.format(picked);
  //     }
  //   }
  //   setState(ViewState.IDLE);
  // }

  // void onChooseFile(BuildContext context, String accountId, String groupId,
  //     File imagePick, GroupQuotationViewModel groupModel) async {
  //   setState(ViewState.BUSY);
  //   FocusScope.of(context).requestFocus(FocusNode());
  //   FilePickerResult result = await FilePicker.platform.pickFiles(
  //     type: FileType.any,
  //   );
  //   if (result != null) {
  //     path = result.files.first.path;
  //     getFilePath = path;
  //     var bytes = File(path).readAsBytesSync();
  //     var excel = Excel.decodeBytes(bytes);
  //     excelDataBname.clear();
  //     excelDataMPAN1.clear();
  //     excelDataMPAN2.clear();
  //     excelPrefStartDate.clear();
  //     excelPrefEndDate.clear();
  //     excelRows.clear();
  //     for (var table in excel.tables.keys) {
  //       // print(table);
  //       //print(excel.tables[table].maxCols);

  //       for (var row in excel.tables[table].rows) {
  //         print("ghfddddddgh$row[index]");
  //         excelData.add(row.toString());
  //         //prevBusinessName = excelData.length.toString();
  //         prevPostCode = excelData.iterator;

  //         excelDataBname.add(row[0].toString());
  //         excelDataMPAN1.add(row[2].toString());
  //         excelDataMPAN2.add(row[3].toString());
  //         excelPrefStartDate.add(row[9].toString());
  //         excelPrefEndDate.add(row[10].toString());

  //         excelRows.add(row);
  //       }
  //       print('rows$excelRows');
  //       print('prevvv$prevPostCode');
  //     }
  //     excelDataBname.removeAt(0);
  //     excelDataMPAN1.removeAt(0);
  //     excelDataMPAN2.removeAt(0);
  //     excelPrefStartDate.removeAt(0);
  //     excelPrefEndDate.removeAt(0);

  //     excelRows.removeAt(0);
  //     print('ghdfgdh$excelRows');

  //     groupModel.onGetExcelData(excelData, excelDataBname, excelDataMPAN1,
  //         excelDataMPAN2, excelRows, excelPrefStartDate, excelPrefEndDate);
  //     // groupModel.onGetExcelData(excelDataBname);
  //     //excelDataBname.removeAt(0);

  //     base64Image = base64Encode(result.toString().codeUnits);
  //     if (base64Image != null) {
  //       path = result.files.first.path;
  //       pdfFile = File(path);
  //       isFileChosen = true;
  //       final response = await database.uploadHHFileAttachment(
  //           UploadHHFileCredential(
  //               accountId: accountId,
  //               groupid: groupId,
  //               imageFile: base64Image));
  //     }
  //   }

  //   setState(ViewState.IDLE);
  // }

  // void onDownloadGroupContract(String accountID, String fileName) async {
  //   setState(ViewState.BUSY);
  //   downloadGroupContract = await database.getDownloadContractGroup(
  //       DownloadContractGroupCredentials(
  //           accountID: accountID, Filename: fileName));
  //   print('object$downloadGroupContract');
  //   setState(ViewState.IDLE);
  // }

  // void onSelectTerm(int val) {
  //   setState(ViewState.BUSY);
  //   termSelected = val;
  //   setState(ViewState.IDLE);
  // }

  // void onToggleThirdPartyMop() {
  //   setState(ViewState.BUSY);
  //   mop = !mop;
  //   setState(ViewState.IDLE);
  // }

  // void onToggleThirdPartyDADCContract() {
  //   setState(ViewState.BUSY);
  //   daDc = !daDc;
  //   setState(ViewState.IDLE);
  // }

  // void onToggleSetCommonEndDate() {
  //   setState(ViewState.BUSY);
  //   setCommonEndDate = !setCommonEndDate;
  //   setState(ViewState.IDLE);
  // }

  // void onToggleStarkDa() {
  //   setState(ViewState.BUSY);
  //   starkDaDc = !starkDaDc;
  //   setState(ViewState.IDLE);
  // }

  // void onTogglePrevSingleRate() {
  //   setState(ViewState.BUSY);
  //   prevSingleRate = !prevSingleRate;
  //   setState(ViewState.IDLE);
  // }
}
