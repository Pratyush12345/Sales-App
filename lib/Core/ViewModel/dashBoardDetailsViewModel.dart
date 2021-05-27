import 'package:get_it/get_it.dart';
import 'package:pozitive/Core/Model/Api/dashBoadDetailCredential.dart';
import 'package:pozitive/Core/Model/dashBoardDetailsDataModel.dart';
import 'package:pozitive/Core/Services/database.dart';
import 'package:pozitive/Core/ViewModel/baseModel.dart';
import 'package:pozitive/Core/enums/view_state.dart';

GetIt getIt = GetIt.instance;

class DashBoardDetailsViewModel extends BaseModel {
  Database database = getIt<DatabaseImplementation>();

  DashBoardDetailDataModel dashBoardDetailDataModel =
      DashBoardDetailDataModel();
  List<String> validUpToMsg = [];
  int i = 0;

  void getDashBoardDetails(
      DashBoardDetailsCredential dashBoardDetailsCredential) async {
    assert(dashBoardDetailsCredential != null);

    setState(ViewState.BUSY);

    final response =
        await database.getDashBoardDetailsList(dashBoardDetailsCredential);

    if (isNotError(response)) {
      dashBoardDetailDataModel = response;
      validUpToMsg.clear();
      for (i = 0;
          i < dashBoardDetailDataModel.lstgetdetail.length.toInt();
          i++) {
        validUpToMsg
            .add(dashBoardDetailDataModel.lstgetdetail[i].validMsg.toString());
      }
      // print(validUpToMsg);
      // print(validUpToMsg.length);
      print(dashBoardDetailDataModel.lstgetdetail[0].validMsg);
      print(response);
    } else {
      print("error");
    }

    setState(ViewState.IDLE);
  }
}
