
import 'dart:convert';
import 'package:get_it/get_it.dart';
import 'package:pozitive/Core/Model/Api/PartnerSavePriceWithUpliftCredential.dart';
import 'package:pozitive/Core/Model/Api/generateIndividualContractCredential.dart';
import 'package:pozitive/Core/Services/database.dart';
import 'package:pozitive/Core/ViewModel/baseModel.dart';
import 'package:pozitive/Core/enums/view_state.dart';
import '../Model/Api/ask_for_requote_credential.dart';

GetIt getIt = GetIt.instance;

class PartnerSavePriceUpLiftViewModel extends BaseModel {

  Database database=getIt<DatabaseImplementation>();

  Future savePartnerPriceUpLift(PartnerSavePriceWithUpliftCredential partnerSavePriceWithUpliftCredential)async {
    setState(ViewState.BUSY);
    final response = await database.getPartnerPriceandUpLift(
        partnerSavePriceWithUpliftCredential);
    if (isNotError(response)) {
      print(response);
      var res = jsonDecode(response);
      setState(ViewState.IDLE);
      return res;
    } else {
      print("error");
      return;
    }
  }



  Future askForReQuoteView(AskForReQuoteCrential askForReQuoteCrential) async {
    setState(ViewState.BUSY);
    final response = await database.askForReQuote(askForReQuoteCrential);
  }

  Future generateIndividualContractView(GenerateIndividualContractCredential contractCredential) async {
    setState(ViewState.BUSY);
    final response = await database.generateIndividualContractService(contractCredential);
  }
}