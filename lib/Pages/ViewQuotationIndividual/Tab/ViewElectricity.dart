import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pozitive/Core/AppConstact/appConstant.dart';
import 'package:pozitive/Core/AppConstact/appString.dart';
import 'package:pozitive/Core/Model/user.dart';
import 'package:pozitive/Core/baseview.dart';
import 'package:pozitive/Util/theme.dart';
import 'package:pozitive/Widget/commonWidget/appTextFieldWithOutborder.dart';
import 'package:pozitive/Widget/commonWidget/appDisableTextFieldWithoutBorder.dart';
import 'package:pozitive/Widget/textfieldsforapp.dart';
import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:pozitive/Util/global.dart' as globals;
import 'package:provider/provider.dart';
import 'package:pozitive/Core/enums/view_state.dart';
import 'package:pozitive/Core/ViewModel/ViewRequestQuoteViewModels/ViewQuotationPageViewModel.dart';
import 'package:pozitive/Util/Pref.dart';
import 'package:pozitive/Core/Model/sharePrefModel/quotation_electricity_model_Rq.dart';

class ViewElectricity extends StatefulWidget {
  TextEditingController mpancodecontroller = TextEditingController();
  TextEditingController mpanOneController = TextEditingController();
  TextEditingController mpanTwoController = TextEditingController();
  TextEditingController mpanThreeController = TextEditingController();
  TextEditingController mpanFourController = TextEditingController();
  TextEditingController mpanFiveController = TextEditingController();
  TextEditingController mpanSixController = TextEditingController();
  TextEditingController dayEacController = TextEditingController();
  TextEditingController nightEacController = TextEditingController();
  TextEditingController eweEacController = TextEditingController();
  final String title;
  ViewElectricity({
    this.mpancodecontroller,
    this.mpanOneController,
    this.mpanThreeController,
    this.mpanFourController,
    this.mpanFiveController,
    this.mpanSixController,
    this.mpanTwoController,
    this.dayEacController,
    this.nightEacController,
    this.eweEacController,
    this.title,
  });
  @override
  _ViewElectricityState createState() => _ViewElectricityState();
}

class _ViewElectricityState extends State<ViewElectricity> {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  ThemeApp themeApp = ThemeApp();
  bool _autovalidation = false;
  bool electricityFieldsEnabled = false;

  //Rq..............
  TextEditingController mpancodecontrollerRq = TextEditingController();
  TextEditingController mpanOneControllerRq = TextEditingController();
  TextEditingController mpanTwoControllerRq = TextEditingController();
  TextEditingController mpanThreeControllerRq = TextEditingController();
  TextEditingController mpanFourControllerRq = TextEditingController();
  TextEditingController mpanFiveControllerRq = TextEditingController();
  TextEditingController mpanSixControllerRq = TextEditingController();
  TextEditingController dayEacControllerRq = TextEditingController();
  TextEditingController nightEacControllerRq = TextEditingController();
  TextEditingController eweEacControllerRq = TextEditingController();
  File pdfFileRq;
  String pathRq;
  String sampleFileUrlRq;
  bool fileUploadedRq = false;
  final _formKey = GlobalKey<FormState>();
  String eacErrorRq;
  String mpanErrorRq;

  Color disableColor = Colors.grey[300];
  List mpancodelistRq = ["00", "01", "02", "03", "04", "05", "06", "07", "08"];

  void onChangeMPanCodeRq(String val) {
    setState(() {
      mpancodecontrollerRq.text = val;
    });
  }

