import 'package:get_it/get_it.dart';
import 'package:pozitive/Core/Model/Api/add_quotation_QuickLeadCredential.dart';
import 'package:pozitive/Core/Model/add_quotation_QuickLeadModel.dart';
import 'package:pozitive/Core/Services/AddQuoteQuickLeadService.dart';
import 'package:pozitive/Core/ViewModel/baseModel.dart';
import 'package:pozitive/Core/enums/view_state.dart';

GetIt getIt = GetIt.instance;

class AddQuickLeadViewModel extends BaseModel {
  AddQuickQuoteLeadService _api = getIt<AddQuickQuoteLeadService>();

  AddQuickLeadQuoteModel addQuickLeadQuoteModel = AddQuickLeadQuoteModel();

  Future getQuickViewQuoteList(
      AddQuoteQuickLeadCredential addQuoteQuickLeadCredential) async {
    assert(addQuoteQuickLeadCredential != null);
    // TODO: Apply validation here or somewhere else?

    print('acountId ===${addQuoteQuickLeadCredential.accountId}');

    setState(ViewState.BUSY);

    final response =
        await _api.getQuickQuoteLeadIndividual(addQuoteQuickLeadCredential);

    if (isNotError(response)) {
      addQuickLeadQuoteModel = response;
      print(response);
    } else {
      print("error");
    }
    setState(ViewState.IDLE);
  }
}
