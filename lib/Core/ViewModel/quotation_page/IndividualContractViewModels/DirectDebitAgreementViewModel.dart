import 'package:pozitive/Core/ViewModel/baseModel.dart';
import 'package:pozitive/Core/Services/database.dart';
import 'package:get_it/get_it.dart';
import 'package:pozitive/Core/enums/view_state.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pozitive/Core/Model/sharePrefModel/SaveAndGenerateContractIndividualModel.dart';
import 'package:pozitive/Core/Model/sharePrefModel/SaveAndGenerateContractAddMethodModel.dart';
import 'package:pozitive/Core/Model/Api/SaveAndGenerateContractAddMethodCredential.dart';
import 'package:pozitive/Core/AppConstact/appConstant.dart';
import 'package:pozitive/Core/Services/DownloadService.dart';
import 'package:pozitive/Util/IndividualContractPref.dart';
import 'package:pozitive/Core/Model/user.dart';
import 'package:pozitive/Util/Pref.dart';

GetIt getIt = GetIt.instance;

class DirectDebitAgreementViewModel extends BaseModel {
  SaveAndGenerateContractAddMethodModel downloadContractModel =
      SaveAndGenerateContractAddMethodModel();
  Database database = getIt<DatabaseImplementation>();

  TextEditingController contractCustomerRefNo = TextEditingController();
  TextEditingController contractAccountHolderName = TextEditingController();
  TextEditingController contractBusinessName = TextEditingController();
  TextEditingController contractAccountNumber = TextEditingController();
  TextEditingController contractOwnerName = TextEditingController();
  TextEditingController contractToOwnerName = TextEditingController();
  TextEditingController contractName = TextEditingController();
  TextEditingController contractDate = TextEditingController();
  TextEditingController contractCompanyName = TextEditingController();
  TextEditingController contractBankSocietyAdd = TextEditingController();
  TextEditingController contractBranchCode1 = TextEditingController();
  TextEditingController contractBranchCode2 = TextEditingController();
  TextEditingController contractBranchCode3 = TextEditingController();
  TextEditingController contractBranchCode4 = TextEditingController();
  TextEditingController contractBranchCode5 = TextEditingController();
  TextEditingController contractBranchCode6 = TextEditingController();
  TextEditingController contractSignature = TextEditingController();
  bool isSeventh = false;
  bool isFourteenth = false;
  bool isTwentyFirst = false;
  bool isTwentyEigth = false;

