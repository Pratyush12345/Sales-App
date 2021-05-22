import 'package:pozitive/Core/Model/Api/DualFuel-InsertAddProspect/newInsertAddProspCredential.dart';
import 'package:pozitive/Core/Model/Api/Electricity-InsertAddProspect/EleBusinessOwnershipDetailsCredential.dart';
import 'package:pozitive/Core/Model/Api/Electricity-InsertAddProspect/EleGroupCredential.dart';
import 'package:pozitive/Core/Services/DownloadService.dart';
import 'package:pozitive/Util/PrefBusinessType/ElePrefBusines.dart';
import 'package:pozitive/Util/electricity_pref.dart';
import 'package:pozitive/Core/Services/database.dart';
import 'package:pozitive/Core/ViewModel/baseModel.dart';
import 'package:pozitive/Core/enums/view_state.dart';
import 'package:flutter/material.dart';
import '../../baseview.dart';
import 'package:pozitive/Core/Model/Api/Electricity-InsertAddProspect/ElePartnerCredential.dart';
import 'package:pozitive/Core/AppConstact/appConstant.dart';
import 'package:pozitive/Core/Model/Api/Electricity-InsertAddProspect/EleBillAddCredential.dart';
import 'package:pozitive/Core/Model/Api/Electricity-InsertAddProspect/EleBusCredential.dart';
import 'package:pozitive/Core/Model/Api/Electricity-InsertAddProspect/EleSiteAddressCredential.dart';
import 'package:pozitive/Core/Model/Api/Electricity-InsertAddProspect/ElePaymentCredential.dart';
import 'package:pozitive/Core/Model/Api/Electricity-InsertAddProspect/EleEAMCredential.dart';
import 'package:pozitive/Core/Model/Api/Electricity-InsertAddProspect/EleEleCredentials.dart';
import 'package:pozitive/Core/baseview.dart';
import 'package:pozitive/Core/Model/Api/InsertAddProspect/ProspectGetAddPartnerCredetial.dart';
import 'package:pozitive/Core/Model/InsertAddProspect/GetAddProspectModel.dart';
import 'package:pozitive/Pages/Add-Prospect-FormTab-view/Electicity/electicityView.dart';
import 'package:pozitive/Pages/homepage.dart';

Database database = getIt<DatabaseImplementation>();

EleGroupCredential credential = EleGroupCredential();

class EleGroupAddProspectViewModel extends BaseModel {
  bool autovalidation = false;

  int groupNameSelected = 0;

  TextEditingController groupName = TextEditingController();

  List groupNameList = ["Group 1", "Group 2", "Group 3"];

  String get getBusinessType {
    if (business.business_Type == 'Select Business Type') {
      return '0';
    }
    if (business.business_Type == 'Ltd') {
      return '1';
    }
    if (business.business_Type == 'Sole Proprietor') {
      return '2';
    }
    if (business.business_Type == 'Partnership') {
      return '3';
    }
    if (business.business_Type == 'Charity') {
      return '4';
    }
    if (business.business_Type == 'LLP') {
      return '5';
    }
    if (business.business_Type == 'LLC') {
      return '6';
    }
    if (business.business_Type == 'Other') {
      return '7';
    }
    return '';
  }

  ProspectGetAddPartnerModel addPartnerModel;

  List<LstGroup> lstGroup = [];
  void getGroupDetails(ProspectGetAddCredential credential) async {
    assert(credential != null);

    setState(ViewState.BUSY);

    final response = await database.getAddProspectService(credential);
    addPartnerModel = response;

    print('rrrrr${addPartnerModel.toJson()}  ==');
    if (isNotError(response)) {
      addPartnerModel = response;
      print(response);
    } else {
      print("error");
    }

    setState(ViewState.IDLE);
  }

  EleEleCredentials electricity;
  EleBusCredential business;
  EleSiteAddressCredential siteAdd;
  EleBillAddCredential billingadd;
  EleEAMCredential acManager;
  ElePartnerCredential partnerDetail;
  ElePaymentCredential paymentDetail;
  SoleBusinessCredential soleBusinessType;
  OtherBusinessCredential otherBusinessType;
  LtdBusinessCredential ltdBusinessType;
  CharityBusinessCredential charityBusinessType;
  LLPBusinessCredential llpBusinessType;
  LLCBusinessCredential llcBusinessType;
  PartnerShipBusinessCredential partnerShipType;

  void getDataFromPref(String accountId, String buttonMessage,
      BuildContext context, String brokerId) async {
    setState(ViewState.BUSY);
    electricity = await ElectricityPref.getElectricityEleValues();
    business = await ElectricityPref.getElectricityBusValues();
    siteAdd = await ElectricityPref.getElectricitySiteAddressValues();
    billingadd = await ElectricityPref.getElectricityBillingAddressValues();
    acManager = await ElectricityPref.getElectricityEAMValues();
    paymentDetail = await ElectricityPref.getElectricityPaymentValues();
    partnerDetail = await ElectricityPref.getElectricityPartnerValues();

    soleBusinessType = await EleBusinessTypePref.getSoleBusinessTypeAdd();
    otherBusinessType = await EleBusinessTypePref.getOtherBusinessTypeAdd();
    ltdBusinessType = await EleBusinessTypePref.getltdBusinessTypeAdd();
    charityBusinessType = await EleBusinessTypePref.getCharityBusinessTypeAdd();
    llpBusinessType = await EleBusinessTypePref.getLLPBusinessTypeAdd();
    llcBusinessType = await EleBusinessTypePref.getLLCBusinessTypeAdd();
    partnerShipType = await EleBusinessTypePref.getPartnerShipBusinessTypeAdd();
    //print("Ele Payment Data : ${electricity.toJson()}");
    //print("Ele Payment Data : ${electricity.fullMpanRHT}");
    //onSaveApiCall(accountId, buttonMessage, context);

    if (electricity != null && billingadd != null && business != null) {
      print('333333333333333${business.toJson()}');
      // print(siteAddress.toJson());
      // print(billAddress.toJson());
      onSaveApiCall(accountId, buttonMessage, context, brokerId);
    } else {
      AppConstant.showFailToast(context, 'Enter all details properly');
    }

    setState(ViewState.IDLE);
    // print("Ele Payment Data : ${electricity.toJson()}");
  }

