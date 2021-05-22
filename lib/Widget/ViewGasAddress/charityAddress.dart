import 'package:flutter/material.dart';
import 'package:pozitive/Core/Model/Api/Gas-Insert-AddProspect/GasBusinessOwnershipDetailsCredential.dart';
import 'package:pozitive/Core/ViewModel/GasAddProspectViewModel/GasBusinessViewModel.dart';
import 'package:pozitive/Util/theme.dart';
import 'package:pozitive/Util/PrefBusinessType/GasPrefBusinessType.dart';
import 'package:pozitive/Widget/textfieldsforapp.dart';
import 'package:pozitive/Util/global.dart' as globals;
import 'package:pozitive/Core/baseview.dart';
import 'package:pozitive/Core/Model/user.dart';
import 'package:provider/provider.dart';

class CharityAddresses extends StatefulWidget {
  @override
  _CharityAddressesState createState() => _CharityAddressesState();
}

class _CharityAddressesState extends State<CharityAddresses> {
  TextEditingController strTitlecharityowner1 = TextEditingController();
  TextEditingController strcharityowner1firstname = TextEditingController();
  TextEditingController strcharityowner1lastname = TextEditingController();
  TextEditingController strTitlecharityowner2 = TextEditingController();
  TextEditingController strcharityowner2firstname = TextEditingController();
  TextEditingController strcharityowner2lastname = TextEditingController();
  TextEditingController strchariryRegisterNo = TextEditingController();

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
              //     strTitlecharityowner1.text = nameTitle[index];
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
              //     strTitlecharityowner2.text = nameTitle[index];
              //   });
              //   Navigator.pop(context);
              // },
            ),
          );
        });
  }

  final _formKey = GlobalKey<FormState>();

  void charityAddressInitialData() async {
    final data = await GasBusinessTypePref.getCharityBusinessTypeAdd();
    setState(() {
      print(strTitlecharityowner1.text);
      if (data != null) {
        strTitlecharityowner1.text = data.strTitlecharityowner1;
        strcharityowner1firstname.text = data.strcharityowner1firstname;
        strcharityowner1lastname.text = data.strcharityowner1lastname;
        strTitlecharityowner2.text = data.strTitlecharityowner2;
        strcharityowner2firstname.text = data.strcharityowner2firstname;
        strcharityowner2lastname.text = data.strcharityowner2lastname;
        strchariryRegisterNo.text = data.strchariryRegisterNo;
      }
    });
  }

  void charityAddressOnSaveAndNext() {
    setState(() {
      GasBusinessTypePref.setCharityBusinessTypeAdd(CharityBusinessCredential(
          strTitlecharityowner1: strTitlecharityowner1.text,
          strcharityowner1firstname: strcharityowner1firstname.text,
          strcharityowner1lastname: strcharityowner1lastname.text,
          strTitlecharityowner2: strTitlecharityowner2.text,
          strcharityowner2firstname: strcharityowner2firstname.text,
          strcharityowner2lastname: strcharityowner2lastname.text,
          strchariryRegisterNo: strchariryRegisterNo.text));
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    charityAddressInitialData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);

    return user.accountId != null
        ? BaseView<GasBusinessAddProspectViewModel>(
            // onModelReady: (model) => model.initialData(),
            builder: (context, model, child) {
            return Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.022,
                  ),
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
                          strTitlecharityowner1,
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
                    height: MediaQuery.of(context).size.height * .062,
                    child: Disableinnertextfield(
                        strcharityowner1firstname,
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
                        strcharityowner1lastname,
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
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.022,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.022,
                  ),
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
                      height: MediaQuery.of(context).size.height * .062,
                      child: dropdowntextfield(
                          strTitlecharityowner2,
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
                    height: MediaQuery.of(context).size.height * .062,
                    child: Disableinnertextfield(
                        strcharityowner2firstname,
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
                        strcharityowner2lastname,
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
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.022,
                  ),
                  Text(
                    "charity Register No",
                    style: TextStyle(
                        fontSize: MediaQuery.of(context).size.height * .015,
                        color: Color.fromRGBO(31, 33, 29, 1)),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.022,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * .062,
                    child: Disableinnertextfield(
                        model.gascharityRegNo,
                        false,
                        model.autovalidation,
                        false,
                        TextInputType.text,
                        "charity Register No", (value) {
                      /*  if (value.isEmpty) {
                                    return 'Please enter electricity night fixed commission';
                                  }*/
                      return null;
                    }, context),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.022,
                  ),
                  InkWell(
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 0.062,
                      child: Center(
                        child: Text(
                          "Go to/ Next",
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
                      //charityAddressOnSaveAndNext();
                      globals.tabController.animateTo(7);
                      /*   if (_formKey.currentState.validate()) {
                      _formKey.currentState.save();
                      charityAddressOnSaveAndNext();
                      globals.tabController1.animateTo(6);
                    } else {
//    If all data are not valid then start auto validation.
                      setState(() {
                        model.autovalidation = true;
                      });
                    }*/
                    },
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
