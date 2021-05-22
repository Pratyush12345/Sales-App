import 'package:pozitive/Core/Services/database.dart';
import 'package:pozitive/Core/Services/email_sender_service.dart';
import 'package:pozitive/Core/ViewModel/baseModel.dart';
import 'package:pozitive/Core/enums/view_state.dart';
import 'package:pozitive/Core/Model/Api/email_tender_price_credential.dart';
import 'package:pozitive/Core/Model/email_tender_price_model.dart';
import '../baseview.dart';

class EmailTenderPriceViewModel extends BaseModel {
  Database database = getIt<DatabaseImplementation>();

  String downloadUrl;

  void onSelectEmailTender(String accountId, String quoteId, String emailType,
      String termType) async {
    setState(ViewState.BUSY);
    EmailTenderPriceModel emailTenderPriceModel =
        await database.onSelectEmailTender(EmailTenderPriceCredential(
            accountId: accountId,
            quoteid: quoteId,
            emailType: emailType,
            termType: termType));
    downloadUrl = emailTenderPriceModel.exportTenderPricePath;
    setState(ViewState.IDLE);
  }

  void onClickEmailTenderPrice(String recepient, String firstName) {
    EmailService.sendEmail(recepient, downloadUrl, firstName);
  }
}
