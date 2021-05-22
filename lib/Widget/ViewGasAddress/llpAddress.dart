import 'package:flutter/material.dart';
import 'package:pozitive/Core/Model/Api/Gas-Insert-AddProspect/GasBusinessOwnershipDetailsCredential.dart';
import 'package:pozitive/Core/ViewModel/GasAddProspectViewModel/GasBusinessViewModel.dart';
import 'package:pozitive/Util/PrefBusinessType/GasPrefBusinessType.dart';
import 'package:pozitive/Util/theme.dart';
import 'package:pozitive/Widget/textfieldsforapp.dart';
import 'package:pozitive/Util/global.dart' as globals;
import 'package:pozitive/Core/baseview.dart';
import 'package:pozitive/Core/Model/user.dart';
import 'package:provider/provider.dart';

class llpAddresses extends StatefulWidget {
  @override
  _llpAddressesState createState() => _llpAddressesState();
}

class _llpAddressesState extends State<llpAddresses> {
  TextEditingController strTitleLLPowner1 = TextEditingController();
  TextEditingController strLLPowner1FirstName = TextEditingController();
  TextEditingController strLLPowner1LastName = TextEditingController();
  TextEditingController strTitleLLPowner2 = TextEditingController();
  TextEditingController strLLPowner2FirstName = TextEditingController();
  TextEditingController strLLPowner2LastName = TextEditingController();

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
              //     strTitleLLPowner1.text = nameTitle[index];
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
              //     strTitleLLPowner2.text = nameTitle[index];
              //   });
              //   Navigator.pop(context);
              // },
            ),
          );
        });
  }

  final _formKey = GlobalKey<FormState>();

  void llpAddressInitialData() async {
    final data = await GasBusinessTypePref.getLLPBusinessTypeAdd();
    setState(() {
      print(strTitleLLPowner1.text);
      if (data != null) {
        strTitleLLPowner1.text = data.strTitleLLPowner1;
        strLLPowner1FirstName.text = data.strLLPowner1FirstName;
        strLLPowner1LastName.text = data.strLLPowner1LastName;
        strTitleLLPowner2.text = data.strTitleLLPowner2;
        strLLPowner2FirstName.text = data.strLLPowner2FirstName;
        strLLPowner2LastName.text = data.strLLPowner2LastName;
      }
    });
  }

  void llpAddressOnSaveAndNext() {
    setState(() {
      GasBusinessTypePref.setLLPBusinessTypeAdd(LLPBusinessCredential(
        strTitleLLPowner1: strTitleLLPowner1.text,
        strLLPowner1FirstName: strLLPowner1FirstName.text,
        strLLPowner1LastName: strLLPowner1LastName.text,
        strTitleLLPowner2: strTitleLLPowner2.text,
        strLLPowner2FirstName: strLLPowner2FirstName.text,
        strLLPowner2LastName: strLLPowner2LastName.text,
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
        ? BaseView<GasBusinessAddProspectViewModel>(
            //onModelReady: (model) => model.initialData(),
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
                        strTitleLLPowner1,
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
                            fontSize: MediaQuery.of(context).size.height * .015,
                            color: Color.fromRGBO(31, 33, 29, 1)),
                        children: <TextSpan>[
                          TextSpan(
                              text: ' \*', style: TextStyle(color: Colors.red)),
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
                      strLLPowner1FirstName,
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
                            fontSize: MediaQuery.of(context).size.height * .015,
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
                      strLLPowner1LastName,
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
                        strTitleLLPowner2,
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
                            fontSize: MediaQuery.of(context).size.height * .015,
                            color: Color.fromRGBO(31, 33, 29, 1)),
                        children: <TextSpan>[
                          TextSpan(
                              text: ' \*', style: TextStyle(color: Colors.red)),
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
                      strLLPowner2FirstName,
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
                            fontSize: MediaQuery.of(context).size.height * .015,
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
                      strLLPowner2LastName,
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
                    //  llpAddressOnSaveAndNext();
                    globals.tabController.animateTo(7);
                    /* if (_formKey.currentState.validate()) {
                      _formKey.currentState.save();
                      llpAddressOnSaveAndNext();
                      globals.tabController1.animateTo(6);
                    } else {
//    If all data are not valid then start auto validation.
                      setState(() {
                        model.autovalidation = true;
                      });
                    }*/
                  },
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
