import 'dart:convert';
import 'package:pozitive/Core/Model/Api/DualFuel-InsertAddProspect/ElectricityCredential.dart';
import 'package:pozitive/Util/dualFuel_Pref.dart';
import 'package:pozitive/Core/Model/InsertAddProspect/insert-Add-prospect.dart';
import 'package:pozitive/Core/Model/InsertAddProspect/GetAddProspectModel.dart';
import 'package:pozitive/Core/Services/database.dart';
import 'package:pozitive/Core/Services/DownloadService.dart';
import 'package:pozitive/Core/ViewModel/baseModel.dart';
import 'package:pozitive/Core/enums/view_state.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:pozitive/Core/Model/Api/DualFuel-InsertAddProspect/DualFuelGroupCredential.dart';
import 'package:pozitive/Core/Model/Api/DualFuel-InsertAddProspect/DualFuelBusinessCredential.dart';
import 'package:pozitive/Core/Model/Api/DualFuel-InsertAddProspect/DualFuelSiteAddressCredential.dart';
import 'package:pozitive/Core/Model/Api/DualFuel-InsertAddProspect/DualFuelPaymentCredential.dart';
import 'package:pozitive/Core/Model/Api/DualFuel-InsertAddProspect/DualFuelBillingAddressCredential.dart';
import 'package:pozitive/Core/Model/Api/DualFuel-InsertAddProspect/DualFuelAccountManagerCredential.dart';
import 'package:pozitive/Core/Model/Api/DualFuel-InsertAddProspect/GasCredential.dart';
import 'package:pozitive/Core/Model/Api/InsertAddProspect/ProspectGetAddPartnerCredetial.dart';
import 'package:pozitive/Core/Model/Api/DualFuel-InsertAddProspect/newInsertAddProspCredential.dart';
import 'package:pozitive/Core/AppConstact/appConstant.dart';
import 'package:pozitive/Util/PrefBusinessType/PrefBusinessType.dart';
import 'package:pozitive/Core/Model/Api/DualFuel-InsertAddProspect/BusinessOwnershipDetailsCredential.dart';
import 'package:pozitive/Pages/Add-Prospect-FormTab-view/DualFuel/dualfuelView.dart';
import 'package:pozitive/Pages/homepage.dart';

GetIt getIt = GetIt.instance;

Database database = getIt<DatabaseImplementation>();

DualFuelGroupCredential credential = DualFuelGroupCredential();

class DFGroupViewModel extends BaseModel {
  bool autovalidation = false;

  int groupNameSelected = 0;

  TextEditingController groupName = TextEditingController();

  List groupNameList = ["Group 1", "Group 2", "Group 3"];

  ProspectGetAddPartnerModel addPartnerModel;

  // List<LstGroup> groupLst = List();

  var items = List<LstGroup>();

  List<LstGroup> lstGroup = List();

  ///
  List<LstGroup> groupLst = List<LstGroup>();

  String get getBusinessType {
    if (business?.business_Type == 'Select Business Type') {
      return '0';
    }
    if (business?.business_Type == 'Ltd') {
      return '1';
    }
    if (business?.business_Type == 'Sole Proprietor') {
      return '2';
    }
    if (business?.business_Type == 'Partnership') {
      return '3';
    }
    if (business?.business_Type == 'Charity') {
      return '4';
    }
    if (business?.business_Type == 'LLP') {
      return '5';
    }
    if (business?.business_Type == 'LLC') {
      return '6';
    }
    if (business?.business_Type == 'Other') {
      return '7';
    }
    return '';
  }

  void filterSearchResults(String query) {
    groupLst.addAll(lstGroup);
    if (query.isNotEmpty) {
      List<LstGroup> dummyListData = List<LstGroup>();
      groupLst.forEach((item) {
        if (item.text.contains(query)) {
          dummyListData.add(item);
        }
      });
      setState(ViewState.BUSY);
      items.clear();
      items.addAll(dummyListData);
      setState(ViewState.IDLE);
      return;
    } else {
      setState(ViewState.BUSY);
      items.clear();
      items.addAll(lstGroup);
      setState(ViewState.IDLE);
    }
  }

  ///
  void onClearText() {
    setState(ViewState.BUSY);

    groupLst = addPartnerModel.lstGroup;
    setState(ViewState.IDLE);
  }

  void getGroupDetails(ProspectGetAddCredential credential) async {
    assert(credential != null);

    setState(ViewState.BUSY);

    final response = await database.getAddProspectService(credential);

    addPartnerModel = response;
    // groupLst=addPartnerModel.lstGroup;

    print('rrrrr${addPartnerModel.toJson()}  ==');
    if (isNotError(response)) {
      addPartnerModel = response;
      groupLst = addPartnerModel.lstGroup;

      print(response);
    } else {
      print("error");
    }

    setState(ViewState.IDLE);
  }

  void onChangeVal(String val) {
    print('object');
    setState(ViewState.BUSY);
    groupLst = [];
    addPartnerModel.lstGroup.forEach((element) {
      if (element.text.toLowerCase().contains(val.toLowerCase())) {
        groupLst.add(element);
      }
    });

    print('${groupLst.length}');
    setState(ViewState.IDLE);
  }

  Future getDualFuelGroupProspect() async {
    setState(ViewState.BUSY);

    credential = await DFPref.getDualFuelGroupValues();
    final response =
        await database.getDualFuelGroupServices(DualFuelGroupCredential());

    if (isNotError(response)) {
      var res = jsonDecode(response.body);
      print(res['data']);
      DualFuelGroupCredential _user =
          DuelFuelInsertAddProspectModel.fromJson(res['data'])
              as DualFuelGroupCredential;

      credential = _user;
      print('#########electriccccccccccc${credential.groupName}');
      DFPref.setDualFuelGroupValues(credential);
      setState(ViewState.IDLE);
    } else {
      print("error");
      setState(ViewState.IDLE);
    }
  }

  void initialData() async {
    final data = await DFPref.getDualFuelGroupValues();
    setState(ViewState.BUSY);

    if (data != null) {
      groupName.text = data.groupName;
      //grou name selected and group name list are not present
    }
    setState(ViewState.IDLE);
  }

  void onSaveAndNext() {
    setState(ViewState.BUSY);
    DFPref.setDualFuelGroupValues(DualFuelGroupCredential(
      groupName: groupName.text,
    ));
    setState(ViewState.IDLE);
  }

  DualFuelELECTRICITYCredential electricity;
  DualFuelGasCredential gas;
  DualFuelBusinessCredential business;
  DualFuelSiteAddressCredential siteAdd;
  DualFuelBillingAddressCredential billingadd;
  DualFuelAccountManagerCredential acManager;
  DualFuelPaymentCredential paymentDetail;
  SoleBusinessCredential soleBusinessType;
  OtherBusinessCredential otherBusinessType;
  LtdBusinessCredential ltdBusinessType;
  CharityBusinessCredential charityBusinessType;
  LLPBusinessCredential llpBusinessType;
  LLCBusinessCredential llcBusinessType;
  PartnerShipBusinessCredential partnerShipType;

  void getDataFromPref(
      String accountId, String buttonMessage, BuildContext context,String brokerId) async {
    setState(ViewState.BUSY);
    electricity = await DFPref.getDualFuelEleValues();
    gas = await DFPref.getDualFuelGasValues();
    business = await DFPref.getDualFuelBusinessDetailsValues();
    siteAdd = await DFPref.getDualFuelSiteAddressValues();
    billingadd = await DFPref.getDualFuelBillingAddressValues();
    acManager = await DFPref.getDualFuelAccountManagerValues();
    paymentDetail = await DFPref.getDualFuelPaymentDetails();
    soleBusinessType = await BusinessTypePref.getSoleBusinessTypeAdd();
    otherBusinessType = await BusinessTypePref.getOtherBusinessTypeAdd();
    ltdBusinessType = await BusinessTypePref.getltdBusinessTypeAdd();
    charityBusinessType = await BusinessTypePref.getCharityBusinessTypeAdd();
    llpBusinessType = await BusinessTypePref.getLLPBusinessTypeAdd();
    llcBusinessType = await BusinessTypePref.getLLCBusinessTypeAdd();
    partnerShipType = await BusinessTypePref.getPartnerShipBusinessTypeAdd();

    // print('datasss-- ${paymentDetail.toJson()}');
    //onSave(accountId, buttonMessage, context);
    print('sdsjfcsdkj${electricity?.dfdtContractEndDateEle}');
    print('dsfsdf${electricity?.dfwholeMpan}');

    if (gas != null && electricity != null && business != null) {
      onSave(accountId, buttonMessage, context,brokerId);
    } else {
      AppConstant.showFailToast(context, 'Enter all details properly');
    }

    setState(ViewState.IDLE);
  }