  Future onSaveApiCall(String accountID, String buttonMessage,
      BuildContext context, String brokerId) async {
    //final user = Provider.of<User>(context);
    setState(ViewState.BUSY);
    final response = await database
        .passElectricityAddProspectServices(ELEInsertAddProspectCredentials(
      accountId: accountID.toString(),
      strFueltype: "2",
      //fullMpan: "038012011300004860599",
      fullMpan: electricity.fullMpan,
      fullMprn: "9874654217",
      //fullMprn: gas?.fullMprn,
      fullMpanRHT: '',
      intBrokerId: brokerId,
      customerid: "0",
      strbtnCommand: "",
      buttonCommandinsert: buttonMessage.toString(),
      //     "SaveAndView", //(For example---à SaveAndGenerateContract, SaveAndAddAnother)
      rhtcheckbox: electricity.rhtcheckbox,
      companyid: "1", /////
      strBillinTermType: billingadd?.elestrBillinTermType ?? "",
      strCompanyRegNo: business?.strCompanyRegNo ?? "",
      // business_Type : business?.business_Type,
      business_Type: getBusinessType,
      strTitleDirector1: ltdBusinessType?.strTitleDirector1 ?? "",
      strDirector1Firstname: ltdBusinessType?.strDirector1Firstname ?? "",
      strDirector1Lastname: ltdBusinessType?.strDirector1Lastname ?? "",
      strTitleDirector2: ltdBusinessType?.strTitleDirector2 ?? "",
      strDirector2Firstname: ltdBusinessType?.strDirector2Firstname ?? "",
      strDirector2Lastname: ltdBusinessType?.strDirector2Lastname ?? "",
      strTitleQwner1: soleBusinessType?.strTitleQwner1 ?? "",
      firstName: soleBusinessType?.firstName ?? "",
      lastName: soleBusinessType?.lastName ?? "",
      strTitlecharityowner1: charityBusinessType?.strTitlecharityowner1 ?? "",
      strcharityowner1firstname:
          charityBusinessType?.strcharityowner1firstname ?? "",
      strcharityowner1lastname:
          charityBusinessType?.strcharityowner1lastname ?? "",
      strchariryRegisterNo: charityBusinessType?.strchariryRegisterNo ?? "",
      strTitleLLPowner1: llpBusinessType?.strTitleLLPowner1 ?? "",
      strLLPowner1FirstName: llpBusinessType?.strLLPowner1FirstName ?? "",
      strLLPowner1LastName: llpBusinessType?.strLLPowner1LastName ?? "",
      strTitleLLcowner1: llcBusinessType?.strTitleLLcowner1 ?? "",
      strLLcowner1FirstName: llcBusinessType?.strLLcowner1FirstName ?? "",
      strLLcowner1LastName: llcBusinessType?.strLLcowner1LastName ?? "",
      strTitleOtherowner1: otherBusinessType?.otherstrTitleOtherowner1 ?? "",
      strOtherowner1FirstName:
          otherBusinessType?.otherstrOtherowner1FirstName ?? "",
      strOtherowner1LastName:
          otherBusinessType?.otherstrOtherowner1LastName ?? "",
      telNo: "",
      alternative_Number: business?.alternative_Number ?? "",
      //alternative_Number: "7454845354",
      email: business?.email ?? "",
      registeredCompanyName: business?.registeredCompanyName ?? "",
      strEcosPostcode: "",
      strEcosaddress1: "",
      strEcosaddress2: "",
      strEcosCity: "",
      strSitePostCode: siteAdd?.strSitePostCode ?? "",
      // strSitePostCode : "EC1A 1BB",
      strSiteAddress1: siteAdd?.strSiteAddress1 ?? "",
      strSiteAddress2: siteAdd?.strSiteAddress2 ?? "",
      strSiteTown: siteAdd.strSiteTown ?? "",
      strBillPostCode: billingadd.elestrBillPostCode ?? "",
      strBillAddress1: billingadd.elestrBillAddress1 ?? "",
      strBillAddress2: billingadd.elestrBillAddress2 ?? "",
      town1: billingadd.eletown1 ?? "",
      business_Name: business?.business_Name ?? "",
      // business_Name : "regel",
      //strBankSortCode: "75437865",
      strBankSortCode: paymentDetail?.strBankSortCode ?? "",
      //strBankName: "Abbey National Treasury Services Plc",
      strBankName: paymentDetail?.strBankName ?? "",
      strBankACName: paymentDetail?.strBankACName ?? "",
      strBankACNo: paymentDetail?.strBankACNo ?? "",
      strEMRCFD: "6758",
      //strEMRCFD: electricity.strEMRCFD,
      strCapacitycharges: electricity?.strCapacitycharges ?? "",
      strSiteCharge: electricity?.strSiteCharge ?? "",
      strExceesCapacityCharegs: electricity?.strExceesCapacityCharegs ?? "",
      strReactiveCharges: electricity?.strReactiveCharges ?? "",
      decVatpercentage: "",
      decCCLpercentage: "",
      btePaperBill: business?.btePaperBill ?? "",
      btemicrobuisnes: business?.btemicrobuisnes ?? "",
      intUserIntroducerId: "",
      strFITcharge: electricity?.strFITcharge ?? "",
      bteMopCustomer: electricity?.bteMopCustomer ?? "",
      bteMopDADCCustomer: electricity?.bteMopDADCCustomer ?? "",
      bteMopCustomerIsIsta: "",
      strEAName: acManager?.strEAName ?? "",
      strEAEmail: acManager?.strEAEmail ?? "",
      strEAPhoneNo: acManager?.strEAPhoneNo ?? "",
      strEAMobileNo: business?.strEAMobileNo ?? "",
      bIsRHT: "",
      intpartnerEmail: "",
      strSupplyName: business?.business_Name ?? "",
      strNameOfBill: business?.strNameOfBill ?? "",
      strPropertOwnerShip: business?.strPropertOwnerShip ?? "",
      strLeaseName: "",
      strLeaseEmail: "",
      strLeasePhone: "",
      strCustomerRefNo: business?.strCustomerRefNo ?? "",
      intPaymentTermDays: paymentDetail?.intPaymentTermDays ?? "",
      intSubUserId: "",
      strDobOwner1: /*soleBusinessType?.strDobOwner1 ??*/ "",
      home_Address: soleBusinessType?.home_Address ?? "",
      home_Address2: soleBusinessType?.home_Address2 ?? "",
      strHomeAdressPostCode: soleBusinessType?.strHomeAdressPostCode ?? "",
      strHomeAdressCity: soleBusinessType?.strHomeAdressCity ?? "",
      strHomeaddressLiveYear: soleBusinessType?.strHomeaddressLiveYear ?? "",
      strHomeaddressLiveMonth: soleBusinessType?.strHomeaddressLiveMonth ?? "",
      strHomeaddress1: soleBusinessType?.strHomeaddress1 ?? "",
      strHomeaddress2: soleBusinessType?.strHomeaddress2 ?? "",
      strHomeaddressCity1: soleBusinessType?.strHomeaddressCity1 ?? "",
      strHomeaddressPostCode1: soleBusinessType?.strHomeaddressPostCode1 ?? "",
      strHomeaddressLiveYear1: soleBusinessType?.strHomeaddressLiveYear1 ?? "",
      strHomeaddressLiveMonth1:
          soleBusinessType?.strHomeaddressLiveMonth1 ?? "",
      strHomeaddress3: soleBusinessType?.strHomeaddress3 ?? "",
      strHomeaddress4: soleBusinessType?.strHomeaddress4 ?? "",
      strHomeaddressCity2: soleBusinessType?.strHomeaddressCity2 ?? "",
      strHomeaddressPostCode2: soleBusinessType?.strHomeaddressPostCode2 ?? "",
      strHomeaddressPostLiveYear2:
          soleBusinessType?.strHomeaddressPostLiveYear2 ?? "",
      strHomeaddressPostLiveMonth2:
          soleBusinessType?.strHomeaddressPostLiveMonth2 ?? "",
      strHomeaddress5: soleBusinessType?.strHomeaddress5 ?? "",
      strHomeaddress6: soleBusinessType?.strHomeaddress6 ?? "",
      strHomeaddressCity3: soleBusinessType?.strHomeaddressCity3 ?? "",
      strHomeaddressPostCode3: soleBusinessType?.strHomeaddressPostCode3 ?? "",
      strHomeaddressLiveYear3: soleBusinessType?.strHomeaddressLiveYear3 ?? "",
      strHomeaddressLivemonth3:
          soleBusinessType?.strHomeaddressLivemonth3 ?? "",
      strHomeaddress7: soleBusinessType?.strHomeaddress7 ?? "",
      strHomeaddress8: soleBusinessType?.strHomeaddress8 ?? "",
      strHomeaddressCity4: soleBusinessType?.strHomeaddressCity4 ?? "",
      strHomeaddressPostCode4: soleBusinessType?.strHomeaddressPostCode4 ?? "",
      strHomeaddressLiveYear4: soleBusinessType?.strHomeaddressLiveYear4 ?? "",
      strHomeaddressLiveMonth4:
          soleBusinessType?.strHomeaddressLiveMonth4 ?? "",
      strHomeaddress9: soleBusinessType?.strHomeaddress9 ?? "",
      strHomeaddress10: soleBusinessType?.strHomeaddress10 ?? "",
      strHomeaddressCity5: soleBusinessType?.strHomeaddressCity5 ?? "",
      strHomeaddressPostCode5: soleBusinessType?.strHomeaddressPostCode5 ?? "",
      strHomeaddressLiveYear5: soleBusinessType?.strHomeaddressLiveYear5 ?? "",
//ptnership
      strTitleQwner2: partnerShipType?.strTitleQwner2 ?? "",
      strFirstNameowner: partnerShipType?.strFirstNameowner ?? "",
      strLastNameowner: partnerShipType?.strLastNameowner ?? "",
      strDobOwner2: "",
      home_Addressowner: partnerShipType?.home_Addressowner ?? "",
      home_Address2owner: partnerShipType?.home_Address2owner ?? "",
      strHomeAdressPostCodeowner:
          partnerShipType?.strHomeAdressPostCodeowner ?? "",
      strHomeAdressCityowner: partnerShipType?.strHomeAdressCityowner ?? "",
      strHomeaddressLiveYearowner:
          partnerShipType?.strHomeaddressLiveYearowner ?? "",
      strHomeaddressLiveMonthowner:
          partnerShipType?.strHomeaddressLiveMonthowner ?? "",
      strHomeaddress1owner: partnerShipType?.strHomeaddress1owner ?? "",
      strHomeaddress2owner: partnerShipType?.strHomeaddress2owner ?? "",
      strHomeaddressCity1owner: partnerShipType?.strHomeaddressCity1owner ?? "",
      strHomeaddressPostCode1owner:
          partnerShipType?.strHomeaddressPostCode1owner ?? "",
      strHomeaddressLiveYear1owner:
          partnerShipType?.strHomeaddressLiveYear1owner ?? "",
      strHomeaddressLiveMonth1owner:
          partnerShipType?.strHomeaddressLiveMonth1owner ?? "",
      strHomeaddress3owner: partnerShipType?.strHomeaddress3owner ?? "",
      strHomeaddress4owner: partnerShipType?.strHomeaddress4owner ?? "",
      strHomeaddressCity2owner: partnerShipType?.strHomeaddressCity2owner ?? "",
      strHomeaddressPostCode2owner:
          partnerShipType?.strHomeaddressPostCode2owner ?? "",
      strHomeaddressPostLiveYear2owner:
          partnerShipType?.strHomeaddressPostLiveYear2owner ?? "",
      strHomeaddressPostLiveMonth2owner:
          partnerShipType?.strHomeaddressPostLiveMonth2owner ?? "",
      strHomeaddress5owner: partnerShipType?.strHomeaddress5owner ?? "",
      strHomeaddress6owner: partnerShipType?.strHomeaddress6owner ?? "",
      strHomeaddressCity3owner: partnerShipType?.strHomeaddressCity3owner ?? "",
      strHomeaddressPostCode3owner:
          partnerShipType?.strHomeaddressPostCode3owner ?? "",
      strHomeaddressLiveYear3owner:
          partnerShipType?.strHomeaddressLiveYear3owner ?? "",
      strHomeaddressLivemonth3owner:
          partnerShipType?.strHomeaddressLivemonth3owner ?? "",
      strHomeaddress7owner: partnerShipType?.strHomeaddress7owner ?? "",
      strHomeaddress8owner: partnerShipType?.strHomeaddress8owner ?? "",
      strHomeaddressCity4owner: partnerShipType?.strHomeaddressCity4owner ?? "",
      strHomeaddressPostCode4owner:
          partnerShipType?.strHomeaddressPostCode4owner ?? "",
      strHomeaddressLiveYear4owner:
          partnerShipType?.strHomeaddressLiveYear4owner ?? "",
      strHomeaddressLiveMonth4owner:
          partnerShipType?.strHomeaddressLiveMonth4owner ?? "",
      strHomeaddress9owner: partnerShipType?.strHomeaddress9owner ?? "",
      strHomeaddress10owner: partnerShipType?.strHomeaddress10owner ?? "",
      strHomeaddressCity5owner: partnerShipType?.strHomeaddressCity5owner ?? "",
      strHomeaddressPostCode5owner:
          partnerShipType?.strHomeaddressPostCode5owner ?? "",
      strHomeaddressLiveYear5owner:
          partnerShipType?.strHomeaddressLiveYear5owner ?? "",
      strHomeaddressLiveMonth5owner:
          partnerShipType?.strHomeaddressLiveMonth5owner ?? "",
      strTitleQwner3: partnerShipType?.strTitleQwner3 ?? "",
      strFirstNameowner3: partnerShipType?.strFirstNameowner3 ?? "",
      strLastNameowner3: partnerShipType?.strLastNameowner3 ?? "",
      strstrDobOwner3: "",
      home_Addressowner3: partnerShipType?.home_Addressowner3 ?? "",
      home_Address2owner3: partnerShipType?.home_Address2owner3 ?? "",
      strHomeAdressCityowner3: partnerShipType?.strHomeAdressCityowner3 ?? "",
      strHomeAdressPostCodeowner3:
          partnerShipType?.strHomeAdressPostCodeowner3 ?? "",
      strHomeaddressLiveYearowner3:
          partnerShipType?.strHomeaddressLiveYearowner3 ?? "",
      strHomeaddressLiveMonthowner3:
          partnerShipType?.strHomeaddressLiveMonthowner3 ?? "",
      strHomeaddress1owner3: partnerShipType?.strHomeaddress1owner3 ?? "",
      strHomeaddress2owner3: partnerShipType?.strHomeaddress2owner3 ?? "",
      strHomeaddressCity1owner3:
          partnerShipType?.strHomeaddressCity1owner3 ?? "",
      strHomeaddressPostCode1owner3:
          partnerShipType?.strHomeaddressPostCode1owner3 ?? "",
      strHomeaddressLiveYear1owner3:
          partnerShipType?.strHomeaddressLiveYear1owner3 ?? "",
      strHomeaddressLiveMonth1owner3:
          partnerShipType?.strHomeaddressLiveMonth1owner3 ?? "",
      strHomeaddress3owner3: partnerShipType?.strHomeaddress3owner3 ?? "",
      strHomeaddress4owner3: partnerShipType?.strHomeaddress4owner3 ?? "",
      strHomeaddressCity2owner3:
          partnerShipType?.strHomeaddressCity2owner3 ?? "",
      strHomeaddressPostCode2owner3:
          partnerShipType?.strHomeaddressPostCode2owner3 ?? "",
      strHomeaddressPostLiveYear2owner3:
          partnerShipType?.strHomeaddressPostLiveYear2owner3 ?? "",
      strHomeaddressPostLiveMonth2owner3:
          partnerShipType?.strHomeaddressPostLiveMonth2owner3 ?? "",
      strHomeaddress5owner3: partnerShipType?.strHomeaddress5owner3 ?? "",
      strHomeaddress6owner3: partnerShipType?.strHomeaddress6owner3 ?? "",
      strHomeaddressCity3owner3:
          partnerShipType?.strHomeaddressCity3owner3 ?? "",
      strHomeaddressPostCode3owner3:
          partnerShipType?.strHomeaddressPostCode3owner3 ?? "",
      strHomeaddressLiveYear3owner3:
          partnerShipType?.strHomeaddressLiveYear3owner3 ?? "",
      strHomeaddressLivemonth3owner3:
          partnerShipType?.strHomeaddressLivemonth3owner3 ?? "",
      strHomeaddress7owner3: partnerShipType?.strHomeaddress7owner3 ?? "",
      strHomeaddress8owner3: partnerShipType?.strHomeaddress8owner3 ?? "",
      strHomeaddressCity4owner3:
          partnerShipType?.strHomeaddressCity4owner3 ?? "",
      strHomeaddressPostCode4owner3:
          partnerShipType?.strHomeaddressPostCode4owner3 ?? "",
      strHomeaddressLiveYear4owner3:
          partnerShipType?.strHomeaddressLiveYear4owner3 ?? "",
      strHomeaddressLiveMonth4owner3:
          partnerShipType?.strHomeaddressLiveMonth4owner3 ?? "",
      strHomeaddress9owner3: partnerShipType?.strHomeaddress9owner3 ?? "",
      strHomeaddress10owner3: partnerShipType?.strHomeaddress10owner3 ?? "",
      strHomeaddressCity5owner3:
          partnerShipType?.strHomeaddressCity5owner3 ?? "",
      strHomeaddressPostCode5owner3:
          partnerShipType?.strHomeaddressPostCode5owner3 ?? "",
      strHomeaddressLiveYear5owner3:
          partnerShipType?.strHomeaddressLiveYear5owner3 ?? "",
      strHomeaddressLiveMonth5owner3:
          partnerShipType?.strHomeaddressLiveMonth5owner3 ?? "",

      strTitleQwner4: partnerShipType?.strTitleQwner4 ?? "",
      strFirstNameowner4: partnerShipType?.strFirstNameowner4 ?? "",
      strLastNameowner4: partnerShipType?.strLastNameowner4 ?? "",
      strstrDobOwner4: "",
      home_Addressowner4: partnerShipType?.home_Addressowner4 ?? "",
      home_Address2owner4: partnerShipType?.home_Address2owner4 ?? "",
      strHomeAdressCityowner4: partnerShipType?.strHomeAdressCityowner4 ?? "",
      strHomeAdressPostCodeowner4:
          partnerShipType?.strHomeAdressPostCodeowner4 ?? "",
      strHomeaddressLiveYearowner4:
          partnerShipType?.strHomeaddressLiveYearowner4 ?? "",
      strHomeaddressLiveMonthowner4:
          partnerShipType?.strHomeaddressLiveMonthowner4 ?? "",
      strHomeaddress1owner4: partnerShipType?.strHomeaddress1owner4 ?? "",
      strHomeaddress2owner4: partnerShipType?.strHomeaddress2owner4 ?? "",
      strHomeaddressCity1owner4:
          partnerShipType?.strHomeaddressCity1owner4 ?? "",
      strHomeaddressPostCode1owner4:
          partnerShipType?.strHomeaddressPostCode1owner4 ?? "",
      strHomeaddressLiveYear1owner4:
          partnerShipType?.strHomeaddressLiveYear1owner4 ?? "",
      strHomeaddressLiveMonth1owner4:
          partnerShipType?.strHomeaddressLiveMonth1owner4 ?? "",
      strHomeaddress3owner4: partnerShipType?.strHomeaddress3owner4 ?? "",
      strHomeaddress4owner4: partnerShipType?.strHomeaddress4owner4 ?? "",
      strHomeaddressCity2owner4:
          partnerShipType?.strHomeaddressCity2owner4 ?? "",
      strHomeaddressPostCode2owner4:
          partnerShipType?.strHomeaddressPostCode2owner4 ?? "",
      strHomeaddressPostLiveYear2owner4:
          partnerShipType?.strHomeaddressPostLiveYear2owner4 ?? "",
      strHomeaddressPostLiveMonth2owner4:
          partnerShipType?.strHomeaddressPostLiveMonth2owner4 ?? "",
      strHomeaddress5owner4: partnerShipType?.strHomeaddress5owner4 ?? "",
      strHomeaddress6owner4: partnerShipType?.strHomeaddress6owner4 ?? "",
      strHomeaddressCity3owner4:
          partnerShipType?.strHomeaddressCity3owner4 ?? "",
      strHomeaddressPostCode3owner4:
          partnerShipType?.strHomeaddressPostCode3owner4 ?? "",
      strHomeaddressLiveYear3owner4:
          partnerShipType?.strHomeaddressLiveYear3owner4 ?? "",
      strHomeaddressLivemonth3owner4:
          partnerShipType?.strHomeaddressLivemonth3owner4 ?? "",
      strHomeaddress7owner4: partnerShipType?.strHomeaddress7owner4 ?? "",
      strHomeaddress8owner4: partnerShipType?.strHomeaddress8owner4 ?? "",
      strHomeaddressCity4owner4:
          partnerShipType?.strHomeaddressCity4owner4 ?? "",
      strHomeaddressPostCode4owner4:
          partnerShipType?.strHomeaddressPostCode4owner4 ?? "",
      strHomeaddressLiveYear4owner4:
          partnerShipType?.strHomeaddressLiveYear4owner4 ?? "",
      strHomeaddressLiveMonth4owner4:
          partnerShipType?.strHomeaddressLiveMonth4owner4 ?? "",
      strHomeaddress9owner4: partnerShipType?.strHomeaddress9owner4 ?? "",
      strHomeaddress10owner4: partnerShipType?.strHomeaddress10owner4 ?? "",
      strHomeaddressCity5owner4:
          partnerShipType?.strHomeaddressCity5owner4 ?? "",
      strHomeaddressPostCode5owner4:
          partnerShipType?.strHomeaddressPostCode5owner4 ?? "",
      strHomeaddressLiveYear5owner4:
          partnerShipType?.strHomeaddressLiveYear5owner4 ?? "",
      strHomeaddressLiveMonth5owner4:
          partnerShipType?.strHomeaddressLiveMonth5owner4 ?? "",
      strTitleQwner5: partnerShipType?.strTitleQwner5 ?? "",
      strFirstNameowner5: partnerShipType?.strFirstNameowner5 ?? "",
      strLastNameowner5: partnerShipType?.strLastNameowner5 ?? "",
      strstrDobOwner5: "",
      home_Addressowner5: partnerShipType?.home_Addressowner5 ?? "",
      home_Address2owner5: partnerShipType?.home_Address2owner5 ?? "",
      strHomeAdressCityowner5: partnerShipType?.strHomeAdressCityowner5 ?? "",
      strHomeAdressPostCodeowner5:
          partnerShipType?.strHomeAdressPostCodeowner5 ?? "",
      strHomeaddressLiveYearowner5:
          partnerShipType?.strHomeaddressLiveYearowner5 ?? "",
      strHomeaddressLiveMonthowner5:
          partnerShipType?.strHomeaddressLiveMonthowner5 ?? "",
      strHomeaddress1owner5: partnerShipType?.strHomeaddress1owner5 ?? "",
      strHomeaddress2owner5: partnerShipType?.strHomeaddress2owner5 ?? "",
      strHomeaddressCity1owner5:
          partnerShipType?.strHomeaddressCity1owner5 ?? "",
      strHomeaddressPostCode1owner5:
          partnerShipType?.strHomeaddressPostCode1owner5 ?? "",
      strHomeaddressLiveYear1owner5:
          partnerShipType?.strHomeaddressLiveYear1owner5 ?? "",
      strHomeaddressLiveMonth1owner5:
          partnerShipType?.strHomeaddressLiveMonth1owner5 ?? "",
      strHomeaddress3owner5: partnerShipType?.strHomeaddress3owner5 ?? "",
      strHomeaddress4owner5: partnerShipType?.strHomeaddress4owner5 ?? "",
      strHomeaddressCity2owner5:
          partnerShipType?.strHomeaddressCity2owner5 ?? "",
      strHomeaddressPostCode2owner5:
          partnerShipType?.strHomeaddressPostCode2owner5 ?? "",
      strHomeaddressPostLiveYear2owner5:
          partnerShipType?.strHomeaddressPostLiveYear2owner5 ?? "",
      strHomeaddressPostLiveMonth2owner5:
          partnerShipType?.strHomeaddressPostLiveMonth2owner5 ?? "",
      strHomeaddress5owner5: partnerShipType?.strHomeaddress5owner5 ?? "",
      strHomeaddress6owner5: partnerShipType?.strHomeaddress6owner5 ?? "",
      strHomeaddressCity3owner5:
          partnerShipType?.strHomeaddressCity3owner5 ?? "",
      strHomeaddressPostCode3owner5:
          partnerShipType?.strHomeaddressPostCode3owner5 ?? "",
      strHomeaddressLiveYear3owner5:
          partnerShipType?.strHomeaddressLiveYear3owner5 ?? "",
      strHomeaddressLivemonth3owner5:
          partnerShipType?.strHomeaddressLivemonth3owner5 ?? "",
      strHomeaddress7owner5: partnerShipType?.strHomeaddress7owner5 ?? "",
      strHomeaddress8owner5: partnerShipType?.strHomeaddress8owner5 ?? "",
      strHomeaddressCity4owner5:
          partnerShipType?.strHomeaddressCity4owner5 ?? "",
      strHomeaddressPostCode4owner5:
          partnerShipType?.strHomeaddressPostCode4owner5 ?? "",
      strHomeaddressLiveYear4owner5:
          partnerShipType?.strHomeaddressLiveYear4owner5 ?? "",
      strHomeaddressLiveMonth4owner5:
          partnerShipType?.strHomeaddressLiveMonth4owner5 ?? "",
      strHomeaddress9owner5: partnerShipType?.strHomeaddress9owner5 ?? "",
      strHomeaddress10owner5: partnerShipType?.strHomeaddress10owner5 ?? "",
      strHomeaddressCity5owner5:
          partnerShipType?.strHomeaddressCity5owner5 ?? "",
      strHomeaddressPostCode5owner5:
          partnerShipType?.strHomeaddressPostCode5owner5 ?? "",
      strHomeaddressLiveYear5owner5:
          partnerShipType?.strHomeaddressLiveYear5owner5 ?? "",
      strHomeaddressLiveMonth5owner5:
          partnerShipType?.strHomeaddressLiveMonth5owner5 ?? "",
      strTitleQwner6: partnerShipType?.strTitleQwner6 ?? "",
      strFirstNameowner6: partnerShipType?.strFirstNameowner6 ?? "",
      strLastNameowner6: partnerShipType?.strLastNameowner6 ?? "",
      strstrDobOwner6: "",
      home_Addressowner6: partnerShipType?.home_Addressowner6 ?? "",
      home_Address2owner6: partnerShipType?.home_Address2owner6 ?? "",
      strHomeAdressCityowner6: partnerShipType?.strHomeAdressCityowner6 ?? "",
      strHomeAdressPostCodeowner6:
          partnerShipType?.strHomeAdressPostCodeowner6 ?? "",
      strHomeaddressLiveYearowner6:
          partnerShipType?.strHomeaddressLiveYearowner6 ?? "",
      strHomeaddressLiveMonthowner6:
          partnerShipType?.strHomeaddressLiveMonthowner6 ?? "",
      strHomeaddress1owner6: partnerShipType?.strHomeaddress1owner6 ?? "",
      strHomeaddress2owner6: partnerShipType?.strHomeaddress2owner6 ?? "",
      strHomeaddressCity1owner6:
          partnerShipType?.strHomeaddressCity1owner6 ?? "",
      strHomeaddressPostCode1owner6:
          partnerShipType?.strHomeaddressPostCode1owner6 ?? "",
      strHomeaddressLiveYear1owner6:
          partnerShipType?.strHomeaddressLiveYear1owner6 ?? "",
      strHomeaddressLiveMonth1owner6:
          partnerShipType?.strHomeaddressLiveMonth1owner6 ?? "",
      strHomeaddress3owner6: partnerShipType?.strHomeaddress3owner6 ?? "",
      strHomeaddress4owner6: partnerShipType?.strHomeaddress4owner6 ?? "",
      strHomeaddressCity2owner6:
          partnerShipType?.strHomeaddressCity2owner6 ?? "",
      strHomeaddressPostCode2owner6:
          partnerShipType?.strHomeaddressPostCode2owner6 ?? "",
      strHomeaddressPostLiveYear2owner6:
          partnerShipType?.strHomeaddressPostLiveYear2owner6 ?? "",
      strHomeaddressPostLiveMonth2owner6:
          partnerShipType?.strHomeaddressPostLiveMonth2owner6 ?? "",
      strHomeaddress5owner6: partnerShipType?.strHomeaddress5owner6 ?? "",
      strHomeaddress6owner6: partnerShipType?.strHomeaddress6owner6 ?? "",
      strHomeaddressCity3owner6:
          partnerShipType?.strHomeaddressCity3owner6 ?? "",
      strHomeaddressPostCode3owner6:
          partnerShipType?.strHomeaddressPostCode3owner6 ?? "",
      strHomeaddressLiveYear3owner6:
          partnerShipType?.strHomeaddressLiveYear3owner6 ?? "",
      strHomeaddressLivemonth3owner6:
          partnerShipType?.strHomeaddressLivemonth3owner6 ?? "",
      strHomeaddress7owner6: partnerShipType?.strHomeaddress7owner6 ?? "",
      strHomeaddress8owner6: partnerShipType?.strHomeaddress8owner6 ?? "",
      strHomeaddressCity4owner6:
          partnerShipType?.strHomeaddressCity4owner6 ?? "",
      strHomeaddressPostCode4owner6:
          partnerShipType?.strHomeaddressPostCode4owner6 ?? "",
      strHomeaddressLiveYear4owner6:
          partnerShipType?.strHomeaddressLiveYear4owner6 ?? "",
      strHomeaddressLiveMonth4owner6:
          partnerShipType?.strHomeaddressLiveMonth4owner6 ?? "",
      strHomeaddress9owner6: partnerShipType?.strHomeaddress9owner6 ?? "",
      strHomeaddress10owner6: partnerShipType?.strHomeaddress10owner6 ?? "",
      strHomeaddressCity5owner6:
          partnerShipType?.strHomeaddressCity5owner6 ?? "",
      strHomeaddressPostCode5owner6:
          partnerShipType?.strHomeaddressPostCode5owner6 ?? "",
      strHomeaddressLiveYear5owner6:
          partnerShipType?.strHomeaddressLiveYear5owner6 ?? "",
      strHomeaddressLiveMonth5owner6:
          partnerShipType?.strHomeaddressLiveMonth5owner6 ?? "",
      strTitleQwner7: partnerShipType?.strTitleQwner7 ?? "",
      strFirstNameowner7: partnerShipType?.strFirstNameowner7 ?? "",
      strLastNameowner7: partnerShipType?.strLastNameowner7 ?? "",
      strstrDobOwner7: "",
      home_Addressowner7: partnerShipType?.home_Addressowner7 ?? "",
      home_Address2owner7: partnerShipType?.home_Address2owner7 ?? "",
      strHomeAdressCityowner7: partnerShipType?.strHomeAdressCityowner7 ?? "",
      strHomeAdressPostCodeowner7:
          partnerShipType?.strHomeAdressPostCodeowner7 ?? "",
      strHomeaddressLiveYearowner7:
          partnerShipType?.strHomeaddressLiveYearowner7 ?? "",
      strHomeaddressLiveMonthowner7:
          partnerShipType?.strHomeaddressLiveMonthowner7 ?? "",
      strHomeaddress1owner7: partnerShipType?.strHomeaddress1owner7 ?? "",
      strHomeaddress2owner7: partnerShipType?.strHomeaddress2owner7 ?? "",
      strHomeaddressCity1owner7:
          partnerShipType?.strHomeaddressCity1owner7 ?? "",
      strHomeaddressPostCode1owner7:
          partnerShipType?.strHomeaddressPostCode1owner7 ?? "",
      strHomeaddressLiveYear1owner7:
          partnerShipType?.strHomeaddressLiveYear1owner7 ?? "",
      strHomeaddressLiveMonth1owner7:
          partnerShipType?.strHomeaddressLiveMonth1owner7 ?? "",
      strHomeaddress3owner7: partnerShipType?.strHomeaddress3owner7 ?? "",
      strHomeaddress4owner7: partnerShipType?.strHomeaddress4owner7 ?? "",
      strHomeaddressCity2owner7:
          partnerShipType?.strHomeaddressCity2owner7 ?? "",
      strHomeaddressPostCode2owner7:
          partnerShipType?.strHomeaddressPostCode2owner7 ?? "",
      strHomeaddressPostLiveYear2owner7:
          partnerShipType?.strHomeaddressPostLiveYear2owner7 ?? "",
      strHomeaddressPostLiveMonth2owner7:
          partnerShipType?.strHomeaddressPostLiveMonth2owner7 ?? "",
      strHomeaddress5owner7: partnerShipType?.strHomeaddress5owner7 ?? "",
      strHomeaddress6owner7: partnerShipType?.strHomeaddress6owner7 ?? "",
      strHomeaddressCity3owner7:
          partnerShipType?.strHomeaddressCity3owner7 ?? "",
      strHomeaddressPostCode3owner7:
          partnerShipType?.strHomeaddressPostCode3owner7 ?? "",
      strHomeaddressLiveYear3owner7:
          partnerShipType?.strHomeaddressLiveYear3owner7 ?? "",
      strHomeaddressLivemonth3owner7:
          partnerShipType?.strHomeaddressLivemonth3owner7 ?? "",
      strHomeaddress7owner7: partnerShipType?.strHomeaddress7owner7 ?? "",
      strHomeaddress8owner7: partnerShipType?.strHomeaddress8owner7 ?? "",
      strHomeaddressCity4owner7:
          partnerShipType?.strHomeaddressCity4owner7 ?? "",
      strHomeaddressPostCode4owner7:
          partnerShipType?.strHomeaddressPostCode4owner7 ?? "",
      strHomeaddressLiveYear4owner7:
          partnerShipType?.strHomeaddressLiveYear4owner7 ?? "",
      strHomeaddressLiveMonth4owner7:
          partnerShipType?.strHomeaddressLiveMonth4owner7 ?? "",
      strHomeaddress9owner7: partnerShipType?.strHomeaddress9owner7 ?? "",
      strHomeaddress10owner7: partnerShipType?.strHomeaddress10owner7 ?? "",
      strHomeaddressCity5owner7:
          partnerShipType?.strHomeaddressCity5owner7 ?? "",
      strHomeaddressPostCode5owner7:
          partnerShipType?.strHomeaddressPostCode5owner7 ?? "",
      strHomeaddressLiveYear5owner7:
          partnerShipType?.strHomeaddressLiveYear5owner7 ?? "",
      strHomeaddressLiveMonth5owner7:
          partnerShipType?.strHomeaddressLiveMonth5owner7 ?? "",
      strTitleQwner8: partnerShipType?.strTitleQwner8 ?? "",
      strFirstNameowner8: partnerShipType?.strFirstNameowner8 ?? "",
      strLastNameowner8: partnerShipType?.strLastNameowner8 ?? "",
      strstrDobOwner8: "",
      home_Addressowner8: partnerShipType?.home_Addressowner8 ?? "",
      home_Address2owner8: partnerShipType?.home_Address2owner8 ?? "",
      strHomeAdressCityowner8: partnerShipType?.strHomeAdressCityowner8 ?? "",
      strHomeAdressPostCodeowner8:
          partnerShipType?.strHomeAdressPostCodeowner8 ?? "",
      strHomeaddressLiveYearowner8:
          partnerShipType?.strHomeaddressLiveYearowner8 ?? "",
      strHomeaddressLiveMonthowner8:
          partnerShipType?.strHomeaddressLiveMonthowner8 ?? "",
      strHomeaddress1owner8: partnerShipType?.strHomeaddress1owner8 ?? "",
      strHomeaddress2owner8: partnerShipType?.strHomeaddress2owner8 ?? "",
      strHomeaddressCity1owner8:
          partnerShipType?.strHomeaddressCity1owner8 ?? "",
      strHomeaddressPostCode1owner8:
          partnerShipType?.strHomeaddressPostCode1owner8 ?? "",
      strHomeaddressLiveYear1owner8:
          partnerShipType?.strHomeaddressLiveYear1owner8 ?? "",
      strHomeaddressLiveMonth1owner8:
          partnerShipType?.strHomeaddressLiveMonth1owner8 ?? "",
      strHomeaddress3owner8: partnerShipType?.strHomeaddress3owner8 ?? "",
      strHomeaddress4owner8: partnerShipType?.strHomeaddress4owner8 ?? "",
      strHomeaddressCity2owner8:
          partnerShipType?.strHomeaddressCity2owner8 ?? "",
      strHomeaddressPostCode2owner8:
          partnerShipType?.strHomeaddressPostCode2owner8 ?? "",
      strHomeaddressPostLiveYear2owner8:
          partnerShipType?.strHomeaddressPostLiveYear2owner8 ?? "",
      strHomeaddressPostLiveMonth2owner8:
          partnerShipType?.strHomeaddressPostLiveMonth2owner8 ?? "",
      strHomeaddress5owner8: partnerShipType?.strHomeaddress5owner8 ?? "",
      strHomeaddress6owner8: partnerShipType?.strHomeaddress6owner8 ?? "",
      strHomeaddressCity3owner8:
          partnerShipType?.strHomeaddressCity3owner8 ?? "",
      strHomeaddressPostCode3owner8:
          partnerShipType?.strHomeaddressPostCode3owner8 ?? "",
      strHomeaddressLiveYear3owner8:
          partnerShipType?.strHomeaddressLiveYear3owner8 ?? "",
      strHomeaddressLivemonth3owner8:
          partnerShipType?.strHomeaddressLivemonth3owner8 ?? "",
      strHomeaddress7owner8: partnerShipType?.strHomeaddress7owner8 ?? "",
      strHomeaddress8owner8: partnerShipType?.strHomeaddress8owner8 ?? "",
      strHomeaddressCity4owner8:
          partnerShipType?.strHomeaddressCity4owner8 ?? "",
      strHomeaddressPostCode4owner8:
          partnerShipType?.strHomeaddressPostCode4owner8 ?? "",
      strHomeaddressLiveYear4owner8:
          partnerShipType?.strHomeaddressLiveYear4owner8 ?? "",
      strHomeaddressLiveMonth4owner8:
          partnerShipType?.strHomeaddressLiveMonth4owner8 ?? "",
      strHomeaddress9owner8: partnerShipType?.strHomeaddress9owner8 ?? "",
      strHomeaddress10owner8: partnerShipType?.strHomeaddress10owner8 ?? "",
      strHomeaddressCity5owner8:
          partnerShipType?.strHomeaddressCity5owner8 ?? "",
      strHomeaddressPostCode5owner8:
          partnerShipType?.strHomeaddressPostCode5owner8 ?? "",
      strHomeaddressLiveYear5owner8:
          partnerShipType?.strHomeaddressLiveYear5owner8 ?? "",
      strHomeaddressLiveMonth5owner8:
          partnerShipType?.strHomeaddressLiveMonth5owner8 ?? "",
      strTitleQwner9: partnerShipType?.strTitleQwner9 ?? "",
      strFirstNameowner9: partnerShipType?.strFirstNameowner9 ?? "",
      strLastNameowner9: partnerShipType?.strLastNameowner9 ?? "",
      strstrDobOwner9: "",
      home_Addressowner9: partnerShipType?.home_Addressowner9 ?? "",
      home_Address2owner9: partnerShipType?.home_Address2owner9 ?? "",
      strHomeAdressCityowner9: partnerShipType?.strHomeAdressCityowner9 ?? "",
      strHomeAdressPostCodeowner9:
          partnerShipType?.strHomeAdressPostCodeowner9 ?? "",
      strHomeaddressLiveYearowner9:
          partnerShipType?.strHomeaddressLiveYearowner9 ?? "",
      strHomeaddressLiveMonthowner9:
          partnerShipType?.strHomeaddressLiveMonthowner9 ?? "",
      strHomeaddress1owner9: partnerShipType?.strHomeaddress1owner9 ?? "",
      strHomeaddress2owner9: partnerShipType?.strHomeaddress2owner9 ?? "",
      strHomeaddressCity1owner9:
          partnerShipType?.strHomeaddressCity1owner9 ?? "",
      strHomeaddressPostCode1owner9:
          partnerShipType?.strHomeaddressPostCode1owner9 ?? "",
      strHomeaddressLiveYear1owner9:
          partnerShipType?.strHomeaddressLiveYear1owner9 ?? "",
      strHomeaddressLiveMonth1owner9:
          partnerShipType?.strHomeaddressLiveMonth1owner9 ?? "",
      strHomeaddress3owner9: partnerShipType?.strHomeaddress3owner9 ?? "",
      strHomeaddress4owner9: partnerShipType?.strHomeaddress4owner9 ?? "",
      strHomeaddressCity2owner9:
          partnerShipType?.strHomeaddressCity2owner9 ?? "",
      strHomeaddressPostCode2owner9:
          partnerShipType?.strHomeaddressPostCode2owner9 ?? "",
      strHomeaddressPostLiveYear2owner9:
          partnerShipType?.strHomeaddressPostLiveYear2owner9 ?? "",
      strHomeaddressPostLiveMonth2owner9:
          partnerShipType?.strHomeaddressPostLiveMonth2owner9 ?? "",
      strHomeaddress5owner9: partnerShipType?.strHomeaddress5owner9 ?? "",
      strHomeaddress6owner9: partnerShipType?.strHomeaddress6owner9 ?? "",
      strHomeaddressCity3owner9:
          partnerShipType?.strHomeaddressCity3owner9 ?? "",
      strHomeaddressPostCode3owner9:
          partnerShipType?.strHomeaddressPostCode3owner9 ?? "",
      strHomeaddressLiveYear3owner9:
          partnerShipType?.strHomeaddressLiveYear3owner9 ?? "",
      strHomeaddressLivemonth3owner9:
          partnerShipType?.strHomeaddressLivemonth3owner9 ?? "",
      strHomeaddress7owner9: partnerShipType?.strHomeaddress7owner9 ?? "",
      strHomeaddress8owner9: partnerShipType?.strHomeaddress8owner9 ?? "",
      strHomeaddressCity4owner9:
          partnerShipType?.strHomeaddressCity4owner9 ?? "",
      strHomeaddressPostCode4owner9:
          partnerShipType?.strHomeaddressPostCode4owner9 ?? "",
      strHomeaddressLiveYear4owner9:
          partnerShipType?.strHomeaddressLiveYear4owner9 ?? "",
      strHomeaddressLiveMonth4owner9:
          partnerShipType?.strHomeaddressLiveMonth4owner9 ?? "",
      strHomeaddress9owner9: partnerShipType?.strHomeaddress9owner9 ?? "",
      strHomeaddress10owner9: partnerShipType?.strHomeaddress10owner9 ?? "",
      strHomeaddressCity5owner9:
          partnerShipType?.strHomeaddressCity5owner9 ?? "",
      strHomeaddressPostCode5owner9:
          partnerShipType?.strHomeaddressPostCode5owner9 ?? "",
      strHomeaddressLiveYear5owner9:
          partnerShipType?.strHomeaddressLiveYear5owner9 ?? "",
      strHomeaddressLiveMonth5owner9:
          partnerShipType?.strHomeaddressLiveMonth5owner9 ?? "",
      strTitleQwner10: partnerShipType?.strTitleQwner10 ?? "",
      strFirstNameowner10: partnerShipType?.strFirstNameowner10 ?? "",
      strLastNameowner10: partnerShipType?.strLastNameowner10 ?? "",
      strstrDobOwner10: "",
      home_Addressowner10: partnerShipType?.home_Addressowner10 ?? "",
      home_Address2owner10: partnerShipType?.home_Address2owner10 ?? "",
      strHomeAdressCityowner10: partnerShipType?.strHomeAdressCityowner10 ?? "",
      strHomeAdressPostCodeowner10:
          partnerShipType?.strHomeAdressPostCodeowner10 ?? "",
      strHomeaddressLiveYearowner10:
          partnerShipType?.strHomeaddressLiveYearowner10 ?? "",
      strHomeaddressLiveMonthowner10:
          partnerShipType?.strHomeaddressLiveMonthowner10 ?? "",
      strHomeaddress1owner10: partnerShipType?.strHomeaddress1owner10 ?? "",
      strHomeaddress2owner10: partnerShipType?.strHomeaddress2owner10 ?? "",
      strHomeaddressCity1owner10:
          partnerShipType?.strHomeaddressCity1owner10 ?? "",
      strHomeaddressPostCode1owner10:
          partnerShipType?.strHomeaddressPostCode1owner10 ?? "",
      strHomeaddressLiveYear1owner10:
          partnerShipType?.strHomeaddressLiveYear1owner10 ?? "",
      strHomeaddressLiveMonth1owner10:
          partnerShipType?.strHomeaddressLiveMonth1owner10 ?? "",
      strHomeaddress3owner10: partnerShipType?.strHomeaddress3owner10 ?? "",
      strHomeaddress4owner10: partnerShipType?.strHomeaddress4owner10 ?? "",
      strHomeaddressCity2owner10:
          partnerShipType?.strHomeaddressCity2owner10 ?? "",
      strHomeaddressPostCode2owner10:
          partnerShipType?.strHomeaddressPostCode2owner10 ?? "",
      strHomeaddressPostLiveYear2owner10:
          partnerShipType?.strHomeaddressPostLiveYear2owner10 ?? "",
      strHomeaddressPostLiveMonth2owner10:
          partnerShipType?.strHomeaddressPostLiveMonth2owner10 ?? "",
      strHomeaddress5owner10: partnerShipType?.strHomeaddress5owner10 ?? "",
      strHomeaddress6owner10: partnerShipType?.strHomeaddress6owner10 ?? "",
      strHomeaddressCity3owner10:
          partnerShipType?.strHomeaddressCity3owner10 ?? "",
      strHomeaddressPostCode3owner10:
          partnerShipType?.strHomeaddressPostCode3owner10 ?? "",
      strHomeaddressLiveYear3owner10:
          partnerShipType?.strHomeaddressLiveYear3owner10 ?? "",
      strHomeaddressLivemonth3owner10:
          partnerShipType?.strHomeaddressLivemonth3owner10 ?? "",
      strHomeaddress7owner10: partnerShipType?.strHomeaddress7owner10 ?? "",
      strHomeaddress8owner10: partnerShipType?.strHomeaddress8owner10 ?? "",
      strHomeaddressCity4owner10:
          partnerShipType?.strHomeaddressCity4owner10 ?? "",
      strHomeaddressPostCode4owner10:
          partnerShipType?.strHomeaddressPostCode4owner10 ?? "",
      strHomeaddressLiveYear4owner10:
          partnerShipType?.strHomeaddressLiveYear4owner10 ?? "",
      strHomeaddressLiveMonth4owner10:
          partnerShipType?.strHomeaddressLiveMonth4owner10 ?? "",
      strHomeaddress9owner10: partnerShipType?.strHomeaddress9owner10 ?? "",
      strHomeaddress10owner10: partnerShipType?.strHomeaddress10owner10 ?? "",
      strHomeaddressCity5owner10:
          partnerShipType?.strHomeaddressCity5owner10 ?? "",
      strHomeaddressPostCode5owner10:
          partnerShipType?.strHomeaddressPostCode5owner10 ?? "",
      strHomeaddressLiveYear5owner10:
          partnerShipType?.strHomeaddressLiveYear5owner10 ?? "",
      strHomeaddressLiveMonth5owner10:
          partnerShipType?.strHomeaddressLiveMonth5owner10 ?? "",

      strTitlecharityowner2: charityBusinessType?.strTitlecharityowner2 ?? "",
      strcharityowner2firstname:
          charityBusinessType?.strcharityowner2firstname ?? "",
      strcharityowner2lastname:
          charityBusinessType?.strcharityowner2lastname ?? "",
      strTitleLLPowner2: llpBusinessType?.strTitleLLPowner2 ?? "",
      strLLPowner2FirstName: llpBusinessType?.strLLPowner2FirstName ?? "",
      strLLPowner2LastName: llpBusinessType?.strLLPowner2LastName ?? "",
      strTitleLLcowner2: llcBusinessType?.strTitleLLcowner2 ?? "",
      strLLcowner2FirstName: llcBusinessType?.strLLcowner2FirstName ?? "",
      strLLcowner2LastName: llcBusinessType?.strLLcowner2LastName ?? "",
      strTitleOtherowner2: otherBusinessType?.otherstrTitleOtherowner2 ?? "",
      strOtherowner2FirstName:
          otherBusinessType?.otherstrOtherowner2FirstName ?? "",
      strOtherowner2LastName:
          otherBusinessType?.otherstrOtherowner2LastName ?? "",
      StrContractTerm: "1",
      strcontracttermelec: "",

      strEnergizationstatus: electricity?.strEnergizationstatus ?? "",
      strNewConnection: electricity?.strNewConnection ?? "",
      decCCLExcumptionElec: "",
      strStandingCharge: electricity?.strStandingCharge ?? "",
      strDayUnit: electricity?.strDayUnit ?? "",
      strNightUnit: electricity?.strNightUnit ?? "",
      strEWEUnit: electricity?.strEWEUnit ?? "",
      dtContractEndDateEle: electricity?.dtContractEndDateEle ?? '',
      electricityDay_EAC: electricity?.electricityDay_EAC ?? '',
      electricityEvening_EAC: electricity?.electricityEvening_EAC ?? '',
      electricityNight_EAC: electricity?.electricityNight_EAC ?? '',
      dteGasStartDate: "27/10/2020",
      strContractTermGas: "",
      strdtecontractGas: "",
      decCCLExcumptionGas: "",
      strUnitPriceGas: "",
      strStandingChargeGas: "",
      strOtherbank: "NewTest",
      strBankAddress: "hyetuinl",
      strPaymentType: paymentDetail?.strPaymentType ?? "",
      strBankCardNo: "",
      intFixedDDDays: "",
      decFixedDDAmount: "",
      intCommTypeEleBroker: "2",
      intCommTypeGasBroker: "",
      strFixedAmt: "",
      strCommissionScUpliftElec: "",
      subDecNightRHTUplift: "",
      subDecSCUplift: "",
      subDecDayUplift: "",
      subDecEweUplift: "",
      subDecSCGasUplift: "",
      subDecDayGasUplift: "",
      intGroupId: "1",
      //dteElecStartDate: "27/10/2020",
      dteElecStartDate: electricity?.dteElecStartDate.toString() ?? "",
    ));

    print(response);
    if (response.status == '7') {
      AppConstant.showSuccessToastAddProsp(
          context, "Prospect added and successfully generated");
      DownloadService.downloadFromUrl(response.strfileElepath);

      groupName.clear();
      ElectricityPref.clearEleEleValues();
      ElectricityPref.clearEleBusinessValues();
      ElectricityPref.clearEleSiteAddValues();
      ElectricityPref.clearEleBillAddValues();
      EleBusinessTypePref.clearELEOtherBusiness();
      EleBusinessTypePref.clearELELTDBusiness();
      EleBusinessTypePref.clearELECharityBusiness();
      EleBusinessTypePref.clearELELLPBusiness();
      EleBusinessTypePref.clearELELLCBusiness();
      EleBusinessTypePref.clearELESoleBusiness();
      EleBusinessTypePref.clearELEPartnerBusiness();
      ElectricityPref.clearELEPrimaryContactValues();
      ElectricityPref.clearEleEAMValues();
      ElectricityPref.clearElePaymentValues();
      ElectricityPref.clearElePartnerValues();
      ElectricityPref.clearEleGroupValues();

      Navigator.of(context).pushReplacement(
          new MaterialPageRoute(builder: (context) => new HomePage()));
    } else if (response.status == '6') {
      if (buttonMessage == 'SaveAndAddAnother') {
        AppConstant.showSuccessToastAddProsp(context, "Successfully Added");
        groupName.clear();
        ElectricityPref.clearEleEleValues();
        ElectricityPref.clearEleBusinessValues();
        ElectricityPref.clearEleSiteAddValues();
        ElectricityPref.clearEleBillAddValues();
        EleBusinessTypePref.clearELEOtherBusiness();
        EleBusinessTypePref.clearELELTDBusiness();
        EleBusinessTypePref.clearELECharityBusiness();
        EleBusinessTypePref.clearELELLPBusiness();
        EleBusinessTypePref.clearELELLCBusiness();
        EleBusinessTypePref.clearELESoleBusiness();
        EleBusinessTypePref.clearELEPartnerBusiness();
        ElectricityPref.clearELEPrimaryContactValues();
        ElectricityPref.clearEleEAMValues();
        ElectricityPref.clearElePaymentValues();
        ElectricityPref.clearElePartnerValues();
        ElectricityPref.clearEleGroupValues();
      }
      if (buttonMessage == 'SaveAndView') {
        AppConstant.showSuccessToastAddProsp(context, "Successfully Added");

        Navigator.of(context).pushReplacement(new MaterialPageRoute(
          builder: (context) => ElecticityTab(),
        ));
      }
    } else {
      AppConstant.showFailToast(context, response.msg);
    }
  }

  void initialData() async {
    final data = await ElectricityPref.getElectricityGroupValues();
    setState(ViewState.BUSY);

    if (data != null) {
      groupName.text = data.groupName;
      //grou name selected and group name list are not present
    }
    setState(ViewState.IDLE);
  }

  void onSaveAndNext(String accountId, String buttonMessage,
      BuildContext context, String brokerId) {
    setState(ViewState.BUSY);
    ElectricityPref.setElectricityGroupValues(EleGroupCredential(
      groupName: groupName.text,
    ));
    getDataFromPref(accountId, buttonMessage, context, brokerId);
    setState(ViewState.IDLE);
  }
}
