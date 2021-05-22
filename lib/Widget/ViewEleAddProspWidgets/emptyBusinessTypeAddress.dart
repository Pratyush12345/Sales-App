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

class emptyAddresses extends StatefulWidget {
  @override
  _emptyAddressesState createState() => _emptyAddressesState();
}

class _emptyAddressesState extends State<emptyAddresses> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController strTitleOtherowner1 = TextEditingController();
  TextEditingController strOtherowner1FirstName = TextEditingController();
  TextEditingController strOtherowner1LastName = TextEditingController();
  TextEditingController strTitleOtherowner2 = TextEditingController();
  TextEditingController strOtherowner2FirstName = TextEditingController();
  TextEditingController strOtherowner2LastName = TextEditingController();

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
              // onTap: () {
              //   setState(() {
              //     strTitleOtherowner1.text = nameTitle[index];
              //   });
              //   Navigator.pop(context);
              // },
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
              // onTap: () {
              //   setState(() {
              //     strTitleOtherowner2.text = nameTitle[index];
              //   });
              //   Navigator.pop(context);
              // },
            ),
          );
        });
  }

  @override
  void initState() {
    // TODO: implement initState
    otherAddressInitialData();
    super.initState();
  }

  void otherAddressInitialData() async {
    final data = await EleBusinessTypePref.getOtherBusinessTypeAdd();
    setState(() {
      if (data != null) {
        strTitleOtherowner1.text = data.otherstrTitleOtherowner1;
        strOtherowner1FirstName.text = data.otherstrOtherowner1FirstName;
        strOtherowner1LastName.text = data.otherstrOtherowner1LastName;
        strTitleOtherowner2.text = data.otherstrTitleOtherowner2;
        strOtherowner2FirstName.text = data.otherstrOtherowner2FirstName;
        strOtherowner2LastName.text = data.otherstrOtherowner2LastName;
      }
    });
  }

  void otherAddressOnSaveAndNext() {
    setState(() {
      EleBusinessTypePref.setOtherBusinessTypeAdd(OtherBusinessCredential(
        otherstrTitleOtherowner1: strTitleOtherowner1.text,
        otherstrOtherowner1FirstName: strOtherowner1FirstName.text,
        otherstrOtherowner1LastName: strOtherowner1LastName.text,
        otherstrTitleOtherowner2: strTitleOtherowner2.text,
        otherstrOtherowner2FirstName: strOtherowner2FirstName.text,
        otherstrOtherowner2LastName: strOtherowner2LastName.text,
      ));
    });
  }

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);

    return user.accountId != null
        ? BaseView<EleBusAddProspectViewModel>(
            //onModelReady: (model) => model.otherAddressInitialData(),
            builder: (context, model, child) {
            return Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.022,
                  ),
//1st owner
                  Text(
                    "Director1",
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      RichText(
                        text: TextSpan(
                          text: 'Title',
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
                  InkWell(
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      //height: MediaQuery.of(context).size.height * .062,
                      child: dropdowntextfield(
                          model.strTitleDirector1,
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
                    //height: MediaQuery.of(context).size.height * .062,
                    child: Disableinnertextfield(
                        model.strDirector1Firstname,
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
                    //height: MediaQuery.of(context).size.height * .062,
                    child: Disableinnertextfield(
                        model.strDirector1Lastname,
                        false,
                        model.autovalidation,
                        false,
                        TextInputType.text,
                        "Last name", (value) {
                      if (value.isEmpty) {
                        return 'Please enter electricity night fixed commission';
                      }
                      return null;
                    }, context),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.01,
                  ),
                  //2nd owner
                  Text(
                    "Director2",
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
                      //height: MediaQuery.of(context).size.height * .062,
                      child: dropdowntextfield(
                          model.strTitleDirector2,
                          false,
                          model.autovalidation,
                          TextInputType.text,
                          "Select Title", (value) {
                        /* if (value.isEmpty) {
                        return 'Please select title';
                      }*/
                        return null;
                      }, context),
                    ),
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
                                //text: ' \*',
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
                    //height: MediaQuery.of(context).size.height * .062,
                    child: Disableinnertextfield(
                        model.strDirector2Firstname,
                        false,
                        model.autovalidation,
                        false,
                        TextInputType.text,
                        "First name", (value) {
                      /* if (value.isEmpty) {
                      return 'Please enter first name';
                    }*/
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
                    // height: MediaQuery.of(context).size.height * .062,
                    child: Disableinnertextfield(
                        model.strDirector2Lastname,
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
                        // otherAddressInitialData();
                        globals.tabController1.animateTo(7);
                      }
                      /* if (_formKey.currentState.validate()) {
                      _formKey.currentState.save();
                      otherAddressInitialData();
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
              ),
            );
          })
        : Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
  }
}
