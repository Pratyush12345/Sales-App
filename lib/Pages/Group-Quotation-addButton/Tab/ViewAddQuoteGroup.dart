import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pozitive/Core/AppConstact/appString.dart';
import 'package:pozitive/Core/Model/user.dart';
import 'package:pozitive/Core/ViewModel/Group-Quotation/group_quotation/group_quotation_tab_viewmodel.dart';
import 'package:pozitive/Core/ViewModel/group_quotation_viewmodel.dart';
import 'package:pozitive/Core/baseview.dart';
import 'package:pozitive/Util/theme.dart';
import 'package:pozitive/Pages/Group-Quotation-addButton/Tab/View-GroupQuotationWidget.dart';
import 'package:provider/provider.dart';

class ViewAddQuoteGroup extends StatefulWidget {
  String groupID;
  String downloadUrl;
  final GroupQuotationViewModel groupModel;
  // final int index;
  // final GroupQuotationTabViewModel model;

  ViewAddQuoteGroup({
    this.groupID,
    this.downloadUrl,
    this.groupModel,
    // this.index,
    // this.model
  });

  @override
  _ViewAddQuoteGroupState createState() => _ViewAddQuoteGroupState();
}

class _ViewAddQuoteGroupState extends State<ViewAddQuoteGroup> {
  ThemeApp themeApp = ThemeApp();

  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    // User user = await Prefs.getUser();

    // return Consumer<GroupQuotationViewModel>(
    //   builder: (context, groupModel, child) {
    return BaseView<GroupQuotationTabViewModel>(
      onModelReady: (model) => model.initializeData(user.accountId),
      builder: (context, model, child) {
        return Scaffold(
          appBar: AppBar(
            title: Text("Group view"),
          ),
          backgroundColor: Colors.white,
          key: _scaffoldKey,
          // appBar: appbar(AppString.quotation,context,_scaffoldKey,true,true),
          //drawer: DrawerWidget(),
          body:
              /* model.state == ViewState.BUSY
              ? AppConstant.circularProgressIndicator()
              :*/
              Padding(
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
                        fontSize: MediaQuery.of(context).size.height * .02,
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
                ViewGroupQuotationWidget(
                  model: model,
                  groupModel: widget.groupModel,
                  groupId: widget.groupID.toString(),
                  downloadUrl: widget.downloadUrl,
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
    // },
    // );
  }
}
