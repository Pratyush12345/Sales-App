
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import 'package:pozitive/Core/AppConstact/appConstant.dart';
import 'package:pozitive/Core/Model/Api/emailIdModel.dart';
import 'package:pozitive/Core/Services/forgotPasswordApi.dart';
import 'package:pozitive/Core/ViewModel/baseModel.dart';
import 'package:pozitive/Core/enums/view_state.dart';

GetIt getIt = GetIt.instance;

class ForgotPasswordViewModel extends BaseModel {
  ForgotPasswordApi _api = getIt<ForgotPasswordApi>();

  Future forgotPassword(ProfileEmailId profileEmailId,BuildContext context) async {
    assert( profileEmailId != null);
    // TODO: Apply validation here or somewhere else?

    setState(ViewState.BUSY);

    final response = await _api.forGotPassword(profileEmailId);

    if (isNotError(response)) {
      var res= jsonDecode(response);
      print('printitin${res['msg']}');
      AppConstant.showSuccessToast(context,res['msg']);
    }else{


    }

    setState(ViewState.IDLE);
  }
}
