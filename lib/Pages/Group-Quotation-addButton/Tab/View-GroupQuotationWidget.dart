import 'dart:io';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pozitive/Core/AppConstact/appConstant.dart';
import 'package:pozitive/Core/AppConstact/appString.dart';
import 'package:pozitive/Core/Model/user.dart';
import 'package:pozitive/Core/Services/DownloadService.dart';
import 'package:pozitive/Core/ViewModel/Group-Quotation/group_quotation/group_quotation_tab_viewmodel.dart';
import 'package:pozitive/Core/ViewModel/group_quotation_viewmodel.dart';
import 'package:pozitive/Util/theme.dart';
import 'package:pozitive/Widget/commonWidget/appTextField.dart';
import 'package:pozitive/Widget/commonWidget/date_text_field_widget.dart';
import 'package:provider/provider.dart';
import '../../../Widget/GroupAddAndViewNote.dart';
import 'package:pozitive/Core/baseview.dart';

class ViewGroupQuotationWidget extends StatefulWidget {
  final GroupQuotationTabViewModel model;
  final GroupQuotationViewModel groupModel;
  final String groupId;
  final String downloadUrl;

  ViewGroupQuotationWidget(
      {this.model, this.groupModel, this.groupId, this.downloadUrl});

  @override
  _ViewGroupQuotationWidgetState createState() =>
      _ViewGroupQuotationWidgetState();
}

class _ViewGroupQuotationWidgetState extends State<ViewGroupQuotationWidget> {
  bool _autovalidation = false;

  final ThemeApp themeApp = ThemeApp();

  File path;

  final _formKey = GlobalKey<FormState>();

  bool enableFields = true;
  String fileError;
  bool isTermSelected = false;
  bool businessName = false;

  DateFormat dateFormat = DateFormat("dd/MM/yyyy");

