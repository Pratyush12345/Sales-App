import 'package:flutter/material.dart';
import 'package:pozitive/Core/AppConstact/appConstant.dart';
import 'package:pozitive/Core/AppConstact/appString.dart';
import 'package:pozitive/Core/Model/sharePrefModel/quotation_gas_model.dart';
import 'package:pozitive/Core/Model/user.dart';
import 'package:pozitive/Core/Services/database.dart';
import 'package:pozitive/Core/ViewModel/baseModel.dart';
import 'package:pozitive/Core/enums/view_state.dart';
import 'package:pozitive/Pages/dashBoradDetailsPage.dart';
import 'package:pozitive/Util/Pref.dart';
import 'package:pozitive/Core/Model/Api/AskForQuoteIndividualCredential.dart';
import 'package:pozitive/Core/Model/sharePrefModel/quotation_electricity_model.dart';
import 'package:pozitive/Core/Model/sharePrefModel/quotation_individual_model.dart';

import '../../baseview.dart';

class QuotationGasViewModel extends BaseModel {
  Database database = getIt<DatabaseImplementation>();
  TextEditingController mPrnController = TextEditingController();
  TextEditingController aQController = TextEditingController();
  bool enableFields = true;
  bool addQuote = false;
  QuotationElectricityModel electricity;
  QuotationIndividualModel individual;
  QuotationGasModel gas;

  void initializeData() async {
    setState(ViewState.BUSY);
    final data = await Prefs.getQuotationGasDetails();
    if (data != null) {
      mPrnController.text = data.mPrn;
      aQController.text = data.aQ;
    }
    electricity = await Prefs.getQuotationElectricityDetails();
    individual = await Prefs.getQuotationInvidualDetails();
    setState(ViewState.IDLE);
  }

  void onAskQuote(String quoteID, BuildContext context) async {
    setState(ViewState.BUSY);
    if (individual != null) {
      Prefs.setQuotationGasDetails(
        QuotationGasModel(
          mPrn: mPrnController.text,
          aQ: aQController.text,
        ),
      );
      getDataFromPref(quoteID, context);
    } else {
      setState(ViewState.IDLE);
      AppConstant.showFailToast(context, 'Fill individual Details');
    }
  }

  void getDataFromPref(String quoteId, BuildContext context) async {
    setState(ViewState.BUSY);

    print(electricity?.toJson());
    print(gas?.toJson());
    if ((electricity?.wholeMpan != '') || (mPrnController.text != '')) {
      onApiCall(quoteId, context);
    } else {
      AppConstant.showFailToast(context, 'Enter either MPAN or MPRN');
    }

    setState(ViewState.IDLE);
  }

  void onApiCall(String quoteId, BuildContext context) async {
    setState(ViewState.BUSY);
    print('calling api');
    User _user = await Prefs.getUser();
    final response = await database.askForQuoteIndividual(
      AskForQuoteIndividualCredential(
        AccountId: _user.accountId,
        FullMPAN: electricity?.wholeMpan ?? "",
        MPRN: mPrnController.text ?? '',
        Quoteid: quoteId ?? "",
        BusinessName: individual.businessName ?? "",
        PostCode: individual.postCode,
        EACDay: electricity?.eACDay ?? '',
        EACNight: electricity?.eACNight ?? '',
        EACEWE: electricity?.eWE ?? '',
        IsforFirstyear: individual.isforFirstyear,
        IsforSecondyear: individual.isforSecondyear,
        IsforThirdyear: individual.isforThirdyear,
        IsforFourthyear: individual.isforFourthyear,
        RequiredByDate: individual.requireByDate,
        AQ: aQController.text ?? '',
        PreferredStartDate: individual.preferredByDate,
        ThirdPartyMOP: individual.thirdPartyMOP,
        ThirdPartyDADC: individual.thirdPartyDADC,
        SingleRate: individual.singleRate,
        Image64HHFile: electricity?.hhFilePath ?? '',
        IsforFifthyear: individual.isForFifthyear,
        IsforOtheryear: individual.isforOtheryear ?? '',
        IsStarkDADC: individual.isStarkDADC,
        intDADCId: individual.intDADCId,
        PreferredEndDate: "",
        PreferredEndDate1: "",
        PreferredEndDate2: "",
      ),
    );
    print('api called');
    print(response.status);
    print(response.priceAlertMsg);
    if (response.priceAlertMsg != null) {
      if (response.status == '1') {
        AppConstant.popUp(context, response.priceAlertMsg);
        mPrnController.clear();
        aQController.clear();
        Prefs.clearGasQuotationValues();
        Prefs.clearElectricityQuotationValues();
        Prefs.clearIndividualQuotationValues();
      }
    } else {
      if (response.status == '1') {
        print('successfully passed');
        print(response);

        mPrnController.clear();
        aQController.clear();

        AppConstant.showSuccessToast(context, response.msg);
        Navigator.of(context).push(
          new MaterialPageRoute(
            builder: (context) => DashBordDetailsPage(
              type: AppString.indvidual,
              title: AppString.quoted,
            ),
          ),
        );
        Prefs.clearGasQuotationValues();
        Prefs.clearElectricityQuotationValues();
        Prefs.clearIndividualQuotationValues();
      } else {
        AppConstant.showFailToast(context, response.msg);
      }
    }

    print(response.toJson());
  }
}
