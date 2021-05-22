import 'package:pozitive/Core/Services/database.dart';
import 'package:pozitive/Core/Services/email_sender_service.dart';
import 'package:pozitive/Core/ViewModel/baseModel.dart';
import 'package:pozitive/Core/enums/view_state.dart';
import 'package:pozitive/Core/Model/Api/email_tender_price_group_credential.dart';
import 'package:pozitive/Core/Model/email_tender_price_group_model.dart';
import '../../baseview.dart';

class EmailTenderPriceGroupViewModel extends BaseModel {
  Database database = getIt<DatabaseImplementation>();

  String downloadUrl;

  void onSelectEmailGroupTender(String accountId, String groupId,
      String quoteId, String emailType) async {
    setState(ViewState.BUSY);
    EmailTenderPriceGroupModel emailTenderPriceGroupModel =
        await database.onSelectEmailGroupTender(EmailTenderPriceGroupCredential(
            accountId: accountId,
            groupId: groupId,
            quoteId: quoteId,
            emailType: emailType));
    downloadUrl = emailTenderPriceGroupModel.exportTenderPricePath;
    setState(ViewState.IDLE);
  }

  void onClickEmailTenderPrice(String recepient, String firstName) {
    EmailService.sendEmail(recepient, downloadUrl, firstName);
  }
}
