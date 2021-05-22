import 'package:flutter/material.dart';
import 'package:pozitive/Core/AppConstact/appConstant.dart';
import 'package:pozitive/Core/AppConstact/appString.dart';
import 'package:pozitive/Core/Model/Api/Refresh-RequestQuoteCredential.dart';
import 'package:pozitive/Core/Model/Api/ask_for_requote_credential..dart';
import 'package:pozitive/Core/Model/Api/move_group_quote_credenitials.dart';
import 'package:pozitive/Core/Model/Api/move_quote_credentials.dart';
import 'package:pozitive/Core/Model/QuotationHistory_Pop-up.dart';
import 'package:pozitive/Core/Model/response_model.dart';
import 'package:pozitive/Core/Services/database.dart';
import 'package:pozitive/Core/Services/date_formate_service.dart';
import 'package:pozitive/Core/ViewModel/baseModel.dart';
import 'package:pozitive/Core/Model/Api/Group-Refresh-Req-Requote.dart';
import 'package:pozitive/Core/enums/view_state.dart';
import 'package:pozitive/Core/Model/request_quote_history_model.dart';
import 'package:pozitive/Core/Model/Api/request_quote_history_credential.dart';
import 'package:pozitive/Core/Model/request_quote_history_button_model.dart';
import 'package:pozitive/Core/Model/Api/request_quote_history_button_credential.dart';
import 'package:pozitive/Core/Model/request_quote_viewbutton_model.dart';
import 'package:pozitive/Core/Model/request_quote_history_group_model.dart';
import 'package:pozitive/Core/Model/Api/request_quote_history_group_credential.dart';
import 'package:pozitive/Core/Model/Api/quote_history_dropdown_group_credential.dart';
import 'package:pozitive/Core/Model/quote_history_dropdown_group_model.dart';
import 'package:pozitive/Pages/quotation_history_individual_screen.dart';
import 'dart:convert';
import '../../getIt.dart';

class DashBoardItemViewModel extends BaseModel {
  List<String> showValMsg = [];
  Database database = getIt<DatabaseImplementation>();
  RequestQuoteHistoryModel requestQuoteHistoryIndividual =
      RequestQuoteHistoryModel();
  List<QuotationPopupMenu> quotationHistory = [];

  bool viewDetails = false;
  //QuoteListItemDetails quoteListItemDetails;
  //RequestQuoteViewButtonModel quoteListItemDetails;
  RequestQuoteViewButtonModel quoteListItemDetails;
  RequestQuoteHistoryGroupModel requestQuoteHistoryGroupModel;

  void getValidUptoMsg(String title) {
    print(title);
    if (title == 'Requested') {
      quotationHistory = <QuotationPopupMenu>[
        QuotationPopupMenu(history: 'QUOTED HISTORY'),
      ];
    }
    if (title == 'Quoted') {
      quotationHistory = <QuotationPopupMenu>[
        QuotationPopupMenu(history: 'QUOTED HISTORY'),
        QuotationPopupMenu(history: null),
      ];
    }
    if (title == 'Requested Requote') {
      quotationHistory = <QuotationPopupMenu>[
        QuotationPopupMenu(history: 'QUOTED HISTORY'),
      ];
    }
    if (title == 'Requoted') {
      quotationHistory = <QuotationPopupMenu>[
        QuotationPopupMenu(history: 'QUOTED HISTORY'),
        QuotationPopupMenu(history: null),
      ];
    }
    if (title == 'Accepted') {
      quotationHistory = <QuotationPopupMenu>[
        QuotationPopupMenu(history: 'QUOTED HISTORY'),
        QuotationPopupMenu(history: null),
      ];
    }
    if (title == 'Contract send but not received') {
      quotationHistory = <QuotationPopupMenu>[
        QuotationPopupMenu(history: 'MOVE TO QUOTED'),
        QuotationPopupMenu(history: null),
      ];
    }
  }

