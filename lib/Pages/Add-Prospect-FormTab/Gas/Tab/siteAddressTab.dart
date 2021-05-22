import 'package:flutter/material.dart';
import 'package:pozitive/Core/AppConstact/appConstant.dart';
import 'package:pozitive/Util/theme.dart';
import 'package:pozitive/Widget/textfieldsforapp.dart';
import 'package:pozitive/Util/global.dart' as globals;
import 'package:pozitive/Core/ViewModel/GasAddProspectViewModel/GasSiteAddViewModel.dart';
import 'package:pozitive/Core/Model/user.dart';
import 'package:provider/provider.dart';
import 'package:pozitive/Core/baseview.dart';

class SiteAddressTab extends StatefulWidget {
  @override
  _SiteAddressTabState createState() => _SiteAddressTabState();
}

class _SiteAddressTabState extends State<SiteAddressTab> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);

    return user.accountId != null
        ? BaseView<GasSiteAddAddProspectViewModel>(
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
                        RichText(
                          text: TextSpan(
                            text: 'Address 1',
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
                        SizedBox(
//              height: MediaQuery.of(context).size.height*.062,
                          child: innerLongtextfield(
                              5,
                              model.address1Controller,
                              model.autovalidation,
                              TextInputType.text,
                              "Site Address 1", (value) {
                            if (value.isEmpty) {
                              return 'Please enter Site Address 1';
                            }
                            return null;
                          }, context),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.022,
                        ),

                        //Text("City",style: TextStyle(fontSize: MediaQuery.of(context).size.height*.015,color: Color.fromRGBO(31, 33, 29, 1)),),
                        RichText(
                          text: TextSpan(
                            text: 'City',
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
                        SizedBox(
                          //  height: MediaQuery.of(context).size.height * .062,
                          child: innertextfield(
                              model.cityController,
                              false,
                              model.autovalidation,
                              TextInputType.text,
                              "Site City", (value) {
                            if (value.isEmpty) {
                              return 'Please enter City';
                            }
                            return null;
                          }, context),
                        ),

                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.022,
                        ),
                        Text(
                          "Address 2",
                          style: TextStyle(
                              fontSize:
                                  MediaQuery.of(context).size.height * .015,
                              color: Color.fromRGBO(31, 33, 29, 1)),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.01,
                        ),
                        SizedBox(
//              height: MediaQuery.of(context).size.height*.062,
                          child: innerLongtextfield(
                              5,
                              model.address2Controller,
                              model.autovalidation,
                              TextInputType.text,
                              "Site Address 2", (value) {
                            /* if (value.isEmpty) {
                              return 'Please enter Site Address 2';
                            }*/
                            return null;
                          }, context),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.022,
                        ),

                        RichText(
                          text: TextSpan(
                            text: 'PostCode',
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
                        SizedBox(
                          //height: MediaQuery.of(context).size.height * .062,
                          child: innertextfield(
                              model.postcode,
                              false,
                              model.autovalidation,
                              TextInputType.text,
                              "Site Post Code", (value) {
                            String patttern =
                                r'^[A-Z]{1,2}[0-9][A-Z0-9]? ?[0-9][A-Z]{2}$';
                            RegExp regExp = new RegExp(patttern);

                            if (value.isEmpty) {
                              return 'Please enter PostCode';
                            }
                            if (!regExp.hasMatch(value)) {
                              return 'Please enter valid Post code';
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

                            if (_formKey.currentState.validate()) {
                              _formKey.currentState.save();
                              model.onSaveAndNext();
                              globals.tabController.animateTo(3);
                            } else {
                              setState(() {
                                AppConstant.showFailToast(
                                    context, "Please add required fields");

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
