import 'package:flutter/material.dart';
import 'package:pozitive/Core/AppConstact/appConstant.dart';
import 'package:pozitive/Core/AppConstact/appString.dart';
import 'package:pozitive/Core/AppConstact/assetApp.dart';
import 'package:pozitive/Core/AppConstact/sizeConfig.dart';

import 'package:pozitive/Core/Model/Api/Group-Refresh-Req-Requote.dart';
import 'package:pozitive/Core/Model/Api/Refresh-RequestQuoteCredential.dart';
import 'package:pozitive/Core/Model/QuotationHistory_Pop-up.dart';
import 'package:pozitive/Core/Model/dashBoardDetailsDataModel.dart';
import 'package:pozitive/Core/Model/user.dart';
import 'package:pozitive/Core/ViewModel/dashboardViewModels/dashboard_list_item_viewmodel.dart';
import 'package:pozitive/Core/baseview.dart';
import 'package:pozitive/Pages/Group-Quotation/Group_quotation_page.dart';
import 'package:pozitive/Pages/ViewQuotationIndividual/ViewQuotation_page.dart';
//import 'package:custom_switch/custom_switch.dart';
import 'package:pozitive/Core/enums/view_state.dart';

import 'package:pozitive/Util/theme.dart';
import 'package:provider/provider.dart';
import 'package:pozitive/Pages/quotation_history_group_screen.dart';

import '../customswitch.dart';
import '../shapePopUp.dart';

class DashBoardListItemWidget extends StatefulWidget {
  final int index;
  final Lstgetdetail lstDetail;
  final String type;
  final String quoteId;
  final String title;
  final List<String> validUpToMsg;

  DashBoardListItemWidget(
      {this.lstDetail,
      this.index,
      this.type,
      this.quoteId,
      this.title,
      this.validUpToMsg});

  @override
  _DashBoardListItemWidgetState createState() =>
      _DashBoardListItemWidgetState();
}

getDropDown() {}

class _DashBoardListItemWidgetState extends State<DashBoardListItemWidget> {
  final ThemeApp themeApp = ThemeApp();

