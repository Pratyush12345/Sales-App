import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:pozitive/Util/theme.dart';
import 'package:pozitive/Widget/textfieldsforapp.dart';
import 'package:pozitive/Util/global.dart' as globals;
import 'package:pozitive/Core/ViewModel/GasAddProspectViewModel/GasEAMViewModel.dart';
import 'package:pozitive/Core/Model/user.dart';
import 'package:provider/provider.dart';
import 'package:pozitive/Core/baseview.dart';

class EnergyAccountManager extends StatefulWidget {
  @override
  _EnergyAccountManagerState createState() => _EnergyAccountManagerState();
}

class _EnergyAccountManagerState extends State<EnergyAccountManager> {
  final _formKey = GlobalKey<FormState>();
  bool isValidPhoneNumber(String string) {
    // Null or empty string is invalid phone number
    if (string == null || string.isEmpty) {
      return false;
    }

    // You may need to change this pattern to fit your requirement.
    // I just copied the pattern from here: https://regexr.com/3c53v
    const pattern = r'^[+]*[(]{0,1}[0-9]{1,4}[)]{0,1}[-\s\./0-9]*$';
    final regExp = RegExp(pattern);

    if (!regExp.hasMatch(string)) {
      return false;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);

    return user.accountId != null
        ? BaseView<GasEAMAddProspectViewModel>(
            onModelReady: (model) => model.initialData(),
            builder: (context, model, child) {
              return Scaffold(
                backgroundColor: Colors.white,
                body: Padding(
                  padding: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width * 0.03,
                      right: MediaQuery.of(context).size.width * 0.03),
                  child: Form(
                    key: _formKey,
                    child: ListView(
                      children: <Widget>[
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.022,
                        ),
                        Text(
                          "(For day to day running of the account)",
                          style: TextStyle(
                              fontSize:
                                  MediaQuery.of(context).size.height * .013,
                              color: Color.fromRGBO(31, 33, 29, 1),
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.005,
                        ),
                        Text(
                          "Name",
                          style: TextStyle(
                              fontSize:
                                  MediaQuery.of(context).size.height * .015,
                              color: Color.fromRGBO(31, 33, 29, 1)),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.01,
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * .062,
                          child: Disableinnertextfield(
                              model.name,
                              false,
                              model.autovalidation,
                              false,
                              TextInputType.text,
                              "Name", (value) {
                            if (value.isEmpty) {
                              return 'Please enter Name';
                            }
                            return null;
                          }, context),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.022,
                        ),
                        Text(
                          "Email Address",
                          style: TextStyle(
                              fontSize:
                                  MediaQuery.of(context).size.height * .015,
                              color: Color.fromRGBO(31, 33, 29, 1)),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.01,
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * .062,
                          child: DisableinnertextfieldEmail(
                              model.email,
                              false,
                              model.autovalidation,
                              false,
                              TextInputType.emailAddress,
                              "Email Address",
                              (email) => EmailValidator.validate(email)
                                  ? null
                                  : "Invalid email address",
                              context),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.022,
                        ),
                        Text(
                          "Phone No.",
                          style: TextStyle(
                              fontSize:
                                  MediaQuery.of(context).size.height * .015,
                              color: Color.fromRGBO(31, 33, 29, 1)),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.01,
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * .062,
                          child: Disableinnertextfield(
                              model.phone,
                              false,
                              model.autovalidation,
                              false,
                              TextInputType.number,
                              "Phone No", (value) {
                            if (value.isEmpty) {
                              return 'Please enter phone no';
                            }
                            return null;
                          }, context),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.022,
                        ),
                        Text(
                          "Mobile No.",
                          style: TextStyle(
                              fontSize:
                                  MediaQuery.of(context).size.height * .015,
                              color: Color.fromRGBO(31, 33, 29, 1)),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.01,
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * .062,
                          child: Disableinnertextfield(
                              model.mobile,
                              false,
                              model.autovalidation,
                              false,
                              TextInputType.number,
                              "Mobile No", (value) {
                            if (value.isEmpty) {
                              return 'Please enter mobile no';
                            }
                            return null;
                          }, context),
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
                                        MediaQuery.of(context).size.height *
                                            0.017,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            decoration: BoxDecoration(
                                color: ThemeApp().purplecolor,
                                borderRadius: BorderRadius.circular(30)),
                          ),
                          onTap: () {
                            globals.tabController.animateTo(6);
                          },
                        ),
                        // InkWell(
                        //   child: Container(
                        //     width: MediaQuery.of(context).size.width,
                        //     height: MediaQuery.of(context).size.height * 0.062,
                        //     child: Center(
                        //       child: Text(
                        //         "Save And Next",
                        //         style: TextStyle(
                        //             color: Colors.white,
                        //             fontSize:
                        //                 MediaQuery.of(context).size.height *
                        //                     0.017,
                        //             fontWeight: FontWeight.bold),
                        //       ),
                        //     ),
                        //     decoration: BoxDecoration(
                        //         color: ThemeApp().purplecolor,
                        //         borderRadius: BorderRadius.circular(30)),
                        //   ),
                        //   onTap: () {
                        //     /*         if (_formKey.currentState.validate()) {
                        //       _formKey.currentState.save();*/
                        //     model.onSaveAndNext();

                        //     int index = globals.tabController.index;
                        //     globals.tabController.animateTo(index + 1);
                        //     //globals.tabController.animateTo(6);
                        //     /* } else {
                        //       setState(() {
                        //         model.autovalidation = true;
                        //       });
                        //     }*/
                        //   },
                        // ),
                        //
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.028,
                        ),
                      ],
                    ),
                  ),
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