  DateTime selectedDate = DateTime.now();
  DateFormat dateFormat = DateFormat("yyyy-MM-dd");
  Future selectDate(BuildContext context, String fromfield) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null) {
      if (fromfield == "Required") {
        setState(ViewState.BUSY);
        contractDate.text = dateFormat.format(picked);
        setState(ViewState.IDLE);
      } else {
        setState(ViewState.BUSY);
        contractDate.text = dateFormat.format(picked);
        setState(ViewState.IDLE);
      }
    }
  }

  void onSaveAndNext(BuildContext context) {
    setState(ViewState.BUSY);
    IndividualContractPref.setContratDirectDebitAgreement(
      SaveAndGenerateContractAddMethodCredential(
        strUniqueRefNo: contractCustomerRefNo.text,
        strACHolderName: contractAccountHolderName.text,
        strBusinessnames: contractBusinessName.text,
        strACBranchCode1: contractBranchCode1.text,
        strACBranchCode2: contractBranchCode2.text,
        strACBranchCode3: contractBranchCode3.text,
        strACBranchCode4: contractBranchCode4.text,
        strACBranchCode5: contractBranchCode5.text,
        strACBranchCode6: contractBranchCode6.text,
        strACNumber: contractAccountNumber.text,
        // strACOwnerName: contractOwnerName.text,
        strACTo: contractToOwnerName.text,
      ),
    );
    print('cust no.' + contractCustomerRefNo.text);
    setState(ViewState.IDLE);
    saveAndDownloadContract(context);
  }

  void setDetails(SaveAndGenerateContractIndividualModel individualModel) {
    setState(ViewState.BUSY);
    contractCustomerRefNo.text = individualModel.strUniqueRefNo;
    contractAccountHolderName.text = individualModel.strACHolderName;
    contractBusinessName.text = individualModel.strACBusinessName;
    contractAccountNumber.text = individualModel.strACNumber;
    contractOwnerName.text = individualModel.strACOwnername;
    contractToOwnerName.text = individualModel.strACTo;
    contractBranchCode1.text = individualModel.strACBranchCode1;
    contractBranchCode2.text = individualModel.strACBranchCode2;
    contractBranchCode3.text = individualModel.strACBranchCode3;
    contractBranchCode4.text = individualModel.strACBranchCode4;
    contractBranchCode5.text = individualModel.strACBranchCode5;
    contractBranchCode6.text = individualModel.strACBranchCode6;

    setState(ViewState.IDLE);
  }

  void saveAndDownloadContract(BuildContext context) async {
    setState(ViewState.BUSY);
    print('trying to call api');
    User _user = await Prefs.getUser();
    SaveAndGenerateContractAddMethodCredential uniqueRefNo =
        await IndividualContractPref.getContractUniqueRefNo();
    SaveAndGenerateContractAddMethodCredential businessDetails =
        await IndividualContractPref.getContractBusinessDetails();
    SaveAndGenerateContractAddMethodCredential siteAddressDetails =
        await IndividualContractPref.getContractSiteAddress();
    SaveAndGenerateContractAddMethodCredential billingAddressDetails =
        await IndividualContractPref.getContractBillingAddress();
    SaveAndGenerateContractAddMethodCredential eamDetails =
        await IndividualContractPref.getContractEam();
    SaveAndGenerateContractAddMethodCredential eleDetails =
        await IndividualContractPref.getContractElectricity();
    SaveAndGenerateContractAddMethodCredential gasDetails =
        await IndividualContractPref.getContractGas();
    print(uniqueRefNo.bitpPPC + ' This si partnerrrrrrrrr');
    print(eleDetails.strSCE + 'sc unit/.......');
    print(eleDetails.strDayUnitE + 'day unit..........');
    print(gasDetails.strContractEndDateGas + 'gas end date++++++++....');

    downloadContractModel = await database.saveAndDownloadContractIndividual(
      SaveAndGenerateContractAddMethodCredential(
        AccountId: _user.accountId,
        Type: "Individual",
        intCustomerId: uniqueRefNo.strUniqueRefNo ?? "",
        strUniqueRefNo: uniqueRefNo.strUniqueRefNo ?? "",
        strBusinessnames: businessDetails?.strBusinessnames ?? "",
        MobileNo: eamDetails?.MobileNo ?? "",
        RegisterCompanyName: businessDetails?.RegisterCompanyName ?? "",
        RegisterCompanyNo: businessDetails?.RegisterCompanyNo ?? "",
        RegisterCharityNo: businessDetails?.RegisterCharityNo ?? "",
        strexcesscapacity: eleDetails?.strexcesscapacity ?? "",
        strreactivecharge: eleDetails?.strreactivecharge ?? "",
        strSiteAddress1: siteAddressDetails?.strSiteAddress1 ?? "",
        strSiteAddress2: "site 2",
        strSiteTown: siteAddressDetails?.strSiteTown ?? "",
        strPostcodeHome: billingAddressDetails?.strPostcodeHome ?? "",
        strPostcodeBusiness: siteAddressDetails?.strPostcodeBusiness ?? "",
        strsitecapacity: "",
        strcapacitycharge: eleDetails?.strcapacitycharge ?? "",
        strContractStartDate: eleDetails?.strContractStartDate ?? "",
        strContractEndDate: eleDetails?.strContractEndDate ?? "",
        strContractStartDateGas: gasDetails?.strContractStartDateGas ?? "",
        strContractEndDateGas: gasDetails?.strContractEndDateGas ?? "",
        strMPRN: gasDetails?.strMPRN ?? "",
        strMPAN1: eleDetails?.strMPAN1 ?? "",
        strMPAN2: eleDetails?.strMPAN2 ?? "",
        strMPAN3: eleDetails?.strMPAN3 ?? "",
        strMPAN4: eleDetails?.strMPAN4 ?? "",
        strMPAN5: eleDetails?.strMPAN5 ?? "",
        strMPAN6: eleDetails?.strMPAN6 ?? "",
        strMPAN7: eleDetails?.strMPAN7 ?? "",
        strSCE: eleDetails?.strSCE ?? "",
        strDayUnitE: eleDetails?.strDayUnitE ?? "",
        strNightUnit: eleDetails?.strNightUnit ?? "",
        strEweUnit: eleDetails?.strEweUnit ?? "",
        strDayUnitG: gasDetails?.strDayUnitG ?? "",
        strSCG: gasDetails?.strSCG ?? "",
        strACTo: contractToOwnerName.text ?? "",
        strACAddress: "",
        strACHolderName: contractAccountHolderName.text ?? "",
        strACNumber: contractAccountNumber.text ?? "",
        strACBranchCode1: contractBranchCode1.text ?? "",
        strACBranchCode2: contractBranchCode2.text ?? "",
        strACBranchCode3: contractBranchCode3.text ?? "",
        strACBranchCode4: contractBranchCode4.text ?? "",
        strACBranchCode5: contractBranchCode5.text ?? "",
        strACBranchCode6: contractBranchCode6.text ?? "",
        bitLtd: uniqueRefNo?.bitLtd ?? '',
        bitPlc: uniqueRefNo?.bitPlc ?? '',
        bitCharity: uniqueRefNo?.bitCharity ?? '',
        bitPublicSector: uniqueRefNo?.bitPublicSector ?? '',
        bitST: uniqueRefNo?.bitST ?? '',
        bitLlp: uniqueRefNo?.bitLlp ?? '',
        bitpPPC: uniqueRefNo?.bitpPPC ?? "",
        bitOther: uniqueRefNo?.bitOther ?? "",
        bitLlc: uniqueRefNo?.bitLlc ?? '',
        bteMicroBusiness: uniqueRefNo?.bteMicroBusiness ?? '',
        strPhoneHome: eamDetails?.strPhoneHome ?? "",
        strEmailHome: eamDetails?.strEmailHome ?? "",
        strFullName: eamDetails?.strFullName ?? "",
        strTown: billingAddressDetails?.strTown ?? "",
        strAddress1: billingAddressDetails?.strAddress1 ?? "",
      ),
    );
    setState(ViewState.IDLE);

    if (downloadContractModel.msg == "Success") {
      print(downloadContractModel.filepath.toString() +
          'dhdgfdhfhdhfgdhfgdhgfhdiieruieru');
      AppConstant.showSuccessToast(context, downloadContractModel.msg);
      DownloadService.downloadFromUrl(downloadContractModel.filepath);
      print(downloadContractModel.filepath);
    } else {
      AppConstant.showFailToast(context, downloadContractModel.msg);
    }
  }

  void toggleIsSeventh() {
    setState(ViewState.BUSY);
    isSeventh = !isSeventh;
    setState(ViewState.IDLE);
  }

  void toggleIsFourteenth() {
    setState(ViewState.BUSY);
    isFourteenth = !isFourteenth;
    setState(ViewState.IDLE);
  }

  void toggleIsTwentyFirst() {
    setState(ViewState.BUSY);
    isTwentyFirst = !isTwentyFirst;
    setState(ViewState.IDLE);
  }

  void toggleIsTwentyEight() {
    setState(ViewState.BUSY);
    isTwentyEigth = !isTwentyEigth;
    setState(ViewState.IDLE);
  }
}
