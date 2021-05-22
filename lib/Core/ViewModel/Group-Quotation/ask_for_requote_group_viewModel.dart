import 'package:pozitive/Core/ViewModel/baseModel.dart';
import 'package:pozitive/Core/Services/database.dart';
import 'package:pozitive/Core/enums/view_state.dart';
import 'package:pozitive/Core/Model/ask_for_requote_group_model.dart';
import 'package:pozitive/Core/Model/Api/ask_for_requote_group_credential.dart';
import 'package:get_it/get_it.dart';
import 'package:pozitive/Core/AppConstact/appConstant.dart';
import 'package:flutter/material.dart';

GetIt getIt = GetIt.instance;

class AskForRequoteGroupViewModel extends BaseModel {
  Database database = getIt<DatabaseImplementation>();

  void getAskForRequoteGroupDetails(String accountId, String groupId,
      String flagFrom, BuildContext context) async {
    setState(ViewState.BUSY);
    AskForRequoteGroupModel askForRequoteGroupModel =
        await database.getAskForRequoteGroupDetails(
      AskForRequoteGroupCredential(
        accountId: accountId,
        groupId: groupId,
        flagFrom: flagFrom,
      ),
    );
    if (askForRequoteGroupModel != null) {
      AppConstant.showSuccessToast(
          context, 'Ask for requote group data passed Successfully');
    } else {
      AppConstant.showFailToast(
          context, 'Ask for requote group data passed Failed');
    }
    setState(ViewState.IDLE);
  }
}
