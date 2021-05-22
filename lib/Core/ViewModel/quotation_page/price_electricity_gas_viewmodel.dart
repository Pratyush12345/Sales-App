import 'package:flutter/material.dart';
import 'package:pozitive/Core/AppConstact/appConstant.dart';
import 'package:pozitive/Core/Model/Api/quotation_invidual/sendTenderPriceCredentials.dart';
import 'package:pozitive/Core/Model/ApiResponse/send_email_tender_response.dart';
import 'package:pozitive/Core/Model/sharePrefModel/quotation_price_electricity_gas_model.dart';
import 'package:pozitive/Core/Services/database.dart';

import 'package:pozitive/Core/ViewModel/baseModel.dart';
import 'package:pozitive/Core/enums/view_state.dart';
import 'package:pozitive/Util/Pref.dart';
import 'package:pozitive/Core/Services/DownloadService.dart';
import '../../baseview.dart';

class PriceElectricityGasViewModel extends BaseModel {
  Database database = getIt<DatabaseImplementation>();
  TextEditingController eUpliftController = TextEditingController();
  TextEditingController eScUpliftController = TextEditingController();
  TextEditingController gUpliftController = TextEditingController();
  TextEditingController gScUpliftController = TextEditingController();
  TextEditingController aEUpliftController = TextEditingController();
  TextEditingController aEScUpliftController = TextEditingController();
  TextEditingController aGUpliftController = TextEditingController();
  TextEditingController aGScUpliftController = TextEditingController();
  TextEditingController partnerController = TextEditingController();

  String subUserID;

  void onChangeSubUserID(String val) {
    setState(ViewState.BUSY);
    subUserID = val;

    setState(ViewState.IDLE);
  }

  void onSelectPartner(String val) {
    setState(ViewState.BUSY);
    partnerController.text = val;
    setState(ViewState.IDLE);
  }

  void initializeData() async {
    setState(ViewState.BUSY);
    final data = await Prefs.getQuotationGasElectricityDetails();
    if (data != null) {
      eUpliftController.text = data.electricityUplift ?? '0';
      eScUpliftController.text = data.electricityScUplift ?? '0';
      gUpliftController.text = data.gasUplift ?? '0';
      gScUpliftController.text = data.gasScUplift ?? '0';
      aEUpliftController.text = data.eAUplift ?? '0';
      aEScUpliftController.text = data.eAScUplift ?? '0';
      aGUpliftController.text = data.gAUplift ?? '0';
      aGScUpliftController.text = data.gAScUplift ?? '0';
      partnerController.text = data.selectPartner ?? '0';
    }

    setState(ViewState.IDLE);
  }

  void onSaveAndNext() async {
    Prefs.setQuotationGasElectricityDetails(QuotationPriceElectricityGasModel(
        electricityUplift: eUpliftController.text ?? '0',
        electricityScUplift: eScUpliftController.text ?? '0',
        gasUplift: gUpliftController.text ?? '0',
        gasScUplift: gScUpliftController.text ?? '0',
        eAUplift: aEUpliftController.text ?? '0',
        eAScUplift: aEScUpliftController.text ?? '0',
        gAUplift: aGUpliftController.text ?? '0',
        gAScUplift: aGScUpliftController.text ?? '0',
        selectPartner: partnerController.text,
        subUserID: subUserID));
  }

  void onClickTenderPrice(bool export, String accountID, String quoteID,
      BuildContext context) async {
    setState(ViewState.BUSY);
    SendEmailTenderResponse response = await database.sendEmailTenderIndividual(
        SendTenderPriceCredentials(
            accountId: accountID,
            quoteid: quoteID,
            emailType: export ? 'no' : 'yes',
            termType: '1'));
    if (export) {
      DownloadService.downloadFromUrl(response.data.exportTenderPricePath);
    } else {
      AppConstant.showSuccessToast(context, response.msg);
    }
    setState(ViewState.IDLE);
  }
}