  void onViewDetailsIndividualQuoteValue(bool val, String accountID,
      String type, String quoteID, BuildContext context) async {
    setState(ViewState.BUSY);
    if (val) {
      if (type.toLowerCase() == AppString.indvidual.toLowerCase()) {
        quoteListItemDetails = await database.getRequestQuoteViewButtonDetails(
            RequestQuoteViewButtonCredential(
                accountId: accountID,
                type: type.toLowerCase(),
                quoteId: quoteID));
      } else {}

      if (quoteListItemDetails != null) {
        viewDetails = val;
        print('Request Quote View button Response' +
            jsonEncode(quoteListItemDetails));
        AppConstant.showSuccessToast(context, 'Data Passed Successfully');
      } else {
        AppConstant.showFailToast(context, AppString.detailsNotAvailable);
      }
    }

    setState(ViewState.IDLE);
  }

  void getQuoteHistoryDropDownGroupDetails(
      String accountId,
      String groupId,
      String type,
      String strPriceDate,
      String strAction,
      BuildContext context) async {
    setState(ViewState.BUSY);
    QuoteHistoryDropDownGroupModel quoteHistoryDropDownGroupModel =
        await database.getQuoteHistoryDropDownGroupDetails(
      QuoteHistoryDropDownGroupCredential(
        accountId: accountId,
        groupId: groupId.toString(),
        type: type,
        strPriceDate: strPriceDate,
        strAction: strAction,
      ),
    );
    if (quoteHistoryDropDownGroupModel != null) {
      AppConstant.showSuccessToast(
          context, 'Quote History Drop Down Group Success');
    } else {
      AppConstant.showFailToast(
          context, 'Quote History Drop Down Group Failed');
    }
    setState(ViewState.IDLE);
  }

  void onChangeDetailsValue(bool val, String accountID, String type,
      String quoteID, BuildContext context) async {
    setState(ViewState.BUSY);
    if (val) {
      if (type.toLowerCase() == AppString.indvidual.toLowerCase()) {
        quoteListItemDetails = await database.getRequestQuoteViewButtonDetails(
            RequestQuoteViewButtonCredential(
                accountId: accountID,
                type: type.toLowerCase(),
                quoteId: quoteID));
      } else {}

      if (quoteListItemDetails != null) {
        viewDetails = val;
        print('Request Quote View button Response' +
            jsonEncode(quoteListItemDetails));
        AppConstant.showSuccessToast(context, 'Data Passed Successfully');
      } else {
        AppConstant.showFailToast(context, AppString.detailsNotAvailable);
      }
    }

    setState(ViewState.IDLE);
  }

  void getRequestQuoteViewButtonDetails(bool val, String accountId, String type,
      String quoteId, BuildContext context) async {
    setState(ViewState.BUSY);
    if (val) {
      RequestQuoteViewButtonModel requestQuoteViewButtonModel =
          await database.getRequestQuoteViewButtonDetails(
        RequestQuoteViewButtonCredential(
          accountId: accountId,
          type: type,
          quoteId: quoteId,
        ),
      );

      if (requestQuoteViewButtonModel.quoteid != null) {
        //print(requestQuoteViewButtonModel);
        print('Resuest Quote View button' +
            jsonEncode(requestQuoteViewButtonModel));
        viewDetails = val;
        AppConstant.showSuccessToast(context, 'Data Passed Successfully');
      } else {
        AppConstant.showFailToast(context, 'Data Passing Failed');
      }
    }
    setState(ViewState.IDLE);
  }

