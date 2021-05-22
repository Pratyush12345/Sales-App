import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pozitive/Core/AppConstact/appConstant.dart';
import 'package:pozitive/Core/AppConstact/appString.dart';
import 'package:pozitive/Core/Model/user.dart';
import 'package:pozitive/Core/baseview.dart';
import 'package:pozitive/Core/enums/view_state.dart';
import 'package:pozitive/Util/theme.dart';
import 'package:pozitive/Widget/appbar.dart';
import 'package:pozitive/Widget/drawerwidget.dart';
import 'package:pozitive/Pages/Group-Quotation-addButton/Tab/group_quotation_widget.dart';
import 'package:provider/provider.dart';
import 'package:pozitive/Core/ViewModel/Group-Quotation/GroupAskForQuoteNewViewModel.dart';

class GroupQuotationPage extends StatefulWidget {
  final String groupID;
  GroupQuotationPage({this.groupID});

  @override
  _GroupQuotationPageState createState() => _GroupQuotationPageState();
}

class _GroupQuotationPageState extends State<GroupQuotationPage> {
  ThemeApp themeApp = ThemeApp();

  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    return BaseView<GroupQuotationTabViewModelNew>(
      builder: (context, model, child) {
        return Scaffold(
          backgroundColor: Colors.white,
          key: _scaffoldKey,
          appBar: appbar(
              AppString.quotationGroup, context, _scaffoldKey, true, true),
          drawer: DrawerWidget(),
          body: model.state == ViewState.BUSY
              ? AppConstant.circularProgressIndicator()
              : Padding(
                  padding: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width * 0.03,
                      right: MediaQuery.of(context).size.width * 0.03),
                  child: ListView(
                    children: <Widget>[
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.018,
                      ),
                      Text(AppString.group,
                          style: TextStyle(
                              color: themeApp.purplecolor,
                              fontSize:
                                  MediaQuery.of(context).size.height * .02,
                              fontWeight: FontWeight.bold)),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.004,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: 1,
                        color: Color.fromRGBO(20, 121, 70, 1),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.015,
                      ),

                      //////////controller          ///////////
                      GroupQuotationWidget(
                        groupId: widget.groupID,
                      ),

                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.028,
                      ),
                    ],
                  ),
                ),
        );
      },
    );
  }
}
