import 'package:pozitive/Core/Model/Api/ExportTenderPriceCredential.dart';
import 'package:pozitive/Core/Model/export-tender-priceModel.dart';
import 'package:pozitive/Core/Services/database.dart';
import 'package:pozitive/Core/Services/DownloadService.dart';
import 'package:pozitive/Core/ViewModel/baseModel.dart';
import 'package:pozitive/Core/enums/view_state.dart';
import 'package:pozitive/Core/Model/email_tender_price_model.dart';
import 'package:pozitive/Core/Model/Api/email_tender_price_credential.dart';
import 'package:pozitive/Core/Services/email_sender_service.dart';
import '../baseview.dart';

class ExportTenderPriceViewModel extends BaseModel {
  Database database = getIt<DatabaseImplementation>();

  String downloadUrl;

  void onSelectDownloadTender(String accountId, String quoteId,
      String emailType, String termType) async {
    setState(ViewState.BUSY);
    ExportTenderPriceModel exportTenderPriceModel =
        await database.onSelectDownloadTender(ExportTenderPriceCredential(
            accountId: accountId,
            quoteid: quoteId,
            emailType: emailType,
            termType: termType));
    downloadUrl = exportTenderPriceModel.exportTenderPricePath;
    setState(ViewState.IDLE);
  }

  void onClickDownloadExportTenderPrice() {
    DownloadService.downloadFromUrl(downloadUrl);
  }

  void onSelectEmailTender(String accountId, String quoteId, String emailType,
      String termType) async {
    setState(ViewState.BUSY);
    EmailTenderPriceModel emailTenderPriceModel =
        await database.onSelectEmailTender(EmailTenderPriceCredential(
      accountId: accountId,
      quoteid: quoteId,
      emailType: emailType,
      termType: termType,
    ));
    setState(ViewState.IDLE);
  }

  void onClickEmailTenderPrice(String recepient, String firstname) {
    EmailService.sendEmail(recepient, downloadUrl, firstname);

    void onSelectDownloadTender(String accountId, String quoteId,
        String emailType, String termType) async {
      if (accountId != null) {
        ExportTenderPriceModel exportTenderPriceModel =
            await database.onSelectDownloadTender(ExportTenderPriceCredential(
                accountId: accountId,
                quoteid: quoteId,
                emailType: emailType,
                termType: termType));
        DownloadService.downloadFromUrl(
            exportTenderPriceModel.exportTenderPricePath);
      } else {}
    }
  }
}