  void getRequestQuoteHistoryDetails(String accountId, String quoteId,
      String type, BuildContext context) async {
    setState(ViewState.BUSY);
    requestQuoteHistoryIndividual =
        await database.getRequestQuoteHistoryDetails(
      RequestQuoteHistoryCredential(
        accountId: accountId,
        quoteid: quoteId,
        //quoteid: '54550',
        type: type,
      ),
    );
    if (requestQuoteHistoryIndividual != null) {
      AppConstant.showSuccessToast(context, 'Success');
      Navigator.of(context).push(
        new MaterialPageRoute(
          builder: (context) => QuotationHistoryScreen(
            apiResponseModel: requestQuoteHistoryIndividual,
            quoteId: quoteId,
          ),
        ),
      );
    } else {
      AppConstant.showFailToast(context, 'Failed');
    }
    setState(ViewState.IDLE);
  }

  ///where you call the function

  Future<void> getRequestQuoteHistoryGroupDetails(String accountId,
      String groupId, String type, BuildContext context) async {
    setState(ViewState.BUSY);
    requestQuoteHistoryGroupModel =
        await database.getRequestQuoteHistoryGroupDetails(
      RequestQuoteHistoryGroupCredential(
        accountId: accountId,
        grouId: groupId,
        type: type,
      ),
    );
    setState(ViewState.IDLE);
    //print('data===${requestQuoteHistoryGroupModel.toJson()}');
    if (requestQuoteHistoryGroupModel != null) {
      AppConstant.showSuccessToast(context, 'Group Data Passed Successfully');
      return requestQuoteHistoryGroupModel;
    } else {
      AppConstant.showFailToast(context, 'Data Passing Failed');
    }
    setState(ViewState.IDLE);
  }

  void getRequestQuoteHistoryButtonDetails(
      String accountId,
      String quoteId,
      String type,
      String strAction,
      String strPriceDate,
      BuildContext context) async {
    setState(ViewState.BUSY);
    RequestQuoteHistoryButtonModel requestQuoteHistoryButtonModel =
        await database.getRequestQuoteHistoryButtonDetails(
      RequestQuoteHistoryButtonCredential(
        accountId: accountId,
        quoteid: quoteId,
        type: type,
        strAction: strAction,
        strPriceDate: strPriceDate,
      ),
    );
    if (requestQuoteHistoryButtonModel != null) {
      AppConstant.showSuccessToast(context, 'Group Data Passed Successfully');
    } else {
      AppConstant.showFailToast(context, 'Data Passing Failed');
    }
    setState(ViewState.IDLE);
  }

  void onMoveToQuote(String accountID, String quoteID, String type,
      BuildContext context) async {
    final response = await database.moveQuote(MoveQuoteCredentials(
        accountID: accountID,
        liveDate: DateFormatService.dateMonthYearString(DateTime.now()),
        quoteID: quoteID));

    if (response.status == 1) {
      //  if (isNotError(response)) {
      AppConstant.showSuccessToast(context, response.msg);
    } else {
      AppConstant.showFailToast(context, response.msg);
    }
    print(quoteID + "quote individual**********");
    print(DateFormatService.dateMonthYearString(DateTime.now()) + "Livep.....");
  }

  void onMoveToQuoteGroup(String accountID, String type, String groupID,
      BuildContext context) async {
    final response = await database.moveGroupQuote(MoveGroupQuoteCredentials(
        accountID: accountID,
        liveDate: DateFormatService.dateMonthYearString(DateTime.now()),
        groupId: groupID));

    if (response.status == 1) {
      //  if (isNotError(response)) {
      AppConstant.showSuccessToast(context, response.msg);
    } else {
      AppConstant.showFailToast(context, response.msg);
    }
    print(groupID + "groupID hgdfhds**********");
    print(DateFormatService.dateMonthYearString(DateTime.now()) + "Livep.....");
  }

  Future refreshReQuote(RefreshReQuoteCrential refreshReQuoteCrential) async {
    setState(ViewState.BUSY);
    final response = await database.refreshReQuote(refreshReQuoteCrential);
  }

  Future groupRefreshReQuote(
      GroupRefreshReQuoteCrential refreshReQuoteCrential) async {
    setState(ViewState.BUSY);
    final response = await database.groupRefreshReQuote(refreshReQuoteCrential);
  }
}
