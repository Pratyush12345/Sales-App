// priew list from excel sheet
import 'package:flutter/material.dart';
import 'package:pozitive/Core/AppConstact/appConstant.dart';
import 'package:pozitive/Core/AppConstact/appString.dart';
import 'package:pozitive/Core/ViewModel/group_quotation_viewmodel.dart';
import 'package:pozitive/Core/ViewModel/Group-Quotation/group_quotation/group_quotation_tab_viewmodel.dart';
import 'package:pozitive/Util/theme.dart';
import 'package:pozitive/Widget/commonWidget/diabledFieldsTextField.dart';
import 'package:pozitive/Pages/Group-Quotation-addButton/Tab/ViewAddQuoteGroup.dart';
import 'package:pozitive/Core/baseview.dart';
import 'package:pozitive/Core/enums/view_state.dart';

class PreviewList extends StatefulWidget {
  final String groupID;
  final String downloadUrl;
  final GroupQuotationViewModel groupModel;
  final int index;
  final GroupQuotationTabViewModel model;

  const PreviewList(
      {this.groupID,
      this.downloadUrl,
      this.groupModel,
      this.index,
      this.model});
  @override
  _PreviewListState createState() => _PreviewListState();
}

class _PreviewListState extends State<PreviewList> {
  bool _autovalidation = false;
  ThemeApp themeApp = ThemeApp();

  @override
  Widget build(BuildContext context) {
    return BaseView<GroupQuotationTabViewModel>(
        //onModelReady: (model) => model.setPrevData(),
        builder: (context, model, child) {
      if (model.state == ViewState.BUSY) {
        return AppConstant.circularProgressIndicator();
      }
      return Scaffold(
        appBar: AppBar(
          title: Text("Preview-group"),
        ),
        body: Container(
          padding: EdgeInsets.all(15),
          child: ListView(
            children: [
              DisableFieldTextField(
                title: 'Business Name',
                //  initialValue: widget.groupModel.excelRows[widget.index][0],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              DisableFieldTextField(
                title: 'Post Code',
                initialValue:
                    widget.groupModel.excelRows[widget.index][1].toString(),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              DisableFieldTextField(
                digit: 21,
                title: 'MPAN',
                enabled: true,
                initialValue: widget.groupModel.excelRows[widget.index][2] +
                    widget.groupModel.excelRows[widget.index][3],
                // controller:
                //     groupModel.prevMpan,
                // validator: (value) =>
                //     AppConstant
                //         .stringValidator(
                //             value,
                //             AppString
                //                 .groupName),
                validator: (value) {
                  // if (groupModel
                  //         .excelData ==
                  //     null) {
                  //   return AppConstant
                  //       .circularProgressIndicator();
                  // }
                  if (widget.groupModel.prevMpan.text !=
                          widget.groupModel?.excelRows[widget.index][2] ??
                      "" + widget.groupModel?.excelRows[widget.index][3] ??
                      "") {
                    // Or check if appState.username != null or what ever your use case is.
                    widget.groupModel.prevMpan.text = widget
                            .groupModel?.excelRows[widget.index][2] ??
                        '' + widget.groupModel?.excelRows[widget.index][3] ??
                        '';
                  }
                  if (widget.groupModel.prevPrefStartDate.text !=
                      widget.groupModel?.excelRows[widget.index][9]) {
                    // Or check if appState.username != null or what ever your use case is.
                    widget.groupModel.prevPrefStartDate.text =
                        widget.groupModel?.excelRows[widget.index][9] ?? '';
                  }
                },
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              DisableFieldTextField(
                  title: 'EAC_DAY',
                  initialValue:
                      widget.groupModel.excelRows[widget.index][4].toString()),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              DisableFieldTextField(
                  title: 'EAC_EWE',
                  initialValue:
                      widget.groupModel.excelRows[widget.index][5].toString()),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              DisableFieldTextField(
                  title: 'EAC_NIGHT	',
                  initialValue:
                      widget.groupModel.excelRows[widget.index][6].toString()),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              DisableFieldTextField(
                  title: 'MPRN',
                  initialValue: widget.groupModel.excelRows[widget.index][7]),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              DisableFieldTextField(
                  title: 'AQ',
                  initialValue:
                      widget.groupModel.excelRows[widget.index][8].toString()),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Preferred Start Date',
                  style: TextStyle(
                    fontSize: MediaQuery.of(context).size.height * .016,
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.01,
              ),
              DateTextFieldWidget(
                title: 'Preferred Start Date',
                autoValidate: _autovalidation,
                obscureText: false,
                // initialValue: groupModel
                //     .excelRows[index][9],
                controller: widget.groupModel.prevPrefStartDate,
                hintText: AppString.selectDate,
                textInputType: TextInputType.text,
                validator: (value) =>
                    AppConstant.stringValidator(value, AppString.selectDate),
                onTap: () {
                  widget.groupModel
                      .selectStartDate(context, AppString.required);
                },
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Preferred End Date',
                  style: TextStyle(
                    fontSize: MediaQuery.of(context).size.height * .016,
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.01,
              ),
              DateTextFieldWidget(
                title: 'Preferred End Date',
                autoValidate: _autovalidation,
                obscureText: false,
                // initialValue: groupModel
                //     .excelRows[index][10],
                controller: widget.groupModel.prevPrefEndDate,
                hintText: AppString.selectDate,
                textInputType: TextInputType.text,
                validator: (value) =>
                    AppConstant.stringValidator(value, AppString.selectDate),
                onTap: () {
                  widget.groupModel.selectEndDate(context, AppString.required);
                },
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              InkWell(
                child: Container(
                  height: MediaQuery.of(context).size.height * .065,
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                    children: <Widget>[
                      SizedBox(
                        width: MediaQuery.of(context).size.width * .02,
                      ),
                      InkWell(
                        child: Icon(
                          model.prevSingleRate
                              ? Icons.check_box
                              : Icons.check_box_outline_blank,
                          color: Color.fromRGBO(155, 119, 217, 1),
                          size: MediaQuery.of(context).size.height * .023,
                        ),
                        onTap: () {
                          model.onTogglePrevSingleRate();
                        },
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * .02,
                      ),
                      Text(
                        AppString.singleRate,
                        style: TextStyle(
                            fontSize: MediaQuery.of(context).size.height * .019,
                            color: Color.fromRGBO(0, 0, 0, .8)),
                      ),
                    ],
                  ),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(
                          color: themeApp.textfieldbordercolor, width: 2),
                      borderRadius: BorderRadius.circular(3)),
                ),
                onTap: () {
                  model.onTogglePrevSingleRate();
                },
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              InkWell(
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.062,
                  child: Center(
                    child: Text(
                      'Continue',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: MediaQuery.of(context).size.height * 0.017,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  decoration: BoxDecoration(
                      color: Color.fromRGBO(155, 119, 217, 1),
                      borderRadius: BorderRadius.circular(30)),
                ),
                onTap: () {
                  // setState(() {
                  //   Navigator.of(context).pop();
                  // });

                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ViewAddQuoteGroup(
                                groupID: widget.groupID.toString(),
                                downloadUrl: widget.downloadUrl,
                                // groupModel: widget.groupModel,
                                // index: widget.index,
                                // model: widget.model
                              )));
                },
              ),
            ],
          ),
        ),
      );
    });
  }
}
