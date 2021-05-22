import 'package:flutter/material.dart';
import 'package:pozitive/Core/AppConstact/appConstant.dart';
import 'package:pozitive/Core/AppConstact/appString.dart';
import 'package:pozitive/Core/Model/Api/GetDailyCommissionCredential.dart';
import 'package:pozitive/Core/Model/Api/add_daily_commission_details_credentials.dart';
import 'package:pozitive/Core/Model/GetDailyCommissonDetailModel.dart';
import 'package:pozitive/Core/Model/response_model.dart';
import 'package:pozitive/Core/Services/database.dart';
import 'package:pozitive/Core/Services/date_formate_service.dart';
import 'package:pozitive/Core/ViewModel/baseModel.dart';
import 'package:pozitive/Core/enums/view_state.dart';
import '../baseview.dart';

class DailyCommissionReportViewModel extends BaseModel {
  Database database = getIt<DatabaseImplementation>();
  TextEditingController preferredDateController = TextEditingController();
  TextEditingController nextPreferredDateController = TextEditingController();
  TextEditingController requireByDateController = TextEditingController();
  bool singleRate = false;
  bool selectCurrentMonth = false;
  int fuelTypeSelected = 0;
  int commissionTypeSelected = 0;

  LstGetDailycommission lstGetDailycommission=LstGetDailycommission();



  String get fuleType {
    if (fuelTypeSelected == 1) {
      return AppString.electricity;
    } else if (fuelTypeSelected == 2) {
      return AppString.gas;
    } else if (fuelTypeSelected == 3) {
      return AppString.all;
    } else {
      return '';
    }
  }

  String get commissionType {
    if (commissionTypeSelected == 1) {
      return AppString.partner;
    } else if (commissionTypeSelected == 2) {
      return AppString.introducer;
    } else {
      return '';
    }
  }

  void selectDate(BuildContext context, String fromField) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null) {
      if (fromField == AppString.required) {
        requireByDateController.text =
            DateFormatService.dateMonthYearString(picked);
      } else if (fromField == AppString.preferred) {
        preferredDateController.text =
            DateFormatService.dateMonthYearString(picked);
      } else {
        nextPreferredDateController.text =
            DateFormatService.dateMonthYearString(picked);
      }
    }
  }

  void toggleCurrentMonth() {
    setState(ViewState.BUSY);
    selectCurrentMonth = !selectCurrentMonth;
    setState(ViewState.IDLE);
  }

  void onSelectFuelType(int val) {
    setState(ViewState.BUSY);
    fuelTypeSelected = val;
    setState(ViewState.IDLE);
  }

  void onSelectCommission(int val) {
    setState(ViewState.BUSY);
    commissionTypeSelected = val;
    setState(ViewState.IDLE);
  }

  void onClearData() {
    setState(ViewState.BUSY);
    preferredDateController.clear();
    nextPreferredDateController.clear();
    requireByDateController.clear();
    singleRate = false;
    fuelTypeSelected = 0;
    commissionTypeSelected = 0;
    setState(ViewState.IDLE);
  }



  void onAddDailyCommissionDetails(String accountID,BuildContext context)async{

    setState(ViewState.BUSY);
    ResponseMessage responseMessage = await database
        .addDailyCommissionDetails(AddDailyCommissionDetailCredentials(
      accountId: accountID,
      commissionType: commissionType,
      currentWeekMonthFlag: selectCurrentMonth.toString(),
      fuelType: fuleType,
      fromDate: requireByDateController.text,
      toDate: preferredDateController.text,
    ));
    if (responseMessage.status == 1) {
      AppConstant.showSuccessToast(context, responseMessage.msg);
    } else {
      AppConstant.showFailToast(context, responseMessage.msg);
    }
    setState(ViewState.IDLE);
  }

  Future getDaily(String accountID, BuildContext context) async {
    assert(GetDailyCommissionCredential != null);
    // TODO: Apply validation here or somewhere else?

    print('acountId ===${lstGetDailycommission.accountId}');

    setState(ViewState.BUSY);

    final response = await database.getDailyCommissionDetailList(
        GetDailyCommissionCredential(accountId: accountID));
    if (isNotError(response)) {
      lstGetDailycommission = response;
      print(response);
    } else {
      print("error");
    }

    setState(ViewState.IDLE);
  }



  void getDailyCommissionService(String accountID,BuildContext context)async{
    setState(ViewState.BUSY);

    lstGetDailycommission=await database.getDailyCommissionDetailList(GetDailyCommissionCredential(
        accountId: accountID
    ));

  }
}
