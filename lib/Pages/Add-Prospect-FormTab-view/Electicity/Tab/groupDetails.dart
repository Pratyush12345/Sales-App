import 'package:flutter/material.dart';
import 'package:pozitive/Widget/DualFuelAddProspWidgets/ELSearchGroupListWidget.dart';
import 'package:pozitive/Widget/textfieldsforapp.dart';
import 'package:pozitive/Widget/bottonfram.dart';
import 'package:pozitive/Util/global.dart' as globals;
import 'package:pozitive/Core/baseview.dart';
import 'package:pozitive/Core/Model/user.dart';
import 'package:provider/provider.dart';
import 'package:pozitive/Core/ViewModel/EleAddProspectViewModels/ele_group_viewmodel.dart';
import 'package:pozitive/Core/Model/Api/InsertAddProspect/ProspectGetAddPartnerCredetial.dart';
import 'package:pozitive/Core/enums/view_state.dart';
import 'package:pozitive/Core/AppConstact/appConstant.dart';
import 'package:pozitive/Pages/addProspectPage.dart';

class GroupDetailsTab extends StatefulWidget {
  @override
  _GroupDetailsTabState createState() => _GroupDetailsTabState();
}

class _GroupDetailsTabState extends State<GroupDetailsTab> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);

    return user.accountId != null
        ? BaseView<EleGroupAddProspectViewModel>(
            onModelReady: (model) => model.getGroupDetails(
                ProspectGetAddCredential(
                    accountID: user.accountId,
                    companyId: "1",
                    customerId: "0")),
            builder: (context, model, child) {
              return Scaffold(
                backgroundColor: Colors.white,
                body: model.state == ViewState.BUSY
                    ? AppConstant.circularProgressIndicator()
                    : Padding(
                        padding: EdgeInsets.only(
                            left: MediaQuery.of(context).size.width * 0.03,
                            right: MediaQuery.of(context).size.width * 0.03),
                        child: Form(
                          key: _formKey,
                          child: ListView(
                            children: <Widget>[
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.022,
                              ),
                              Text(
                                "Group Name",
                                style: TextStyle(
                                    fontSize:
                                        MediaQuery.of(context).size.height *
                                            .015,
                                    color: Color.fromRGBO(31, 33, 29, 1)),
                              ),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.01,
                              ),
                              InkWell(
                                child: Container(
                                  width: MediaQuery.of(context).size.width,
                                  height:
                                      MediaQuery.of(context).size.height * .062,
                                  child: dropdowntextfield(
                                      model.groupName,
                                      false,
                                      model.autovalidation,
                                      TextInputType.text,
                                      "Select", (value) {
                                    // if (value.isEmpty) {
                                    //   return 'Please select group name';
                                    // }
                                    return null;
                                  }, context),
                                ),
                                onTap: () {
                                  FocusScope.of(context)
                                      .requestFocus(FocusNode());
                                  showDialog(
                                      context: context,
                                      builder: (context)=> Dialog(
                                        child: ELEGroupSearch(
                                          model: model,
                                        ),
                                      ));
                                },
                              ),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.022,
                              ),
                              // Row(
                              //   mainAxisAlignment:
                              //       MainAxisAlignment.spaceBetween,
                              //   children: <Widget>[
                              //     InkWell(
                              //       child: buttonframewithresizechangefont(
                              //           context, "Save And Add Another", 0.45),
                              //       highlightColor: Colors.transparent,
                              //       splashColor: Colors.transparent,
                              //       onTap: () {
                              //         model.onSaveAndNext(user.accountId,
                              //             "SaveAndAddAnother", context);
                              //       },
                              //     ),
                              //     InkWell(
                              //       child: buttonframewithresizechangefont(
                              //           context, "Save And View", 0.45),
                              //       highlightColor: Colors.transparent,
                              //       splashColor: Colors.transparent,
                              //       onTap: () {
                              //         if (_formKey.currentState.validate()) {
                              //           _formKey.currentState.save();
                              //           model.onSaveAndNext(user.accountId,
                              //               "SaveAndView", context);
                              //         } else {
                              //           setState(() {
                              //             model.autovalidation = true;
                              //           });
                              //         }
                              //       },
                              //     ),
                              //   ],
                              // ),
                              //
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.055,
                              ),
                              InkWell(
                                child: Container(
                                  width: MediaQuery.of(context).size.width,
                                  height: MediaQuery.of(context).size.height *
                                      0.062,
                                  child: Center(
                                    child: Text(
                                      "Back ",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.017,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  decoration: BoxDecoration(
                                      color: Colors.green,
                                      borderRadius: BorderRadius.circular(30)),
                                ),
                                onTap: () {
                                  Navigator.of(context)
                                      .pushReplacement(new MaterialPageRoute(
                                          builder: (context) => AddProspectPage(
                                                accountId: user.accountId,
                                              )));

                                  //Navigator.of(context).pop();
                                  // model.getDataFromPref(user.accountId,
                                  //     "SaveAndGenerateContract", context);
                                },
                              ),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.028,
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
