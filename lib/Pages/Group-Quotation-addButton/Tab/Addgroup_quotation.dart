import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pozitive/Core/AppConstact/appColors.dart';
import 'package:pozitive/Core/ViewModel/Group-Quotation/GroupAskForQuoteNewViewModel.dart';
import 'package:pozitive/Core/ViewModel/group_quotation_viewmodel.dart';
import 'package:pozitive/Core/baseview.dart';
import 'package:pozitive/Util/theme.dart';
import 'package:pozitive/Pages/Group-Quotation-addButton/Tab/group_quotation_widget.dart';
import 'package:provider/provider.dart';
import 'package:pozitive/Core/enums/view_state.dart';
import 'package:pozitive/Core/AppConstact/appConstant.dart';

class GroupQuotation extends StatefulWidget {
  final String groupID;
  final String downloadUrl;
  GroupQuotation({this.groupID, this.downloadUrl});

  @override
  _GroupQuotationState createState() => _GroupQuotationState();
}

class _GroupQuotationState extends State<GroupQuotation> {
  ThemeApp themeApp = ThemeApp();

  @override
  Widget build(BuildContext context) {
    return Consumer<GroupQuotationViewModel>(
      builder: (context, groupModel, child) {
        return BaseView<GroupQuotationTabViewModelNew>(
          builder: (context, model, child) {
            if (model.state == ViewState.BUSY) {
              return Scaffold(
                body: Center(
                  child: AppConstant.circularProgressIndicator(),
                ),
              );
            }
            return Scaffold(
              backgroundColor: AppColors.defaultWhite,
              body: GroupQuotationWidget(
                groupId: widget.groupID.toString(),
              ),
            );
          },
        );
      },
    );
  }
}
