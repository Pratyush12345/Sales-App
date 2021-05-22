import 'package:pozitive/Core/Services/database.dart';
import 'package:pozitive/Core/ViewModel/baseModel.dart';
import '../../baseview.dart';
import 'package:pozitive/Core/Model/sharePrefModel/SaveAndGenerateContractIndividualModel.dart';

class GenerateContractIndividualViewModel extends BaseModel {
  Database database = getIt<DatabaseImplementation>();
  SaveAndGenerateContractIndividualModel
      saveAndGenerateContractIndividualModel =
      SaveAndGenerateContractIndividualModel();

  // void getIndividualContractDetails() async {
  //   setState(ViewState.BUSY);
  //   print('reached here');
  //   User _user = await Prefs.getUser();

  //   saveAndGenerateContractIndividualModel =
  //       await database.saveAndGenerateContactIndividual(
  //     SaveAndGenerateContractIndivualCredential(
  //         accountId: _user.accountId,
  //         type: 'Individual',
  //         intCustomerId: '39879',
  //         intGroupId: '0'),
  //   );

  //   setState(ViewState.IDLE);
  // }
}