  @override
  Widget build(BuildContext context) {
    User user = Provider.of<User>(context);
    return user.accountId != null
        ? BaseView<DashBoardItemViewModel>(
            onModelReady: (model) => model.getValidUptoMsg(widget.title),
            builder: (context, model, child) {
              if (model.state == ViewState.BUSY) {
                return AppConstant.circularProgressIndicator();
              }
              return Column(
                children: <Widget>[
                  Container(
                    color: widget.index.isOdd
                        ? Colors.white
                        : Color.fromRGBO(237, 243, 231, 1),
                    child: Padding(
                      padding: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height * 0.01,
                          bottom: MediaQuery.of(context).size.height * 0.01),
                      child: Row(
                        children: <Widget>[
                          Expanded(
                              flex: 1,
                              child: Padding(
                                padding: SizeConfig.innersidepadding,
                                child: Text(
                                    widget.lstDetail.intId.toString(),
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize:
                                            MediaQuery.of(context).size.width *
                                                0.029),
                                    textAlign: TextAlign.start),
                              )),
                          Expanded(
                            flex: 1,
                            child: InkWell(
                              child: Text(
                                  widget.type == 'Individual' ?
                              ( widget.lstDetail.businessName==null ? widget.lstDetail.strGroupname : widget.lstDetail.businessName) :
                              (widget.lstDetail.businessName==null ? widget.lstDetail.businessName : widget.lstDetail.strGroupname ),

                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize:
                                          MediaQuery.of(context).size.width *
                                              0.029),
                                  textAlign: TextAlign.start),
                              // onTap: () {
                              //   setState(() {
                              //     print(widget.lstDetail.validMsg.toString());
                              //   });
                              // },
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                InkWell(
                                  child: Row(
                                    children: [
                                      Image.asset(
                                        AppAssets.view,
                                        scale: 13,
                                      ),
                                      Text(
                                        AppString.view,
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.027,
                                            color: themeApp.purplecolor),
                                      ),
                                    ],
                                  ),
                                  onTap: () {
                                    if (widget.type.toLowerCase() ==
                                        AppString.indvidual.toLowerCase()) {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  ViewQuotationPage(
                                                    quoteID: widget
                                                        .lstDetail.intId
                                                        .toString(),
                                                    title: widget.title,
                                                  )));
                                    } else {
                                      Navigator.of(context).push(
                                          new MaterialPageRoute(
                                              builder: (context) =>
                                                  GroupQuotationPagesTab(
                                                    groupID: widget
                                                        .lstDetail.intGroupId
                                                        .toString(),
                                                    quoteId: widget.quoteId,
                                                    title: widget.title,
                                                  )));
                                      print(widget.lstDetail.intGroupId);
                                    }
                                  },
                                ),

                                Transform.scale(
                                  scale: .8,
                                  child: CustomSwitch(
                                    value: model.viewDetails,
                                    onChanged: (val) {
                                      model.onChangeDetailsValue(
                                          val,
                                          user.accountId,
                                          widget.type,
                                          widget.lstDetail.intId.toString(),
                                          context);
                                      setState(() {
                                        model.viewDetails = val;
                                      });
                                    },
                                  ),
                                ),

                                // Spacer(),

                                Transform.scale(
                                  scale: .9,
                                  child: SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width * .06,
                                    child: PopupMenuButton<QuotationPopupMenu>(
                                      padding: EdgeInsets.only(bottom: 0.5),
                                      color: Colors.deepPurple,
                                      shape: CustomRoundedRectangleBorders(
                                        borderHeight:
                                            MediaQuery.of(context).size.height *
                                                .05,
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                      onSelected: (val) {
                                        if (widget.type.toLowerCase() ==
                                            AppString.indvidual.toLowerCase()) {
                                          if (val.history ==
                                              AppString.MOVE_TO_QUOTED) {
                                            model.onMoveToQuote(
                                                user.accountId.toString(),
                                                widget.lstDetail.intId
                                                    .toString(),
                                                widget.type,
                                                context);
                                          }
                                          if (val.history ==
                                              AppString.REFRESH) {
                                            model.refreshReQuote(
                                                RefreshReQuoteCrential(
                                                    accountId: user.accountId,
                                                    quoteId: widget
                                                        .lstDetail.intId
                                                        .toString(),
                                                    flagFrom: "manual",
                                                    fuel: "Electricity",
                                                    termType: "2"));
                                            if (model.success) {
                                              AppConstant.showSuccessToast(
                                                  context, "Refresh");
                                            } else {
                                              AppConstant.showFailToast(
                                                  context, "Can't Refresh");
                                            }
                                          }
                                          if (val.history ==
                                              AppString.QUOTED_HISTORY) {
                                            model.getRequestQuoteHistoryDetails(
                                                user.accountId,
                                                widget.lstDetail.intId
                                                    .toString(),
                                                widget.type,
                                                context);
                                            // Navigator.of(context).push(
                                            //   new MaterialPageRoute(
                                            //     builder: (context) =>
                                            //         QuotationHistoryScreen(),
                                            //   ),
                                            // );
                                          }
                                        }
                                        if (widget.type.toLowerCase() ==
                                            AppString.group.toLowerCase()) {
                                          if (val.history ==
                                              AppString.REFRESH) {
                                            model.groupRefreshReQuote(
                                                GroupRefreshReQuoteCrential(
                                              accountId: user.accountId,
                                              quoteId: widget.lstDetail.intId
                                                  .toString(),
                                            ));
                                            if (model.success) {
                                              AppConstant.showSuccessToast(
                                                  context, "Group Refresh");
                                            } else {
                                              AppConstant.showFailToast(
                                                  context, "Can't Refresh");
                                            }
                                          }
                                        }

                                        if (val.history ==
                                            AppString.MOVE_TO_QUOTED_Group) {
                                          model.onMoveToQuoteGroup(
                                              user.accountId.toString(),
                                              widget.type,
                                              widget.lstDetail.intGroupId
                                                  .toString(),
                                              context);
                                        }
                                        if (val.history ==
                                            AppString.QUOTED_HISTORY) {
//                                           if (type.toLowerCase() ==
//                                               AppString.indvidual
//                                                   .toLowerCase()) {
// //                                      model.getRequestQuoteHistoryDetails(
// //                                          user.accountId,
// //                                          lstDetail.intId.toString(),
// //                                          type,
// //                                          context);

//                                             Navigator.of(context).push(
//                                               new MaterialPageRoute(
//                                                 builder: (context) =>
//                                                     ViewQuotationPage(
//                                                   quoteID: lstDetail.intId
//                                                       .toString(),
//                                                 ),
//                                               ),
//                                             );
//                                           }

                                          //here
                                          // on tap of view history
                                          if (widget.type.toLowerCase() ==
                                              AppString.group.toLowerCase()) {
                                            model
                                                .getRequestQuoteHistoryGroupDetails(
                                                    user.accountId,
                                                    widget.lstDetail.intGroupId
                                                        .toString(),
                                                    widget.type,
                                                    context);

                                            Navigator.of(context).push(
                                              new MaterialPageRoute(
                                                builder: (context) =>
                                                    QuotationHistoryGroupScreen(
                                                  widget.index,
                                                  widget.lstDetail.intGroupId
                                                      .toString(),
                                                  widget.type,
                                                ),
                                                // index,
                                                // '16141',
                                                // type),
                                              ),
                                            );
                                          }
                                        }
                                      },
                                      itemBuilder: (BuildContext context) {
                                        return model.quotationHistory
                                            .map((quotationHistory) {
                                          return PopupMenuItem<
                                              QuotationPopupMenu>(
                                            value: quotationHistory,
                                            child: SizedBox(
                                              width: 500,
                                              child: Text(
                                                quotationHistory.history ??
                                                    // // ('${widget.lstDetail.validMsg ?? 'VALID UP TO'.split('-')[0]}' +
                                                    // //     '\n${widget.lstDetail.validMsg.substring(12)}') ??

                                                    ('${widget.lstDetail.validMsg.substring(0, 11)}' +
                                                        '\n${widget.lstDetail.validMsg.substring(12, 31)}') ??
                                                    '',
                                                // ('${widget.lstDetail.validMsg ?? 'Valid Up To'}') ??
                                                // 'Valid Up To',
                                                style: TextStyle(
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ),
                                          );
                                        }).toList();
                                      },
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  model.viewDetails
                      ? Container(
                          decoration: BoxDecoration(
                              color: Color.fromRGBO(243, 249, 237, 1),
                              border: Border.all(
                                  color: Colors.grey.withOpacity(.5))),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Padding(
                                padding: EdgeInsets.only(
                                    bottom: MediaQuery.of(context).size.height *
                                        0.01,
                                    top: MediaQuery.of(context).size.height *
                                        0.01),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    SizedBox(
                                      child: Text(AppString.status,
                                          textAlign: TextAlign.end,
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.027,
                                          )),
                                      width: MediaQuery.of(context).size.width *
                                          0.46,
                                    ),
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width *
                                          .03,
                                    ),
                                    SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.46,
                                        child: Text(
                                            model.quoteListItemDetails.strStatus
                                                .toString(),
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.027)))
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                    bottom: MediaQuery.of(context).size.height *
                                        0.01,
                                    top: MediaQuery.of(context).size.height *
                                        0.01),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.46,
                                        child: Text(AppString.timer,
                                            textAlign: TextAlign.end,
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold,
                                                fontSize: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.027))),
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width *
                                          .03,
                                    ),
                                    SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.46,
                                        child: Text(
                                            model.quoteListItemDetails.termType
                                                .toString(),
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.027)))
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                    bottom: MediaQuery.of(context).size.height *
                                        0.01,
                                    top: MediaQuery.of(context).size.height *
                                        0.01),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.46,
                                        child: Text(AppString.no,
                                            textAlign: TextAlign.end,
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold,
                                                fontSize: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.027))),
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width *
                                          .03,
                                    ),
                                    SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.46,
                                        child: Text(
                                            widget.type == AppString.group
                                                ? "G${model.quoteListItemDetails.quoteid}"
                                                : "I${model.quoteListItemDetails.quoteid}",
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.027)))
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                    bottom: MediaQuery.of(context).size.height *
                                        0.01,
                                    top: MediaQuery.of(context).size.height *
                                        0.01),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width *
                                          0.46,
                                      child: Text(AppString.partnerName,
                                          textAlign: TextAlign.end,
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold,
                                              fontSize: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.027)),
                                    ),
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width *
                                          .03,
                                    ),
                                    SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.46,
                                        child: Text(
                                            widget.lstDetail.strBrokername,
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.027)))
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                    bottom: MediaQuery.of(context).size.height *
                                        0.01,
                                    top: MediaQuery.of(context).size.height *
                                        0.01),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.46,
                                        child: Text("Last Access",
                                            textAlign: TextAlign.end,
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.027,
                                                fontWeight: FontWeight.bold))),
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width *
                                          .03,
                                    ),
                                    SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.46,
                                        child: Text(
                                            widget.lstDetail.strLastAccess,
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.027)))
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                    bottom: MediaQuery.of(context).size.height *
                                        0.01,
                                    top: MediaQuery.of(context).size.height *
                                        0.01),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.46,
                                        child: Text(AppString.businessName,
                                            textAlign: TextAlign.end,
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold,
                                                fontSize: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.027))),
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width *
                                          .03,
                                    ),
                                    SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.46,
                                        child: Text(
                                            model.quoteListItemDetails
                                                .businessName,
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.027)))
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                    bottom: MediaQuery.of(context).size.height *
                                        0.01,
                                    top: MediaQuery.of(context).size.height *
                                        0.01),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.46,
                                        child: Text(AppString.requiredByDate,
                                            textAlign: TextAlign.end,
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.027,
                                                fontWeight: FontWeight.bold))),
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width *
                                          .03,
                                    ),
                                    SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.46,
                                        child: Text(
                                            model.quoteListItemDetails
                                                .requiredByDate,
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.027)))
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                    bottom: MediaQuery.of(context).size.height *
                                        0.01,
                                    top: MediaQuery.of(context).size.height *
                                        0.01),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.46,
                                        child: Text(
                                            AppString.createdRerequestedDate,
                                            textAlign: TextAlign.end,
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.027,
                                                fontWeight: FontWeight.bold))),
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width *
                                          .03,
                                    ),
                                    SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.46,
                                        child: Text(
                                            model.quoteListItemDetails
                                                .quotedDate,
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.027)))
                                  ],
                                ),
                              )
                            ],
                          ),
                        )
                      : Container()
                ],
              );
            },
          )
        : Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
  }
}
//recent update 9-1-21