  Future onSave(
      String accountId, String buttonMessage, BuildContext context,String brokerId) async {
    setState(ViewState.BUSY);

    final response = await database
        .passdualFuelAddProspectServices(DualFuelInsertAddProspectCredentials(
      dfaccountId: accountId.toString(),
      dfstrFueltype: "3",
      //   dffullMpan: "038012011300004860599",
      dffullMpan: electricity?.dffullMpan ?? "",
      // fullMprn: "9874654217",
      dffullMprn: gas?.fullMprn ?? "",
      dffullMpanRHT: "",
      dfintBrokerId: brokerId,
      dfcustomerid: "0",
      dfstrbtnCommand: "",
      dfbuttonCommandinsert: buttonMessage.toString(),
      //     "SaveAndView", //(For example---à SaveAndGenerateContract, SaveAndAddAnother)
      dfrhtcheckbox: electricity?.dfrhtcheckbox.toString() ?? '',
      dfcompanyid: "1", /////
      dfstrBillinTermType: billingadd?.strBillinTermType ?? "",
      dfstrCompanyRegNo: business?.strCompanyRegNo ?? "",
      // business_Type : business?.business_Type,
      dfbusiness_Type: getBusinessType ?? "",
      dfstrTitleDirector1: ltdBusinessType?.strTitleDirector1 ?? "",
      dfstrDirector1Firstname: ltdBusinessType?.strDirector1Firstname ?? "",
      dfstrDirector1Lastname: ltdBusinessType?.strDirector1Lastname ?? "",
      dfstrTitleDirector2: ltdBusinessType?.strTitleDirector2 ?? "",
      dfstrDirector2Firstname: ltdBusinessType?.strDirector2Firstname ?? "",
      dfstrDirector2Lastname: ltdBusinessType?.strDirector2Lastname ?? "",
      dfstrTitleQwner1: soleBusinessType?.strTitleQwner1 ?? "",
      dffirstName: soleBusinessType?.firstName ?? "",
      dflastName: soleBusinessType?.lastName ?? "",
      dfstrTitlecharityowner1: charityBusinessType?.strTitlecharityowner1 ?? "",
      dfstrcharityowner1firstname:
          charityBusinessType?.strcharityowner1firstname ?? "",
      dfstrcharityowner1lastname:
          charityBusinessType?.strcharityowner1lastname ?? "",
      dfstrchariryRegisterNo: charityBusinessType?.strchariryRegisterNo ?? "",
      dfstrTitleLLPowner1: llpBusinessType?.strTitleLLPowner1 ?? "",
      dfstrLLPowner1FirstName: llpBusinessType?.strLLPowner1FirstName ?? "",
      dfstrLLPowner1LastName: llpBusinessType?.strLLPowner1LastName ?? "",
      dfstrTitleLLcowner1: llcBusinessType?.strTitleLLcowner1 ?? "",
      dfstrLLcowner1FirstName: llcBusinessType?.strLLcowner1FirstName ?? "",
      dfstrLLcowner1LastName: llcBusinessType?.strLLcowner1LastName ?? "",
      dfstrTitleOtherowner1: otherBusinessType?.strTitleOtherowner1 ?? "",
      dfstrOtherowner1FirstName:
          otherBusinessType?.strOtherowner1FirstName ?? "",
      dfstrOtherowner1LastName: otherBusinessType?.strOtherowner1LastName ?? "",
      dftelNo: "",
      dfalternative_Number: business?.alternative_Number ?? "",
      //alternative_Number: "7454845354",
      dfemail: business?.email ?? "",
      dfregisteredCompanyName: business?.registeredCompanyName ?? "",
      dfstrEcosPostcode: "",
      dfstrEcosaddress1: "",
      dfstrEcosaddress2: "",
      dfstrEcosCity: "",
      dfstrSitePostCode: siteAdd?.strSitePostCode ?? "",
      // strSitePostCode : "EC1A 1BB",
      dfstrSiteAddress1: siteAdd?.strSiteAddress1 ?? "",
      dfstrSiteAddress2: siteAdd?.strSiteAddress2 ?? "",
      dfstrSiteTown: siteAdd.strSiteTown ?? "",
      dfstrBillPostCode: billingadd.strBillPostCode ?? "",
      dfstrBillAddress1: billingadd.strBillAddress1 ?? "",
      dfstrBillAddress2: billingadd.strBillAddress2 ?? "",
      dftown1: billingadd.strSiteTown ?? "",
      dfbusiness_Name: business?.business_Name ?? "",
      // business_Name : "regel",
      //strBankSortCode: "75437865",
      dfstrBankSortCode: paymentDetail?.strBankSortCode ?? "",
      //strBankName: "Abbey National Treasury Services Plc",
      dfstrBankName: paymentDetail?.strBankName ?? "",
      dfstrBankACName: paymentDetail?.strBankACName ?? "",
      dfstrBankACNo: paymentDetail?.strBankACNo ?? "",
      dfstrEMRCFD: "6758",
      //strEMRCFD: electricity.strEMRCFD,
      dfstrCapacitycharges: electricity?.dfstrCapacitycharges ?? "",
      dfstrSiteCharge: electricity?.dfstrSiteCharge ?? "",
      dfstrExceesCapacityCharegs: electricity?.dfstrExceesCapacityCharegs ?? "",
      dfstrReactiveCharges: electricity?.dfstrReactiveCharges ?? "",
      dfdecVatpercentage: "",
      dfdecCCLpercentage: "",
      dfbtePaperBill: business?.btePaperBill ?? "",
      dfbtemicrobuisnes: business?.btemicrobuisnes ?? "",
      dfintUserIntroducerId: "",
      dfstrFITcharge: electricity?.dfstrFITcharge ?? "",
      dfbteMopCustomer: electricity?.dfbteMopCustomer ?? "",
      dfbteMopDADCCustomer: electricity?.dfbteMopDADCCustomer ?? "",
      dfbteMopCustomerIsIsta: "",
      dfstrEAName: acManager?.strEAName ?? "",
      dfstrEAEmail: acManager?.strEAEmail ?? "",
      dfstrEAPhoneNo: acManager?.strEAPhoneNo ?? "",
      dfstrEAMobileNo: business?.strEAMobileNo ?? "",
      dfbIsRHT: "",
      dfintpartnerEmail: "",
      dfstrSupplyName: business?.business_Name ?? "",
      dfstrNameOfBill: business?.strNameOfBill ?? "",
      dfstrPropertOwnerShip: business?.strPropertOwnerShip ?? "",
      dfstrLeaseName: "",
      dfstrLeaseEmail: "",
      dfstrLeasePhone: "",
      dfstrCustomerRefNo: business?.strCustomerRefNo ?? "",
      dfintPaymentTermDays: paymentDetail?.intPaymentTermDays ?? "",
      dfintSubUserId: "",
      dfstrDobOwner1: /*soleBusinessType?.strDobOwner1 ??*/ "",
      dfhome_Address: soleBusinessType?.home_Address ?? "",
      dfhome_Address2: soleBusinessType?.home_Address2 ?? "",
      dfstrHomeAdressPostCode: soleBusinessType?.strHomeAdressPostCode ?? "",
      dfstrHomeAdressCity: soleBusinessType?.strHomeAdressCity ?? "",
      dfstrHomeaddressLiveYear: soleBusinessType?.strHomeaddressLiveYear ?? "",
      dfstrHomeaddressLiveMonth:
          soleBusinessType?.strHomeaddressLiveMonth ?? "",
      dfstrHomeaddress1: soleBusinessType?.strHomeaddress1 ?? "",
      dfstrHomeaddress2: soleBusinessType?.strHomeaddress2 ?? "",
      dfstrHomeaddressCity1: soleBusinessType?.strHomeaddressCity1 ?? "",
      dfstrHomeaddressPostCode1:
          soleBusinessType?.strHomeaddressPostCode1 ?? "",
      dfstrHomeaddressLiveYear1:
          soleBusinessType?.strHomeaddressLiveYear1 ?? "",
      dfstrHomeaddressLiveMonth1:
          soleBusinessType?.strHomeaddressLiveMonth1 ?? "",
      dfstrHomeaddress3: soleBusinessType?.strHomeaddress3 ?? "",
      dfstrHomeaddress4: soleBusinessType?.strHomeaddress4 ?? "",
      dfstrHomeaddressCity2: soleBusinessType?.strHomeaddressCity2 ?? "",
      dfstrHomeaddressPostCode2:
          soleBusinessType?.strHomeaddressPostCode2 ?? "",
      dfstrHomeaddressPostLiveYear2:
          soleBusinessType?.strHomeaddressPostLiveYear2 ?? "",
      dfstrHomeaddressPostLiveMonth2:
          soleBusinessType?.strHomeaddressPostLiveMonth2 ?? "",
      dfstrHomeaddress5: soleBusinessType?.strHomeaddress5 ?? "",
      dfstrHomeaddress6: soleBusinessType?.strHomeaddress6 ?? "",
      dfstrHomeaddressCity3: soleBusinessType?.strHomeaddressCity3 ?? "",
      dfstrHomeaddressPostCode3:
          soleBusinessType?.strHomeaddressPostCode3 ?? "",
      dfstrHomeaddressLiveYear3:
          soleBusinessType?.strHomeaddressLiveYear3 ?? "",
      dfstrHomeaddressLivemonth3:
          soleBusinessType?.strHomeaddressLivemonth3 ?? "",
      dfstrHomeaddress7: soleBusinessType?.strHomeaddress7 ?? "",
      dfstrHomeaddress8: soleBusinessType?.strHomeaddress8 ?? "",
      dfstrHomeaddressCity4: soleBusinessType?.strHomeaddressCity4 ?? "",
      dfstrHomeaddressPostCode4:
          soleBusinessType?.strHomeaddressPostCode4 ?? "",
      dfstrHomeaddressLiveYear4:
          soleBusinessType?.strHomeaddressLiveYear4 ?? "",
      dfstrHomeaddressLiveMonth4:
          soleBusinessType?.strHomeaddressLiveMonth4 ?? "",
      dfstrHomeaddress9: soleBusinessType?.strHomeaddress9 ?? "",
      dfstrHomeaddress10: soleBusinessType?.strHomeaddress10 ?? "",
      dfstrHomeaddressCity5: soleBusinessType?.strHomeaddressCity5 ?? "",
      dfstrHomeaddressPostCode5:
          soleBusinessType?.strHomeaddressPostCode5 ?? "",
      dfstrHomeaddressLiveYear5:
          soleBusinessType?.strHomeaddressLiveYear5 ?? "",
      dfstrTitleQwner2: partnerShipType?.dfstrTitleQwner2 ?? "",
      dfstrFirstNameowner: partnerShipType?.dfstrFirstNameowner ?? "",
      dfstrLastNameowner: partnerShipType?.dfstrLastNameowner ?? "",
      dfstrDobOwner2: "",
      dfhome_Addressowner: partnerShipType?.dfhome_Addressowner ?? "",
      dfhome_Address2owner: partnerShipType?.dfhome_Address2owner ?? "",
      dfstrHomeAdressPostCodeowner:
          partnerShipType?.dfstrHomeAdressPostCodeowner ?? "",
      dfstrHomeAdressCityowner: partnerShipType?.dfstrHomeAdressCityowner ?? "",
      dfstrHomeaddressLiveYearowner:
          partnerShipType?.dfstrHomeaddressLiveYearowner ?? "",
      dfstrHomeaddressLiveMonthowner:
          partnerShipType?.dfstrHomeaddressLiveMonthowner ?? "",
      dfstrHomeaddress1owner: partnerShipType?.dfstrHomeaddress1owner ?? "",
      dfstrHomeaddress2owner: partnerShipType?.dfstrHomeaddress2owner ?? "",
      dfstrHomeaddressCity1owner:
          partnerShipType?.dfstrHomeaddressCity1owner ?? "",
      dfstrHomeaddressPostCode1owner:
          partnerShipType?.dfstrHomeaddressPostCode1owner ?? "",
      dfstrHomeaddressLiveYear1owner:
          partnerShipType?.dfstrHomeaddressLiveYear1owner ?? "",
      dfstrHomeaddressLiveMonth1owner:
          partnerShipType?.dfstrHomeaddressLiveMonth1owner ?? "",
      dfstrHomeaddress3owner: partnerShipType?.dfstrHomeaddress3owner ?? "",
      dfstrHomeaddress4owner: partnerShipType?.dfstrHomeaddress4owner ?? "",
      dfstrHomeaddressCity2owner:
          partnerShipType?.dfstrHomeaddressCity2owner ?? "",
      dfstrHomeaddressPostCode2owner:
          partnerShipType?.dfstrHomeaddressPostCode2owner ?? "",
      dfstrHomeaddressPostLiveYear2owner:
          partnerShipType?.dfstrHomeaddressPostLiveYear2owner ?? "",
      dfstrHomeaddressPostLiveMonth2owner:
          partnerShipType?.dfstrHomeaddressPostLiveMonth2owner ?? "",
      dfstrHomeaddress5owner: partnerShipType?.dfstrHomeaddress5owner ?? "",
      dfstrHomeaddress6owner: partnerShipType?.dfstrHomeaddress6owner ?? "",
      dfstrHomeaddressCity3owner:
          partnerShipType?.dfstrHomeaddressCity3owner ?? "",
      dfstrHomeaddressPostCode3owner:
          partnerShipType?.dfstrHomeaddressPostCode3owner ?? "",
      dfstrHomeaddressLiveYear3owner:
          partnerShipType?.dfstrHomeaddressLiveYear3owner ?? "",
      dfstrHomeaddressLivemonth3owner:
          partnerShipType?.dfstrHomeaddressLivemonth3owner ?? "",
      dfstrHomeaddress7owner: partnerShipType?.dfstrHomeaddress7owner ?? "",
      dfstrHomeaddress8owner: partnerShipType?.dfstrHomeaddress8owner ?? "",
      dfstrHomeaddressCity4owner:
          partnerShipType?.dfstrHomeaddressCity4owner ?? "",
      dfstrHomeaddressPostCode4owner:
          partnerShipType?.dfstrHomeaddressPostCode4owner ?? "",
      dfstrHomeaddressLiveYear4owner:
          partnerShipType?.dfstrHomeaddressLiveYear4owner ?? "",
      dfstrHomeaddressLiveMonth4owner:
          partnerShipType?.dfstrHomeaddressLiveMonth4owner ?? "",
      dfstrHomeaddress9owner: partnerShipType?.dfstrHomeaddress9owner ?? "",
      dfstrHomeaddress10owner: partnerShipType?.dfstrHomeaddress10owner ?? "",
      dfstrHomeaddressCity5owner:
          partnerShipType?.dfstrHomeaddressCity5owner ?? "",
      dfstrHomeaddressPostCode5owner:
          partnerShipType?.dfstrHomeaddressPostCode5owner ?? "",
      dfstrHomeaddressLiveYear5owner:
          partnerShipType?.dfstrHomeaddressLiveYear5owner ?? "",
      dfstrHomeaddressLiveMonth5owner:
          partnerShipType?.dfstrHomeaddressLiveMonth5owner ?? "",
      dfstrTitleQwner3: partnerShipType?.dfstrTitleQwner3 ?? "",
      dfstrFirstNameowner3: partnerShipType?.dfstrFirstNameowner3 ?? "",
      dfstrLastNameowner3: partnerShipType?.dfstrLastNameowner3 ?? "",
      dfstrstrDobOwner3: "",
      dfhome_Addressowner3: partnerShipType?.dfhome_Addressowner3 ?? "",
      dfhome_Address2owner3: partnerShipType?.dfhome_Address2owner3 ?? "",
      dfstrHomeAdressCityowner3:
          partnerShipType?.dfstrHomeAdressCityowner3 ?? "",
      dfstrHomeAdressPostCodeowner3:
          partnerShipType?.dfstrHomeAdressPostCodeowner3 ?? "",
      dfstrHomeaddressLiveYearowner3:
          partnerShipType?.dfstrHomeaddressLiveYearowner3 ?? "",
      dfstrHomeaddressLiveMonthowner3:
          partnerShipType?.dfstrHomeaddressLiveMonthowner3 ?? "",
      dfstrHomeaddress1owner3: partnerShipType?.dfstrHomeaddress1owner3 ?? "",
      dfstrHomeaddress2owner3: partnerShipType?.dfstrHomeaddress2owner3 ?? "",
      dfstrHomeaddressCity1owner3:
          partnerShipType?.dfstrHomeaddressCity1owner3 ?? "",
      dfstrHomeaddressPostCode1owner3:
          partnerShipType?.dfstrHomeaddressPostCode1owner3 ?? "",
      dfstrHomeaddressLiveYear1owner3:
          partnerShipType?.dfstrHomeaddressLiveYear1owner3 ?? "",
      dfstrHomeaddressLiveMonth1owner3:
          partnerShipType?.dfstrHomeaddressLiveMonth1owner3 ?? "",
      dfstrHomeaddress3owner3: partnerShipType?.dfstrHomeaddress3owner3 ?? "",
      dfstrHomeaddress4owner3: partnerShipType?.dfstrHomeaddress4owner3 ?? "",
      dfstrHomeaddressCity2owner3:
          partnerShipType?.dfstrHomeaddressCity2owner3 ?? "",
      dfstrHomeaddressPostCode2owner3:
          partnerShipType?.dfstrHomeaddressPostCode2owner3 ?? "",
      dfstrHomeaddressPostLiveYear2owner3:
          partnerShipType?.dfstrHomeaddressPostLiveYear2owner3 ?? "",
      dfstrHomeaddressPostLiveMonth2owner3:
          partnerShipType?.dfstrHomeaddressPostLiveMonth2owner3 ?? "",
      dfstrHomeaddress5owner3: partnerShipType?.dfstrHomeaddress5owner3 ?? "",
      dfstrHomeaddress6owner3: partnerShipType?.dfstrHomeaddress6owner3 ?? "",
      dfstrHomeaddressCity3owner3:
          partnerShipType?.dfstrHomeaddressCity3owner3 ?? "",
      dfstrHomeaddressPostCode3owner3:
          partnerShipType?.dfstrHomeaddressPostCode3owner3 ?? "",
      dfstrHomeaddressLiveYear3owner3:
          partnerShipType?.dfstrHomeaddressLiveYear3owner3 ?? "",
      dfstrHomeaddressLivemonth3owner3:
          partnerShipType?.dfstrHomeaddressLivemonth3owner3 ?? "",
      dfstrHomeaddress7owner3: partnerShipType?.dfstrHomeaddress7owner3 ?? "",
      dfstrHomeaddress8owner3: partnerShipType?.dfstrHomeaddress8owner3 ?? "",
      dfstrHomeaddressCity4owner3:
          partnerShipType?.dfstrHomeaddressCity4owner3 ?? "",
      dfstrHomeaddressPostCode4owner3:
          partnerShipType?.dfstrHomeaddressPostCode4owner3 ?? "",
      dfstrHomeaddressLiveYear4owner3:
          partnerShipType?.dfstrHomeaddressLiveYear4owner3 ?? "",
      dfstrHomeaddressLiveMonth4owner3:
          partnerShipType?.dfstrHomeaddressLiveMonth4owner3 ?? "",
      dfstrHomeaddress9owner3: partnerShipType?.dfstrHomeaddress9owner3 ?? "",
      dfstrHomeaddress10owner3: partnerShipType?.dfstrHomeaddress10owner3 ?? "",
      dfstrHomeaddressCity5owner3:
          partnerShipType?.dfstrHomeaddressCity5owner3 ?? "",
      dfstrHomeaddressPostCode5owner3:
          partnerShipType?.dfstrHomeaddressPostCode5owner3 ?? "",
      dfstrHomeaddressLiveYear5owner3:
          partnerShipType?.dfstrHomeaddressLiveYear5owner3 ?? "",
      dfstrHomeaddressLiveMonth5owner3:
          partnerShipType?.dfstrHomeaddressLiveMonth5owner3 ?? "",

      dfstrTitleQwner4: partnerShipType.dfstrTitleQwner4 ?? "",
      dfstrFirstNameowner4: partnerShipType.dfstrFirstNameowner4 ?? "",
      dfstrLastNameowner4: partnerShipType.dfstrLastNameowner4 ?? "",
      dfstrstrDobOwner4: "",
      dfhome_Addressowner4: partnerShipType.dfhome_Addressowner4 ?? "",
      dfhome_Address2owner4: partnerShipType.dfhome_Address2owner4 ?? "",
      dfstrHomeAdressCityowner4:
          partnerShipType.dfstrHomeAdressCityowner4 ?? "",
      dfstrHomeAdressPostCodeowner4:
          partnerShipType.dfstrHomeAdressPostCodeowner4 ?? "",
      dfstrHomeaddressLiveYearowner4:
          partnerShipType.dfstrHomeaddressLiveYearowner4 ?? "",
      dfstrHomeaddressLiveMonthowner4:
          partnerShipType.dfstrHomeaddressLiveMonthowner4 ?? "",
      dfstrHomeaddress1owner4: partnerShipType.dfstrHomeaddress1owner4 ?? "",
      dfstrHomeaddress2owner4: partnerShipType.dfstrHomeaddress2owner4 ?? "",
      dfstrHomeaddressCity1owner4:
          partnerShipType.dfstrHomeaddressCity1owner4 ?? "",
      dfstrHomeaddressPostCode1owner4:
          partnerShipType.dfstrHomeaddressPostCode1owner4 ?? "",
      dfstrHomeaddressLiveYear1owner4:
          partnerShipType.dfstrHomeaddressLiveYear1owner4 ?? "",
      dfstrHomeaddressLiveMonth1owner4:
          partnerShipType.dfstrHomeaddressLiveMonth1owner4 ?? "",
      dfstrHomeaddress3owner4: partnerShipType.dfstrHomeaddress3owner4 ?? "",
      dfstrHomeaddress4owner4: partnerShipType.dfstrHomeaddress4owner4 ?? "",
      dfstrHomeaddressCity2owner4:
          partnerShipType.dfstrHomeaddressCity2owner4 ?? "",
      dfstrHomeaddressPostCode2owner4:
          partnerShipType.dfstrHomeaddressPostCode2owner4 ?? "",
      dfstrHomeaddressPostLiveYear2owner4:
          partnerShipType.dfstrHomeaddressPostLiveYear2owner4 ?? "",
      dfstrHomeaddressPostLiveMonth2owner4:
          partnerShipType.dfstrHomeaddressPostLiveMonth2owner4 ?? "",
      dfstrHomeaddress5owner4: partnerShipType.dfstrHomeaddress5owner4 ?? "",
      dfstrHomeaddress6owner4: partnerShipType.dfstrHomeaddress6owner4 ?? "",
      dfstrHomeaddressCity3owner4:
          partnerShipType.dfstrHomeaddressCity3owner4 ?? "",
      dfstrHomeaddressPostCode3owner4:
          partnerShipType.dfstrHomeaddressPostCode3owner4 ?? "",
      dfstrHomeaddressLiveYear3owner4:
          partnerShipType.dfstrHomeaddressLiveYear3owner4 ?? "",
      dfstrHomeaddressLivemonth3owner4:
          partnerShipType.dfstrHomeaddressLivemonth3owner4 ?? "",
      dfstrHomeaddress7owner4: partnerShipType.dfstrHomeaddress7owner4 ?? "",
      dfstrHomeaddress8owner4: partnerShipType.dfstrHomeaddress8owner4 ?? "",
      dfstrHomeaddressCity4owner4:
          partnerShipType.dfstrHomeaddressCity4owner4 ?? "",
      dfstrHomeaddressPostCode4owner4:
          partnerShipType.dfstrHomeaddressPostCode4owner4 ?? "",
      dfstrHomeaddressLiveYear4owner4:
          partnerShipType.dfstrHomeaddressLiveYear4owner4 ?? "",
      dfstrHomeaddressLiveMonth4owner4:
          partnerShipType.dfstrHomeaddressLiveMonth4owner4 ?? "",
      dfstrHomeaddress9owner4: partnerShipType.dfstrHomeaddress9owner4 ?? "",
      dfstrHomeaddress10owner4: partnerShipType.dfstrHomeaddress10owner4 ?? "",
      dfstrHomeaddressCity5owner4:
          partnerShipType.dfstrHomeaddressCity5owner4 ?? "",
      dfstrHomeaddressPostCode5owner4:
          partnerShipType.dfstrHomeaddressPostCode5owner4 ?? "",
      dfstrHomeaddressLiveYear5owner4:
          partnerShipType.dfstrHomeaddressLiveYear5owner4 ?? "",
      dfstrHomeaddressLiveMonth5owner4:
          partnerShipType.dfstrHomeaddressLiveMonth5owner4 ?? "",
      dfstrTitleQwner5: partnerShipType.dfstrTitleQwner5 ?? "",
      dfstrFirstNameowner5: partnerShipType.dfstrFirstNameowner5 ?? "",
      dfstrLastNameowner5: partnerShipType.dfstrLastNameowner5 ?? "",
      dfstrstrDobOwner5: "",
      dfhome_Addressowner5: partnerShipType.dfhome_Addressowner5 ?? "",
      dfhome_Address2owner5: partnerShipType.dfhome_Address2owner5 ?? "",
      dfstrHomeAdressCityowner5:
          partnerShipType.dfstrHomeAdressCityowner5 ?? "",
      dfstrHomeAdressPostCodeowner5:
          partnerShipType.dfstrHomeAdressPostCodeowner5 ?? "",
      dfstrHomeaddressLiveYearowner5:
          partnerShipType.dfstrHomeaddressLiveYearowner5 ?? "",
      dfstrHomeaddressLiveMonthowner5:
          partnerShipType.dfstrHomeaddressLiveMonthowner5 ?? "",
      dfstrHomeaddress1owner5: partnerShipType.dfstrHomeaddress1owner5 ?? "",
      dfstrHomeaddress2owner5: partnerShipType.dfstrHomeaddress2owner5 ?? "",
      dfstrHomeaddressCity1owner5:
          partnerShipType.dfstrHomeaddressCity1owner5 ?? "",
      dfstrHomeaddressPostCode1owner5:
          partnerShipType.dfstrHomeaddressPostCode1owner5 ?? "",
      dfstrHomeaddressLiveYear1owner5:
          partnerShipType.dfstrHomeaddressLiveYear1owner5 ?? "",
      dfstrHomeaddressLiveMonth1owner5:
          partnerShipType.dfstrHomeaddressLiveMonth1owner5 ?? "",
      dfstrHomeaddress3owner5: partnerShipType.dfstrHomeaddress3owner5 ?? "",
      dfstrHomeaddress4owner5: partnerShipType.dfstrHomeaddress4owner5 ?? "",
      dfstrHomeaddressCity2owner5:
          partnerShipType.dfstrHomeaddressCity2owner5 ?? "",
      dfstrHomeaddressPostCode2owner5:
          partnerShipType.dfstrHomeaddressPostCode2owner5 ?? "",
      dfstrHomeaddressPostLiveYear2owner5:
          partnerShipType.dfstrHomeaddressPostLiveYear2owner5 ?? "",
      dfstrHomeaddressPostLiveMonth2owner5:
          partnerShipType.dfstrHomeaddressPostLiveMonth2owner5 ?? "",
      dfstrHomeaddress5owner5: partnerShipType.dfstrHomeaddress5owner5 ?? "",
      dfstrHomeaddress6owner5: partnerShipType.dfstrHomeaddress6owner5 ?? "",
      dfstrHomeaddressCity3owner5:
          partnerShipType.dfstrHomeaddressCity3owner5 ?? "",
      dfstrHomeaddressPostCode3owner5:
          partnerShipType.dfstrHomeaddressPostCode3owner5 ?? "",
      dfstrHomeaddressLiveYear3owner5:
          partnerShipType.dfstrHomeaddressLiveYear3owner5 ?? "",
      dfstrHomeaddressLivemonth3owner5:
          partnerShipType.dfstrHomeaddressLivemonth3owner5 ?? "",
      dfstrHomeaddress7owner5: partnerShipType.dfstrHomeaddress7owner5 ?? "",
      dfstrHomeaddress8owner5: partnerShipType.dfstrHomeaddress8owner5 ?? "",
      dfstrHomeaddressCity4owner5:
          partnerShipType.dfstrHomeaddressCity4owner5 ?? "",
      dfstrHomeaddressPostCode4owner5:
          partnerShipType.dfstrHomeaddressPostCode4owner5 ?? "",
      dfstrHomeaddressLiveYear4owner5:
          partnerShipType.dfstrHomeaddressLiveYear4owner5 ?? "",
      dfstrHomeaddressLiveMonth4owner5:
          partnerShipType.dfstrHomeaddressLiveMonth4owner5 ?? "",
      dfstrHomeaddress9owner5: partnerShipType.dfstrHomeaddress9owner5 ?? "",
      dfstrHomeaddress10owner5: partnerShipType.dfstrHomeaddress10owner5 ?? "",
      dfstrHomeaddressCity5owner5:
          partnerShipType.dfstrHomeaddressCity5owner5 ?? "",
      dfstrHomeaddressPostCode5owner5:
          partnerShipType.dfstrHomeaddressPostCode5owner5 ?? "",
      dfstrHomeaddressLiveYear5owner5:
          partnerShipType.dfstrHomeaddressLiveYear5owner5 ?? "",
      dfstrHomeaddressLiveMonth5owner5:
          partnerShipType.dfstrHomeaddressLiveMonth5owner5 ?? "",
      dfstrTitleQwner6: partnerShipType.dfstrTitleQwner6 ?? "",
      dfstrFirstNameowner6: partnerShipType.dfstrFirstNameowner6 ?? "",
      dfstrLastNameowner6: partnerShipType.dfstrLastNameowner6 ?? "",
      dfstrstrDobOwner6: "",
      dfhome_Addressowner6: partnerShipType.dfhome_Addressowner6 ?? "",
      dfhome_Address2owner6: partnerShipType.dfhome_Address2owner6 ?? "",
      dfstrHomeAdressCityowner6:
          partnerShipType.dfstrHomeAdressCityowner6 ?? "",
      dfstrHomeAdressPostCodeowner6:
          partnerShipType.dfstrHomeAdressPostCodeowner6 ?? "",
      dfstrHomeaddressLiveYearowner6:
          partnerShipType.dfstrHomeaddressLiveYearowner6 ?? "",
      dfstrHomeaddressLiveMonthowner6:
          partnerShipType.dfstrHomeaddressLiveMonthowner6 ?? "",
      dfstrHomeaddress1owner6: partnerShipType.dfstrHomeaddress1owner6 ?? "",
      dfstrHomeaddress2owner6: partnerShipType.dfstrHomeaddress2owner6 ?? "",
      dfstrHomeaddressCity1owner6:
          partnerShipType.dfstrHomeaddressCity1owner6 ?? "",
      dfstrHomeaddressPostCode1owner6:
          partnerShipType.dfstrHomeaddressPostCode1owner6 ?? "",
      dfstrHomeaddressLiveYear1owner6:
          partnerShipType.dfstrHomeaddressLiveYear1owner6 ?? "",
      dfstrHomeaddressLiveMonth1owner6:
          partnerShipType.dfstrHomeaddressLiveMonth1owner6 ?? "",
      dfstrHomeaddress3owner6: partnerShipType.dfstrHomeaddress3owner6 ?? "",
      dfstrHomeaddress4owner6: partnerShipType.dfstrHomeaddress4owner6 ?? "",
      dfstrHomeaddressCity2owner6:
          partnerShipType.dfstrHomeaddressCity2owner6 ?? "",
      dfstrHomeaddressPostCode2owner6:
          partnerShipType.dfstrHomeaddressPostCode2owner6 ?? "",
      dfstrHomeaddressPostLiveYear2owner6:
          partnerShipType.dfstrHomeaddressPostLiveYear2owner6 ?? "",
      dfstrHomeaddressPostLiveMonth2owner6:
          partnerShipType.dfstrHomeaddressPostLiveMonth2owner6 ?? "",
      dfstrHomeaddress5owner6: partnerShipType.dfstrHomeaddress5owner6 ?? "",
      dfstrHomeaddress6owner6: partnerShipType.dfstrHomeaddress6owner6 ?? "",
      dfstrHomeaddressCity3owner6:
          partnerShipType.dfstrHomeaddressCity3owner6 ?? "",
      dfstrHomeaddressPostCode3owner6:
          partnerShipType.dfstrHomeaddressPostCode3owner6 ?? "",
      dfstrHomeaddressLiveYear3owner6:
          partnerShipType.dfstrHomeaddressLiveYear3owner6 ?? "",
      dfstrHomeaddressLivemonth3owner6:
          partnerShipType.dfstrHomeaddressLivemonth3owner6 ?? "",
      dfstrHomeaddress7owner6: partnerShipType.dfstrHomeaddress7owner6 ?? "",
      dfstrHomeaddress8owner6: partnerShipType.dfstrHomeaddress8owner6 ?? "",
      dfstrHomeaddressCity4owner6:
          partnerShipType.dfstrHomeaddressCity4owner6 ?? "",
      dfstrHomeaddressPostCode4owner6:
          partnerShipType.dfstrHomeaddressPostCode4owner6 ?? "",
      dfstrHomeaddressLiveYear4owner6:
          partnerShipType.dfstrHomeaddressLiveYear4owner6 ?? "",
      dfstrHomeaddressLiveMonth4owner6:
          partnerShipType.dfstrHomeaddressLiveMonth4owner6 ?? "",
      dfstrHomeaddress9owner6: partnerShipType.dfstrHomeaddress9owner6 ?? "",
      dfstrHomeaddress10owner6: partnerShipType.dfstrHomeaddress10owner6 ?? "",
      dfstrHomeaddressCity5owner6:
          partnerShipType.dfstrHomeaddressCity5owner6 ?? "",
      dfstrHomeaddressPostCode5owner6:
          partnerShipType.dfstrHomeaddressPostCode5owner6 ?? "",
      dfstrHomeaddressLiveYear5owner6:
          partnerShipType.dfstrHomeaddressLiveYear5owner6 ?? "",
      dfstrHomeaddressLiveMonth5owner6:
          partnerShipType.dfstrHomeaddressLiveMonth5owner6 ?? "",
      dfstrTitleQwner7: partnerShipType.dfstrTitleQwner7 ?? "",
      dfstrFirstNameowner7: partnerShipType.dfstrFirstNameowner7 ?? "",
      dfstrLastNameowner7: partnerShipType.dfstrLastNameowner7 ?? "",
      dfstrstrDobOwner7: "",
      dfhome_Addressowner7: partnerShipType.dfhome_Addressowner7 ?? "",
      dfhome_Address2owner7: partnerShipType.dfhome_Address2owner7 ?? "",
      dfstrHomeAdressCityowner7:
          partnerShipType.dfstrHomeAdressCityowner7 ?? "",
      dfstrHomeAdressPostCodeowner7:
          partnerShipType.dfstrHomeAdressPostCodeowner7 ?? "",
      dfstrHomeaddressLiveYearowner7:
          partnerShipType.dfstrHomeaddressLiveYearowner7 ?? "",
      dfstrHomeaddressLiveMonthowner7:
          partnerShipType.dfstrHomeaddressLiveMonthowner7 ?? "",
      dfstrHomeaddress1owner7: partnerShipType.dfstrHomeaddress1owner7 ?? "",
      dfstrHomeaddress2owner7: partnerShipType.dfstrHomeaddress2owner7 ?? "",
      dfstrHomeaddressCity1owner7:
          partnerShipType.dfstrHomeaddressCity1owner7 ?? "",
      dfstrHomeaddressPostCode1owner7:
          partnerShipType.dfstrHomeaddressPostCode1owner7 ?? "",
      dfstrHomeaddressLiveYear1owner7:
          partnerShipType.dfstrHomeaddressLiveYear1owner7 ?? "",
      dfstrHomeaddressLiveMonth1owner7:
          partnerShipType.dfstrHomeaddressLiveMonth1owner7 ?? "",
      dfstrHomeaddress3owner7: partnerShipType.dfstrHomeaddress3owner7 ?? "",
      dfstrHomeaddress4owner7: partnerShipType.dfstrHomeaddress4owner7 ?? "",
      dfstrHomeaddressCity2owner7:
          partnerShipType.dfstrHomeaddressCity2owner7 ?? "",
      dfstrHomeaddressPostCode2owner7:
          partnerShipType.dfstrHomeaddressPostCode2owner7 ?? "",
      dfstrHomeaddressPostLiveYear2owner7:
          partnerShipType.dfstrHomeaddressPostLiveYear2owner7 ?? "",
      dfstrHomeaddressPostLiveMonth2owner7:
          partnerShipType.dfstrHomeaddressPostLiveMonth2owner7 ?? "",
      dfstrHomeaddress5owner7: partnerShipType.dfstrHomeaddress5owner7 ?? "",
      dfstrHomeaddress6owner7: partnerShipType.dfstrHomeaddress6owner7 ?? "",
      dfstrHomeaddressCity3owner7:
          partnerShipType.dfstrHomeaddressCity3owner7 ?? "",
      dfstrHomeaddressPostCode3owner7:
          partnerShipType.dfstrHomeaddressPostCode3owner7 ?? "",
      dfstrHomeaddressLiveYear3owner7:
          partnerShipType.dfstrHomeaddressLiveYear3owner7 ?? "",
      dfstrHomeaddressLivemonth3owner7:
          partnerShipType.dfstrHomeaddressLivemonth3owner7 ?? "",
      dfstrHomeaddress7owner7: partnerShipType.dfstrHomeaddress7owner7 ?? "",
      dfstrHomeaddress8owner7: partnerShipType.dfstrHomeaddress8owner7 ?? "",
      dfstrHomeaddressCity4owner7:
          partnerShipType.dfstrHomeaddressCity4owner7 ?? "",
      dfstrHomeaddressPostCode4owner7:
          partnerShipType.dfstrHomeaddressPostCode4owner7 ?? "",
      dfstrHomeaddressLiveYear4owner7:
          partnerShipType.dfstrHomeaddressLiveYear4owner7 ?? "",
      dfstrHomeaddressLiveMonth4owner7:
          partnerShipType.dfstrHomeaddressLiveMonth4owner7 ?? "",
      dfstrHomeaddress9owner7: partnerShipType.dfstrHomeaddress9owner7 ?? "",
      dfstrHomeaddress10owner7: partnerShipType.dfstrHomeaddress10owner7 ?? "",
      dfstrHomeaddressCity5owner7:
          partnerShipType.dfstrHomeaddressCity5owner7 ?? "",
      dfstrHomeaddressPostCode5owner7:
          partnerShipType.dfstrHomeaddressPostCode5owner7 ?? "",
      dfstrHomeaddressLiveYear5owner7:
          partnerShipType.dfstrHomeaddressLiveYear5owner7 ?? "",
      dfstrHomeaddressLiveMonth5owner7:
          partnerShipType.dfstrHomeaddressLiveMonth5owner7 ?? "",
      dfstrTitleQwner8: partnerShipType.dfstrTitleQwner8 ?? "",
      dfstrFirstNameowner8: partnerShipType.dfstrFirstNameowner8 ?? "",
      dfstrLastNameowner8: partnerShipType.dfstrLastNameowner8 ?? "",
      dfstrstrDobOwner8: "",
      dfhome_Addressowner8: partnerShipType.dfhome_Addressowner8 ?? "",
      dfhome_Address2owner8: partnerShipType.dfhome_Address2owner8 ?? "",
      dfstrHomeAdressCityowner8:
          partnerShipType.dfstrHomeAdressCityowner8 ?? "",
      dfstrHomeAdressPostCodeowner8:
          partnerShipType.dfstrHomeAdressPostCodeowner8 ?? "",
      dfstrHomeaddressLiveYearowner8:
          partnerShipType.dfstrHomeaddressLiveYearowner8 ?? "",
      dfstrHomeaddressLiveMonthowner8:
          partnerShipType.dfstrHomeaddressLiveMonthowner8 ?? "",
      dfstrHomeaddress1owner8: partnerShipType.dfstrHomeaddress1owner8 ?? "",
      dfstrHomeaddress2owner8: partnerShipType.dfstrHomeaddress2owner8 ?? "",
      dfstrHomeaddressCity1owner8:
          partnerShipType.dfstrHomeaddressCity1owner8 ?? "",
      dfstrHomeaddressPostCode1owner8:
          partnerShipType.dfstrHomeaddressPostCode1owner8 ?? "",
      dfstrHomeaddressLiveYear1owner8:
          partnerShipType.dfstrHomeaddressLiveYear1owner8 ?? "",
      dfstrHomeaddressLiveMonth1owner8:
          partnerShipType.dfstrHomeaddressLiveMonth1owner8 ?? "",
      dfstrHomeaddress3owner8: partnerShipType.dfstrHomeaddress3owner8 ?? "",
      dfstrHomeaddress4owner8: partnerShipType.dfstrHomeaddress4owner8 ?? "",
      dfstrHomeaddressCity2owner8:
          partnerShipType.dfstrHomeaddressCity2owner8 ?? "",
      dfstrHomeaddressPostCode2owner8:
          partnerShipType.dfstrHomeaddressPostCode2owner8 ?? "",
      dfstrHomeaddressPostLiveYear2owner8:
          partnerShipType.dfstrHomeaddressPostLiveYear2owner8 ?? "",
      dfstrHomeaddressPostLiveMonth2owner8:
          partnerShipType.dfstrHomeaddressPostLiveMonth2owner8 ?? "",
      dfstrHomeaddress5owner8: partnerShipType.dfstrHomeaddress5owner8 ?? "",
      dfstrHomeaddress6owner8: partnerShipType.dfstrHomeaddress6owner8 ?? "",
      dfstrHomeaddressCity3owner8:
          partnerShipType.dfstrHomeaddressCity3owner8 ?? "",
      dfstrHomeaddressPostCode3owner8:
          partnerShipType.dfstrHomeaddressPostCode3owner8 ?? "",
      dfstrHomeaddressLiveYear3owner8:
          partnerShipType.dfstrHomeaddressLiveYear3owner8 ?? "",
      dfstrHomeaddressLivemonth3owner8:
          partnerShipType.dfstrHomeaddressLivemonth3owner8 ?? "",
      dfstrHomeaddress7owner8: partnerShipType.dfstrHomeaddress7owner8 ?? "",
      dfstrHomeaddress8owner8: partnerShipType.dfstrHomeaddress8owner8 ?? "",
      dfstrHomeaddressCity4owner8:
          partnerShipType.dfstrHomeaddressCity4owner8 ?? "",
      dfstrHomeaddressPostCode4owner8:
          partnerShipType.dfstrHomeaddressPostCode4owner8 ?? "",
      dfstrHomeaddressLiveYear4owner8:
          partnerShipType.dfstrHomeaddressLiveYear4owner8 ?? "",
      dfstrHomeaddressLiveMonth4owner8:
          partnerShipType.dfstrHomeaddressLiveMonth4owner8 ?? "",
      dfstrHomeaddress9owner8: partnerShipType.dfstrHomeaddress9owner8 ?? "",
      dfstrHomeaddress10owner8: partnerShipType.dfstrHomeaddress10owner8 ?? "",
      dfstrHomeaddressCity5owner8:
          partnerShipType.dfstrHomeaddressCity5owner8 ?? "",
      dfstrHomeaddressPostCode5owner8:
          partnerShipType.dfstrHomeaddressPostCode5owner8 ?? "",
      dfstrHomeaddressLiveYear5owner8:
          partnerShipType.dfstrHomeaddressLiveYear5owner8 ?? "",
      dfstrHomeaddressLiveMonth5owner8:
          partnerShipType.dfstrHomeaddressLiveMonth5owner8 ?? "",
      dfstrTitleQwner9: partnerShipType.dfstrTitleQwner9 ?? "",
      dfstrFirstNameowner9: partnerShipType.dfstrFirstNameowner9 ?? "",
      dfstrLastNameowner9: partnerShipType.dfstrLastNameowner9 ?? "",
      dfstrstrDobOwner9: "",
      dfhome_Addressowner9: partnerShipType.dfhome_Addressowner9 ?? "",
      dfhome_Address2owner9: partnerShipType.dfhome_Address2owner9 ?? "",
      dfstrHomeAdressCityowner9:
          partnerShipType.dfstrHomeAdressCityowner9 ?? "",
      dfstrHomeAdressPostCodeowner9:
          partnerShipType.dfstrHomeAdressPostCodeowner9 ?? "",
      dfstrHomeaddressLiveYearowner9:
          partnerShipType.dfstrHomeaddressLiveYearowner9 ?? "",
      dfstrHomeaddressLiveMonthowner9:
          partnerShipType.dfstrHomeaddressLiveMonthowner9 ?? "",
      dfstrHomeaddress1owner9: partnerShipType.dfstrHomeaddress1owner9 ?? "",
      dfstrHomeaddress2owner9: partnerShipType.dfstrHomeaddress2owner9 ?? "",
      dfstrHomeaddressCity1owner9:
          partnerShipType.dfstrHomeaddressCity1owner9 ?? "",
      dfstrHomeaddressPostCode1owner9:
          partnerShipType.dfstrHomeaddressPostCode1owner9 ?? "",
      dfstrHomeaddressLiveYear1owner9:
          partnerShipType.dfstrHomeaddressLiveYear1owner9 ?? "",
      dfstrHomeaddressLiveMonth1owner9:
          partnerShipType.dfstrHomeaddressLiveMonth1owner9 ?? "",
      dfstrHomeaddress3owner9: partnerShipType.dfstrHomeaddress3owner9 ?? "",
      dfstrHomeaddress4owner9: partnerShipType.dfstrHomeaddress4owner9 ?? "",
      dfstrHomeaddressCity2owner9:
          partnerShipType.dfstrHomeaddressCity2owner9 ?? "",
      dfstrHomeaddressPostCode2owner9:
          partnerShipType.dfstrHomeaddressPostCode2owner9 ?? "",
      dfstrHomeaddressPostLiveYear2owner9:
          partnerShipType.dfstrHomeaddressPostLiveYear2owner9 ?? "",
      dfstrHomeaddressPostLiveMonth2owner9:
          partnerShipType.dfstrHomeaddressPostLiveMonth2owner9 ?? "",
      dfstrHomeaddress5owner9: partnerShipType.dfstrHomeaddress5owner9 ?? "",
      dfstrHomeaddress6owner9: partnerShipType.dfstrHomeaddress6owner9 ?? "",
      dfstrHomeaddressCity3owner9:
          partnerShipType.dfstrHomeaddressCity3owner9 ?? "",
      dfstrHomeaddressPostCode3owner9:
          partnerShipType.dfstrHomeaddressPostCode3owner9 ?? "",
      dfstrHomeaddressLiveYear3owner9:
          partnerShipType.dfstrHomeaddressLiveYear3owner9 ?? "",
      dfstrHomeaddressLivemonth3owner9:
          partnerShipType.dfstrHomeaddressLivemonth3owner9 ?? "",
      dfstrHomeaddress7owner9: partnerShipType.dfstrHomeaddress7owner9 ?? "",
      dfstrHomeaddress8owner9: partnerShipType.dfstrHomeaddress8owner9 ?? "",
      dfstrHomeaddressCity4owner9:
          partnerShipType.dfstrHomeaddressCity4owner9 ?? "",
      dfstrHomeaddressPostCode4owner9:
          partnerShipType.dfstrHomeaddressPostCode4owner9 ?? "",
      dfstrHomeaddressLiveYear4owner9:
          partnerShipType.dfstrHomeaddressLiveYear4owner9 ?? "",
      dfstrHomeaddressLiveMonth4owner9:
          partnerShipType.dfstrHomeaddressLiveMonth4owner9 ?? "",
      dfstrHomeaddress9owner9: partnerShipType.dfstrHomeaddress9owner9 ?? "",
      dfstrHomeaddress10owner9: partnerShipType.dfstrHomeaddress10owner9 ?? "",
      dfstrHomeaddressCity5owner9:
          partnerShipType.dfstrHomeaddressCity5owner9 ?? "",
      dfstrHomeaddressPostCode5owner9:
          partnerShipType.dfstrHomeaddressPostCode5owner9 ?? "",
      dfstrHomeaddressLiveYear5owner9:
          partnerShipType.dfstrHomeaddressLiveYear5owner9 ?? "",
      dfstrHomeaddressLiveMonth5owner9:
          partnerShipType.dfstrHomeaddressLiveMonth5owner9 ?? "",
      dfstrTitleQwner10: partnerShipType.dfstrTitleQwner10 ?? "",
      dfstrFirstNameowner10: partnerShipType.dfstrFirstNameowner10 ?? "",
      dfstrLastNameowner10: partnerShipType.dfstrLastNameowner10 ?? "",
      dfstrstrDobOwner10: "",
      dfhome_Addressowner10: partnerShipType.dfhome_Addressowner10 ?? "",
      dfhome_Address2owner10: partnerShipType.dfhome_Address2owner10 ?? "",
      dfstrHomeAdressCityowner10:
          partnerShipType.dfstrHomeAdressCityowner10 ?? "",
      dfstrHomeAdressPostCodeowner10:
          partnerShipType.dfstrHomeAdressPostCodeowner10 ?? "",
      dfstrHomeaddressLiveYearowner10:
          partnerShipType.dfstrHomeaddressLiveYearowner10 ?? "",
      dfstrHomeaddressLiveMonthowner10:
          partnerShipType.dfstrHomeaddressLiveMonthowner10 ?? "",
      dfstrHomeaddress1owner10: partnerShipType.dfstrHomeaddress1owner10 ?? "",
      dfstrHomeaddress2owner10: partnerShipType.dfstrHomeaddress2owner10 ?? "",
      dfstrHomeaddressCity1owner10:
          partnerShipType.dfstrHomeaddressCity1owner10 ?? "",
      dfstrHomeaddressPostCode1owner10:
          partnerShipType.dfstrHomeaddressPostCode1owner10 ?? "",
      dfstrHomeaddressLiveYear1owner10:
          partnerShipType.dfstrHomeaddressLiveYear1owner10 ?? "",
      dfstrHomeaddressLiveMonth1owner10:
          partnerShipType.dfstrHomeaddressLiveMonth1owner10 ?? "",
      dfstrHomeaddress3owner10: partnerShipType.dfstrHomeaddress3owner10 ?? "",
      dfstrHomeaddress4owner10: partnerShipType.dfstrHomeaddress4owner10 ?? "",
      dfstrHomeaddressCity2owner10:
          partnerShipType.dfstrHomeaddressCity2owner10 ?? "",
      dfstrHomeaddressPostCode2owner10:
          partnerShipType.dfstrHomeaddressPostCode2owner10 ?? "",
      dfstrHomeaddressPostLiveYear2owner10:
          partnerShipType.dfstrHomeaddressPostLiveYear2owner10 ?? "",
      dfstrHomeaddressPostLiveMonth2owner10:
          partnerShipType.dfstrHomeaddressPostLiveMonth2owner10 ?? "",
      dfstrHomeaddress5owner10: partnerShipType.dfstrHomeaddress5owner10 ?? "",
      dfstrHomeaddress6owner10: partnerShipType.dfstrHomeaddress6owner10 ?? "",
      dfstrHomeaddressCity3owner10:
          partnerShipType.dfstrHomeaddressCity3owner10 ?? "",
      dfstrHomeaddressPostCode3owner10:
          partnerShipType.dfstrHomeaddressPostCode3owner10 ?? "",
      dfstrHomeaddressLiveYear3owner10:
          partnerShipType.dfstrHomeaddressLiveYear3owner10 ?? "",
      dfstrHomeaddressLivemonth3owner10:
          partnerShipType.dfstrHomeaddressLivemonth3owner10 ?? "",
      dfstrHomeaddress7owner10: partnerShipType.dfstrHomeaddress7owner10 ?? "",
      dfstrHomeaddress8owner10: partnerShipType.dfstrHomeaddress8owner10 ?? "",
      dfstrHomeaddressCity4owner10:
          partnerShipType.dfstrHomeaddressCity4owner10 ?? "",
      dfstrHomeaddressPostCode4owner10:
          partnerShipType.dfstrHomeaddressPostCode4owner10 ?? "",
      dfstrHomeaddressLiveYear4owner10:
          partnerShipType.dfstrHomeaddressLiveYear4owner10 ?? "",
      dfstrHomeaddressLiveMonth4owner10:
          partnerShipType.dfstrHomeaddressLiveMonth4owner10 ?? "",
      dfstrHomeaddress9owner10: partnerShipType.dfstrHomeaddress9owner10 ?? "",
      dfstrHomeaddress10owner10:
          partnerShipType.dfstrHomeaddress10owner10 ?? "",
      dfstrHomeaddressCity5owner10:
          partnerShipType.dfstrHomeaddressCity5owner10 ?? "",
      dfstrHomeaddressPostCode5owner10:
          partnerShipType.dfstrHomeaddressPostCode5owner10 ?? "",
      dfstrHomeaddressLiveYear5owner10:
          partnerShipType.dfstrHomeaddressLiveYear5owner10 ?? "",
      dfstrHomeaddressLiveMonth5owner10:
          partnerShipType.dfstrHomeaddressLiveMonth5owner10 ?? "",

      dfstrTitlecharityowner2: charityBusinessType?.strTitlecharityowner2 ?? "",
      dfstrcharityowner2firstname:
          charityBusinessType?.strcharityowner2firstname ?? "",
      dfstrcharityowner2lastname:
          charityBusinessType?.strcharityowner2lastname ?? "",
      dfstrTitleLLPowner2: llpBusinessType?.strTitleLLPowner2 ?? "",
      dfstrLLPowner2FirstName: llpBusinessType?.strLLPowner2FirstName ?? "",
      dfstrLLPowner2LastName: llpBusinessType?.strLLPowner2LastName ?? "",
      dfstrTitleLLcowner2: llcBusinessType?.strTitleLLcowner2 ?? "",
      dfstrLLcowner2FirstName: llcBusinessType?.strLLcowner2FirstName ?? "",
      dfstrLLcowner2LastName: llcBusinessType?.strLLcowner2LastName ?? "",
      dfstrTitleOtherowner2: otherBusinessType?.strTitleOtherowner2 ?? "",
      dfstrOtherowner2FirstName:
          otherBusinessType?.strOtherowner2FirstName ?? "",
      dfstrOtherowner2LastName: otherBusinessType?.strOtherowner2LastName ?? "",
      dfStrContractTerm: "1",

      dfstrcontracttermelec: "",

      dfstrEnergizationstatus: electricity?.dfstrEnergizationstatus ?? "",
      dfstrNewConnection: electricity?.dfstrNewConnection ?? "",
      dfdecCCLExcumptionElec: "",
      dfstrStandingCharge: electricity?.dfstrStandingCharge ?? "",
      dfstrDayUnit: electricity?.dfstrDayUnit ?? "",
      dfstrNightUnit: electricity?.dfstrNightUnit ?? "",
      dfstrEWEUnit: electricity?.dfstrEWEUnit ?? "",
      dfdtContractEndDateEle: electricity?.dfdtContractEndDateEle ?? '',
      dfelectricityDay_EAC: electricity?.dfelectricityDay_EAC ?? '',
      dfelectricityEvening_EAC: electricity?.dfelectricityEvening_EAC ?? '',
      dfelectricityNight_EAC: electricity?.dfelectricityNight_EAC ?? '',
      dfdteGasStartDate: "27/10/2020",
      dfstrContractTermGas: "",
      dfstrdtecontractGas: "",
      dfdecCCLExcumptionGas: "",
      dfstrUnitPriceGas: "",
      dfstrStandingChargeGas: "",
      dfstrOtherbank: "NewTest",
      dfstrBankAddress: "hyetuinl",
      dfstrPaymentType: paymentDetail?.strPaymentType ?? "",
      dfstrBankCardNo: "",
      dfintFixedDDDays: "",
      dfdecFixedDDAmount: "",
      dfintCommTypeEleBroker: "2",
      dfintCommTypeGasBroker: "",
      dfstrFixedAmt: "",
      dfstrCommissionScUpliftElec: "",
      dfsubDecNightRHTUplift: "",
      dfsubDecSCUplift: "",
      dfsubDecDayUplift: "",
      dfsubDecEweUplift: "",
      dfsubDecSCGasUplift: "",
      dfsubDecDayGasUplift: "",
      dfintGroupId: "1",
      //dteElecStartDate: "27/10/2020",
      dfdteElecStartDate: electricity?.dfdteElecStartDate.toString() ?? "",
    ));

    print(response.DownloadZipPath);
    if (response.status == '7') {
      AppConstant.showSuccessToastAddProsp(
          context, "Prospect added and successfully generated");

      DownloadService.downloadFromUrl(response.DownloadZipPath);

      groupName.clear();
      DFPref.clearDFEleValues();
      DFPref.clearDFGasValues();
      DFPref.clearDFBusinessValues();
      DFPref.clearDFSiteAddValues();
      DFPref.clearDFBillAddValues();
      BusinessTypePref.clearDFOtherBusinessTypeAdd();
      BusinessTypePref.clearDFLtdBusiness();
      BusinessTypePref.clearDFCharityBusiness();
      BusinessTypePref.clearDFLLPBusiness();
      BusinessTypePref.clearDFLLCBusiness();
      BusinessTypePref.clearDFSoleBusiness();
      BusinessTypePref.clearDFPartnerBusiness();
      DFPref.clearDFPrimaryContactValues();
      DFPref.clearDFEAMValues();
      DFPref.clearDFPaymentValues();
      DFPref.clearDFPartnerValues();
      DFPref.clearDFGroupValues();
      Navigator.of(context).pushReplacement(
          new MaterialPageRoute(builder: (context) => new HomePage()));
    } else if (response.status == '6') {
      if (buttonMessage == 'SaveAndAddAnother') {
        AppConstant.showSuccessToastAddProsp(context, "Successfully Added");
        groupName.clear();
        DFPref.clearDFEleValues();
        DFPref.clearDFGasValues();
        DFPref.clearDFBusinessValues();
        DFPref.clearDFSiteAddValues();
        DFPref.clearDFBillAddValues();
        DFPref.clearDFPrimaryContactValues();
        BusinessTypePref.clearDFOtherBusinessTypeAdd();
        BusinessTypePref.clearDFLtdBusiness();
        BusinessTypePref.clearDFCharityBusiness();
        BusinessTypePref.clearDFLLPBusiness();
        BusinessTypePref.clearDFLLCBusiness();
        BusinessTypePref.clearDFSoleBusiness();
        BusinessTypePref.clearDFPartnerBusiness();
        DFPref.clearDFEAMValues();
        DFPref.clearDFPaymentValues();
        DFPref.clearDFPartnerValues();
        DFPref.clearDFGroupValues();
      }

      if (buttonMessage == 'SaveAndView') {
        AppConstant.showSuccessToastAddProsp(context, "Successfully Added");

        Navigator.of(context).pushReplacement(new MaterialPageRoute(
          builder: (context) => DualFuelTabView(),
        ));
      }
    } else {
      AppConstant.showFailToast(context, response.msg);
    }
  }
}
