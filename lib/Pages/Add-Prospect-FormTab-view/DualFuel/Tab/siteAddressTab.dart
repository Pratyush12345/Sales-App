import 'package:flutter/material.dart';
import 'package:pozitive/Util/theme.dart';
import 'package:pozitive/Widget/textfieldsforapp.dart';
import 'package:pozitive/Util/global.dart' as globals;
import 'package:pozitive/Util/Pref.dart';

import 'package:pozitive/Core/ViewModel/DualFuelAddProspect-viewModel/siteAddressDualFuel-viewModel.dart';
import 'package:provider/provider.dart';
import 'package:pozitive/Core/Model/user.dart';
import 'package:pozitive/Core/baseview.dart';

class SiteAddressTab extends StatefulWidget {
  @override
  _SiteAddressTabState createState() => _SiteAddressTabState();
}

class _SiteAddressTabState extends State<SiteAddressTab> {
  final _formKey = GlobalKey<FormState>();

  /* TextEditingController address1Controller=TextEditingController();
  TextEditingController address2Controller=TextEditingController();
  TextEditingController postcode=TextEditingController();
  TextEditingController cityController=TextEditingController();
  bool _autovalidation=false;*/

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);

    return user.accountId != null
        ? BaseView<DualFuelSiteAddressAddProspectViewModel>(
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
                          child: DisableinnerLongtextfield(
                              5,
                              model.address1Controller,
                              model.autovalidation,
                              false,
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
                          height: MediaQuery.of(context).size.height * .062,
                          child: Disableinnertextfield(
                              model.cityController,
                              false,
                              model.autovalidation,
                              false,
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
                          child: DisableinnerLongtextfield(
                              5,
                              model.address2Controller,
                              model.autovalidation,
                              false,
                              TextInputType.text,
                              "Site Address 2", (value) {
                            /*  if (value.isEmpty) {
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
                          //height: MediaQuery.of(context).size.height*.062,
                          child: Disableinnertextfield(
                              model.postcode,
                              false,
                              model.autovalidation,
                              false,
                              TextInputType.text,
                              "Site Post Code", (value) {
                            String patttern =
                                r'^[A-Z]{1,2}[0-9][A-Z0-9]? ?[0-9][A-Z]{2}$';
                            //   r"^/[A-Z]{2}\d[A-Z]?\s?\d[A-Z]{2}/i$";
                            // String patttern =
                            //     r'^([0-9]{5})(?:[-\s]*([0-9]{4}))?$';
                            // String patttern =
                            //     r'^([A-PR-UWYZ]([0-9]{1,2}|([A-HK-Y][0-9]|[A-HK-Y][0-9]([0-9]|[ABEHMNPRV-Y]))|[0-9][A-HJKS-UW])\ [0-9][ABD-HJLNP-UW-Z]{2}|(GIR\ 0AA)|(SAN\ TA1)|(BFPO\ (C\/O\ )?[0-9]{1,4})|((ASCN|BBND|[BFS]IQQ|PCRN|STHL|TDCU|TKCA)\ 1ZZ))$';
//EXAM. GL51 0EX, GN1 0EX
                            RegExp regExp = new RegExp(patttern);

                            if (value.isEmpty) {
                              return 'Please enter PostCode';
                            }
                            if (!regExp.hasMatch(value)) {
                              return 'Please enter valid Post code';
                            }
                            // if (value.length > 8) {
                            //   return 'enter valid Post code';
                            // } else if (!regExp.hasMatch(value)) {
                            //   return 'Please enter valid Post code';
                            // }
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
//                         InkWell(
//                           child: Container(
//                             width: MediaQuery.of(context).size.width,
//                             height: MediaQuery.of(context).size.height * 0.062,
//                             child: Center(
//                               child: Text(
//                                 "Save And Next",
//                                 style: TextStyle(
//                                     color: Colors.white,
//                                     fontSize:
//                                         MediaQuery.of(context).size.height *
//                                             0.017,
//                                     fontWeight: FontWeight.bold),
//                               ),
//                             ),
//                             decoration: BoxDecoration(
//                                 color: ThemeApp().purplecolor,
//                                 borderRadius: BorderRadius.circular(30)),
//                           ),
//                           onTap: () {
// /*
//                         if (_formKey.currentState.validate()) {
// */

//                             if (_formKey.currentState.validate()) {
//                               _formKey.currentState.save();
//                               model.onSaveAndNext();
//                               globals.tabController2.animateTo(4);
//                             } else {
// //    If all data are not valid then start auto validation.
//                               setState(() {
//                                 model.autovalidation = true;
//                               });
//                             }
//                           },
//                         ),
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
