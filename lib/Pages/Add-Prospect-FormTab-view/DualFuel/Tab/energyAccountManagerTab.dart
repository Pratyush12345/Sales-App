import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:pozitive/Core/ViewModel/DualFuelAddProspect-viewModel/AccountManagerDualFuel-ViewModel.dart';
import 'package:pozitive/Util/theme.dart';
import 'package:pozitive/Widget/textfieldsforapp.dart';
import 'package:pozitive/Util/global.dart' as globals;
import 'package:pozitive/Util/Pref.dart';
import 'package:pozitive/Core/Model/Api/DualFuel-InsertAddProspect/InsertAddProspectCredential.dart';
import 'package:provider/provider.dart';
import 'package:pozitive/Core/Model/user.dart';
import 'package:pozitive/Core/baseview.dart';

class EnergyAccountManager extends StatefulWidget {
  @override
  _EnergyAccountManagerState createState() => _EnergyAccountManagerState();
}

class _EnergyAccountManagerState extends State<EnergyAccountManager> {
  /*bool _autovalidation=false;
  TextEditingController name=TextEditingController();
  TextEditingController email=TextEditingController();
  TextEditingController phone=TextEditingController();
  TextEditingController mobile=TextEditingController();*/
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);

    return user.accountId != null
        ? BaseView<AccountManagerDualFuelViewModel>(
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
                          //height: MediaQuery.of(context).size.height * .062,
                          child: Disableinnertextfield(
                              model.phone,
                              false,
                              model.autovalidation,
                              false,
                              TextInputType.number,
                              "079-89898989", (value) {
                            //    ((\+63)|0)[.\- ]?9[0-9]{2}[.\- ]?[0-9]{3}[.\- ]?[0-9]{4}

                            // String patttern = r'^(?:(?:\(?(?:07|\+)([1-4]\d\d|[1-9]\d?)\)?)?[\-\.\ \\\/]?)?((?:\(?\d{1,}\)?[\-\.\ \\\/]?){0,})(?:[\-\.\ \\\/]?(?:#|ext\.?|extension|x)[\-\.\ \\\/]?(\d+))?$';
                            String patttern =
                                r'^(?:(?:\(?(?:07|\+)([1-4]{1}\d\d|[1-9]{1}\d?)\)?)?[\-\.\ \\\/]?)?((?:[+0]9)?[0-9]{8}$)?$';
                            RegExp regExp = new RegExp(patttern);
                            /*      if (value.length == 0) {
                              return 'Please enter phone number';
                            }
                            else if (!regExp.hasMatch(value)) {
                              return 'Please enter valid phone number';
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
                          child: DisableinnerMobilefield(
                              10,
                              model.mobile,
                              true,
                              false,
                              TextInputType.phone,
                              "Enter 10 digit no.", (value) {
                            String patttern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
                            RegExp regExp = new RegExp(patttern);
                            /*      if (value.length == 0) {
                              return 'Please enter mobile number';
                            }
                            else if (!regExp.hasMatch(value)) {
                              return 'Please enter valid mobile number';
                            }*/
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
                            int index = globals.tabController2.index;
                            globals.tabController2.animateTo(index + 1);

                            // globals.tabController2.animateTo(7);
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
