import 'package:pozitive/Core/ViewModel/baseModel.dart';
import 'package:pozitive/Core/Services/database.dart';
import 'package:get_it/get_it.dart';
import 'package:pozitive/Core/enums/view_state.dart';
import 'package:flutter/material.dart';
import 'package:pozitive/Core/Model/sharePrefModel/SaveAndGenerateContractIndividualModel.dart';
import 'package:pozitive/Util/IndividualContractPref.dart';
import 'package:pozitive/Core/Model/Api/SaveAndGenerateContractAddMethodCredential.dart';
import 'package:pozitive/Util/global.dart' as globals;

GetIt getIt = GetIt.instance;

class UniqueRefNoViewModel extends BaseModel {
  Database database = getIt<DatabaseImplementation>();

  TextEditingController uniqueRefNo = TextEditingController();

  bool letter = false;
  bool email = false;
  bool phone = false;
  bool ltd = false;
  bool charity = false;
  bool soleProprietor = false;
  bool limitedLiability = false;
  bool microBusiness = false;
  bool plc = false;
  bool publicSector = false;
  bool partnerShip = false;
  bool llc = false;
  bool other = false;

  int businessTypeSelected = 0;

  void saveCompanyDetails(int businessType) {
    print(businessType);
    if (businessType == 1) {
      ltd = true;
      plc = false;
      charity = false;
      publicSector = false;
      soleProprietor = false;
      partnerShip = false;
      microBusiness = false;
      llc = false;
      other = false;
      limitedLiability = false;
    } else if (businessType == 2) {
      ltd = false;
      plc = true;
      charity = false;
      publicSector = false;
      soleProprietor = false;
      partnerShip = false;
      microBusiness = false;
      llc = false;
      other = false;
      limitedLiability = false;
    } else if (businessType == 3) {
      ltd = false;
      plc = false;
      charity = true;
      publicSector = false;
      soleProprietor = false;
      partnerShip = false;
      microBusiness = false;
      llc = false;
      other = false;
      limitedLiability = false;
    }
    if (businessType == 4) {
      ltd = false;
      plc = false;
      charity = false;
      publicSector = true;
      soleProprietor = false;
      partnerShip = false;
      microBusiness = false;
      llc = false;
      other = false;
      limitedLiability = false;
    }
    if (businessType == 5) {
      ltd = false;
      plc = false;
      charity = false;
      publicSector = false;
      soleProprietor = true;
      partnerShip = false;
      microBusiness = false;
      llc = false;
      other = false;
      limitedLiability = false;
    }
    if (businessType == 6) {
      ltd = false;
      plc = false;
      charity = false;
      publicSector = false;
      soleProprietor = false;
      partnerShip = true;
      microBusiness = false;
      llc = false;
      other = false;
      limitedLiability = false;
    }
    if (businessType == 7) {
      ltd = false;
      plc = false;
      charity = false;
      publicSector = false;
      soleProprietor = false;
      partnerShip = false;
      microBusiness = true;
      llc = false;
      other = false;
      limitedLiability = false;
    }
    if (businessType == 8) {
      ltd = false;
      plc = false;
      charity = false;
      publicSector = false;
      soleProprietor = false;
      partnerShip = false;
      microBusiness = false;
      llc = true;
      other = false;
      limitedLiability = false;
    }
    if (businessType == 9) {
      ltd = false;
      plc = false;
      charity = false;
      publicSector = false;
      soleProprietor = false;
      partnerShip = false;
      microBusiness = false;
      llc = false;
      other = true;
      limitedLiability = false;
    }
    if (businessType == 10) {
      ltd = false;
      plc = false;
      charity = false;
      publicSector = false;
      soleProprietor = false;
      partnerShip = false;
      microBusiness = false;
      llc = false;
      other = false;
      limitedLiability = true;
    }
    onSaveAndNext();
  }

  void onSaveAndNext() {
    setState(ViewState.BUSY);
    IndividualContractPref.setContractUniqueRefNo(
        SaveAndGenerateContractAddMethodCredential(
      strUniqueRefNo: uniqueRefNo.text,
      // letter: letter,
      // email: email,
      // phone: phone,
      bitLtd: ltd.toString(),
      bitPlc: plc.toString(),
      bitCharity: charity.toString(),
      bitPublicSector: publicSector.toString(),
      bitST: soleProprietor.toString(),
      bteMicroBusiness: microBusiness.toString(),
      bitLlc: llc.toString(),
      bitOther: other.toString(),

      bitLlp: limitedLiability.toString(),
      bitpPPC: partnerShip.toString(),
    ));
    setState(ViewState.IDLE);
    globals.tabController6.animateTo(1);
  }

  void setDetails(SaveAndGenerateContractIndividualModel individualModel) {
    setState(ViewState.BUSY);
    uniqueRefNo.text = individualModel.strUniqueRefNo.toString();
    ltd = individualModel.bitLtd;
    charity = individualModel.bitCharity;
    soleProprietor = individualModel.bitST;
    limitedLiability = individualModel.bitLlp;
    microBusiness = individualModel.bteMicroBusiness;
    plc = individualModel.bitPlc;
    publicSector = individualModel.bitPublicSector;
    other = individualModel.bitOther;
    //partnerShip
    llc = individualModel.bitLlc;
    setState(ViewState.IDLE);
  }

  void toggleLetter() {
    setState(ViewState.BUSY);
    letter = !letter;
    setState(ViewState.IDLE);
  }

  void toggleEmail() {
    setState(ViewState.BUSY);
    email = !email;
    setState(ViewState.IDLE);
  }

  void togglePhone() {
    setState(ViewState.BUSY);
    phone = !phone;
    setState(ViewState.IDLE);
  }

  // void toggleCompanyType(String selectedType) {
  //   setState(ViewState.BUSY);
  //   if (selectedType == 'Ltd') {
  //     ltd = !ltd;

  //     charity = false;
  //     soleProprietor = false;
  //     limitedLiability = false;
  //     microBusiness = false;
  //     plc = false;
  //     publicSector = false;
  //     partnerShip = false;
  //     llc = false;
  //   }
  //   setState(ViewState.IDLE);
  // }

  void toggleLtd() {
    setState(ViewState.BUSY);
    ltd = !ltd;
    setState(ViewState.IDLE);
  }

  void toggleCharity() {
    setState(ViewState.BUSY);
    charity = !charity;
    setState(ViewState.IDLE);
  }

  void toggleSoleProprietor() {
    setState(ViewState.BUSY);
    soleProprietor = !soleProprietor;
    setState(ViewState.IDLE);
  }

  void toggleLimitedLiability() {
    setState(ViewState.BUSY);
    limitedLiability = !limitedLiability;
    setState(ViewState.IDLE);
  }

  void toggleMicroBusiness() {
    setState(ViewState.BUSY);
    microBusiness = !microBusiness;
    setState(ViewState.IDLE);
  }

  void togglePlc() {
    setState(ViewState.BUSY);
    plc = !plc;
    setState(ViewState.IDLE);
  }

  void toggleOther() {
    setState(ViewState.BUSY);
    other = !other;
    setState(ViewState.IDLE);
  }

  void togglePublicSector() {
    setState(ViewState.BUSY);
    publicSector = !publicSector;
    setState(ViewState.IDLE);
  }

  void togglePartnerShip() {
    setState(ViewState.BUSY);
    partnerShip = !partnerShip;
    setState(ViewState.IDLE);
  }

  void toggleLlc() {
    setState(ViewState.BUSY);
    llc = !llc;
    setState(ViewState.IDLE);
  }
}
