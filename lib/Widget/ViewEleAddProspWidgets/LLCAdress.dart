import 'package:flutter/material.dart';
import 'package:pozitive/Core/ViewModel/EleAddProspectViewModels/ele_business_viewmodel.dart';
import 'package:pozitive/Util/theme.dart';
import 'package:pozitive/Widget/textfieldsforapp.dart';
import 'package:pozitive/Util/global.dart' as globals;
import 'package:pozitive/Core/baseview.dart';
import 'package:pozitive/Core/Model/user.dart';
import 'package:provider/provider.dart';

import 'package:pozitive/Util/PrefBusinessType/ElePrefBusines.dart';
import 'package:pozitive/Core/Model/Api/Electricity-InsertAddProspect/EleBusinessOwnershipDetailsCredential.dart';

class llcAddresses extends StatefulWidget {
  @override
  _llcAddressesState createState() => _llcAddressesState();
}

class _llcAddressesState extends State<llcAddresses> {
  TextEditingController strTitleLLcowner1 = TextEditingController();
  TextEditingController strLLcowner1FirstName = TextEditingController();
  TextEditingController strLLcowner1LastName = TextEditingController();
  TextEditingController strTitleLLcowner2 = TextEditingController();
  TextEditingController strLLcowner2FirstName = TextEditingController();
  TextEditingController strLLcowner2LastName = TextEditingController();

  List nameTitle = ["Mr", "Mrs", "Miss", "Ms", "Sir", "Dr"];

