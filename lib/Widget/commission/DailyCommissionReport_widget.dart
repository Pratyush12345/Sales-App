import 'package:flutter/material.dart';
import 'package:pozitive/Core/AppConstact/appColors.dart';
import 'package:pozitive/Core/AppConstact/appConstant.dart';
import 'package:pozitive/Core/AppConstact/sizeConfig.dart';
import 'package:pozitive/Core/Model/user.dart';
import 'package:pozitive/Core/ViewModel/daily_commission_report_viewmodel.dart';
import 'package:pozitive/Util/theme.dart';
import 'package:pozitive/Core/AppConstact/assetApp.dart';
import 'package:pozitive/Core/AppConstact/appString.dart';
import 'package:pozitive/Widget/commonWidget/app_button_widget.dart';
import 'package:pozitive/Widget/commonWidget/date_text_field_widget.dart';
import 'package:provider/provider.dart';

class CommissionReportWidget extends StatefulWidget {
  final DailyCommissionReportViewModel dailyCommissionReportViewModel;
  Key formkey;

  CommissionReportWidget({this.dailyCommissionReportViewModel, this.formkey});

  @override
  _CommissionReportWidgetState createState() => _CommissionReportWidgetState();
}

class _CommissionReportWidgetState extends State<CommissionReportWidget> {
  final ThemeApp themeApp = ThemeApp();
  bool _autovalidation = false;

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);

    return Column(
      children: <Widget>[
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.028,
        ),
        Text(
          AppString.totalCommission,
          style: TextStyle(
            color: themeApp.purplecolor,
            fontSize: MediaQuery.of(context).size.height * .025,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.02,
        ),
        Container(
          height: 2.0,
          color: themeApp.purplecolor,
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.022,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              color: Colors.white,
              width: MediaQuery.of(context).size.width * .45,
              height: MediaQuery.of(context).size.height * .092,
              child: Row(
                children: <Widget>[
                  Container(
//
                    height: MediaQuery.of(context).size.height * .092,
                    width: MediaQuery.of(context).size.width * .16,
                    child: Center(
                      child: Image.asset(
                        AppAssets.totalKWH,
                        scale: 5,
                      ),
                    ),
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                            colors: [
                          Color.fromRGBO(25, 126, 66, 1),
                          Color.fromRGBO(111, 183, 25, 1)
                        ])),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * .29,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          AppString.totalKWH,
                          style: TextStyle(
                              color: Color.fromRGBO(0, 0, 0, 1),
                              fontSize:
                                  MediaQuery.of(context).size.height * .014,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * .005,
                        ),
                        /* Text("${model.lstGetDailycommission}",
                            style: TextStyle(
                                color: Color.fromRGBO(48, 142, 58, 1),
                                fontSize:
                                    MediaQuery.of(context).size.height * .02,
                                fontWeight: FontWeight.bold))*/
                        Text(
                            "${widget.dailyCommissionReportViewModel.lstGetDailycommission.totalKWH}" /*"6540881.11"*/,
                            style: TextStyle(
                                color: Color.fromRGBO(48, 142, 58, 1),
                                fontSize:
                                    MediaQuery.of(context).size.height * .02,
                                fontWeight: FontWeight.bold))
                      ],
                    ),
                  )
                ],
              ),
            ),
            Container(
              color: Colors.white,
              width: MediaQuery.of(context).size.width * .45,
              height: MediaQuery.of(context).size.height * .092,
              child: Row(
                children: <Widget>[
                  Container(
                    height: MediaQuery.of(context).size.height * .092,
                    width: MediaQuery.of(context).size.width * .16,
                    child: Center(
                      child: Image.asset(
                        AppAssets.totalAmount,
                        scale: 5,
                      ),
                    ),
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                            colors: [
                          Color.fromRGBO(123, 72, 193, 1),
                          Color.fromRGBO(147, 116, 210, 1)
                        ])),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * .29,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          AppString.totalAmount,
                          style: TextStyle(
                              color: Color.fromRGBO(0, 0, 0, 1),
                              fontSize:
                                  MediaQuery.of(context).size.height * .014,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * .005,
                        ),
                        Text(
                            "${widget.dailyCommissionReportViewModel.lstGetDailycommission.undergoingRegistration}",
                            style: TextStyle(
                                color: Color.fromRGBO(48, 142, 58, 1),
                                fontSize:
                                    MediaQuery.of(context).size.height * .02,
                                fontWeight: FontWeight.bold))
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.022,
        ),
        Text(
          AppString.dailyCommissionReport,
          style: TextStyle(
            color: themeApp.purplecolor,
            fontSize: MediaQuery.of(context).size.height * .025,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.02,
        ),
        Container(
          height: 2.0,
          color: themeApp.purplecolor,
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.022,
        ),
        Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                AppString.fromDate,
                style: TextStyle(
                    fontSize: MediaQuery.of(context).size.height * .015,
                    color: Color.fromRGBO(31, 33, 29, 1)),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.01,
              ),
              DateTextFieldWidget(
                height: SizeConfig.screenHeight * .062,
                controller: widget
                    .dailyCommissionReportViewModel.requireByDateController,
                obscureText: false,
                autoValidate: _autovalidation,
                textInputType: TextInputType.text,
                validator: (value) =>
                    AppConstant.stringValidator(value, AppString.selectDate),
                hintText: AppString.selectDate,
                onTap: () {
                  widget.dailyCommissionReportViewModel
                      .selectDate(context, AppString.required);
                },
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.022,
              ),
              Text(
                AppString.toDate,
                style: TextStyle(
                    fontSize: MediaQuery.of(context).size.height * .015,
                    color: Color.fromRGBO(31, 33, 29, 1)),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.01,
              ),
              DateTextFieldWidget(
                height: SizeConfig.screenHeight * .062,
                controller: widget
                    .dailyCommissionReportViewModel.preferredDateController,
                obscureText: false,
                autoValidate: _autovalidation,
                textInputType: TextInputType.text,
                validator: (value) =>
                    AppConstant.stringValidator(value, AppString.selectDate),
                hintText: AppString.selectDate,
                onTap: () {
                  widget.dailyCommissionReportViewModel
                      .selectDate(context, AppString.preferred);
                },
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.022,
              ),
              InkWell(
                child: Container(
                  height: MediaQuery.of(context).size.height * .062,
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                    children: <Widget>[
                      SizedBox(
                        width: MediaQuery.of(context).size.width * .02,
                      ),
                      widget.dailyCommissionReportViewModel.selectCurrentMonth
                          ? Icon(
                              Icons.check_box,
                              color: AppColors.purple,
                              size: MediaQuery.of(context).size.height * .023,
                            )
                          : Icon(
                              Icons.check_box_outline_blank,
                              color: Color.fromRGBO(155, 119, 217, 1),
                              size: MediaQuery.of(context).size.height * .023,
                            ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * .02,
                      ),
                      Text(
                        AppString.currentMonth,
                        style: TextStyle(
                            fontSize: MediaQuery.of(context).size.height * .02,
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
                  widget.dailyCommissionReportViewModel.toggleCurrentMonth();
                },
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.022,
              ),
              RichText(
                text: TextSpan(
                  text: AppString.fuelType,
                  style: TextStyle(
                      fontSize: MediaQuery.of(context).size.height * .015,
                      color: Color.fromRGBO(31, 33, 29, 1)),
                  children: <TextSpan>[
                    TextSpan(text: '', style: TextStyle(color: Colors.red)),
                  ],
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.01,
              ),
              Container(
                height: MediaQuery.of(context).size.height * .062,
                width: MediaQuery.of(context).size.width,
                child:
                    Row(mainAxisAlignment: MainAxisAlignment.start, children: <
                        Widget>[
//            SizedBox(
//              width: MediaQuery.of(context).size.width*.02,
//            ),
                  InkWell(
                    child: Container(
                      height: MediaQuery.of(context).size.height * .062,
                      child: Row(
                        children: <Widget>[
                          SizedBox(
                            width: MediaQuery.of(context).size.width * .02,
                          ),
                          widget.dailyCommissionReportViewModel
                                      .fuelTypeSelected ==
                                  1
                              ? Icon(
                                  Icons.radio_button_checked,
                                  color: Color.fromRGBO(155, 119, 217, 1),
                                  size:
                                      MediaQuery.of(context).size.height * .023,
                                )
                              : InkWell(
                                  child: Icon(
                                    Icons.radio_button_unchecked,
                                    color: Color.fromRGBO(155, 119, 217, 1),
                                    size: MediaQuery.of(context).size.height *
                                        .023,
                                  ),
                                  onTap: () {
                                    widget.dailyCommissionReportViewModel
                                        .onSelectFuelType(1);
                                  },
                                ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * .0055,
                          ),
                          Text(
                            AppString.electricity,
                            style: TextStyle(
                                fontSize:
                                    MediaQuery.of(context).size.height * .02,
                                color: Color.fromRGBO(0, 0, 0, .8)),
                          ),
                        ],
                      ),
                    ),
                    onTap: () {
                      widget.dailyCommissionReportViewModel.onSelectFuelType(1);
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
                          widget.dailyCommissionReportViewModel
                                      .fuelTypeSelected ==
                                  2
                              ? Icon(Icons.radio_button_checked,
                                  size:
                                      MediaQuery.of(context).size.height * .023,
                                  color: Color.fromRGBO(155, 119, 217, 1))
                              : InkWell(
                                  child: Icon(Icons.radio_button_unchecked,
                                      size: MediaQuery.of(context).size.height *
                                          .023,
                                      color: Color.fromRGBO(155, 119, 217, 1)),
                                  onTap: () {
                                    widget.dailyCommissionReportViewModel
                                        .onSelectFuelType(2);
                                  },
                                ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * .0055,
                          ),
                          Text(
                            AppString.gas,
                            style: TextStyle(
                                fontSize:
                                    MediaQuery.of(context).size.height * .02,
                                color: Color.fromRGBO(0, 0, 0, .8)),
                          ),
                        ],
                      ),
                    ),
                    onTap: () {
                      widget.dailyCommissionReportViewModel.onSelectFuelType(2);
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
                          widget.dailyCommissionReportViewModel
                                      .fuelTypeSelected ==
                                  3
                              ? Icon(
                                  Icons.radio_button_checked,
                                  size:
                                      MediaQuery.of(context).size.height * .023,
                                  color: Color.fromRGBO(155, 119, 217, 1),
                                )
                              : InkWell(
                                  child: Icon(
                                    Icons.radio_button_unchecked,
                                    size: MediaQuery.of(context).size.height *
                                        .023,
                                    color: Color.fromRGBO(155, 119, 217, 1),
                                  ),
                                  onTap: () {
                                    widget.dailyCommissionReportViewModel
                                        .onSelectFuelType(3);
                                  },
                                ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * .0055,
                          ),
                          Text(
                            AppString.all,
                            style: TextStyle(
                                fontSize:
                                    MediaQuery.of(context).size.height * .02,
                                color: Color.fromRGBO(0, 0, 0, .8)),
                          ),
                        ],
                      ),
                    ),
                    onTap: () {
                      widget.dailyCommissionReportViewModel.onSelectFuelType(3);
                    },
                  ),
//            SizedBox(
//              width: MediaQuery.of(context).size.width*.02,
//            ),
                ]),
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                        color: ThemeApp().textfieldbordercolor, width: 2),
                    borderRadius: BorderRadius.circular(3)),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * .022,
              ),
              RichText(
                text: TextSpan(
                  text: AppString.commissionType,
                  style: TextStyle(
                      fontSize: MediaQuery.of(context).size.height * .015,
                      color: Color.fromRGBO(31, 33, 29, 1)),
                  children: <TextSpan>[
                    TextSpan(text: '', style: TextStyle(color: Colors.red)),
                  ],
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.01,
              ),
              Container(
                height: MediaQuery.of(context).size.height * .062,
                width: MediaQuery.of(context).size.width,
                child:
                    Row(mainAxisAlignment: MainAxisAlignment.start, children: <
                        Widget>[
//            SizedBox(
//              width: MediaQuery.of(context).size.width*.02,
//            ),
                  InkWell(
                    child: Container(
                      height: MediaQuery.of(context).size.height * .062,
                      child: Row(
                        children: <Widget>[
                          SizedBox(
                            width: MediaQuery.of(context).size.width * .02,
                          ),
                          widget.dailyCommissionReportViewModel
                                      .commissionTypeSelected ==
                                  1
                              ? Icon(
                                  Icons.radio_button_checked,
                                  color: Color.fromRGBO(155, 119, 217, 1),
                                  size:
                                      MediaQuery.of(context).size.height * .023,
                                )
                              : InkWell(
                                  child: Icon(
                                    Icons.radio_button_unchecked,
                                    color: Color.fromRGBO(155, 119, 217, 1),
                                    size: MediaQuery.of(context).size.height *
                                        .023,
                                  ),
                                  onTap: () {
                                    widget.dailyCommissionReportViewModel
                                        .onSelectCommission(1);
                                  },
                                ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * .0055,
                          ),
                          Text(
                            AppString.partner,
                            style: TextStyle(
                                fontSize:
                                    MediaQuery.of(context).size.height * .02,
                                color: Color.fromRGBO(0, 0, 0, .8)),
                          ),
                        ],
                      ),
                    ),
                    onTap: () {
                      widget.dailyCommissionReportViewModel
                          .onSelectCommission(1);
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
                          widget.dailyCommissionReportViewModel
                                      .commissionTypeSelected ==
                                  2
                              ? Icon(Icons.radio_button_checked,
                                  size:
                                      MediaQuery.of(context).size.height * .023,
                                  color: Color.fromRGBO(155, 119, 217, 1))
                              : InkWell(
                                  child: Icon(Icons.radio_button_unchecked,
                                      size: MediaQuery.of(context).size.height *
                                          .023,
                                      color: Color.fromRGBO(155, 119, 217, 1)),
                                  onTap: () {
                                    widget.dailyCommissionReportViewModel
                                        .onSelectCommission(2);
                                  },
                                ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * .0055,
                          ),
                          Text(
                            AppString.introducer,
                            style: TextStyle(
                                fontSize:
                                    MediaQuery.of(context).size.height * .02,
                                color: Color.fromRGBO(0, 0, 0, .8)),
                          ),
                        ],
                      ),
                    ),
                    onTap: () {
                      widget.dailyCommissionReportViewModel
                          .onSelectCommission(2);
                    },
                  ),
                ]),
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                        color: ThemeApp().textfieldbordercolor, width: 2),
                    borderRadius: BorderRadius.circular(3)),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.025,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  InkWell(
                    child: Container(
                      width: MediaQuery.of(context).size.width * .46,
                      height: MediaQuery.of(context).size.height * 0.062,
                      child: Center(
                        child: Text(
                          AppString.clear,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize:
                                  MediaQuery.of(context).size.height * 0.019,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      decoration: BoxDecoration(
                          color: Color.fromRGBO(155, 119, 217, 1),
                          borderRadius: BorderRadius.circular(30)),
                    ),
                    onTap: () {
                      AppConstant.showComfirmDialogue(
                          mainContext: context,
                          function: () {
                            setState(() {
                              _autovalidation = false;
                            });
                            widget.dailyCommissionReportViewModel.onClearData();
                          });
                    },
                  ),
                  AppButtonWidget(
                    title: AppString.submit,
                    onTap: () {
                      setState(() {
                        _autovalidation = true;
                      });
                      if (formKey.currentState.validate()) {
                        widget.dailyCommissionReportViewModel
                            .onAddDailyCommissionDetails(
                                user.accountId, context);
                      }
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
