
import 'package:flutter/material.dart';
import 'package:pozitive/Core/AppConstact/appConstant.dart';
import 'package:pozitive/Core/Model/Api/UploadHHFileCredential.dart';
import 'package:pozitive/Core/Services/database.dart';
import 'package:pozitive/Core/ViewModel/baseModel.dart';
import 'package:pozitive/Core/enums/view_state.dart';

import '../baseview.dart';

class UploadHHFileViewModel extends BaseModel{
  Database database=getIt<DatabaseImplementation>();


  void onUploadHHFile(UploadHHFileCredential  uploadHHFileCredential,BuildContext context)async{
    setState(ViewState.BUSY);

    final response=await database.uploadHHFileAttachment(uploadHHFileCredential);
    if(response.status=='1'){
      AppConstant.showSuccessToast(context, response.msg);
    }else{
      AppConstant.showFailToast(context, response.msg);
    }


    setState(ViewState.IDLE);
  }
}