import 'package:flutter/material.dart';
import 'package:pozitive/Core/AppConstact/appConstant.dart';
import 'package:pozitive/Core/AppConstact/appString.dart';
import 'package:pozitive/Core/Model/custom_pop_up.dart';
import 'package:pozitive/Core/Model/user.dart';
import 'package:pozitive/Core/ViewModel/commission_statement_viewmodel.dart';
import 'package:pozitive/Core/baseview.dart';
import 'package:pozitive/Core/enums/view_state.dart';

import 'package:pozitive/Widget/appbar.dart';
import 'package:pozitive/Widget/commission/commission_statement_widget.dart';
import 'package:provider/provider.dart';

class CommissionStatement extends StatefulWidget {
  @override
  _CommissionStatementState createState() => _CommissionStatementState();
}

List<CustomPopupMenu> choices = <CustomPopupMenu>[
  CustomPopupMenu(
      title: AppString.downloadAll, assetImage: "assets/icon/download.png"),
  CustomPopupMenu(
      title: AppString.downloadInvoice,
      assetImage: "assets/icon/download-invoice.png"),
  CustomPopupMenu(
      title: AppString.commissionDetails,
      assetImage: "assets/icon/commission-detail.png"),
  CustomPopupMenu(
      title: AppString.commissionStatus,
      assetImage: "assets/icon/commission-status.png"),
  CustomPopupMenu(
      title: AppString.allianceCommission,
      assetImage: "assets/icon/Alliance Commission.png"),
];

class _CommissionStatementState extends State<CommissionStatement> {
  bool partner = true;
  var key;

  List viewlist = [];

  bool isSwitched = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    for (int i = 0; i < 20; i++) {
      setState(() {
        viewlist.add({"view": false, "click": false, "checkbox": false});
      });
    }
  }

  void _onselect(CustomPopupMenu choice, job_id) {
    if (choice.title == "Remove Job") {
    } else {}
  }

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    return Scaffold(
      appBar: appbar("Commission Invoice Report", context, key, false, true),
      body: BaseView<CommissionStatementViewModel>(
        onModelReady: (model) =>
            model.getCommissionList(partner, user.accountId),
        builder: (context, model, child) {
          return Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  InkWell(
                    child: Container(
                      width: MediaQuery.of(context).size.width * .5,
                      height: MediaQuery.of(context).size.height * .08,
                      child: Center(
                        child: Text(
                          AppString.partner,
                          style: TextStyle(
                              color: partner
                                  ? Color.fromRGBO(20, 121, 70, 1)
                                  : Color.fromRGBO(123, 123, 123, 1),
                              fontSize:
                                  MediaQuery.of(context).size.height * .022),
                        ),
                      ),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border(
                              bottom: partner
                                  ? BorderSide(
                                      color: Color.fromRGBO(20, 121, 70, 1),
                                      width: 2)
                                  : BorderSide(color: Colors.transparent))),
                    ),
                    onTap: () {
                      setState(() {
                        partner = true;
                      });
                      model.getCommissionList(partner, user.accountId);
                    },
                  ),
                  InkWell(
                    child: Container(
                      width: MediaQuery.of(context).size.width * .5,
                      height: MediaQuery.of(context).size.height * .08,
                      child: Center(
                        child: Text(AppString.renewal,
                            style: TextStyle(
                                color: partner
                                    ? Color.fromRGBO(123, 123, 123, 1)
                                    : Color.fromRGBO(20, 121, 70, 1),
                                fontSize:
                                    MediaQuery.of(context).size.height * .022)),
                      ),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border(
                              bottom: partner
                                  ? BorderSide(color: Colors.transparent)
                                  : BorderSide(
                                      color: Color.fromRGBO(20, 129, 88, 1),
                                      width: 2))),
                    ),
                    onTap: () {
                      setState(() {
                        partner = false;
                      });
                      model.getCommissionList(partner, user.accountId);
                    },
                  ),
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.017,
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width * .02,
                      right: MediaQuery.of(context).size.width * .02),
                  child: Column(
                    children: <Widget>[
                      Container(
//                  width: MediaQuery.of(context).size.width,
                        color: Color.fromRGBO(48, 142, 58, 1),
                        child: Padding(
                          padding: EdgeInsets.only(
                              top: MediaQuery.of(context).size.height * 0.017,
                              bottom:
                                  MediaQuery.of(context).size.height * 0.017),
                          child: Row(
                            children: <Widget>[
                              SizedBox(
                                width: MediaQuery.of(context).size.width * .02,
                              ),
                              Container(
                                  width:
                                      MediaQuery.of(context).size.width * .31,
                                  child: Text(
                                    AppString.invoiceNumber,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize:
                                            MediaQuery.of(context).size.height *
                                                0.02),
                                  )),
                              Container(
                                  width:
                                      MediaQuery.of(context).size.width * .28,
                                  child: Text(
                                    AppString.invoiceDate,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize:
                                            MediaQuery.of(context).size.height *
                                                0.02),
                                  )),
                              Container(
                                  width:
                                      MediaQuery.of(context).size.width * .34,
                                  child: Text(
                                    AppString.invoiceTotal,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize:
                                            MediaQuery.of(context).size.height *
                                                0.02),
                                  ))
                            ],
                          ),
                        ),
                      ),
                      model.state == ViewState.BUSY
                          ? Expanded(
                              child: AppConstant.circularProgressIndicator())
                          : Expanded(
                              child: ListView.builder(
                                  padding: EdgeInsets.all(0),
                                  shrinkWrap: true,
                                  itemCount: model.brokerCommissionList.length,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return CommissionStatementItemWidget(
                                      brokerCommissionList:
                                          model.brokerCommissionList[index],
                                      index: index,
                                      partner: partner,
                                    );
                                  }),
                            )
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
