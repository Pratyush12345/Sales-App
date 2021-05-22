import 'package:flutter/material.dart';
import 'package:pozitive/Core/ViewModel/DualFuelAddProspect-viewModel/DualFuelBusiness-ViewModel.dart';
import 'package:pozitive/Util/theme.dart';
import 'package:pozitive/Widget/textfieldsforapp.dart';
import 'package:pozitive/Util/global.dart' as globals;
import 'package:pozitive/Core/baseview.dart';
import 'package:pozitive/Core/Model/user.dart';
import 'package:provider/provider.dart';
import 'package:pozitive/Util/PrefBusinessType/PrefBusinessType.dart';
import 'package:pozitive/Core/Model/Api/DualFuel-InsertAddProspect/BusinessOwnershipDetailsCredential.dart';

class ltdAddresses extends StatefulWidget {
  @override
  _ltdAddressesState createState() => _ltdAddressesState();
}

class _ltdAddressesState extends State<ltdAddresses> {
  TextEditingController strTitleDirector1 = TextEditingController();
  TextEditingController strDirector1Firstname = TextEditingController();
  TextEditingController strDirector1Lastname = TextEditingController();
  TextEditingController strTitleDirector2 = TextEditingController();
  TextEditingController strDirector2Firstname = TextEditingController();
  TextEditingController strDirector2Lastname = TextEditingController();
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
              //     strTitleDirector1.text = nameTitle[index];
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
              //     strTitleDirector2.text = nameTitle[index];
              //   });
              //   Navigator.pop(context);
              // },
            ),
          );
        });
  }

  final _formKey = GlobalKey<FormState>();

  void ltdAddressInitialData() async {
    final data = await BusinessTypePref.getltdBusinessTypeAdd();
    setState(() {
      print(strTitleDirector1.text);
      if (data != null) {
        strTitleDirector1.text = data.strTitleDirector1;
        strDirector1Firstname.text = data.strDirector1Firstname;
        strDirector1Lastname.text = data.strDirector1Lastname;
        strTitleDirector2.text = data.strTitleDirector2;
        strDirector2Firstname.text = data.strDirector2Firstname;
        strDirector2Lastname.text = data.strDirector2Lastname;
      }
    });
  }

  void ltdAddressOnSaveAndNext() {
    setState(() {
      BusinessTypePref.setltdBusinessTypeAdd(LtdBusinessCredential(
        strTitleDirector1: strTitleDirector1.text,
        strDirector1Firstname: strDirector1Firstname.text,
        strDirector1Lastname: strDirector1Lastname.text,
        strTitleDirector2: strTitleDirector2.text,
        strDirector2Firstname: strDirector2Firstname.text,
        strDirector2Lastname: strDirector2Lastname.text,
      ));
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    ltdAddressInitialData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);

    return user.accountId != null
        ? BaseView<DualFuelAddProspectBusinessViewModel>(
            // onModelReady: (model) => model.ltdAddressInitialData(),
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
                          strTitleDirector1,
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
                    // onTap: () {
                    //   FocusScope.of(context).requestFocus(FocusNode());
                    //   showDialog(
                    //       context: context,
                    //       child: Dialog(
                    //         child: Column(
                    //           mainAxisSize: MainAxisSize.min,
                    //           children: <Widget>[
                    //             SizedBox(
                    //               height:
                    //                   MediaQuery.of(context).size.height * 0.03,
                    //             ),
                    //             Text(
                    //               "Select Title",
                    //               style: TextStyle(
                    //                   fontWeight: FontWeight.bold,
                    //                   fontSize:
                    //                       MediaQuery.of(context).size.height *
                    //                           0.03),
                    //             ),
                    //             SizedBox(
                    //               height:
                    //                   MediaQuery.of(context).size.height * 0.02,
                    //             ),
                    //             Container(
                    //               width: MediaQuery.of(context).size.width,
                    //               height: 1,
                    //               color: Colors.grey.withOpacity(.2),
                    //             ),
                    //             Container(
                    //               child: nameList(),
                    //             )
                    //           ],
                    //         ),
                    //       ));
                    // },
                
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
                        strDirector1Firstname,
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
                        strDirector1Lastname,
                        false,
                        model.autovalidation,
                        false,
                        TextInputType.text,
                        "Last name", (value) {
                      if (value.isEmpty) {
                        return 'Please enter last name';
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
                          strTitleDirector2,
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
                    // onTap: () {
                    //   FocusScope.of(context).requestFocus(FocusNode());
                    //   showDialog(
                    //       context: context,
                    //       child: Dialog(
                    //         child: Column(
                    //           mainAxisSize: MainAxisSize.min,
                    //           children: <Widget>[
                    //             SizedBox(
                    //               height:
                    //                   MediaQuery.of(context).size.height * 0.03,
                    //             ),
                    //             Text(
                    //               "Select Title",
                    //               style: TextStyle(
                    //                   fontWeight: FontWeight.bold,
                    //                   fontSize:
                    //                       MediaQuery.of(context).size.height *
                    //                           0.03),
                    //             ),
                    //             SizedBox(
                    //               height:
                    //                   MediaQuery.of(context).size.height * 0.02,
                    //             ),
                    //             Container(
                    //               width: MediaQuery.of(context).size.width,
                    //               height: 1,
                    //               color: Colors.grey.withOpacity(.2),
                    //             ),
                    //             Container(
                    //               child: nameList2(),
                    //             )
                    //           ],
                    //         ),
                    //       ));
                    // },
               
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
                        strDirector2Firstname,
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
                        strDirector2Lastname,
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
                        globals.tabController2.animateTo(8);
                      }),
//                   InkWell(
//                     child: Container(
//                       width: MediaQuery.of(context).size.width,
//                       height: MediaQuery.of(context).size.height * 0.062,
//                       child: Center(
//                         child: Text(
//                           "Save And Next",
//                           style: TextStyle(
//                               color: Colors.white,
//                               fontSize:
//                                   MediaQuery.of(context).size.height * 0.017,
//                               fontWeight: FontWeight.bold),
//                         ),
//                       ),
//                       decoration: BoxDecoration(
//                           color: ThemeApp().purplecolor,
//                           borderRadius: BorderRadius.circular(30)),
//                     ),
//                     onTap: () {
//                       if (_formKey.currentState.validate()) {
//                         _formKey.currentState.save();
//                         ltdAddressOnSaveAndNext();
//                         globals.tabController2.animateTo(8);
//                       } else {
// //    If all data are not valid then start auto validation.
//                         setState(() {
//                           model.autovalidation = true;
//                         });
//                       }
//                     },
//                   ),
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
