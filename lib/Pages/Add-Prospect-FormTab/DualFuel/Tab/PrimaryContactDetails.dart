import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:pozitive/Core/Model/user.dart';
import 'package:pozitive/Core/ViewModel/DualFuelAddProspect-viewModel/PrimaryContactViewModel.dart';
import 'package:pozitive/Core/baseview.dart';
import 'package:pozitive/Util/theme.dart';
import 'package:pozitive/Util/global.dart' as globals;
import 'package:pozitive/Widget/textfieldsforapp.dart';
import 'package:provider/provider.dart';

class PrimaryContactDetail extends StatefulWidget {
  @override
  _PrimaryContactDetailState createState() => _PrimaryContactDetailState();
}

class _PrimaryContactDetailState extends State<PrimaryContactDetail> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);

    return user.accountId != null
        ? BaseView<DFPrimaryContactViewModel>(
            onModelReady: (model) => model.initialData(),
            builder: (context, model, child) {
              return ListView(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.022,
                          ),
                          Text(
                            "Primary Contact Details",
                            style: TextStyle(
                                fontSize:
                                    MediaQuery.of(context).size.height * .025,
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
                                          MediaQuery.of(context).size.height *
                                              .015,
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
                              // width: MediaQuery.of(context).size.width,
                              //height: MediaQuery.of(context).size.height * .062,
                              child: dropdowntextfield(
                                  model.primaryTitle,
                                  false,
                                  model.autovalidation,
                                  TextInputType.text,
                                  "Select Title", (value) {
                                if (value.isEmpty) {
                                  return 'Please select title';
                                } else if (model.nameTitle == null) {
                                  return 'Please select';
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
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.03,
                                        ),
                                        Text(
                                          "Select Title",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.03),
                                        ),
                                        SizedBox(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.02,
                                        ),
                                        Container(
                                          width:
                                              MediaQuery.of(context).size.width,
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
                                  text: 'Primary First Name',
                                  style: TextStyle(
                                      fontSize:
                                          MediaQuery.of(context).size.height *
                                              .015,
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
                            child: innertextfield(
                                model.primaryFirstName,
                                false,
                                model.autovalidation,
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
                                          MediaQuery.of(context).size.height *
                                              .015,
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
                            child: innertextfield(
                                model.primaryLastName,
                                false,
                                model.autovalidation,
                                TextInputType.text,
                                "Last name", (value) {
                              if (value.isEmpty) {
                                return 'Please enter last name';
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
                                  text: 'Primary Phone No',
                                  style: TextStyle(
                                      fontSize:
                                          MediaQuery.of(context).size.height *
                                              .015,
                                      color: Color.fromRGBO(31, 33, 29, 1)),
                                  children: <TextSpan>[
                                    // TextSpan(
                                    //     text: ' \*',
                                    //     style: TextStyle(color: Colors.red)),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.01,
                          ),
                          SizedBox(
                            child: innertextfield(
                                model.primaryPhone,
                                false,
                                model.autovalidation,
                                TextInputType.phone,
                                "Phone No", (value) {
                              if (value.isNotEmpty) {
                                if (value.length > 15) {
                                  return "Enter valid Phone no.";
                                }
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
                                  text: 'Primary Email Id',
                                  style: TextStyle(
                                      fontSize:
                                          MediaQuery.of(context).size.height *
                                              .015,
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
                            // height: MediaQuery.of(context).size.height * .062,
                            child: innertextfieldEmail(
                                model.primaryEmail,
                                false,
                                model.autovalidation,
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
                            onTap: () {
                              FocusScopeNode currentFocus =
                                  FocusScope.of(context);
                              if (!currentFocus.hasPrimaryFocus &&
                                  currentFocus.focusedChild != null) {
                                currentFocus.focusedChild.unfocus();
                              }
                              // globals.tabController2.animateTo(5);

                              if (_formKey.currentState.validate()) {
                                _formKey.currentState.save();
                                model.onSaveAndNext();
                                // globals.tabController2.animateTo(6);

                                int index = globals.tabController2.index;

                                globals.tabController2.animateTo(index + 1);
                              } else {
//    If all data are not valid then start auto validation.
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
