import 'package:flutter/material.dart';
import 'package:pozitive/Util/theme.dart';
import 'package:pozitive/Widget/commonWidget/appTextField.dart';
import 'package:pozitive/Core/AppConstact/appConstant.dart';
import 'package:pozitive/Core/AppConstact/appString.dart';
import 'package:pozitive/Util/global.dart' as globals;
import 'package:pozitive/Core/Model/sharePrefModel/SaveAndGenerateContractIndividualModel.dart';
import 'package:pozitive/Core/baseview.dart';
import 'package:pozitive/Core/enums/view_state.dart';
import 'package:pozitive/Core/ViewModel/quotation_page/IndividualContractViewModels/UniqueRefNoViewModel.dart';

class UniqueRefNo extends StatefulWidget {
  final SaveAndGenerateContractIndividualModel individualModel;
  UniqueRefNo({this.individualModel});
  @override
  _UniqueRefNoState createState() => _UniqueRefNoState();
}

class _UniqueRefNoState extends State<UniqueRefNo> {
  ThemeApp themeApp = ThemeApp();
  bool _autovalidation = false;
  @override
  Widget build(BuildContext context) {
    return BaseView<UniqueRefNoViewModel>(
      onModelReady: (model) => model.setDetails(widget.individualModel),
      builder: (context, model, child) {
        if (model.state == ViewState.BUSY) {
          Scaffold(
              body: AppConstant.circularProgressIndicator(),
              backgroundColor: Colors.white);
        }
        return Scaffold(
          backgroundColor: Colors.white,
          body: Container(
            padding: EdgeInsets.all(10),
            margin: EdgeInsets.all(5),
            child: ListView(
              children: [
                AppTextField(
                  enabled: false,
                  title: AppString.uniqueRefNo,
                  controller: model.uniqueRefNo,
                  autoValidation: _autovalidation,
                  textInputType: TextInputType.text,
                  hintText: widget.individualModel.strUniqueRefNo,
                  validator: (value) => AppConstant.stringValidator(
                      value, AppString.businessName),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.022,
                ),
                Center(
                  child: Text(
                      'Electricity and gas supply contract customer details.',
                      style: TextStyle(
                          color: Colors.red,
                          fontSize: 14,
                          fontWeight: FontWeight.bold)),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.022,
                ),
                Text(
                  "We'd like to keep in touch so we can tell you about other products and services.",
                  style: TextStyle(
                      fontSize: MediaQuery.of(context).size.height * .015,
                      color: Color.fromRGBO(31, 33, 29, 1)),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.01,
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.065,
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(
                        width: MediaQuery.of(context).size.width * .04,
                      ),
                      InkWell(
                        child: Container(
                          height: MediaQuery.of(context).size.height * .062,
                          child: Row(
                            children: <Widget>[
                              model.letter
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
                                        model.toggleLetter();
                                      },
                                    ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * .01,
                              ),
                              Text(
                                "Letter",
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
                          if (!model.letter) {
                            model.letter = !model.letter;
                          }
                          model.toggleLetter();
                        },
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * .04,
                      ),
                      InkWell(
                        child: Container(
                          height: MediaQuery.of(context).size.height * .062,
                          child: Row(
                            children: <Widget>[
                              model.email
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
                                        model.toggleEmail();
                                      },
                                    ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * .01,
                              ),
                              Text(
                                "Email",
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
                          if (!model.email) {
                            model.email = !model.email;
                          }
                          model.toggleEmail();
                        },
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * .04,
                      ),
                      InkWell(
                        child: Container(
                          height: MediaQuery.of(context).size.height * .062,
                          child: Row(
                            children: <Widget>[
                              model.phone
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
                                        model.togglePhone();
                                      },
                                    ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * .01,
                              ),
                              Text(
                                "Phone",
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
                          if (!model.phone) {
                            model.phone = !model.phone;
                          }
                          model.togglePhone();
                        },
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * .02,
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
                  height: MediaQuery.of(context).size.height * 0.022,
                ),
                Text(
                  'Company Types',
                  style: TextStyle(
                      fontSize: MediaQuery.of(context).size.height * .015,
                      color: Color.fromRGBO(31, 33, 29, 1)),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.01,
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.27,
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.005,
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height * 0.05,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            SizedBox(
                              width: MediaQuery.of(context).size.width * .02,
                            ),
                            Container(
                              height: MediaQuery.of(context).size.height * .062,
                              child: Row(
                                children: <Widget>[
                                  model.businessTypeSelected == 1
                                      ? Icon(
                                          Icons.check_box,
                                          color:
                                              Color.fromRGBO(155, 119, 217, 1),
                                          size: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              .023,
                                        )
                                      : InkWell(
                                          child: Icon(
                                            Icons.check_box_outline_blank,
                                            color: Color.fromRGBO(
                                                155, 119, 217, 1),
                                            size: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                .023,
                                          ),
                                          onTap: () {
                                            setState(() {
                                              model.businessTypeSelected = 1;
                                            });
                                          },
                                        ),
                                  SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width * .01,
                                  ),
                                  Text(
                                    "LTD",
                                    style: TextStyle(
                                        fontSize:
                                            MediaQuery.of(context).size.height *
                                                .02,
                                        color: Color.fromRGBO(0, 0, 0, .8)),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * .02,
                            ),
                            Container(
                              height: MediaQuery.of(context).size.height * .062,
                              child: Row(
                                children: <Widget>[
                                  model.businessTypeSelected == 2
                                      ? Icon(Icons.check_box,
                                          size: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              .023,
                                          color:
                                              Color.fromRGBO(155, 119, 217, 1))
                                      : InkWell(
                                          child: Icon(
                                              Icons.check_box_outline_blank,
                                              size: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  .023,
                                              color: Color.fromRGBO(
                                                  155, 119, 217, 1)),
                                          onTap: () {
                                            setState(() {
                                              model.businessTypeSelected = 2;
                                            });
                                          },
                                        ),
                                  SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width * .01,
                                  ),
                                  Text(
                                    "PLC",
                                    style: TextStyle(
                                        fontSize:
                                            MediaQuery.of(context).size.height *
                                                .02,
                                        color: Color.fromRGBO(0, 0, 0, .8)),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height * 0.05,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            SizedBox(
                              width: MediaQuery.of(context).size.width * .02,
                            ),
                            Container(
                              height: MediaQuery.of(context).size.height * .062,
                              child: Row(
                                children: <Widget>[
                                  model.businessTypeSelected == 3
                                      ? Icon(
                                          Icons.check_box,
                                          color:
                                              Color.fromRGBO(155, 119, 217, 1),
                                          size: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              .023,
                                        )
                                      : InkWell(
                                          child: Icon(
                                            Icons.check_box_outline_blank,
                                            color: Color.fromRGBO(
                                                155, 119, 217, 1),
                                            size: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                .023,
                                          ),
                                          onTap: () {
                                            setState(() {
                                              model.businessTypeSelected = 3;
                                            });
                                          },
                                        ),
                                  SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width * .01,
                                  ),
                                  Text(
                                    "Charity",
                                    style: TextStyle(
                                        fontSize:
                                            MediaQuery.of(context).size.height *
                                                .02,
                                        color: Color.fromRGBO(0, 0, 0, .8)),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * .02,
                            ),
                            Container(
                              height: MediaQuery.of(context).size.height * .062,
                              child: Row(
                                children: <Widget>[
                                  model.businessTypeSelected == 4
                                      ? Icon(Icons.check_box,
                                          size: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              .023,
                                          color:
                                              Color.fromRGBO(155, 119, 217, 1))
                                      : InkWell(
                                          child: Icon(
                                              Icons.check_box_outline_blank,
                                              size: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  .023,
                                              color: Color.fromRGBO(
                                                  155, 119, 217, 1)),
                                          onTap: () {
                                            setState(() {
                                              model.businessTypeSelected = 4;
                                            });
                                          },
                                        ),
                                  SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width * .01,
                                  ),
                                  Text(
                                    "Public Sector",
                                    style: TextStyle(
                                        fontSize:
                                            MediaQuery.of(context).size.height *
                                                .02,
                                        color: Color.fromRGBO(0, 0, 0, .8)),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * .04,
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height * 0.05,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            SizedBox(
                              width: MediaQuery.of(context).size.width * .02,
                            ),
                            Container(
                              height: MediaQuery.of(context).size.height * .062,
                              child: Row(
                                children: <Widget>[
                                  model.businessTypeSelected == 5
                                      ? Icon(
                                          Icons.check_box,
                                          color:
                                              Color.fromRGBO(155, 119, 217, 1),
                                          size: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              .023,
                                        )
                                      : InkWell(
                                          child: Icon(
                                            Icons.check_box_outline_blank,
                                            color: Color.fromRGBO(
                                                155, 119, 217, 1),
                                            size: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                .023,
                                          ),
                                          onTap: () {
                                            setState(() {
                                              model.businessTypeSelected = 5;
                                            });
                                          },
                                        ),
                                  SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width * .01,
                                  ),
                                  Text(
                                    "Sole Proprietor",
                                    style: TextStyle(
                                        fontSize:
                                            MediaQuery.of(context).size.height *
                                                .02,
                                        color: Color.fromRGBO(0, 0, 0, .8)),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * .02,
                            ),
                            Container(
                              height: MediaQuery.of(context).size.height * .062,
                              child: Row(
                                children: <Widget>[
                                  model.businessTypeSelected == 6
                                      ? Icon(Icons.check_box,
                                          size: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              .023,
                                          color:
                                              Color.fromRGBO(155, 119, 217, 1))
                                      : InkWell(
                                          child: Icon(
                                              Icons.check_box_outline_blank,
                                              size: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  .023,
                                              color: Color.fromRGBO(
                                                  155, 119, 217, 1)),
                                          onTap: () {
                                            setState(() {
                                              model.businessTypeSelected = 6;
                                            });
                                          },
                                        ),
                                  SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width * .01,
                                  ),
                                  Text(
                                    "Partnership",
                                    style: TextStyle(
                                        fontSize:
                                            MediaQuery.of(context).size.height *
                                                .02,
                                        color: Color.fromRGBO(0, 0, 0, .8)),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height * 0.05,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            SizedBox(
                              width: MediaQuery.of(context).size.width * .02,
                            ),
                            Container(
                              height: MediaQuery.of(context).size.height * .062,
                              child: Row(
                                children: <Widget>[
                                  model.businessTypeSelected == 7
                                      ? Icon(
                                          Icons.check_box,
                                          color:
                                              Color.fromRGBO(155, 119, 217, 1),
                                          size: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              .023,
                                        )
                                      : InkWell(
                                          child: Icon(
                                            Icons.check_box_outline_blank,
                                            color: Color.fromRGBO(
                                                155, 119, 217, 1),
                                            size: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                .023,
                                          ),
                                          onTap: () {
                                            setState(() {
                                              model.businessTypeSelected = 7;
                                            });
                                          },
                                        ),
                                  SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width * .01,
                                  ),
                                  Text(
                                    "Microbusiness",
                                    style: TextStyle(
                                        fontSize:
                                            MediaQuery.of(context).size.height *
                                                .02,
                                        color: Color.fromRGBO(0, 0, 0, .8)),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * .02,
                            ),
                            Container(
                              height: MediaQuery.of(context).size.height * .062,
                              child: Row(
                                children: <Widget>[
                                  model.businessTypeSelected == 8
                                      ? Icon(Icons.check_box,
                                          size: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              .023,
                                          color:
                                              Color.fromRGBO(155, 119, 217, 1))
                                      : InkWell(
                                          child: Icon(
                                              Icons.check_box_outline_blank,
                                              size: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  .023,
                                              color: Color.fromRGBO(
                                                  155, 119, 217, 1)),
                                          onTap: () {
                                            setState(() {
                                              model.businessTypeSelected = 8;
                                            });
                                          },
                                        ),
                                  SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width * .01,
                                  ),
                                  Text(
                                    "LLC",
                                    style: TextStyle(
                                        fontSize:
                                            MediaQuery.of(context).size.height *
                                                .02,
                                        color: Color.fromRGBO(0, 0, 0, .8)),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * .04,
                            ),
                            Container(
                              height: MediaQuery.of(context).size.height * .062,
                              child: Row(
                                children: <Widget>[
                                  model.businessTypeSelected == 9
                                      ? Icon(Icons.check_box,
                                          size: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              .023,
                                          color:
                                              Color.fromRGBO(155, 119, 217, 1))
                                      : InkWell(
                                          child: Icon(
                                              Icons.check_box_outline_blank,
                                              size: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  .023,
                                              color: Color.fromRGBO(
                                                  155, 119, 217, 1)),
                                          onTap: () {
                                            setState(() {
                                              model.businessTypeSelected = 9;
                                            });
                                          },
                                        ),
                                  SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width * .01,
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
                            SizedBox(
                              width: MediaQuery.of(context).size.width * .04,
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height * 0.05,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            SizedBox(
                              width: MediaQuery.of(context).size.width * .02,
                            ),
                            Container(
                              height: MediaQuery.of(context).size.height * .062,
                              child: Row(
                                children: <Widget>[
                                  model.businessTypeSelected == 10
                                      ? Icon(
                                          Icons.check_box,
                                          color:
                                              Color.fromRGBO(155, 119, 217, 1),
                                          size: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              .023,
                                        )
                                      : InkWell(
                                          child: Icon(
                                            Icons.check_box_outline_blank,
                                            color: Color.fromRGBO(
                                                155, 119, 217, 1),
                                            size: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                .023,
                                          ),
                                          onTap: () {
                                            setState(() {
                                              model.businessTypeSelected = 10;
                                            });
                                          },
                                        ),
                                  SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width * .01,
                                  ),
                                  Text(
                                    "Limited Liability Partnership",
                                    style: TextStyle(
                                        fontSize:
                                            MediaQuery.of(context).size.height *
                                                .02,
                                        color: Color.fromRGBO(0, 0, 0, .8)),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * .04,
                            ),
                          ],
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
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.032,
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
                    print(model.uniqueRefNo.text + 'unique.e......');
                    model.saveCompanyDetails(model.businessTypeSelected);
                    // model.onSaveAndNext();
                    // globals.tabController6.animateTo(1);
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
