import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pozitive/Core/AppConstact/appString.dart';
import 'package:pozitive/Core/Model/company_name_group_add_quote_model.dart';
import 'package:pozitive/Core/ViewModel/baseModel.dart';
import 'package:pozitive/Core/enums/view_state.dart';
import 'package:pozitive/Util/PrefGroupQuote/PrefQuoteGroup.dart';
import 'package:pozitive/Core/Model/Api/GroupAddPartnerAddQuickLeadCredential.dart';
import 'package:pozitive/Core/AppConstact/appConstant.dart';
import 'package:pozitive/Pages/Group-Quotation-addButton/common_wids_group/site_controller_model.dart';
import 'package:pozitive/Pages/Group-Quotation-addButton/common_wids_group/site_detail_widget.dart';
import 'package:pozitive/Core/Model/get_max_count_for_site_model.dart';
import 'package:pozitive/Core/Services/database.dart';
import 'package:get_it/get_it.dart';
import 'package:pozitive/Core/Model/get_company_reg_no_model.dart';
import 'package:pozitive/Core/Model/Api/Group-Quotation/GroupAddPartnerAddQuickLeadNewCredential.dart';
import 'package:pozitive/Core/Model/GroupQuotation/GroupAddPartnerAddQuickLeadNewModel.dart';
import 'package:http/http.dart' as htp;
import 'package:pozitive/Core/Model/site_list_model.dart';
import 'package:pozitive/providers/site_list_provider.dart';
import 'package:pozitive/providers/quotation_detail_provider.dart';
import 'package:pozitive/Core/Model/quotation_details_data_model.dart';
import 'package:pozitive/Core/Model/Group-addPartner-addQuickLeadQuotes.dart';
import 'package:pozitive/Util/Pref.dart';
import 'package:pozitive/Util/global.dart' as globals;
import 'package:pozitive/Core/Model/get_company_name_list_model.dart';
import 'package:pozitive/Core/Model/user.dart';
import 'dart:convert';
import 'package:pozitive/Pages/Group-Quotation-addButton/common_wids_group/site_shared_pref_data_model.dart';
import 'package:pozitive/providers/tabcontroller3_provider.dart';

GetIt getIt = GetIt.instance;

class GroupQuotationViewModel extends BaseModel {
  var prevData;
  var excelData;
  var excelDataBnaam;
  var excelDataMpanNaam1;
  var excelDataMpanNaam2;
  var excelRows;
  var excelStartDate;
  var excelEndDate;
  String filePath;
  bool prevSingleRate = false;
  bool siteDetailsFilled = false;
  GroupAddPartnerAddQuickLeadCrential tempModel;
  List<CompanyNameGroupAddQuoteModel> companyNameList = List();

  TextEditingController prevMpan = TextEditingController();
  TextEditingController prevPrefStartDate = TextEditingController();
  TextEditingController prevPrefEndDate = TextEditingController();
  TextEditingController preferredStartDateController = TextEditingController();
  TextEditingController typeAheadController = TextEditingController();

  DateTime selectedDate = DateTime.now();
  DateFormat dateFormat = DateFormat("dd/MM/yyyy");
  DateFormat dateFormatD = DateFormat("dd/MM/yyyy hh:mm");

  SiteControllerModel siteConts = SiteControllerModel();
  int maxSites;
  List<SiteControllerModel> siteControllerModelList = [];
  TextContollerList textContollerList = TextContollerList();
  List<TextContollerList> textlist = [];
  bool autovalidation = false;
  String groupIdFromPref;
  bool enableFields = true;
  String fileError;
  bool isTermSelected = false;
  bool businessName = false;
  DateFormat dateRFormat = DateFormat("dd/MM/yyyy hh:mm");
  Database database = getIt<DatabaseImplementation>();
  String companyRegNo = '';
  GetCompanyRegNoModel companyRegNoModel;
  bool companyRegNoEnabled = true;
  bool previousSitesFilled = true;
  TextEditingController groupNameController = TextEditingController();
  TextEditingController requireByDateController = TextEditingController();
  TextEditingController companyRegNoController = TextEditingController();
  TextEditingController companyNameController = TextEditingController();
  TextEditingController preferredEndDateController = TextEditingController();
  TextEditingController businessNameController = TextEditingController();

  bool daDc = false;
  bool setCommonEndDate = false;
  bool starkDaDc = false;
  bool mop = false;
  String path;
  String getFilePath;
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
  bool load = false;
  CompanyListModel model;
  List<CompanyListData> suggestions = <CompanyListData>[];

  String id;
  String symbol;
  String open;

  String errorMsg = '';
  bool termsSelect = true;
  bool termsSelected = false;
  String termError = '';

  List<ListFormSiteList> allSites = [];
  List<SiteListModel> siteListReceived = [];

