
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:pozitive/Core/AppConstact/appConstant.dart';
import 'package:pozitive/Core/Model/Api/changePassword.dart';
import 'package:pozitive/Core/Services/changePasswordApi.dart';
import 'package:pozitive/Core/ViewModel/baseModel.dart';
import 'package:pozitive/Core/enums/view_state.dart';

GetIt getIt = GetIt.instance;

class ChangePasswordViewModel extends BaseModel {
  ChangePasswordAPi _api = getIt<ChangePasswordAPi>();

  TextEditingController oldPassword= TextEditingController();
  TextEditingController newPassword= TextEditingController();
  TextEditingController accountId= TextEditingController();



  Future changePassword(ChangePasswordCredential changePasswordCredential,BuildContext context) async {
    assert( changePasswordCredential != null);
    // TODO: Apply validation here or somewhere else?

    setState(ViewState.BUSY);

    final response = await _api.changePassword(changePasswordCredential);

    if (isNotError(response)) {
      var res= jsonDecode(response.body);
      print('printitin${res['msg']}');

      if(res['status']=='1'){
        AppConstant.showSuccessToast(context, res['msg']);

        accountId.clear();
        oldPassword.clear();
        newPassword.clear();
      }else{
        AppConstant.showFailToast(context, res['msg']);
      }

    }else{
      print("error");

    }

    setState(ViewState.IDLE);
  }
}
