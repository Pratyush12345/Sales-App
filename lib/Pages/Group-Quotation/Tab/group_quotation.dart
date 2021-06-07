import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pozitive/Core/AppConstact/appString.dart';
import 'package:pozitive/Core/Model/user.dart';
import 'package:pozitive/Core/ViewModel/Group-Quotation/group_quotation/group_quotation_tab_viewmodel.dart';
import 'package:pozitive/Core/ViewModel/group_quotation_viewmodel.dart';
import 'package:pozitive/Core/baseview.dart';
import 'package:pozitive/Util/theme.dart';
import 'package:pozitive/Pages/Group-Quotation-addButton/Tab/view_group_quotation_widget.dart';
import 'package:provider/provider.dart';
import 'package:pozitive/Core/ViewModel/Group-Quotation/GroupAskForQuoteNewViewModel.dart';

class GroupQuotation extends StatefulWidget {
  String groupId;
  String title;
  dynamic loaddata;
  String status;
  GroupQuotation({this.groupId, this.title,this.loaddata,this.status});

  @override
  _GroupQuotationState createState() => _GroupQuotationState();
}

class _GroupQuotationState extends State<GroupQuotation> {
  ThemeApp themeApp = ThemeApp();

  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return BaseView<GroupQuotationTabViewModelNew>(
      builder: (context, model, child) {
        return Scaffold(
          backgroundColor: Colors.white,
          key: _scaffoldKey,
          body: ViewGroupQuotationWidget(
            groupId: widget.groupId.toString(),
            loaddata: widget.loaddata,
            status: widget.status,
          ),
        );
      },
    );
  }
}