  bool checkTerms() {
    setState(ViewState.BUSY);
    if (oneYear || twoYear || threeYear || fourYear || fiveYear || other) {
      termsSelected = true;
      setState(ViewState.IDLE);
    } else {
      termError = 'Please select atleast one Term.';
      termsSelected = false;
      print(termError);
      setState(ViewState.IDLE);
    }
    return termsSelected;
  }

  //---------------------------------//
  void toggleOther(BuildContext context) {
    setState(ViewState.BUSY);
    other = !other;
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

  void goToNext() {
    setState(ViewState.BUSY);
    globals.tabController8.animateTo(1);
    setState(ViewState.IDLE);
  }
  Future<void> getCompanyName() async {
    setState(ViewState.BUSY);

    final response = await database.getCompanyNameList();
    model = response;
    print(response);
    if (model.companyList[0].text == 'Select') {
      model.companyList.removeAt(0);
    }
    suggestions = model.companyList;
    setState(ViewState.IDLE);
  }

  GroupAddPartnerAddQuickLeadQuote addQuickLeadQuoteModel =
      GroupAddPartnerAddQuickLeadQuote();
  GroupAddPartnerAddQuickLeadNewModel groupAddPartnerAddQuickLeadNewModel =
      GroupAddPartnerAddQuickLeadNewModel();

  List<ListFormSiteList> getAllSites(
      {@required List<TextContollerList> textlist}) {
    allSites.clear();
    for (int i = 0; i < textlist.length; i++) {
      allSites.add(
        ListFormSiteList(
          businessName: textlist[i].businessNameCont.text ?? "",
          mPANCore: textlist[i].mpanCoreCont.text ?? "",
          mPRN: textlist[i].mprnCont.text ?? "",
          preferedStartDate: textlist[i].prefStartDateCont.text ?? "",
        ),
      );
    }

    return allSites;
  }

  Future askForQuote(
      {@required TabController3Provider tabController3Provider,
        @required GroupQuotaionDetailsProvider quotaionDetailsProvider,
        @required SiteListProvider siteListProviderData,
        @required BuildContext context,
        @required String apiCommand,
        @required List<TextContollerList> textlist}) async {
    setState(ViewState.BUSY);
    if (requireByDateController.text == '') {
      requireByDateController.text =
          dateFormatD.format(DateTime.now()).toString();
    }
    User _user = await Prefs.getUser();

    //List<GroupAddPartnerAddQuickLeadNewCredential> list = [];
    // list.add(
    //   GroupAddPartnerAddQuickLeadNewCredential(
    //     accountId: _user.accountId,
    //     command: apiCommand,
    //     intCompanyUserId: _user.accountId,
    //     intCompanyId: "1",
    //     groupId: groupIdFromPref == null ? '0' : groupIdFromPref.toString(),
    //     groupname: groupNameController.text ?? "",
    //     basketName: businessNameController.text ?? "",
    //     thirdPartyMOP: "$mop",
    //     thirdPartyDADC: "$daDc",
    //     bteIsStarkDADC: "$starkDaDc",
    //     isforFirstyearGroup: "$oneYear",
    //     isforSecondyearGroup: "$twoYear",
    //     isforThirdyearGroup: "$threeYear",
    //     isforFouryearGroup: "$fourYear",
    //     isforFiveyearGroup: "$fiveYear",
    //     isforOtheryearGroup: "$other",
    //     isCommonEnddate: "$setCommonEndDate",
    //     requiredByDate: requireByDateController.text ?? "",
    //     contractEndDateGroup: "",
    //     requestedDateGroup: requireByDateController.text ?? "",
    //     companyName: companyNameController.text ?? "",
    //     cRN: companyRegNoController.text ?? "",
    //     lstFormSiteList: getAllSites(textlist: textlist),
    //   ),
    // );

    GroupAddPartnerAddQuickLeadNewCredential groupAddPartnerAddQuickLeadNewCredential =   GroupAddPartnerAddQuickLeadNewCredential(
      accountId: _user.accountId,
      command: apiCommand,
      intCompanyUserId: _user.accountId,
      intCompanyId: "1",
      groupId: groupIdFromPref == null ? '0' : groupIdFromPref.toString(),
      groupname: groupNameController.text ?? "",
      basketName: businessNameController.text ?? "",
      thirdPartyMOP: "$mop",
      thirdPartyDADC: "$daDc",
      bteIsStarkDADC: "$starkDaDc",
      isforFirstyearGroup: "$oneYear",
      isforSecondyearGroup: "$twoYear",
      isforThirdyearGroup: "$threeYear",
      isforFouryearGroup: "$fourYear",
      isforFiveyearGroup: "$fiveYear",
      isforOtheryearGroup: "$other",
      isCommonEnddate: "$setCommonEndDate",
      requiredByDate: requireByDateController.text ?? "",
      contractEndDateGroup: "",
      requestedDateGroup: requireByDateController.text ?? "",
      companyName: companyNameController.text ?? "",
      cRN: companyRegNoController.text ?? "",
      lstFormSiteList: getAllSites(textlist: textlist),
    );
    // GroupAddPartnerAddQuickLeadNewCredential groupAddPartnerAddQuickLeadNewCredential =   GroupAddPartnerAddQuickLeadNewCredential(
    //     accountId: "7257",
    //     command: "Insert",
    //     intCompanyUserId: "7257",
    //     intCompanyId: "1",
    //     groupId: '0',
    //     groupname: "",
    //     basketName: "testing for api",
    //     thirdPartyMOP: "false",
    //     thirdPartyDADC: "true",
    //     bteIsStarkDADC: "false",
    //     isforFirstyearGroup: "true",
    //     isforSecondyearGroup: "true",
    //     isforThirdyearGroup: "true",
    //     isforFouryearGroup: "true",
    //     isforFiveyearGroup: "true",
    //     isforOtheryearGroup: "false",
    //     isCommonEnddate: "false",
    //     requiredByDate: requireByDateController.text ?? "",
    //     contractEndDateGroup: "",
    //     requestedDateGroup: requireByDateController.text ?? "",
    //     companyName: companyNameController.text ?? "",
    //     cRN: companyRegNoController.text ?? "",
    //     lstFormSiteList: getAllSites(textlist: textlist),
    //   );

    //String json1 = jsonEncode(list.map((e) => e.toJson()).toList());
    //int lstLength = json1.length;
    //print("lst length===================${list.length}");
    // AppConstant.printWrapped(json1.substring(1, lstLength - 1));
    // print(json1.substring(1, lstLength - 1));
    print(textlist.length);
    htp.Response response = await htp.post(
        Uri.parse(
            'https://api.boshposh.com/api/Partner/AddPartnerAddQuickLeadQuoteGroup_New'),
        headers: {"Content-Type": "application/json"},
        // body: (json1.substring(1, lstLength - 1)),
        body: json.encode(groupAddPartnerAddQuickLeadNewCredential.toJson())
    );
    var res = jsonDecode(response.body);
    print(res);
    print(res['status']);
    if (res['status'] == '1') {
      siteListReceived.clear();
      print('Api Calling successfull');
      print(res['data']['Sitelist'].length);
      print(siteControllerModelList.length);
      for (int i = 0; i < res['data']['Sitelist'].length; i++) {
        siteListReceived.add(
          SiteListModel(
            businessName: res['data']['Sitelist'][i]['Business_Name'],
            strPostCode: res['data']['Sitelist'][i]['strPostCode'],
            fullMpanNumber: res['data']['Sitelist'][i]['Full_Mpan_Number'],
            eACDay: res['data']['Sitelist'][i]['EAC_Day'],
            eACEWE: res['data']['Sitelist'][i]['EAC_EWE'],
            eACNight: res['data']['Sitelist'][i]['EAC_Night'],
            gasMprn: res['data']['Sitelist'][i]['Gas_Mprn'],
            eACGAS: res['data']['Sitelist'][i]['GAS_EAC'],
            dteContractStartDate: res['data']['Sitelist'][i]
            ['dteContractStartDate'],
            preferedStartDate: res['data']['Sitelist'][i]['PreferedStartDate'],
            preferedEndDate: res['data']['Sitelist'][i]['PreferedEndDate'],
            bIsSingleRate: res['data']['Sitelist'][i]['bIsSingleRate'] == 'true'
                ? true
                : false,
            bisGreenCertificate:
            res['data']['Sitelist'][i]['bisGreenCertificate'] == 'true'
                ? true
                : false,
            businessNameErr: res['data']['Sitelist'][i]['Business_NameErr'],
            postCodeErr: res['data']['Sitelist'][i]['PostCodeErr'],
            mpanErr: res['data']['Sitelist'][i]['MpanErr'],
            dayEACErr: res['data']['Sitelist'][i]['Day_EACErr'],
            eveningEACErr: res['data']['Sitelist'][i]['Evening_EACErr'],
            nightEACErr: res['data']['Sitelist'][i]['Night_EACErr'],
            gASEACErr: res['data']['Sitelist'][i]['GAS_EACErr'],
            startDateErr: res['data']['Sitelist'][i]['StartDateErr'],
            endDateErr: res['data']['Sitelist'][i]['EndDateErr'],
            singleRateErr: res['data']['Sitelist'][i]['SingleRateErr'],
            mprnErr: res['data']['Sitelist'][i]['MprnErr'],
          ),
        );
      }
      siteListProviderData.siteListProvider = siteListReceived;
      quotaionDetailsProvider.groupQuotaionDetailsProvider =
          QuotationDetailsDataModel(
            basketName: res['data']['BasketName'],
            companyName: res['data']['CompanyName'],
            bteIsStarkDADC: res['data']['bteIsStarkDADC'] == 'true' ? true : false,
            cRN: res['CRN'],
            contractEndDateGroup: res['data']['ContractEndDateGroup'],
            groupId: res['data']['GroupId'].toString(),
            groupname: res['data']['Groupname'],
            isCommonEnddate:
            res['data']['IsCommonEnddate'] == 'true' ? true : false,
            isforFirstyearGroup:
            res['data']['IsforFirstyearGroup'] == 'true' ? true : false,
            isforFiveyearGroup:
            res['data']['IsforFiveyearGroup'] == 'true' ? true : false,
            isforFouryearGroup:
            res['data']['IsforFouryearGroup'] == 'true' ? true : false,
            isforOtheryearGroup:
            res['data']['IsforOtheryearGroup'] == 'true' ? true : false,
            isforSecondyearGroup:
            res['data']['IsforSecondyearGroup'] == 'true' ? true : false,
            isforThirdyearGroup:
            res['data']['IsforThirdyearGroup'] == 'true' ? true : false,
            requestedDateGroup: res['data']['RequestedDateGroup'],
            requiredByDate: res['data']['RequiredByDate'],
            thirdPartyDADC: res['data']['ThirdPartyDADC'] == 'true' ? true : false,
            thirdPartyMOP: res['data']['ThirdPartyMOP '] == 'true' ? true : false,
          );
      await PrefGroupQuote.gRQsetGroupId(res['data']['GroupId'].toString());
      setState(ViewState.IDLE);
      setPrefData();
      tabController3Provider.setTabListProvider = 1;
      globals.tabController8.animateTo(1);
    } else {
      setState(ViewState.IDLE);
      print(res['Error']);
      AppConstant.showFailToast(context, res['Error']);
    }
  }

  void setPrefData() async {
    setState(ViewState.BUSY);
    List<String> siteBusinessNames = [];
    List<String> siteMpanCore = [];
    List<String> siteMprn = [];
    List<String> sitePrefStartDate = [];
    siteBusinessNames.clear();
    siteMpanCore.clear();
    siteMprn.clear();
    sitePrefStartDate.clear();
    textlist.forEach(
      (element) {
        siteBusinessNames.add(element.businessNameCont.text ?? "");
        siteMpanCore.add(element.mpanCoreCont.text ?? "");
        siteMprn.add(element.mprnCont.text ?? "");
        sitePrefStartDate.add(element.prefStartDateCont.text ?? "");
      },
    );
    PrefGroupQuote.setQuotationGroupDetailsAddQuote(
      GroupAddPartnerAddQuickLeadNewCredential(
        basketName: businessNameController.text ?? "",
        groupname: groupNameController.text ?? "",
        companyName: companyNameController.text ?? "",
        cRN: companyRegNoController.text ?? "",
        isforFirstyearGroup: oneYear.toString() ?? 'false',
        isforSecondyearGroup: twoYear.toString() ?? 'false',
        isforThirdyearGroup: threeYear.toString() ?? 'false',
        isforFouryearGroup: fourYear.toString() ?? 'false',
        isforFiveyearGroup: fiveYear.toString() ?? 'false',
        isforOtheryearGroup: other.toString() ?? 'false',
        requiredByDate: requireByDateController.text ?? "",
        isCommonEnddate: setCommonEndDate.toString() ?? 'false',
        contractEndDateGroup: preferredEndDateController.text ?? '',
        thirdPartyMOP: mop.toString() ?? 'false',
        thirdPartyDADC: daDc.toString() ?? 'false',
        bteIsStarkDADC: starkDaDc.toString() ?? 'false',
      ),
    );

    PrefGroupQuote.setBusinessNameFromSite(SiteSharedPrefDataModel(
      siteBusinessNames: siteBusinessNames,
      siteMpanCore: siteMpanCore,
      siteMprn: siteMprn,
      sitePrefStartDate: sitePrefStartDate,
    ));
    setState(ViewState.IDLE);
  }

  void checkSiteListData() {
    setState(ViewState.BUSY);
    siteListReceived.forEach((element) {
      print(element.businessName);
    });
    setState(ViewState.IDLE);
  }

  Future<void> getDataFromPref() async {
    final data = await PrefGroupQuote.getQuotationGroupDetailsAddQuote();
    if (data != null) {
      businessNameController.text = data.basketName ?? '';
      groupNameController.text = data.groupname ?? '';
      companyNameController.text = data.companyName ?? '';
      companyRegNoController.text = data.cRN ?? '';
      if (data.cRN != '') {
        companyRegNoEnabled = false;
      } else {
        companyRegNoEnabled = true;
      }
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

      if (data.isforOtheryearGroup == 'true') {
        other = true;
      }

      if (data.thirdPartyDADC == 'true') {
        daDc = true;
      }

      if (data.thirdPartyMOP == 'true') {
        mop = true;
      }

      if (data.bteIsStarkDADC == 'true') {
        starkDaDc = true;
      }
      requireByDateController.text = data.requiredByDate ??
          dateFormat.format(
            DateTime.now(),
          );
      if (data.isCommonEnddate == 'true') {
        setCommonEndDate = true;
      }
      preferredEndDateController.text = data.contractEndDateGroup ?? "";
    }
  }

  Future<void>getDataPrevQuotes(BuildContext context,String id,dynamic doota) async{
    setState(ViewState.BUSY);
    // User _user = await Prefs.getUser();
    //
    //
    // htp.Response response = await htp.post(
    //     Uri.parse(
    //         'https://api.boshposh.com/api/Partner/GetPartnerQuoteGroup_Price'),
    //     headers: {"Content-Type": "application/json"},
    //     // body: (json1.substring(1, lstLength - 1)),
    //     body: json.encode({
    //       "AccountId": _user.accountId,
    //       "GroupId": id ,
    //       "type": "group"
    //     })
    // );
    // var doota  = jsonDecode(response.body);
   // print(response.body);

   // print(doota);
    textlist.clear();
    siteControllerModelList.clear();

    print(doota['data']['lstGroupMaster'] );
      if (doota['data']['lstGroupMaster'] !=null) {
        for (int i = 0; i < doota['data']['lstGroupMaster'].length; i++) {
          String corempan = '';
          if((doota['data']['lstGroupMaster'][i]['Full_Mpan_Number']) != "" && (doota['data']['lstGroupMaster'][i]['Full_Mpan_Number']) != null)
            corempan = doota['data']['lstGroupMaster'][i]['Full_Mpan_Number'].toString().substring(8);

          textlist.add(
            TextContollerList(
              businessNameCont: TextEditingController(
                  text: doota['data']['lstGroupMaster'][i]['Business_Name'] ?? ''),
              mpanCoreCont: TextEditingController(
                  text: corempan),
              mprnCont: TextEditingController(
                  text: doota['data']['lstGroupMaster'][i]['Gas_Mprn'] ?? ''),
              prefStartDateCont: TextEditingController(
                  text: doota['data']['lstGroupMaster'][i]['dteContractStartDate']?? ''),
              index: i,
            ),
          );

          siteControllerModelList.add(
            SiteControllerModel(
              child: SiteDetailWidget(
                add: () => addSite(
                  context: context,
                  index: siteControllerModelList.length,
                ),
                remove: () {
                  removeSiteDetail(context: context, index: textlist[i].index);
                },
                addButtonEnable: false,
                //siteControllerModelList.length == maxSites - 1 ? false : true,
                removeButtonEnable: false,
               // siteControllerModelList.length == 0 ? false : true,
                mprnController: textlist[i].mprnCont,
                mpanCoreController: textlist[i].mpanCoreCont,
                businessNameController: textlist[i].businessNameCont,
                startDateController: textlist[i].prefStartDateCont,
                autoValidation: autovalidation,
                selectDate: () {
                  FocusScope.of(context).unfocus();
                  dateSelect(
                      context: context,
                      controller: textlist[i].prefStartDateCont);
                },
                fieldsEnabled: true,
              ),
            ),
          );
        }
      }
      else{

        textlist.add(
          TextContollerList(
            businessNameCont: TextEditingController(
                text:  ''),
            mpanCoreCont: TextEditingController(
                text: ''),
            mprnCont: TextEditingController(
                text:  ''),
            prefStartDateCont: TextEditingController(
                text:  ''),
            index: 0,
          ),
        );

        siteControllerModelList.add(
          SiteControllerModel(
            child: SiteDetailWidget(
              add: () => addSite(
                context: context,
                index: siteControllerModelList.length,
              ),
              remove: () {
                removeSiteDetail(context: context, index: textlist[0].index);
              },
              addButtonEnable:
              siteControllerModelList.length == maxSites - 1 ? false : true,
              removeButtonEnable:
              siteControllerModelList.length == 0 ? false : true,
              mprnController: textlist[0].mprnCont,
              mpanCoreController: textlist[0].mpanCoreCont,
              businessNameController: textlist[0].businessNameCont,
              startDateController: textlist[0].prefStartDateCont,
              autoValidation: autovalidation,
              selectDate: () {
                FocusScope.of(context).unfocus();
                dateSelect(
                    context: context,
                    controller: textlist[0].prefStartDateCont);
              },
              fieldsEnabled: true,
            ),
          ),
        );
      }







    // print(doota['data']['Sitelist'].length);
    businessNameController.text = doota['data']['BasketName'];
    groupNameController.text = doota['data']['Groupname'];
    companyNameController.text = doota['data']['CompanyName'];
    companyRegNoController.text = doota['data']['CRN'];
    print(doota['data']['CRN']);
    if (doota['data']['CRN'] != null) {
      companyRegNoEnabled = false;
    } else {
      companyRegNoEnabled = true;
    }
    if (doota['data']['IsforFirstyearGroup'] == true) {
      oneYear = true;
    }
    if (doota['data']['IsforSecondyearGroup'] == true) {
      twoYear = true;
    }
    if (doota['data']['IsforThirdyearGroup'] == true) {
      threeYear = true;
    }
    if (doota['data']['IsforFouryearGroup'] == true) {
      fourYear = true;
    }
    if (doota['data']['IsforFiveyearGroup'] == true) {
      fiveYear = true;
    }

    if (doota['data']['IsforOtheryearGroup']  == true) {
      other = true;
    }

    if (doota['data']['ThirdPartyDADC'] == true) {
      daDc = true;
    }

    if (doota['data']['ThirdPartyMOP'] == true) {
      mop = true;
    }

    if (doota['data']['bteIsStarkDADC']== 'true') {
      starkDaDc = true;
    }
    requireByDateController.text = doota['data']['RequiredByDate'] ??
        dateFormat.format(
          DateTime.now(),
        );
    if (doota['data']['IsCommonEnddate']== 'true') {
      setCommonEndDate = true;
    }
    preferredEndDateController.text = doota['data']['ContractEndDateGroup']?? "";

    setState(ViewState.IDLE);

  }
  void sitevalidate({BuildContext context}){
    siteControllerModelList.clear();
    for(int i=0;i<textlist.length;i++){
      siteControllerModelList.add(
        SiteControllerModel(
          child: SiteDetailWidget(
            add: () => addSite(
              context: context,
              index: siteControllerModelList.length,
            ),
            remove: () {
              removeSiteDetail(context: context, index: textlist[i].index);
            },
            addButtonEnable: siteControllerModelList.length == maxSites - 1 ? false : true,
            removeButtonEnable: siteControllerModelList.length == 0 ? false : true,
            mprnController: textlist[i].mprnCont,
            mpanCoreController: textlist[i].mpanCoreCont,
            businessNameController: textlist[i].businessNameCont,
            startDateController: textlist[i].prefStartDateCont,
            autoValidation: true,
            selectDate: () {
              print(textlist[i].prefStartDateCont);
              FocusScope.of(context).unfocus();
              dateSelect(
                  context: context,
                  controller: textlist[i].prefStartDateCont);
            },
            fieldsEnabled: true,
          ),
        ),
      );
    }
  }
  Future<void> getSiteBusinessNames(
      {BuildContext context,
      SiteSharedPrefDataModel sharedPrefDataModel}) async {
    textlist.clear();
    siteControllerModelList.clear();
    if (sharedPrefDataModel.siteBusinessNames.length > 0) {
      for (int i = 0; i < sharedPrefDataModel.siteBusinessNames.length; i++) {
        textlist.add(
          TextContollerList(
            businessNameCont: TextEditingController(
                text: sharedPrefDataModel.siteBusinessNames[i] ?? ''),
            mpanCoreCont: TextEditingController(
                text: sharedPrefDataModel.siteMpanCore[i] ?? ''),
            mprnCont: TextEditingController(
                text: sharedPrefDataModel.siteMprn[i] ?? ''),
            prefStartDateCont: TextEditingController(
                text: sharedPrefDataModel.sitePrefStartDate[i] ?? ''),
            index: i,
          ),
        );

        siteControllerModelList.add(
          SiteControllerModel(
            child: SiteDetailWidget(
              add: () => addSite(
                context: context,
                index: siteControllerModelList.length,
              ),
              remove: () {
                removeSiteDetail(context: context, index: textlist[i].index);
              },
              addButtonEnable:
                  siteControllerModelList.length == maxSites - 1 ? false : true,
              removeButtonEnable:
                  siteControllerModelList.length == 0 ? false : true,
              mprnController: textlist[i].mprnCont,
              mpanCoreController: textlist[i].mpanCoreCont,
              businessNameController: textlist[i].businessNameCont,
              startDateController: textlist[i].prefStartDateCont,
              autoValidation: autovalidation,
              selectDate: () {
                FocusScope.of(context).unfocus();
                dateSelect(
                    context: context,
                    controller: textlist[i].prefStartDateCont);
              },
              fieldsEnabled: true,
            ),
          ),
        );
      }
    }
  }

  void initializeData({BuildContext context,String grpid,dynamic loaddata}) async {
    setState(ViewState.BUSY);
    load = false;
    SiteSharedPrefDataModel sharedPrefDataModel;
    groupIdFromPref = await PrefGroupQuote.gRQgetGroupId() ?? null;
    await getMaxSiteCount();
    sharedPrefDataModel = await PrefGroupQuote.getSiteBusinessNames();
    //sharedPrefDataModel = null;
    // siteControllerModelList.clear();
    // textlist.clear();
    if(grpid != null){
      siteControllerModelList.clear();
      textlist.clear();
      sharedPrefDataModel = null;
      await getDataPrevQuotes(context,grpid,loaddata);
    }
    else{
      await getDataFromPref();
    }
    // else{
    //   await getDataPrevQuotes(context,grpid);
    // }
    if (sharedPrefDataModel != null) {
      await getSiteBusinessNames(
          context: context, sharedPrefDataModel: sharedPrefDataModel);
    } else {
      // siteControllerModelList.clear();
      // textlist.clear();

     if(grpid ==  null){
       if (siteControllerModelList.isEmpty) {
         initializeSite(context: context);
       }
     }
    }
  print(grpid);
   // await getDataPrevQuotes(context,grpid);
    await getCompanyName();

    load = true;
    requireByDateController.text = dateRFormat.format(DateTime.now());
   // print(textlist.length);
    setState(ViewState.IDLE);
  }

  void selectDate1(BuildContext context, String fromField) async {
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

  // void getFilePath() async {
  //   tempModel = await PrefGroupQuote.getQuotationGroupDetails();
  //   filePath = tempModel.filePath.toString();
  // }

  Future<void> getCompanyRegNo(
      {@required String companyName,
      @required TextEditingController controller}) async {
    setState(ViewState.BUSY);
    companyRegNoModel =
        await database.getCompanyRegNo(companyName: companyName);
    if (companyRegNoModel.companyList.isNotEmpty) {
      if (companyRegNoModel.companyList[0].companyRegNo.toString() != '') {
        controller.text =
            companyRegNoModel.companyList[0].companyRegNo.toString();
        companyRegNoEnabled = false;
      } else {
        controller.clear();
        companyRegNoEnabled = true;
      }
    } else {
      controller.clear();
      companyRegNoEnabled = true;
    }

    setState(ViewState.IDLE);
  }

  bool validateSiteDetails() {
    setState(ViewState.BUSY);
    siteDetailsFilled = true;
    for (int i = 0; i < textlist.length; i++) {
      if (textlist[i].businessNameCont.text == '' ||
          (textlist[i].mpanCoreCont.text == '' &&
              textlist[i].mprnCont.text == '') ||
          textlist[i].prefStartDateCont.text == '') {
        siteDetailsFilled = false;
      }
    }
    setState(ViewState.IDLE);
    return siteDetailsFilled;
  }

  Future<void> getMaxSiteCount() async {
    setState(ViewState.BUSY);
    GetMaxCountForAddSiteModel response =
        await database.getMaxCountForAddSite();
    maxSites = int.parse(response.result);
    print('Max Sites : ${response.result}');
    setState(ViewState.IDLE);
  }

  initializeSite({BuildContext context}) {
    setState(ViewState.BUSY);
    textlist.add(
      TextContollerList(
        businessNameCont: TextEditingController(text: ''),
        mpanCoreCont: TextEditingController(text: ''),
        mprnCont: TextEditingController(text: ''),
        prefStartDateCont: TextEditingController(text: dateFormat.format(DateTime.now())),
        index: 0,
      ),
    );

    siteControllerModelList.add(
      SiteControllerModel(
        child: SiteDetailWidget(
          add: () => addSite(
            context: context,
            index: siteControllerModelList.length,
          ),
          remove: () {
            removeSiteDetail(context: context, index: textlist[0].index);
          },
          addButtonEnable: true,
          removeButtonEnable: false,
          mprnController: textlist[0].mprnCont,
          mpanCoreController: textlist[0].mpanCoreCont,
          businessNameController: textlist[0].businessNameCont,
          startDateController: textlist[0].prefStartDateCont,
          autoValidation: autovalidation,
          selectDate: () {
            FocusScope.of(context).unfocus();
            dateSelect(
                context: context, controller: textlist[0].prefStartDateCont);
          },
          fieldsEnabled: true,
        ),
      ),
    );
    setState(ViewState.IDLE);
  }

  void dateSelect(
      {BuildContext context, TextEditingController controller}) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime.now(),
        lastDate: DateTime(2101));
    if (picked != null) {
      controller.text = dateFormat.format(picked).toString();
    }
  }

