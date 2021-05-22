import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:pozitive/Util/theme.dart';
import 'package:pozitive/Widget/textfieldsforapp.dart';
import 'package:pozitive/Util/global.dart' as globals;
import 'package:pozitive/Core/baseview.dart';
import 'package:pozitive/Core/Model/user.dart';
import 'package:provider/provider.dart';
import 'package:pozitive/Core/ViewModel/EleAddProspectViewModels/ele_energy_account_manager_viewmodel.dart';

class EnergyAccountManager extends StatefulWidget {
  @override
  _EnergyAccountManagerState createState() => _EnergyAccountManagerState();
}

class _EnergyAccountManagerState extends State<EnergyAccountManager> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    {
      final user = Provider.of<User>(context);

      return user.accountId != null
          ? BaseView<EleEAMAddProspectViewModel>(
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
                            //    height: MediaQuery.of(context).size.height * .062,
                            child: innertextfield(
                                model.name,
                                false,
                                model.autovalidation,
                                TextInputType.text,
                                "Name", (value) {
                              // if (value.isEmpty) {
                              //   return 'Please enter Name';
                              // }
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
                            //height: MediaQuery.of(context).size.height * .062,
                            child: innertextfieldEmail(
                                model.email,
                                false,
                                model.autovalidation,
                                TextInputType.emailAddress,
                                "Email Address", (email) {
                              if (email.isNotEmpty) {
                                if (EmailValidator.validate(email)) {
                                } else {
                                  return 'Please Enter valid Email';
                                }
                              }
                            },
                                // (email) => EmailValidator.validate(email)
                                //     ? null
                                //     : "Invalid email address",
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
                            child: innerMobilefield(
                                15,
                                model.phone,
                                true,
                                TextInputType.phone,
                                "Enter Phone no.", (value) {
                              String patttern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
                              RegExp regExp = new RegExp(patttern);
                              /* if (value.length == 0) {
                                    return 'Please enter mobile number';
                                  }
                                  else if (!regExp.hasMatch(value)) {
                                    return 'Please enter valid mobile number';
                                  }*/
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
                            //height: MediaQuery.of(context).size.height * .062,
                            child: innerMobilefield(
                                10,
                                model.mobile,
                                true,
                                TextInputType.phone,
                                "Enter Mobile no.", (value) {
                              String patttern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
                              RegExp regExp = new RegExp(patttern);

                              return null;
                            }, context),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.025,
                          ),
                          InkWell(
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              height:
                                  MediaQuery.of(context).size.height * 0.062,
                              child: Center(
                                child: Text(
                                  "Save And Next",
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
                            onTap: () {    FocusScopeNode currentFocus = FocusScope.of(context);
    if (!currentFocus.hasPrimaryFocus && currentFocus.focusedChild != null) {
       currentFocus.focusedChild.unfocus();
    }
                              if (_formKey.currentState.validate()) {
                                _formKey.currentState.save();
                                model.onSaveAndNext();
                                // globals.tabController1.animateTo(6);
                                int index = globals.tabController1.index;
                                globals.tabController1.animateTo(index + 1);
                              } else {
                                setState(() {
                                  model.autovalidation = true;
                                });
                              }
                            },
                          ),
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
}