  DateFormat dateRFormat = DateFormat("dd/MM/yyyy hh:mm");

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    // return Consumer<GroupQuotationViewModel>(
    //     builder: (context, groupModel, child) {
    return BaseView<GroupQuotationViewModel>(
        // onModelReady: (model) => model.getFilePath(),
        builder: (context, groupModelsa, child) {
      return Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // AppTextField(
            //   enabled: enableFields ,
            //   title: AppString.businessBasketName,
            //   controller: model.businessNameController,
            //   autoValidation: _autovalidation,
            //   textInputType: TextInputType.text,
            //   hintText: AppString.name,
            //   obscureText: false,
            //   validator: (value) =>
            //       AppConstant.stringValidator(value, AppString.name),
            // ),
            AppTextField(
              title: AppString.businessName,
              controller: widget.model.businessNameController,
              autoValidation: _autovalidation,
              textInputType: TextInputType.text,
              validator: (value) =>
                  AppConstant.stringValidator(value, AppString.businessName),
            ),

            // SizeConfig.verticalSpaceSmall(),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Text(
                  AppString.pleaseNoteIndividualConracts,
                  style: TextStyle(
                      fontSize: MediaQuery.of(context).size.height * .015,
                      color: themeApp.greenappcolor),
                )
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.026,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  width: MediaQuery.of(context).size.width * .41,
                  height: 2,
                  color: Color.fromRGBO(155, 155, 155, 1),
                ),
                Text(
                  AppString.or,
                  style: TextStyle(
                      color: themeApp.purplecolor,
                      fontSize: MediaQuery.of(context).size.height * .02,
                      fontWeight: FontWeight.bold),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * .41,
                  height: 2,
                  color: Color.fromRGBO(155, 155, 155, 1),
                ),
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.013,
            ),
            AppTextField(
              title: AppString.groupName,
              controller: widget.model.groupNameController,
              autoValidation: _autovalidation,
              textInputType: TextInputType.text,
              hintText: AppString.groupName,
              validator: (value) =>
                  AppConstant.stringValidator(value, AppString.groupName),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * .004,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Text(
                  AppString.pleaseNoteGroupContracts,
                  style: TextStyle(
                      fontSize: MediaQuery.of(context).size.height * .015,
                      color: themeApp.greenappcolor),
                )
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.005,
            ),
            Text(
              AppString.terms,
              style: TextStyle(
                  fontSize: MediaQuery.of(context).size.height * .015,
                  color: Color.fromRGBO(31, 33, 29, 1)),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.008,
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.13,
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      SizedBox(
                        width: MediaQuery.of(context).size.width * .02,
                      ),
                      InkWell(
                        child: Container(
                          height: MediaQuery.of(context).size.height * .062,
                          child: Row(
                            children: <Widget>[
                              widget.model.oneYear
                                  ? Icon(
                                      Icons.check_box,
                                      color: Color.fromRGBO(155, 119, 217, 1),
                                      size: MediaQuery.of(context).size.height *
                                          .023,
                                    )
                                  : InkWell(
                                      child: Icon(
                                        Icons.check_box_outline_blank,
                                        color: Color.fromRGBO(155, 119, 217, 1),
                                        size:
                                            MediaQuery.of(context).size.height *
                                                .023,
                                      ),
                                      onTap: () {
                                        widget.model.toggleOneYear();
                                      },
                                    ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * .01,
                              ),
                              Text(
                                "1 Year",
                                style: TextStyle(
                                    fontSize:
                                        MediaQuery.of(context).size.height *
                                            .02,
                                    color: Color.fromRGBO(0, 0, 0, .8)),
                              ),
                            ],
                          ),
                        ),
                        onTap: () {
                          if (!isTermSelected) {
                            isTermSelected = !isTermSelected;
                          }
                          widget.model.toggleOneYear();
                        },
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * .02,
                      ),
                      InkWell(
                        child: Container(
                          height: MediaQuery.of(context).size.height * .062,
                          child: Row(
                            children: <Widget>[
                              widget.model.twoYear
                                  ? Icon(Icons.check_box,
                                      size: MediaQuery.of(context).size.height *
                                          .023,
                                      color: Color.fromRGBO(155, 119, 217, 1))
                                  : InkWell(
                                      child: Icon(Icons.check_box_outline_blank,
                                          size: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              .023,
                                          color:
                                              Color.fromRGBO(155, 119, 217, 1)),
                                      onTap: () {
                                        widget.model.toggleTwoYear();
                                      },
                                    ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * .01,
                              ),
                              Text(
                                "2 Year",
                                style: TextStyle(
                                    fontSize:
                                        MediaQuery.of(context).size.height *
                                            .02,
                                    color: Color.fromRGBO(0, 0, 0, .8)),
                              ),
                            ],
                          ),
                        ),
                        onTap: () {
                          if (!isTermSelected) {
                            isTermSelected = !isTermSelected;
                          }
                          widget.model.toggleTwoYear();
                        },
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * .01,
                      ),
                      InkWell(
                        child: Container(
                          height: MediaQuery.of(context).size.height * .062,
                          child: Row(
                            children: <Widget>[
                              widget.model.threeYear
                                  ? Icon(
                                      Icons.check_box,
                                      size: MediaQuery.of(context).size.height *
                                          .023,
                                      color: Color.fromRGBO(155, 119, 217, 1),
                                    )
                                  : InkWell(
                                      child: Icon(
                                        Icons.check_box_outline_blank,
                                        size:
                                            MediaQuery.of(context).size.height *
                                                .023,
                                        color: Color.fromRGBO(155, 119, 217, 1),
                                      ),
                                      onTap: () {
                                        if (!isTermSelected) {
                                          isTermSelected = !isTermSelected;
                                        }
                                        widget.model.toggleThreeYear();
                                      },
                                    ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * .01,
                              ),
                              Text(
                                "3 Year",
                                style: TextStyle(
                                    fontSize:
                                        MediaQuery.of(context).size.height *
                                            .02,
                                    color: Color.fromRGBO(0, 0, 0, .8)),
                              ),
                            ],
                          ),
                        ),
                        onTap: () {
                          if (!isTermSelected) {
                            isTermSelected = !isTermSelected;
                          }
                          widget.model.toggleThreeYear();
                        },
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * .02,
                      ),
                      InkWell(
                        child: Container(
                          height: MediaQuery.of(context).size.height * .062,
                          child: Row(
                            children: <Widget>[
                              widget.model.fourYear
                                  ? Icon(
                                      Icons.check_box,
                                      color: Color.fromRGBO(155, 119, 217, 1),
                                      size: MediaQuery.of(context).size.height *
                                          .023,
                                    )
                                  : InkWell(
                                      child: Icon(
                                        Icons.check_box_outline_blank,
                                        color: Color.fromRGBO(155, 119, 217, 1),
                                        size:
                                            MediaQuery.of(context).size.height *
                                                .023,
                                      ),
                                      onTap: () {
                                        if (!isTermSelected) {
                                          isTermSelected = !isTermSelected;
                                        }
                                        widget.model.toggleFourYear();
                                      },
                                    ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * .01,
                              ),
                              Text(
                                "4 Year",
                                style: TextStyle(
                                    fontSize:
                                        MediaQuery.of(context).size.height *
                                            .02,
                                    color: Color.fromRGBO(0, 0, 0, .8)),
                              ),
                            ],
                          ),
                        ),
                        onTap: () {
                          if (!isTermSelected) {
                            isTermSelected = !isTermSelected;
                          }
                          widget.model.toggleFourYear();
                        },
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * .02,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(
                        width: MediaQuery.of(context).size.width * .045,
                      ),
                      InkWell(
                        child: Container(
                          height: MediaQuery.of(context).size.height * .062,
                          child: Row(
                            children: <Widget>[
                              widget.model.fiveYear
                                  ? Icon(
                                      Icons.check_box,
                                      color: Color.fromRGBO(155, 119, 217, 1),
                                      size: MediaQuery.of(context).size.height *
                                          .023,
                                    )
                                  : InkWell(
                                      child: Icon(
                                        Icons.check_box_outline_blank,
                                        color: Color.fromRGBO(155, 119, 217, 1),
                                        size:
                                            MediaQuery.of(context).size.height *
                                                .023,
                                      ),
                                      onTap: () {
                                        if (!isTermSelected) {
                                          isTermSelected = !isTermSelected;
                                        }
                                        widget.model.toggleFiveYear();
                                      },
                                    ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * .01,
                              ),
                              Text(
                                "5 Year",
                                style: TextStyle(
                                    fontSize:
                                        MediaQuery.of(context).size.height *
                                            .02,
                                    color: Color.fromRGBO(0, 0, 0, .8)),
                              ),
                            ],
                          ),
                        ),
                        onTap: () {
                          if (!isTermSelected) {
                            isTermSelected = !isTermSelected;
                          }
                          widget.model.toggleFiveYear();
                        },
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * .043,
                      ),
                      InkWell(
                        child: Container(
                          height: MediaQuery.of(context).size.height * .062,
                          child: Row(
                            children: <Widget>[
                              widget.model.other
                                  ? Icon(
                                      Icons.check_box,
                                      size: MediaQuery.of(context).size.height *
                                          .023,
                                      color: Color.fromRGBO(155, 119, 217, 1),
                                    )
                                  : InkWell(
                                      child: Icon(
                                        Icons.check_box_outline_blank,
                                        size:
                                            MediaQuery.of(context).size.height *
                                                .023,
                                        color: Color.fromRGBO(155, 119, 217, 1),
                                      ),
                                      onTap: () {
                                        widget.model.toggleOther(context);
                                      },
                                    ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * .01,
                              ),
                              Text(
                                "Other",
                                style: TextStyle(
                                    fontSize:
                                        MediaQuery.of(context).size.height *
                                            .02,
                                    color: Color.fromRGBO(0, 0, 0, .8)),
                              ),
                            ],
                          ),
                        ),
                        onTap: () {
                          widget.model.toggleOther(context);
                        },
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * .045,
                      ),
                      InkWell(
                        child: Container(
                          height: MediaQuery.of(context).size.height * .062,
                          child: Row(
                            children: <Widget>[
                              widget.model.all
                                  ? Icon(
                                      Icons.check_box,
                                      size: MediaQuery.of(context).size.height *
                                          .023,
                                      color: Color.fromRGBO(155, 119, 217, 1),
                                    )
                                  : InkWell(
                                      child: Icon(
                                        Icons.check_box_outline_blank,
                                        size:
                                            MediaQuery.of(context).size.height *
                                                .023,
                                        color: Color.fromRGBO(155, 119, 217, 1),
                                      ),
                                      onTap: () {
                                        widget.model.toggleAll();
                                      },
                                    ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * .01,
                              ),
                              Text(
                                "All",
                                style: TextStyle(
                                    fontSize:
                                        MediaQuery.of(context).size.height *
                                            .02,
                                    color: Color.fromRGBO(0, 0, 0, .8)),
                              ),
                            ],
                          ),
                        ),
                        onTap: () {
                          if (!isTermSelected) {
                            isTermSelected = !isTermSelected;
                          }
                          widget.model.toggleAll();
                        },
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * .01,
                      ),
                    ],
                  ),
                ],
              ),
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                      color: themeApp.textfieldbordercolor, width: 2),
                  borderRadius: BorderRadius.circular(3)),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.033,
            ),
            Text(
              AppString.requiredByDate,
              style: TextStyle(
                  fontSize: MediaQuery.of(context).size.height * .015,
                  color: Color.fromRGBO(31, 33, 29, 1)),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
            DateTextFieldWidget(
              autoValidate: _autovalidation,
              obscureText: false,
              controller: widget.model.requireByDateController,
              hintText: AppString.selectDate,
              textInputType: TextInputType.text,
              validator: (value) =>
                  AppConstant.stringValidator(value, AppString.selectDate),
              onTap: () {
                widget.model.selectDate(context, AppString.required);
              },
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            Text(
              AppString.uploadGroupFile,
              style: TextStyle(
                  fontSize: MediaQuery.of(context).size.height * .015,
                  color: Color.fromRGBO(31, 33, 29, 1)),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
            Container(
              height: MediaQuery.of(context).size.height * .065,
              width: MediaQuery.of(context).size.width,
              child: Row(
                children: <Widget>[
                  SizedBox(
                    width: MediaQuery.of(context).size.width * .02,
                  ),
                  InkWell(
                      child: Container(
                        height: MediaQuery.of(context).size.height * .042,
                        width: MediaQuery.of(context).size.width * .24,
                        child: Center(
                          child: Text(
                            AppString.chooseFile,
                            style: TextStyle(
                                fontSize:
                                    MediaQuery.of(context).size.height * .017,
                                color: Colors.white),
                          ),
                        ),
                        decoration: BoxDecoration(
                          color: themeApp.purplecolor,
                          borderRadius: BorderRadius.circular(14),
                        ),
                      ),
                      onTap: () async {
                        widget.model.onChooseFile(context, user.accountId,
                            this.widget.groupId.toString(), path, groupModelsa);
                      }),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * .02,
                  ),
                  widget.model.path != null
                      ? Flexible(
                          child: Text(
                            // widget.model.path.substring(
                            //     widget.model.path.lastIndexOf("/") + 1),
                            widget.model.path.split("/").last,
                            style: TextStyle(
                                fontSize:
                                    MediaQuery.of(context).size.height * .019,
                                color: Color.fromRGBO(0, 0, 0, .8)),
                            overflow: TextOverflow.ellipsis,
                            softWrap: true,
                          ),
                        )
                      : Flexible(
                          child: Text(
                            groupModelsa.filePath ?? 'no',
                            style: TextStyle(
                                fontSize:
                                    MediaQuery.of(context).size.height * .019,
                                color: Color.fromRGBO(0, 0, 0, .6)),
                            overflow: TextOverflow.ellipsis,
                            softWrap: true,
                          ),
                        ),
                ],
              ),
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                      color: themeApp.textfieldbordercolor, width: 2),
                  borderRadius: BorderRadius.circular(3)),
            ),
            fileError != null
                ? Text(
                    fileError,
                    style: TextStyle(color: Colors.red),
                  )
                : Container(),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.028,
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
                        widget.model.mop
                            ? Icons.check_box
                            : Icons.check_box_outline_blank,
                        color: Color.fromRGBO(155, 119, 217, 1),
                        size: MediaQuery.of(context).size.height * .023,
                      ),
                      onTap: () {
                        widget.model.onToggleThirdPartyMop();
                      },
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * .02,
                    ),
                    Text(
                      AppString.customerThirdPartyMopContract,
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
                widget.model.onToggleThirdPartyMop();
              },
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.024,
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
                        widget.model.daDc
                            ? Icons.check_box
                            : Icons.check_box_outline_blank,
                        color: Color.fromRGBO(155, 119, 217, 1),
                        size: MediaQuery.of(context).size.height * .023,
                      ),
                      onTap: () {
                        widget.model.onToggleThirdPartyDADCContract();
                      },
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * .02,
                    ),
                    Text(
                      AppString.customerThirdPartyDADCContract,
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
                widget.model.onToggleThirdPartyDADCContract();
              },
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.024,
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
                        widget.model.starkDaDc
                            ? Icons.check_box
                            : Icons.check_box_outline_blank,
                        color: Color.fromRGBO(155, 119, 217, 1),
                        size: MediaQuery.of(context).size.height * .023,
                      ),
                      onTap: () {
                        widget.model.onToggleStarkDa();
                      },
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * .02,
                    ),
                    Text(
                      AppString.pozitiveEnergyToNominateStarkAsDADC,
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
                widget.model.onToggleStarkDa();
              },
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.033,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                InkWell(
                  child: Container(
                    width: MediaQuery.of(context).size.width * .38,
                    height: MediaQuery.of(context).size.height * 0.062,
                    child: Center(
                      child: Text(
                        AppString.Cnotes,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize:
                                MediaQuery.of(context).size.height * 0.017,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    decoration: BoxDecoration(
                        color: Color.fromRGBO(155, 119, 217, 1),
                        borderRadius: BorderRadius.circular(30)),
                  ),
                  onTap: () {
                    print('click');
                    FocusScope.of(context).requestFocus(FocusNode());
                    showDialog(
                        context: context,
                        builder: (context)=> Dialog(
                          child: GroupAddAndViewNote(
                            groupId: this.widget.groupId.toString(),
                          ),
                        ));
                  },
                ),
                InkWell(
                  child: Container(
                    width: MediaQuery.of(context).size.width * .52,
                    height: MediaQuery.of(context).size.height * 0.062,
                    child: Center(
                      child: Text(
                        AppString.downloadTemplate,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize:
                                MediaQuery.of(context).size.height * 0.017,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    decoration: BoxDecoration(
                        color: Color.fromRGBO(155, 119, 217, 1),
                        borderRadius: BorderRadius.circular(30)),
                  ),
                  onTap: () {
                    print('this is to be downloaded ${widget.downloadUrl}');
                    // DownloadGroupContractService.downloadGroupContractFromUrl(
                    //     downloadUrl);
                    DownloadService.downloadFromUrl(widget.downloadUrl);
                  },
                ),
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.027,
            ),
            InkWell(
              onTap: () {
                if (user.accountId != null) {
                  if (_formKey.currentState.validate()) {
                    if (widget.model.isFileChosen ||
                        groupModelsa.filePath.isNotEmpty) {
                      widget.model
                          .askForQuote(widget.groupId, context, "Insert");
                    } else {
                      setState(() {
                        fileError = 'Please upload file';
                      });
                    }
                  }
                } else {
                  AppConstant.showFailToast(context, "Not Quoted");
                }
              },
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.062,
                child: Center(
                  child: Text(
                    AppString.askForQuote,
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
            ),
          ],
        ),
      );
    });
  }
}