  void selectDate({
    @required BuildContext context,
    @required String fromField,
    @required TextEditingController controller,
  }) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime.now(),
        lastDate: DateTime(2101));
    if (picked != null) {
      if (fromField == AppString.required) {
        controller.text = dateFormatD.format(picked).toString();
      } else if (fromField == AppString.preferred) {
        controller.text = dateFormat.format(picked).toString();
      }
    }
  }

  bool checkPreviousIndex({int prev}) {
    previousSitesFilled = true;
    for (int i = 0; i < prev; i++) {
      if (textlist[i].businessNameCont.text == '' ||
          (textlist[i].mprnCont.text == '' &&
              textlist[i].mpanCoreCont.text == '') ||
          textlist[i].prefStartDateCont.text == '') {
        setState(ViewState.BUSY);
        previousSitesFilled = false;
        setState(ViewState.IDLE);
      }
    }
    return previousSitesFilled;
  }

  void addSite({@required BuildContext context, @required int index}) {
    setState(ViewState.BUSY);
    print('Add Site index : $index');
    if (siteControllerModelList.length >= maxSites) {
      setState(ViewState.IDLE);
      return AppConstant.showFailToast(
          context, 'You have reached max limit to add site');
    } else {
      if (!checkPreviousIndex(prev: index)) {
        setState(ViewState.IDLE);
        return AppConstant.showFailToast(
            context, 'Please enter details of previous site');
      } else {
        textlist.add(
          TextContollerList(
            businessNameCont: TextEditingController(text: ''),
            mpanCoreCont: TextEditingController(text: ''),
            mprnCont: TextEditingController(text: ''),
            prefStartDateCont: TextEditingController(text: dateFormat.format(DateTime.now())),
            index: index,
          ),
        );

        siteControllerModelList.add(
          SiteControllerModel(
            child: SiteDetailWidget(
              add: () => addSite(
                  context: context, index: siteControllerModelList.length),
              remove: () {
                removeSiteDetail(
                    context: context, index: textlist[index].index);
              },
              addButtonEnable: textlist.length == maxSites ? false : true,
              removeButtonEnable:
                  siteControllerModelList.length == 0 ? false : true,
              mprnController: textlist[index].mprnCont,
              mpanCoreController: textlist[index].mpanCoreCont,
              businessNameController: textlist[index].businessNameCont,
              startDateController: textlist[index].prefStartDateCont,
              autoValidation: autovalidation,
              selectDate: () {
                FocusScope.of(context).unfocus();
                dateSelect(
                    context: context,
                    controller: textlist[index].prefStartDateCont);
              },
              fieldsEnabled: true,
            ),
          ),
        );
      }
    }

    setState(ViewState.IDLE);
  }

  void removeSiteDetail({@required BuildContext context, @required int index}) {
    setState(ViewState.BUSY);
    FocusScope.of(context).unfocus();
    print('remove Index : $index');
    if (siteControllerModelList.length == 1) {
      setState(ViewState.IDLE);
      return AppConstant.showFailToast(context, 'No more sites can be removed');
    } else {
      siteControllerModelList.removeAt(index);
      textlist.removeAt(index);
      for (int i = 0; i < siteControllerModelList.length; i++) {
        textlist[i].index = i;
        siteControllerModelList[i].child = SiteDetailWidget(
          add: () =>
              addSite(context: context, index: siteControllerModelList.length),
          remove: () {
            removeSiteDetail(context: context, index: textlist[i].index);
          },
          addButtonEnable:
              siteControllerModelList.length > maxSites ? false : true,
          removeButtonEnable:
              siteControllerModelList.length == 1 || i == 0 ? false : true,
          // siteControllerModelList.length == 1 ? false : true,
          mprnController: textlist[i].mprnCont,
          mpanCoreController: textlist[i].mpanCoreCont,
          businessNameController: textlist[i].businessNameCont,
          startDateController: textlist[i].prefStartDateCont,
          autoValidation: autovalidation,
          selectDate: () {

            FocusScope.of(context).unfocus();
            dateSelect(
                context: context, controller: textlist[i].prefStartDateCont);
          },
          fieldsEnabled: true,
        );
      }
    }

    setState(ViewState.IDLE);
  }

  void onGetExcelData(excelVal, excelDataBname, excelDataMpan1, excelDataMpan2,
      excelRow, excelStartdate, excelEnddate) {
    setState(ViewState.BUSY);
    excelDataBnaam = excelDataBname;
    excelData = excelVal;
    excelDataMpanNaam1 = excelDataMpan1;
    excelDataMpanNaam2 = excelDataMpan2;
    excelRows = excelRow;
    excelStartDate = excelStartdate;
    excelEndDate = excelEnddate;

    setState(ViewState.IDLE);
  }

  void selectStartDate(BuildContext context, String fromField) async {
    setState(ViewState.BUSY);
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        // initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null) {
      if (fromField == AppString.required) {
        prevPrefStartDate.text = dateFormatD.format(picked);
      } else {
        prevPrefStartDate.text = dateFormat.format(picked);
      }
    }
    setState(ViewState.IDLE);
  }

  void selectEndDate(BuildContext context, String fromField) async {
    setState(ViewState.BUSY);
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        //initialDate: excelEndDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null) {
      if (fromField == AppString.required) {
        prevPrefEndDate.text = dateFormatD.format(picked);
      } else {
        prevPrefEndDate.text = dateFormat.format(picked);
      }
    }
    setState(ViewState.IDLE);
  }
}
