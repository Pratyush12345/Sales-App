import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pozitive/Core/AppConstact/appConstant.dart';
import 'package:pozitive/Core/AppConstact/appString.dart';
import 'package:pozitive/Core/Model/user.dart';
import 'package:pozitive/Core/ViewModel/quotation_page/quotation_electricity_viewmodel.dart';
import 'package:pozitive/Core/baseview.dart';
import 'package:pozitive/Util/theme.dart';
import 'package:pozitive/Widget/commonWidget/appTextFieldWithOutborder.dart';
import 'package:pozitive/Widget/textfieldsforapp.dart';
import 'package:provider/provider.dart';

class Electricity extends StatefulWidget {
  @override
  _ElectricityState createState() => _ElectricityState();
}

class _ElectricityState extends State<Electricity> {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  ThemeApp themeApp = ThemeApp();
  bool _autovalidation = false;
  bool wrongMpan = false;
  bool fileDone = false;
  String eacError;
  String mpanError;

  // File _pdffile;
  // String path;
  // String _path;

  List mpancodelist = ["00", "01", "02", "03", "04", "05", "06", "07", "08"];

  Widget mpancodeview(QuotationElectricityViewModel model) {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: mpancodelist.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            child: ListTile(
              title: Text(
                mpancodelist[index],
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              onTap: () {
                model.onChangeMPanCode(mpancodelist[index]);

                Navigator.pop(context);
              },
            ),
          );
        });
  }

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);

    return Scaffold(
      backgroundColor: Colors.white,
      body: BaseView<QuotationElectricityViewModel>(
        onModelReady: (model) => model.initializeData(user.accountId),
        builder: (context, model, child) {
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
                        InkWell(
                          child: Container(
                            width: MediaQuery.of(context).size.width * .3,
                            child: withoutboderdropdowntextfield(
                                model.mpancodecontroller,
                                false,
                                _autovalidation,
                                TextInputType.text,
                                "", (value) {
                              return null;
                            }, context),
                            decoration: BoxDecoration(
                                border: Border(
                                    right: BorderSide(
                                        color:
                                            Color.fromRGBO(128, 189, 40, 1)))),
                          ),
                          onTap: () {
                            FocusScope.of(context).requestFocus(FocusNode());
                            showDialog(
                                context: context,
                                builder: (context)=> Dialog(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: <Widget>[
                                      SizedBox(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.03,
                                      ),
                                      Text(
                                        "Select MPAN",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.03),
                                      ),
                                      SizedBox(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.02,
                                      ),
                                      Container(
                                        width:
                                            MediaQuery.of(context).size.width,
                                        height: 1,
                                        color: Colors.grey.withOpacity(.2),
                                      ),
                                      Container(
                                        child: mpancodeview(model),
                                      )
                                    ],
                                  ),
                                ));
                          },
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * .3,
                          child: AppTextFieldWithOutBorder(
                            controller: model.mpanOneController,
                            autoValidation: _autovalidation,
                            textInputType: TextInputType.number,
                            digit: 3,
                            //hintText: '12',
                            onChange: (text) {
                              if (text.length == 3) {
                                TextSelection previousSelection =
                                    model.mpanTwoController.selection;
                                FocusScope.of(context).nextFocus();
                              }
                            },
                            textInputFormatter: [
                              new WhitelistingTextInputFormatter(
                                  RegExp("[0-9]")),
                            ],
                            validator: (value) {
                              AppConstant.stringValidator(value, '');
                              if (value.length != 3) {
                                return 'Invalid mpan';
                              }
                            },
                          ),
                          decoration: BoxDecoration(
                              border: Border(
                                  right: BorderSide(
                                      color: Color.fromRGBO(128, 189, 40, 1)))),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * .32,
                          child: AppTextFieldWithOutBorder(
                            onChange: (text) {
                              if (text.length == 3) {
                                TextSelection previousSelection =
                                    model.mpanThreeController.selection;
                                FocusScope.of(context).nextFocus();
                              }
                            },
                            controller: model.mpanTwoController,
                            digit: 3,
                            autoValidation: _autovalidation,
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
                            // validator: (value) =>
                            //     AppConstant.stringValidator(value, ''),
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
                        Container(
                          width: MediaQuery.of(context).size.width * .23,
                          child: AppTextFieldWithOutBorder(
                            onChange: (text) {
                              if (text.length == 2) {
                                TextSelection previousSelection =
                                    model.mpanFourController.selection;
                                FocusScope.of(context).nextFocus();
                              }
                            },
                            controller: model.mpanThreeController,
                            digit: 2,
                            autoValidation: _autovalidation,
                            textInputType: TextInputType.number,
                            textInputFormatter: [
                              new WhitelistingTextInputFormatter(
                                  RegExp("[0-9]")),
                            ],
                            validator: (value) {
                              AppConstant.stringValidator(value, '');
                              // if (value.length != 2) {
                              //   return 'Invalid mpan';
                              // }
                            },
                            // validator: (value) =>
                            //     AppConstant.stringValidator(value, ''),
                          ),
                          decoration: BoxDecoration(
                              border: Border(
                                  right: BorderSide(
                                      color: themeApp.textfieldbordercolor,
                                      width: 2))),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * .23,
                          child: AppTextFieldWithOutBorder(
                            onChange: (text) {
                              if (text.length == 4) {
                                TextSelection previousSelection =
                                    model.mpanFiveController.selection;
                                FocusScope.of(context).nextFocus();
                              }
                            },
                            controller: model.mpanFourController,
                            digit: 4,
                            autoValidation: _autovalidation,
                            textInputType: TextInputType.number,
                            textInputFormatter: [
                              new WhitelistingTextInputFormatter(
                                  RegExp("[0-9]")),
                            ],
                            validator: (value) {
                              AppConstant.stringValidator(value, '');
                              // if (value.length != 4) {
                              //   return 'Invalid mpan';
                              // }
                            },
                            // validator: (value) =>
                            //     AppConstant.stringValidator(value, ''),
                          ),
                          decoration: BoxDecoration(
                              border: Border(
                                  right: BorderSide(
                                      color: themeApp.textfieldbordercolor,
                                      width: 2))),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * .23,
                          child: AppTextFieldWithOutBorder(
                            onChange: (text) {
                              if (text.length == 4) {
                                TextSelection previousSelection =
                                    model.mpanSixController.selection;
                                FocusScope.of(context).nextFocus();
                              }
                            },
                            controller: model.mpanFiveController,
                            digit: 4,
                            autoValidation: _autovalidation,
                            textInputType: TextInputType.number,
                            textInputFormatter: [
                              new WhitelistingTextInputFormatter(
                                  RegExp("[0-9]")),
                            ],
                            validator: (value) {
                              AppConstant.stringValidator(value, '');
                              // if (value.length != 4) {
                              //   return 'Invalid mpan';
                              // }
                            },
                            // validator: (value) =>
                            //     AppConstant.stringValidator(value, ''),
                          ),
                          decoration: BoxDecoration(
                              border: Border(
                                  right: BorderSide(
                                      color: Color.fromRGBO(128, 189, 40, 1)))),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * .23,
                          child: AppTextFieldWithOutBorder(
                            controller: model.mpanSixController,
                            digit: 3,
                            autoValidation: _autovalidation,
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
                            // validator: (value) =>
                            //     AppConstant.stringValidator(value, ''),
                          ),
                        ),
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
                  mpanError != null
                      ? Text(
                          mpanError,
                          style: TextStyle(color: Colors.red),
                        )
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
                  Container(
                    height: MediaQuery.of(context).size.height * .062,
                    width: MediaQuery.of(context).size.width,
                    child: Row(
                      children: <Widget>[
                        Container(
                          width: MediaQuery.of(context).size.width * .3,
                          child: AppTextFieldWithOutBorder(
                            controller: model.dayController,
                            // autoValidation: _autovalidation,
                            textInputType: TextInputType.number,
                            hintText: AppString.day,
                            textInputFormatter: [
                              new WhitelistingTextInputFormatter(
                                  RegExp("[0-9]")),
                            ],

                            // validator: (value) => AppConstant.stringValidator(
                            //     value, AppString.day),
                          ),
                          decoration: BoxDecoration(
                              border: Border(
                                  right: BorderSide(
                                      color: Color.fromRGBO(128, 189, 40, 1)))),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * .3,
                          child: AppTextFieldWithOutBorder(
                            controller: model.nightController,
                            //autoValidation: _autovalidation,
                            textInputType: TextInputType.number,
                            textInputFormatter: [
                              new WhitelistingTextInputFormatter(
                                  RegExp("[0-9]")),
                            ],
                            hintText: AppString.night,
                            // validator: (value) => AppConstant.stringValidator(
                            //     value, AppString.night),
                          ),
                          decoration: BoxDecoration(
                              border: Border(
                                  right: BorderSide(
                                      color: Color.fromRGBO(128, 189, 40, 1)))),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * .32,
                          child: AppTextFieldWithOutBorder(
                            controller: model.eweController,
                            //   autoValidation: _autovalidation,
                            textInputType: TextInputType.number,
                            textInputFormatter: [
                              new WhitelistingTextInputFormatter(
                                  RegExp("[0-9]")),
                            ],
                            hintText: AppString.eWE,
                            // validator: (value) => AppConstant.stringValidator(
                            //     value, AppString.eWE),
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
                  eacError != null
                      ? Text(
                          eacError,
                          style: TextStyle(color: Colors.red),
                        )
                      : Container(),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.025,
                  ),
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
                        InkWell(
                          child: Container(
                            height: MediaQuery.of(context).size.height * .043,
                            width: MediaQuery.of(context).size.width * .24,
                            child: Center(
                              child: Text(
                                "Choose File",
                                style: TextStyle(
                                    fontSize:
                                        MediaQuery.of(context).size.height *
                                            .017,
                                    color: Colors.white),
                              ),
                            ),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(14),
                                color: themeApp.purplecolor),
                          ),
                          onTap: () async {
                            FocusScope.of(context).requestFocus(FocusNode());
                            model.onUploadFile();
                          },
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * .02,
                        ),
                        model.path != null
                            ? Text(
                                model.path
                                    .substring(model.path.lastIndexOf("/") + 1),
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
                          "Save And Next",
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
                      FocusScopeNode currentFocus = FocusScope.of(context);
                      if (!currentFocus.hasPrimaryFocus &&
                          currentFocus.focusedChild != null) {
                        currentFocus.focusedChild.unfocus();
                      }
                      if (((model.mpancodecontroller.text.length != 0) ||
                          (model.mpanOneController.text.length != 0) ||
                          (model.mpanTwoController.text.length != 0) ||
                          (model.mpanThreeController.text.length != 0) ||
                          (model.mpanFourController.text.length != 0) ||
                          (model.mpanFiveController.text.length != 0) ||
                          (model.mpanSixController.text.length != 0))) {
                        if ((model.mpancodecontroller.text.length == 2) &&
                            (model.mpanOneController.text.length == 3) &&
                            (model.mpanTwoController.text.length == 3) &&
                            (model.mpanThreeController.text.length == 2) &&
                            (model.mpanFourController.text.length == 4) &&
                            (model.mpanFiveController.text.length == 4) &&
                            (model.mpanSixController.text.length == 3)) {
                          if ((model.dayController.text.length == 0) &&
                              (model.eweController.text.length == 0) &&
                              (model.nightController.text.length == 0) &&
                              (!model.fileUploaded)) {
                            setState(() {
                              eacError =
                                  'Either enter EAC values or Upload HH File';
                            });
                          } else {
                            if (_formKey.currentState.validate()) {
                              model.onSaveAndNext();
                            }
                          }
                        } else {
                          setState(() {
                            mpanError = 'Enter a valid MPAN';
                          });
                        }
                      }

                      if ((model.mpancodecontroller.text.length == 0) &&
                          ((model.mpanOneController.text.length == 0) &&
                              (model.mpanTwoController.text.length == 0) &&
                              (model.mpanThreeController.text.length == 0) &&
                              (model.mpanFourController.text.length == 0) &&
                              (model.mpanFiveController.text.length == 0) &&
                              (model.mpanSixController.text.length == 0))) {
                        if (_formKey.currentState.validate()) {
                          model.onSaveAndNext();
                        }
                      }

                      // if (_formKey.currentState.validate()) {
                      //   model.onSaveAndNext();
                      // }
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