  void onUploadFileRq() async {
    FilePickerResult result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['xlsx', 'csv'],
    );
    PlatformFile file = result.files.first;
    if (file.extension == 'xlsx' || file.extension == 'csv') {
      pathRq = result.files.first.path;
      pdfFileRq = File(pathRq);
      fileUploadedRq = true;
    } else {
      SnackBar(
        content: Text('Invalid File Format'),
      );
      print('Invalid File format');
    }
  }

  Widget mpancodeview(ViewRequestQuoteViewModel model) {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: mpancodelistRq.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            child: ListTile(
              title: Text(
                mpancodelistRq[index],
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              onTap: () {
                onChangeMPanCodeRq(mpancodelistRq[index]);

                Navigator.pop(context);
              },
            ),
          );
        });
  }

  void onSaveAndNextRq() {
    setState(() {
      Prefs.setQuotationElectricityDetailsRq(QuotationElectricityModelRq(
          wholeMpanRq: mpancodecontrollerRq.text +
              mpanOneControllerRq.text +
              mpanTwoControllerRq.text +
              mpanThreeControllerRq.text +
              mpanFourControllerRq.text +
              mpanFiveControllerRq.text +
              mpanSixControllerRq.text,
          mPanCodeRq: mpancodecontrollerRq.text,
          mPanOneRq: mpanOneControllerRq.text,
          mPanTwoRq: mpanTwoControllerRq.text,
          mPanThreeRq: mpanThreeControllerRq.text,
          mPanFourRq: mpanFourControllerRq.text,
          mPanFiveRq: mpanFiveControllerRq.text,
          mPanSixRq: mpanSixControllerRq.text,
          eACDayRq: dayEacControllerRq.text,
          eACNightRq: nightEacControllerRq.text,
          eWERq: eweEacControllerRq.text,
          hhFilePathRq: pathRq));
      globals.tabController3.animateTo(2);
    });
  }

  @override
  void initState() {
    if (widget.title == 'Requested') {
      electricityFieldsEnabled = true;
      mpancodecontrollerRq.text = widget.mpancodecontroller.text;
      mpanOneControllerRq.text = widget.mpanOneController.text;
      mpanTwoControllerRq.text = widget.mpanTwoController.text;
      mpanThreeControllerRq.text = widget.mpanThreeController.text;
      mpanFourControllerRq.text = widget.mpanFourController.text;
      mpanFiveControllerRq.text = widget.mpanFiveController.text;
      mpanSixControllerRq.text = widget.mpanSixController.text;
      dayEacControllerRq.text = widget.dayEacController.text;
      nightEacControllerRq.text = widget.nightEacController.text;
      eweEacControllerRq.text = widget.eweEacController.text;
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);

    return Scaffold(
      backgroundColor: Colors.white,
      body: BaseView<ViewRequestQuoteViewModel>(
        // onModelReady: (model) => model.setElecDetails(),
        builder: (context, model, child) {
          if (model.state == ViewState.BUSY) {
            return AppConstant.circularProgressIndicator();
          }
          return Padding(
            padding: EdgeInsets.only(
                left: MediaQuery.of(context).size.width * 0.03,
                right: MediaQuery.of(context).size.width * 0.03),
            child: Form(
              key: _formKey,
              child: ListView(
                children: <Widget>[
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.018,
                  ),
                  Text(
                    "MPAN",
                    style: TextStyle(
                        fontSize: MediaQuery.of(context).size.height * .015,
                        color: Color.fromRGBO(31, 33, 29, 1)),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.01,
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * .062,
                    width: MediaQuery.of(context).size.width,
                    child: Row(
                      children: <Widget>[
                        electricityFieldsEnabled
                            ? InkWell(
                                child: Container(
                                  width: MediaQuery.of(context).size.width * .3,
                                  child: withoutboderdropdowntextfield(
                                      mpancodecontrollerRq,
                                      false,
                                      _autovalidation,
                                      TextInputType.text,
                                      "", (value) {
                                    // if (value.isEmpty) {
                                    //   AppConstant.stringValidator(value, '');
                                    //   return 'Select Mpan';
                                    // }
                                    // if (value.length != 0) {
                                    //   model.isMpanCode = true;
                                    // }
                                    return null;
                                  }, context),
                                  decoration: BoxDecoration(
                                      border: Border(
                                          right: BorderSide(
                                              color: Color.fromRGBO(
                                                  128, 189, 40, 1)))),
                                ),
                                onTap: () {
                                  FocusScope.of(context)
                                      .requestFocus(FocusNode());
                                  showDialog(
                                      context: context,
                                      builder: (context)=> Dialog(
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: <Widget>[
                                            SizedBox(
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.03,
                                            ),
                                            Text(
                                              "Select MPAN",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize:
                                                      MediaQuery.of(context)
                                                              .size
                                                              .height *
                                                          0.03),
                                            ),
                                            SizedBox(
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.02,
                                            ),
                                            Container(
                                              width: MediaQuery.of(context)
                                                  .size
                                                  .width,
                                              height: 1,
                                              color:
                                                  Colors.grey.withOpacity(.2),
                                            ),
                                            Container(
                                              child: mpancodeview(model),
                                            )
                                          ],
                                        ),
                                      ));
                                },
                              )
                            : InkWell(
                                child: Container(
                                  width: MediaQuery.of(context).size.width * .3,
                                  child: AppDisbleTextFieldWithoutBorder(
                                      controller: widget.mpancodecontroller),
                                  decoration: BoxDecoration(
                                    border: Border(
                                      right: BorderSide(
                                        color: Color.fromRGBO(128, 189, 40, 1),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                        electricityFieldsEnabled
                            ? Container(
                                width: MediaQuery.of(context).size.width * .3,
                                child: AppTextFieldWithOutBorder(
                                  onChange: (text) {
                                    if (text.length == 3) {
                                      TextSelection previousSelection =
                                          mpanTwoControllerRq.selection;
                                      FocusScope.of(context).nextFocus();
                                    }
                                  },
                                  controller: mpanOneControllerRq,
                                  digit: 3,
                                  textInputType: TextInputType.number,
                                  textInputFormatter: [
                                    new WhitelistingTextInputFormatter(
                                        RegExp("[0-9]")),
                                  ],
                                  validator: (value) {
                                    AppConstant.stringValidator(value, '');
                                    // if (value.length != 3) {
                                    //   return 'Invalid mpan';
                                    // }
                                  },
                                ),
                                decoration: BoxDecoration(
                                    border: Border(
                                        right: BorderSide(
                                            color: Color.fromRGBO(
                                                128, 189, 40, 1)))),
                              )
                            : Container(
                                width: MediaQuery.of(context).size.width * .3,
                                child: AppDisbleTextFieldWithoutBorder(
                                  controller: widget.mpanOneController,
                                  autoValidation: _autovalidation,
                                  textInputType: TextInputType.number,
                                  textInputFormatter: [
                                    new WhitelistingTextInputFormatter(
                                        RegExp("[0-9]")),
                                  ],
                                  validator: (value) =>
                                      AppConstant.stringValidator(value, ''),
                                ),
                                decoration: BoxDecoration(
                                    border: Border(
                                        right: BorderSide(
                                            color: Color.fromRGBO(
                                                128, 189, 40, 1)))),
                              ),
                        electricityFieldsEnabled
                            ? SizedBox(
                                width: MediaQuery.of(context).size.width * .32,
                                child: AppTextFieldWithOutBorder(
                                  onChange: (text) {
                                    if (text.length == 3) {
                                      TextSelection previousSelection =
                                          mpanThreeControllerRq.selection;
                                      FocusScope.of(context).nextFocus();
                                    }
                                  },
                                  controller: mpanTwoControllerRq,
                                  digit: 3,
                                  autoValidation: _autovalidation,
                                  textInputType: TextInputType.number,
                                  textInputFormatter: [
                                    new WhitelistingTextInputFormatter(
                                        RegExp("[0-9]")),
                                  ],
                                  validator: (value) {
                                    AppConstant.stringValidator(value, '');
                                  },
                                ),
                              )
                            : SizedBox(
                                width: MediaQuery.of(context).size.width * .32,
                                child: AppDisbleTextFieldWithoutBorder(
                                  controller: widget.mpanTwoController,
                                  autoValidation: _autovalidation,
                                  textInputType: TextInputType.number,
                                  textInputFormatter: [
                                    new WhitelistingTextInputFormatter(
                                        RegExp("[0-9]")),
                                  ],
                                  validator: (value) =>
                                      AppConstant.stringValidator(value, ''),
                                ),
                              )
                      ],
                    ),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                            color: themeApp.textfieldbordercolor, width: 2),
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(5),
                            topLeft: Radius.circular(5))),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * .062,
                    width: MediaQuery.of(context).size.width,
                    child: Row(
                      children: <Widget>[
                        electricityFieldsEnabled
                            ? Container(
                                width: MediaQuery.of(context).size.width * .23,
                                child: AppTextFieldWithOutBorder(
                                  onChange: (text) {
                                    if (text.length == 2) {
                                      TextSelection previousSelection =
                                          mpanFourControllerRq.selection;
                                      FocusScope.of(context).nextFocus();
                                    }
                                  },
                                  controller: mpanThreeControllerRq,
                                  digit: 2,
                                  autoValidation: _autovalidation,
                                  textInputType: TextInputType.number,
                                  textInputFormatter: [
                                    new WhitelistingTextInputFormatter(
                                        RegExp("[0-9]")),
                                  ],
                                  validator: (value) {
                                    AppConstant.stringValidator(value, '');
                                  },
                                ),
                                decoration: BoxDecoration(
                                    border: Border(
                                        right: BorderSide(
                                            color:
                                                themeApp.textfieldbordercolor,
                                            width: 2))),
                              )
                            : Container(
                                width: MediaQuery.of(context).size.width * .23,
                                child: AppDisbleTextFieldWithoutBorder(
                                  controller: widget.mpanThreeController,
                                  autoValidation: _autovalidation,
                                  textInputType: TextInputType.number,
                                  textInputFormatter: [
                                    WhitelistingTextInputFormatter(
                                        RegExp("[0-9]")),
                                  ],
                                  validator: (value) =>
                                      AppConstant.stringValidator(value, ''),
                                ),
                                decoration: BoxDecoration(
                                    border: Border(
                                        right: BorderSide(
                                            color:
                                                themeApp.textfieldbordercolor,
                                            width: 2))),
                              ),
                        electricityFieldsEnabled
                            ? Container(
                                width: MediaQuery.of(context).size.width * .23,
                                child: AppTextFieldWithOutBorder(
                                  onChange: (text) {
                                    if (text.length == 4) {
                                      TextSelection previousSelection =
                                          mpanFiveControllerRq.selection;
                                      FocusScope.of(context).nextFocus();
                                    }
                                  },
                                  controller: mpanFourControllerRq,
                                  digit: 4,
                                  autoValidation: _autovalidation,
                                  textInputType: TextInputType.number,
                                  textInputFormatter: [
                                    new WhitelistingTextInputFormatter(
                                        RegExp("[0-9]")),
                                  ],
                                  validator: (value) {
                                    AppConstant.stringValidator(value, '');
                                  },
                                ),
                                decoration: BoxDecoration(
                                    border: Border(
                                        right: BorderSide(
                                            color:
                                                themeApp.textfieldbordercolor,
                                            width: 2))),
                              )
                            : Container(
                                width: MediaQuery.of(context).size.width * .23,
                                child: AppDisbleTextFieldWithoutBorder(
                                  controller: widget.mpanFourController,
                                  autoValidation: _autovalidation,
                                  textInputType: TextInputType.number,
                                  textInputFormatter: [
                                    WhitelistingTextInputFormatter(
                                        RegExp("[0-9]")),
                                  ],
                                  validator: (value) =>
                                      AppConstant.stringValidator(value, ''),
                                ),
                                decoration: BoxDecoration(
                                    border: Border(
                                        right: BorderSide(
                                            color:
                                                themeApp.textfieldbordercolor,
                                            width: 2))),
                              ),
                        electricityFieldsEnabled
                            ? Container(
                                width: MediaQuery.of(context).size.width * .23,
                                child: AppTextFieldWithOutBorder(
                                  onChange: (text) {
                                    if (text.length == 4) {
                                      TextSelection previousSelection =
                                          mpanSixControllerRq.selection;
                                      FocusScope.of(context).nextFocus();
                                    }
                                  },
                                  controller: mpanFiveControllerRq,
                                  digit: 4,
                                  autoValidation: _autovalidation,
                                  textInputType: TextInputType.number,
                                  textInputFormatter: [
                                    new WhitelistingTextInputFormatter(
                                        RegExp("[0-9]")),
                                  ],
                                  validator: (value) {
                                    AppConstant.stringValidator(value, '');
                                  },
                                ),
                                decoration: BoxDecoration(
                                    border: Border(
                                        right: BorderSide(
                                            color: Color.fromRGBO(
                                                128, 189, 40, 1)))),
                              )
                            : Container(
                                width: MediaQuery.of(context).size.width * .23,
                                child: AppDisbleTextFieldWithoutBorder(
                                  controller: widget.mpanFiveController,
                                  autoValidation: _autovalidation,
                                  textInputType: TextInputType.number,
                                  textInputFormatter: [
                                    WhitelistingTextInputFormatter(
                                        RegExp("[0-9]")),
                                  ],
                                  validator: (value) =>
                                      AppConstant.stringValidator(value, ''),
                                ),
                                decoration: BoxDecoration(
                                    border: Border(
                                        right: BorderSide(
                                            color: Color.fromRGBO(
                                                128, 189, 40, 1)))),
                              ),
                        electricityFieldsEnabled
                            ? SizedBox(
                                width: MediaQuery.of(context).size.width * .23,
                                child: AppTextFieldWithOutBorder(
                                  controller: mpanSixControllerRq,
                                  digit: 3,
                                  autoValidation: _autovalidation,
                                  textInputType: TextInputType.number,
                                  textInputFormatter: [
                                    new WhitelistingTextInputFormatter(
                                        RegExp("[0-9]")),
                                  ],
                                  validator: (value) {
                                    AppConstant.stringValidator(value, '');
                                  },
                                ),
                              )
                            : SizedBox(
                                width: MediaQuery.of(context).size.width * .23,
                                child: AppDisbleTextFieldWithoutBorder(
                                  controller: widget.mpanSixController,
                                  autoValidation: _autovalidation,
                                  textInputType: TextInputType.number,
                                  textInputFormatter: [
                                    new WhitelistingTextInputFormatter(
                                        RegExp("[0-9]")),
                                  ],
                                  validator: (value) =>
                                      AppConstant.stringValidator(value, ''),
                                ),
                              )
                      ],
                    ),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                            color: themeApp.textfieldbordercolor, width: 2),
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(5),
                            bottomRight: Radius.circular(5))),
                  ),
                  electricityFieldsEnabled
                      ? (mpanErrorRq != null
                          ? Text(
                              mpanErrorRq,
                              style: TextStyle(color: Colors.red),
                            )
                          : Container())
                      : Container(),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.025,
                  ),
                  Text(
                    "EAC (KwH)",
                    style: TextStyle(
                        fontSize: MediaQuery.of(context).size.height * .015,
                        color: Color.fromRGBO(31, 33, 29, 1)),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.01,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          text: 'Day',
                          style: TextStyle(
                              fontSize:
                                  MediaQuery.of(context).size.height * .015,
                              color: Color.fromRGBO(31, 33, 29, 1)),
                        ),
                      ),
                      RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          text: 'Night',
                          style: TextStyle(
                              fontSize:
                                  MediaQuery.of(context).size.height * .015,
                              color: Color.fromRGBO(31, 33, 29, 1)),
                        ),
                      ),
                      RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          text: 'EWE',
                          style: TextStyle(
                              fontSize:
                                  MediaQuery.of(context).size.height * .015,
                              color: Color.fromRGBO(31, 33, 29, 1)),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.01,
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * .062,
                    width: MediaQuery.of(context).size.width,
                    child: Row(
                      children: <Widget>[
                        electricityFieldsEnabled
                            ? Container(
                                width: MediaQuery.of(context).size.width * .3,
                                child: AppTextFieldWithOutBorder(
                                  controller: dayEacControllerRq,
                                  textInputType: TextInputType.number,
                                  hintText: AppString.day,
                                  textInputFormatter: [
                                    new WhitelistingTextInputFormatter(
                                        RegExp("[0-9]")),
                                  ],
                                ),
                                decoration: BoxDecoration(
                                    border: Border(
                                        right: BorderSide(
                                            color: Color.fromRGBO(
                                                128, 189, 40, 1)))),
                              )
                            : Container(
                                width: MediaQuery.of(context).size.width * .3,
                                child: AppDisbleTextFieldWithoutBorder(
                                  controller: widget.dayEacController,
                                  autoValidation: _autovalidation,
                                  textInputType: TextInputType.number,
                                  hintText: AppString.day,
                                  textInputFormatter: [
                                    new WhitelistingTextInputFormatter(
                                        RegExp("[0-9]")),
                                  ],
                                  validator: (value) =>
                                      AppConstant.stringValidator(
                                          value, AppString.day),
                                ),
                                decoration: BoxDecoration(
                                    border: Border(
                                        right: BorderSide(
                                            color: Color.fromRGBO(
                                                128, 189, 40, 1)))),
                              ),
                        electricityFieldsEnabled
                            ? Container(
                                width: MediaQuery.of(context).size.width * .3,
                                child: AppTextFieldWithOutBorder(
                                  controller: nightEacControllerRq,
                                  textInputType: TextInputType.number,
                                  textInputFormatter: [
                                    new WhitelistingTextInputFormatter(
                                        RegExp("[0-9]")),
                                  ],
                                  hintText: AppString.night,
                                ),
                                decoration: BoxDecoration(
                                    border: Border(
                                        right: BorderSide(
                                            color: Color.fromRGBO(
                                                128, 189, 40, 1)))),
                              )
                            : Container(
                                width: MediaQuery.of(context).size.width * .3,
                                child: AppDisbleTextFieldWithoutBorder(
                                  controller: widget.nightEacController,
                                  autoValidation: _autovalidation,
                                  textInputType: TextInputType.number,
                                  textInputFormatter: [
                                    new WhitelistingTextInputFormatter(
                                        RegExp("[0-9]")),
                                  ],
                                  hintText: AppString.night,
                                  validator: (value) =>
                                      AppConstant.stringValidator(
                                          value, AppString.night),
                                ),
                                decoration: BoxDecoration(
                                    border: Border(
                                        right: BorderSide(
                                            color: Color.fromRGBO(
                                                128, 189, 40, 1)))),
                              ),
                        electricityFieldsEnabled
                            ? SizedBox(
                                width: MediaQuery.of(context).size.width * .32,
                                child: AppTextFieldWithOutBorder(
                                  controller: eweEacControllerRq,
                                  textInputType: TextInputType.number,
                                  textInputFormatter: [
                                    new WhitelistingTextInputFormatter(
                                        RegExp("[0-9]")),
                                  ],
                                  hintText: AppString.eWE,
                                ),
                              )
                            : SizedBox(
                                width: MediaQuery.of(context).size.width * .32,
                                child: AppDisbleTextFieldWithoutBorder(
                                  controller: widget.eweEacController,
                                  autoValidation: _autovalidation,
                                  textInputType: TextInputType.number,
                                  textInputFormatter: [
                                    new WhitelistingTextInputFormatter(
                                        RegExp("[0-9]")),
                                  ],
                                  hintText: AppString.eWE,
                                  validator: (value) =>
                                      AppConstant.stringValidator(
                                          value, AppString.eWE),
                                ),
                              )
                      ],
                    ),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                            color: themeApp.textfieldbordercolor, width: 2),
                        borderRadius: BorderRadius.circular(5)),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.025,
                  ),
                  electricityFieldsEnabled
                      ? (eacErrorRq != null
                          ? Text(
                              eacErrorRq,
                              style: TextStyle(color: Colors.red),
                            )
                          : Container())
                      : Container(),
                  Text(
                    "Upload HH File",
                    style: TextStyle(
                        fontSize: MediaQuery.of(context).size.height * .015,
                        color: Color.fromRGBO(31, 33, 29, 1)),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.01,
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * .062,
                    width: MediaQuery.of(context).size.width,
                    child: Row(
                      children: <Widget>[
                        SizedBox(
                          width: MediaQuery.of(context).size.width * .02,
                        ),
                        electricityFieldsEnabled
                            ? InkWell(
                                child: Container(
                                  height:
                                      MediaQuery.of(context).size.height * .043,
                                  width:
                                      MediaQuery.of(context).size.width * .24,
                                  child: Center(
                                    child: Text(
                                      "Choose File",
                                      style: TextStyle(
                                          fontSize: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              .017,
                                          color: Colors.white),
                                    ),
                                  ),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(14),
                                      color: themeApp.purplecolor),
                                ),
                                onTap: () async {
                                  FocusScope.of(context)
                                      .requestFocus(FocusNode());
                                  onUploadFileRq();
                                },
                              )
                            : InkWell(
                                child: Container(
                                  height:
                                      MediaQuery.of(context).size.height * .043,
                                  width:
                                      MediaQuery.of(context).size.width * .24,
                                  child: Center(
                                    child: Text(
                                      "Choose File",
                                      style: TextStyle(
                                          fontSize: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              .017,
                                          color: Colors.white),
                                    ),
                                  ),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(14),
                                      color: themeApp.purplecolor),
                                ),
                              ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * .02,
                        ),
                        electricityFieldsEnabled
                            ? pathRq != null
                                ? Text(
                                    pathRq
                                        .substring(pathRq.lastIndexOf("/") + 1),
                                    style: TextStyle(
                                        fontSize:
                                            MediaQuery.of(context).size.height *
                                                .017,
                                        color: Color.fromRGBO(0, 0, 0, .5)))
                                : Text(
                                    "No File Chosen",
                                    style: TextStyle(
                                        fontSize:
                                            MediaQuery.of(context).size.height *
                                                .017,
                                        color: Color.fromRGBO(0, 0, 0, .5)),
                                  )
                            : Text(
                                "No File Chosen",
                                style: TextStyle(
                                    fontSize:
                                        MediaQuery.of(context).size.height *
                                            .017,
                                    color: Color.fromRGBO(0, 0, 0, .5)),
                              ),
                      ],
                    ),
                    decoration: BoxDecoration(
                        color: electricityFieldsEnabled
                            ? Colors.white
                            : disableColor,
                        border: Border.all(
                            color: themeApp.textfieldbordercolor, width: 2),
                        borderRadius: BorderRadius.circular(3)),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.025,
                  ),
                  InkWell(
                    onTap: () {
                      model.onDownloadSampleFile(user.accountId);
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 0.062,
                      child: Center(
                        child: Text(
                          "DOWNLOAD SAMPLE HH FILE",
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
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.025,
                  ),
                  InkWell(
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 0.062,
                      child: Center(
                        child: Text(
                          "Go to Next",
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
                      if (electricityFieldsEnabled) {
                        if (((mpanOneControllerRq.text.length != 0) ||
                            (mpanTwoControllerRq.text.length != 0) ||
                            (mpanThreeControllerRq.text.length != 0) ||
                            (mpanFourControllerRq.text.length != 0) ||
                            (mpanFiveControllerRq.text.length != 0) ||
                            (mpanSixControllerRq.text.length != 0))) {
                          if ((mpancodecontrollerRq.text.length == 2) &&
                              (mpanOneControllerRq.text.length == 3) &&
                              (mpanTwoControllerRq.text.length == 3) &&
                              (mpanThreeControllerRq.text.length == 2) &&
                              (mpanFourControllerRq.text.length == 4) &&
                              (mpanFiveControllerRq.text.length == 4) &&
                              (mpanSixControllerRq.text.length == 3)) {
                            if ((dayEacControllerRq.text.length == 0) &&
                                (eweEacControllerRq.text.length == 0) &&
                                (nightEacControllerRq.text.length == 0) &&
                                (!fileUploadedRq)) {
                              setState(() {
                                eacErrorRq =
                                    'Either enter EAC values or Upload HH File';
                              });
                            } else {
                              if (_formKey.currentState.validate()) {
                                onSaveAndNextRq();
                              }
                            }
                          } else {
                            setState(() {
                              mpanErrorRq = 'Enter a valid MPAN';
                            });
                          }
                        }

                        if (((mpanOneControllerRq.text.length == 0) &&
                            (mpanTwoControllerRq.text.length == 0) &&
                            (mpanThreeControllerRq.text.length == 0) &&
                            (mpanFourControllerRq.text.length == 0) &&
                            (mpanFiveControllerRq.text.length == 0) &&
                            (mpanSixControllerRq.text.length == 0))) {
                          if (_formKey.currentState.validate()) {
                            onSaveAndNextRq();
                          }
                        }
                      } else {
                        globals.tabController3.animateTo(2);
                      }
                    },
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.025,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.028,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