  Widget nameList() {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: nameTitle.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            child: ListTile(
              title: Text(
                nameTitle[index],
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              onTap: () {
                setState(() {
                  strTitleLLcowner1.text = nameTitle[index];
                });
                Navigator.pop(context);
              },
            ),
          );
        });
  }

  Widget nameList2() {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: nameTitle.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            child: ListTile(
              title: Text(
                nameTitle[index],
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              onTap: () {
                setState(() {
                  strTitleLLcowner2.text = nameTitle[index];
                });
                Navigator.pop(context);
              },
            ),
          );
        });
  }

  final _formKey = GlobalKey<FormState>();

  void llpAddressInitialData() async {
    final data = await EleBusinessTypePref.getLLCBusinessTypeAdd();
    setState(() {
      print(strTitleLLcowner1.text);
      if (data != null) {
        strTitleLLcowner1.text = data.strTitleLLcowner1;
        strLLcowner1FirstName.text = data.strLLcowner1FirstName;
        strLLcowner1LastName.text = data.strLLcowner1LastName;
        strTitleLLcowner2.text = data.strTitleLLcowner2;
        strLLcowner2FirstName.text = data.strLLcowner2FirstName;
        strLLcowner2LastName.text = data.strLLcowner2LastName;
      }
    });
  }

  void llcAddressOnSaveAndNext() {
    setState(() {
      EleBusinessTypePref.setLLCBusinessTypeAdd(LLCBusinessCredential(
        strTitleLLcowner1: strTitleLLcowner1.text,
        strLLcowner1FirstName: strLLcowner1FirstName.text,
        strLLcowner1LastName: strLLcowner1LastName.text,
        strTitleLLcowner2: strTitleLLcowner2.text,
        strLLcowner2FirstName: strLLcowner2FirstName.text,
        strLLcowner2LastName: strLLcowner2LastName.text,
      ));
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    llpAddressInitialData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);

    return user.accountId != null
        ? BaseView<EleBusAddProspectViewModel>(
            onModelReady: (model) => model.initialData(() {}),
            builder: (context, model, child) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.022,
                  ),
//1st owner
                  Text(
                    "Owner1",
                    style: TextStyle(
                        fontSize: MediaQuery.of(context).size.height * .025,
                        color: Color.fromRGBO(31, 33, 29, 1)),
                  ),
                  Divider(
                    thickness: 2,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.01,
                  ),
                  Text(
                    "Title",
                    style: TextStyle(
                        fontSize: MediaQuery.of(context).size.height * .015,
                        color: Color.fromRGBO(31, 33, 29, 1)),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.01,
                  ),
                  InkWell(
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * .062,
                      child: dropdowntextfield(
                          model.ownerTitle,
                          false,
                          model.autovalidation,
                          TextInputType.text,
                          "Select Title", (value) {
                        if (value.isEmpty) {
                          return 'Please select title';
                        }
                        return null;
                      }, context),
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
                                      MediaQuery.of(context).size.height * 0.03,
                                ),
                                Text(
                                  "Select Title",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize:
                                          MediaQuery.of(context).size.height *
                                              0.03),
                                ),
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height * 0.02,
                                ),
                                Container(
                                  width: MediaQuery.of(context).size.width,
                                  height: 1,
                                  color: Colors.grey.withOpacity(.2),
                                ),
                                Container(
                                  child: model.nameList(),
                                )
                              ],
                            ),
                          ));
                    },
                  ),

                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.022,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      RichText(
                        text: TextSpan(
                          text: 'First Name',
                          style: TextStyle(
                              fontSize:
                                  MediaQuery.of(context).size.height * .015,
                              color: Color.fromRGBO(31, 33, 29, 1)),
                          children: <TextSpan>[
                            TextSpan(
                                text: ' \*',
                                style: TextStyle(color: Colors.red)),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.01,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * .062,
                    child: Disableinnertextfield(
                        model.ownerFirstName,
                        false,
                        model.autovalidation,
                        false,
                        TextInputType.text,
                        "First name", (value) {
                      if (value.isEmpty) {
                        return 'Please enter first name';
                      }
                      return null;
                    }, context),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.022,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      RichText(
                        text: TextSpan(
                          text: 'Last Name',
                          style: TextStyle(
                              fontSize:
                                  MediaQuery.of(context).size.height * .015,
                              color: Color.fromRGBO(31, 33, 29, 1)),
                          children: <TextSpan>[
                            TextSpan(
                                text: '', style: TextStyle(color: Colors.red)),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.01,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * .062,
                    child: Disableinnertextfield(
                        model.ownerLastName,
                        false,
                        model.autovalidation,
                        false,
                        TextInputType.text,
                        "Last name", (value) {
                      /*  if (value.isEmpty) {
                                  return 'Please enter electricity night fixed commission';
                                }*/
                      return null;
                    }, context),
                  ),
                  //2nd owner
                  Text(
                    "Owner2",
                    style: TextStyle(
                        fontSize: MediaQuery.of(context).size.height * .025,
                        color: Color.fromRGBO(31, 33, 29, 1)),
                  ),
                  Divider(
                    thickness: 2,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.01,
                  ),
                  Text(
                    "Title",
                    style: TextStyle(
                        fontSize: MediaQuery.of(context).size.height * .015,
                        color: Color.fromRGBO(31, 33, 29, 1)),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.01,
                  ),
                  InkWell(
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * .062,
                      child: dropdowntextfield(
                          model.ownerTitle,
                          false,
                          model.autovalidation,
                          TextInputType.text,
                          "Select Title", (value) {
                        if (value.isEmpty) {
                          return 'Please select title';
                        }
                        return null;
                      }, context),
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
                                      MediaQuery.of(context).size.height * 0.03,
                                ),
                                Text(
                                  "Select Title",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize:
                                          MediaQuery.of(context).size.height *
                                              0.03),
                                ),
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height * 0.02,
                                ),
                                Container(
                                  width: MediaQuery.of(context).size.width,
                                  height: 1,
                                  color: Colors.grey.withOpacity(.2),
                                ),
                                Container(
                                  child: model.nameList(),
                                )
                              ],
                            ),
                          ));
                    },
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.022,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      RichText(
                        text: TextSpan(
                          text: 'First Name',
                          style: TextStyle(
                              fontSize:
                                  MediaQuery.of(context).size.height * .015,
                              color: Color.fromRGBO(31, 33, 29, 1)),
                          children: <TextSpan>[
                            TextSpan(
                                text: ' \*',
                                style: TextStyle(color: Colors.red)),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.01,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * .062,
                    child: Disableinnertextfield(
                        model.ownerFirstName,
                        false,
                        model.autovalidation,
                        false,
                        TextInputType.text,
                        "First name", (value) {
                      if (value.isEmpty) {
                        return 'Please enter first name';
                      }
                      return null;
                    }, context),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.022,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      RichText(
                        text: TextSpan(
                          text: 'Last Name',
                          style: TextStyle(
                              fontSize:
                                  MediaQuery.of(context).size.height * .015,
                              color: Color.fromRGBO(31, 33, 29, 1)),
                          children: <TextSpan>[
                            TextSpan(
                                text: '', style: TextStyle(color: Colors.red)),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.01,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * .062,
                    child: Disableinnertextfield(
                        model.ownerLastName,
                        false,
                        model.autovalidation,
                        false,
                        TextInputType.text,
                        "Last name", (value) {
                      /*  if (value.isEmpty) {
                                  return 'Please enter electricity night fixed commission';
                                }*/
                      return null;
                    }, context),
                  ),
                  /* SizedBox(
                height: MediaQuery.of(context).size.height * 0.022,
              ),
              RichText(
                text: TextSpan(
                  text: 'BOD',
                  style: TextStyle(
                      fontSize:
                      MediaQuery.of(context).size.height * .015,
                      color: Color.fromRGBO(31, 33, 29, 1)),
                  children: <TextSpan>[
                    TextSpan(
                        text: ' \*',
                        style: TextStyle(color: Colors.red)),
                  ],
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.01,
              ),
              InkWell(
                child: SizedBox(
                  height: MediaQuery.of(context).size.height * .062,
                  child: datetextfield(
                      model.contractstartdatecontroller,
                      false,
                      model.autovalidation,
                      TextInputType.text,
                      "Select date", (value) {
                    setState(() {
                      if (value.isEmpty) {
                        return 'Please Select date';
                      }
                      else{
                        return value.text;
                      }
                    });

                    // return null;
                    return model.contractstartdatecontroller = value;
                  }, context),

                ),
                onTap: () {
                  model.selectDate(context, "Required");
                },
              ),*/
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.022,
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
                                    MediaQuery.of(context).size.height * 0.017,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        decoration: BoxDecoration(
                            color: ThemeApp().purplecolor,
                            borderRadius: BorderRadius.circular(30)),
                      ),
                      onTap: () {
                        // llcAddressOnSaveAndNext();
                        globals.tabController1.animateTo(7);
                      }
                      /*if (_formKey.currentState.validate()) {
                    _formKey.currentState.save();
                    llcAddressOnSaveAndNext();
                    globals.tabController1.animateTo(6);
                  } else {
//    If all data are not valid then start auto validation.
                    setState(() {
                      model.autovalidation = true;
                    });
                  }
                },*/
                      ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.028,
                  ),
                ],
              );
            })
        : Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
  }
}
