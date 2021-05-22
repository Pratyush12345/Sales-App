
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:pozitive/Core/AppConstact/appConstant.dart';
import 'package:pozitive/Core/Model/Api/credentialLogin.dart';
import 'package:pozitive/Core/Model/user.dart';
import 'package:pozitive/Core/Services/logInApi.dart';
import 'package:pozitive/Core/ViewModel/baseModel.dart';
import 'package:pozitive/Core/enums/view_state.dart';
import '../baseview.dart';


class LogInModel extends BaseModel {
  LogInApi _api = getIt<LogInApi>();



  Future<User> login(LogInCredential logInCredential,BuildContext context) async {
    assert( logInCredential != null);
    // TODO: Apply validation here or somewhere else?

    setState(ViewState.BUSY);

    final response = await _api.login(logInCredential);



    if (isNotError(response)) {

      var res=jsonDecode(response.body);

      print("#############${res["status"]}");

      if(res["status"]=="1"){
        setState(ViewState.IDLE);
        AppConstant.showSuccessToast(context,res["msg"]);
        return User.fromJson(res["data"]);
      }else{
        setState(ViewState.IDLE);
        AppConstant.showFailToast(context,res["msg"]);
        return null;
      }
    }else{
      setState(ViewState.IDLE);
      print("error");
      return null;


    }


  }
}
