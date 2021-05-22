import 'package:pozitive/Core/AppConstact/appString.dart';
import 'package:pozitive/Core/Model/Api/account_credential.dart';
import 'package:pozitive/Core/Model/Api/downloadall_credential.dart';
import 'package:pozitive/Core/Model/broker_commission_details.dart';
import 'package:pozitive/Core/Model/broker_commission_model.dart';
import 'package:pozitive/Core/Model/commission_statement_details.dart';
import 'package:pozitive/Core/Model/download_all.dart';
import 'package:pozitive/Core/Model/download_invoice_model.dart';
import 'package:pozitive/Core/Model/renewal_download_details.dart';
import 'package:pozitive/Core/Model/renewal_download_invoice_model.dart';
import 'package:pozitive/Core/Services/database.dart';
import 'package:pozitive/Core/Services/DownloadService.dart';
import 'package:pozitive/Core/ViewModel/baseModel.dart';
import 'package:pozitive/Core/enums/view_state.dart';
import '../baseview.dart';

class CommissionStatementViewModel extends BaseModel {
  Database database = getIt<DatabaseImplementation>();

  List<BrokerCommission> brokerCommissionList = [];

  void onSelectDownload(String accountID, bool partnerVal, String selectOption,
      String intBrokerCommBillMstID) async {
    if (partnerVal) {
      if (selectOption == AppString.downloadAll) {
        DownloadAllClass downloadAllDetails = await database.getDownLoadAllUrl(
            DownloadAllCredentials(
                accountID: accountID,
                type: AppString.partner,
                intBrokerCommBillMstID: intBrokerCommBillMstID));
        DownloadService.downloadFromUrl(downloadAllDetails.downloadALLFilePath);
      } else if (selectOption == AppString.downloadInvoice) {
        DownloadInvoice downloadInvoice = await database.getDownloadInvoiceUrl(
            DownloadAllCredentials(
                accountID: accountID,
                type: AppString.partner,
                intBrokerCommBillMstID: intBrokerCommBillMstID));
        DownloadService.downloadFromUrl(
            downloadInvoice.downloadInvoiceFilePath);
      } else if (selectOption == AppString.commissionDetails) {
        BrokerCommissionDetails details =
            await database.getDownloadCommonDetailsUrl(DownloadAllCredentials(
                accountID: accountID,
                type: AppString.partner,
                intBrokerCommBillMstID: intBrokerCommBillMstID));
        if (details.downloadCommissionSummaryFilepath != null) {
          DownloadService.downloadFromUrl(
              details.downloadCommissionSummaryFilepath);
        }
      }
    } else {
      if (selectOption == AppString.downloadAll) {
        RenewalDownloadDetails details = await database.getRenewalDownloadUrl(
            DownloadAllCredentials(
                accountID: accountID,
                type: AppString.renewal,
                intBrokerCommBillMstID: intBrokerCommBillMstID));
        DownloadService.downloadFromUrl(details.renewalDownloadALLFilePath);
      } else if (selectOption == AppString.downloadInvoice) {
        RenewalDownloadInvoiceDetails details =
            await database.getRenewalDownloadInvoiceUrl(DownloadAllCredentials(
                accountID: accountID,
                type: AppString.renewal,
                intBrokerCommBillMstID: intBrokerCommBillMstID));
        DownloadService.downloadFromUrl(details.renewalDownloadInvoiceFilePath);
      }
    }
  }

  void getCommissionList(bool partnerVal, String accountID) async {
    setState(ViewState.BUSY);
    if (partnerVal) {
      brokerCommissionList = await database
          .getPartnerCommissionList(AccountCredential(accountID: accountID));
    } else {
      CommissionStatementDetails details = await database
          .getRenewalCommissionList(AccountCredential(accountID: accountID));
      brokerCommissionList = details.brokerCommissionList;
    }
    setState(ViewState.IDLE);
  }
}
