import 'package:pozitive/Core/Model/Api/export_tender_price_group_credential.dart';
import 'package:pozitive/Core/Model/export_tender_price_group_Model.dart';
import 'package:pozitive/Core/Services/database.dart';
import 'package:pozitive/Core/Services/DownloadService.dart';
import 'package:pozitive/Core/ViewModel/baseModel.dart';
import 'package:pozitive/Core/enums/view_state.dart';
import 'package:pozitive/Core/Model/email_tender_price_group_model.dart';
import 'package:pozitive/Core/Model/Api/email_tender_price_group_credential.dart';
import 'package:pozitive/Core/Services/email_sender_service.dart';
import '../../baseview.dart';

class ExportTenderPriceGroupViewModel extends BaseModel {
  Database database = getIt<DatabaseImplementation>();

  String downloadUrl;

  void onSelectDownloadTenderGroup(String accountId, String groupId,
      String quoteId, String emailType) async {
    setState(ViewState.BUSY);
    ExportTenderPriceGroupModel exportTenderPriceGroupModel = await database
        .onSelectDownloadTenderGroup(ExportTenderPriceGroupCredential(
            accountId: accountId,
            groupId: groupId,
            quoteId: quoteId,
            emailType: emailType));
    downloadUrl = exportTenderPriceGroupModel.exportTenderPricePath;
    setState(ViewState.IDLE);
  }

  void onClickDownloadExportTenderPrice() {
    DownloadService.downloadFromUrl(downloadUrl);
  }

  void onSelectEmailTenderGroup(String accountId, String groupId,
      String quoteId, String emailType) async {
    setState(ViewState.BUSY);
    EmailTenderPriceGroupModel emailTenderPriceGroupModel =
        await database.onSelectEmailGroupTender(EmailTenderPriceGroupCredential(
      accountId: accountId,
      groupId: groupId,
      quoteId: quoteId,
      emailType: emailType,
    ));
    setState(ViewState.IDLE);
  }

  void onClickEmailTenderPrice(String recepient, String firstname) {
    EmailService.sendEmail(recepient, downloadUrl, firstname);
  }
}
