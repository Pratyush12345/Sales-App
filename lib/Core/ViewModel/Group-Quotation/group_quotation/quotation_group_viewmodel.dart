
import 'package:pozitive/Core/Model/Api/profileIdModel.dart';
import 'package:pozitive/Core/Model/user.dart';
import 'package:pozitive/Core/Services/database.dart';
import 'package:pozitive/Core/ViewModel/baseModel.dart';
import 'package:pozitive/Core/enums/view_state.dart';
import 'package:pozitive/Util/Pref.dart';

import '../../../baseview.dart';

class QuotationGroupViewModel extends BaseModel{

  Database database=getIt<DatabaseImplementation>();

  String hHSampleFileUrl;
  void initializeData()async{
    User user=await Prefs.getUser();
    setState(ViewState.BUSY);
    hHSampleFileUrl=await database.getHHSampleFileAttachment(ProfileId(
      accountId: user.accountId
    ));
    setState(ViewState.IDLE);
  }
}