import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:pozitive/Core/Model/InsertAddProspect/GetAddProspectModel.dart';
import 'package:pozitive/Core/ViewModel/DualFuelAddProspect-viewModel/DFGroupViewModel.dart';
import 'package:pozitive/Widget/textfieldsforapp.dart';
import 'package:pozitive/Widget/bottonfram.dart';
import 'package:provider/provider.dart';
import 'package:pozitive/Core/Model/user.dart';
import 'package:pozitive/Core/baseview.dart';
import 'package:pozitive/Core/AppConstact/appConstant.dart';
import 'package:pozitive/Core/enums/view_state.dart';
import 'package:pozitive/Core/Model/Api/InsertAddProspect/ProspectGetAddPartnerCredetial.dart';
import 'package:pozitive/Util/global.dart' as globals;
import 'package:pozitive/Util/dualFuel_Pref.dart';
import 'package:pozitive/Core/Model/Api/DualFuel-InsertAddProspect/DualFuelBusinessCredential.dart';

class GroupDetailsTab extends StatefulWidget {
  Function removeTab;
  GroupDetailsTab({this.removeTab});

  @override
  _GroupDetailsTabState createState() => _GroupDetailsTabState();
}

class _GroupDetailsTabState extends State<GroupDetailsTab>
    with SingleTickerProviderStateMixin {
  final _formKey = GlobalKey<FormState>();
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);

    return user.accountId != null
        ? BaseView<DFGroupViewModel>(
            onModelReady: (model) => model.getGroupDetails(
                ProspectGetAddCredential(
                    accountID: user.accountId,
                    companyId: "1",
                    customerId: "0")),
            builder: (context, model, child) {
              return SafeArea(
                child: Scaffold(
                  key: _scaffoldKey,
                  backgroundColor: Colors.white,
                  body: model.state == ViewState.BUSY
                      ? AppConstant.circularProgressIndicator()
                      : Padding(
                          padding: EdgeInsets.only(
                              left: MediaQuery.of(context).size.width * 0.03,
                              right: MediaQuery.of(context).size.width * 0.03),
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
                              Form(
                                // key: _formKey,
                                child: InkWell(
                                  child: Container(
                                    width: MediaQuery.of(context).size.width,
                                    height: MediaQuery.of(context).size.height *
                                        .062,
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
                                          //child: DFGroupSearch(model: model,),
                                          child: Column(
                                            //mainAxisSize: MainAxisSize.min,
                                            children: [
                                              TypeAheadField<LstGroup>(
                                                  getImmediateSuggestions: true,
                                                  textFieldConfiguration:
                                                      TextFieldConfiguration(
                                                    autofocus: true,
                                                    controller: model.groupName,
                                                    decoration: InputDecoration(
                                                      suffixIcon: Image.asset(
                                                        "assets/search.png",
                                                        scale: 10,
                                                      ),
                                                      hintText: "Select",
                                                    ),
                                                  ),
                                                  onSuggestionSelected: (data) {
                                                    print(
                                                        'selected: ${data.text}');
                                                  },
                                                  suggestionsCallback: (s) => model
                                                      .addPartnerModel.lstGroup
                                                      .where((c) => c.text
                                                          .toLowerCase()
                                                          .contains(
                                                              s.toLowerCase())),
                                                  keepSuggestionsOnLoading:
                                                      true,
                                                  itemBuilder: (context, data) {
                                                    return ListTile(
                                                      title: Text(
                                                        data.text,
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      ),
                                                      onTap: () {
                                                        setState(() {
                                                          model.groupName.text =
                                                              data.text;
                                                        });
                                                        Navigator.pop(context);
                                                      },
                                                    );
                                                  }),
                                            ],
                                          ),
                                        ));
                                  },
                                ),
                              ),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.022,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  InkWell(
                                      child: buttonframewithresizechangefont(
                                          context,
                                          "Save And Add Another",
                                          0.45),
                                      highlightColor: Colors.transparent,
                                      splashColor: Colors.transparent,
                                      onTap: () {
                                        model.getDataFromPref(
                                            user.accountId,
                                            "SaveAndAddAnother",
                                            context,
                                            model.addPartnerModel.intBrokerId
                                                .toString());
                                      }),
                                  InkWell(
                                    child: buttonframewithresizechangefont(
                                        context, "Save And View", 0.45),
                                    highlightColor: Colors.transparent,
                                    splashColor: Colors.transparent,
                                    onTap: () async {
                                      FocusScopeNode currentFocus =
                                          FocusScope.of(context);
                                      if (!currentFocus.hasPrimaryFocus &&
                                          currentFocus.focusedChild != null) {
                                        currentFocus.focusedChild.unfocus();
                                      }
                                      model.getDataFromPref(
                                          user.accountId,
                                          "SaveAndView",
                                          context,
                                          model.addPartnerModel.intBrokerId
                                              .toString());

                                      model.business = await DFPref
                                          .getDualFuelBusinessDetailsValues();

                                      if (model.business.business_Type !=
                                          null) {
                                        setState(() {
                                          if (globals.tabController2.length ==
                                              11) {
                                            widget.removeTab();
                                            globals.tabController2 =
                                                TabController(
                                                    length: 10, vsync: this);
                                            print(
                                                "${globals.tabController2.length}dfsssssssssssaaaaaaaaaaaaaad");
                                          }
                                        });
                                      }
                                      print(model.getBusinessType +
                                          "dfdshf ''''business");
                                    },
                                  ),
                                ],
                              ),
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
                                      "Save And Generate Contract",
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
                                  // model.getGroupDetails(ProspectGetAddCredential(accountID: user.accountId,companyId: "1",customerId: "0"));
                                  model.getDataFromPref(
                                      user.accountId,
                                      "SaveAndGenerateContract",
                                      context,
                                      model.addPartnerModel.intBrokerId
                                          .toString());
                                  print(model.addPartnerModel.intBrokerId
                                          .toString() +
                                      '+++++++++++++++++brokkk');
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
