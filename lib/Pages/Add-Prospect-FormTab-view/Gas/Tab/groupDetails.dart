import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:pozitive/Core/Model/InsertAddProspect/GetAddProspectModel.dart';
import 'package:pozitive/Util/theme.dart';
import 'package:pozitive/Widget/DualFuelAddProspWidgets/GASSearchGroupListWidget.dart';
import 'package:pozitive/Widget/textfieldsforapp.dart';
import 'package:pozitive/Widget/bottonfram.dart';
import 'package:pozitive/Util/global.dart' as globals;
import 'package:pozitive/Core/ViewModel/GasAddProspectViewModel/GasGroupViewModel.dart';
import 'package:pozitive/Core/Model/user.dart';
import 'package:provider/provider.dart';
import 'package:pozitive/Core/baseview.dart';
import 'package:pozitive/Pages/addProspectPage.dart';

import 'package:pozitive/Core/Model/Api/InsertAddProspect/ProspectGetAddPartnerCredetial.dart';
import 'package:pozitive/Core/enums/view_state.dart';
import 'package:pozitive/Core/AppConstact/appConstant.dart';

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
        ? BaseView<GasGroupAddProspectViewModel>(
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
                                // onTap: () {
                                //   FocusScope.of(context)
                                //       .requestFocus(FocusNode());
                                //   showDialog(
                                //       context: context,
                                //       child: Dialog(
                                //         // child: GASGroupSearch(model : model),
                                //         child: Column(
                                //           children: [
                                //             TypeAheadField<LstGroup>(
                                //                 getImmediateSuggestions: true,
                                //                 textFieldConfiguration:
                                //                     TextFieldConfiguration(
                                //                   autofocus: true,
                                //                   controller: model.groupName,
                                //                   decoration: InputDecoration(
                                //                       enabled: true,
                                //                       suffixIcon: Image.asset(
                                //                         "assets/search.png",
                                //                         scale: 10,
                                //                       ),
                                //                       hintText: "Select",
                                //                       contentPadding:
                                //                           EdgeInsets.all(10)),
                                //                 ),
                                //                 onSuggestionSelected: (data) {
                                //                   print(
                                //                       'selected: ${data.text}');
                                //                 },
                                //                 suggestionsCallback: (s) => model
                                //                     .addPartnerModel.lstGroup
                                //                     .where((c) => c.text
                                //                         .toLowerCase()
                                //                         .contains(
                                //                             s.toLowerCase())),
                                //                 keepSuggestionsOnLoading: true,
                                //                 itemBuilder: (context, data) {
                                //                   return Column(
                                //                     children: [
                                //                       ListTile(
                                //                         title: Text(
                                //                           data.text,
                                //                           style: TextStyle(
                                //                               fontWeight:
                                //                                   FontWeight
                                //                                       .bold),
                                //                         ),
                                //                         onTap: () {
                                //                           setState(() {
                                //                             model.groupName
                                //                                     .text =
                                //                                 data.text;
                                //                           });
                                //                           Navigator.pop(
                                //                               context);
                                //                         },
                                //                       ),
                                //                     ],
                                //                   );
                                //                 }),
                                //           ],
                                //         ),
                                //       ));
                                // },
                              ),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.022,
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
