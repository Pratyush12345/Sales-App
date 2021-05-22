import 'package:flutter/material.dart';
import 'package:pozitive/Util/theme.dart';
import 'package:pozitive/Widget/appbar.dart';
import 'package:pozitive/Widget/drawerwidget.dart';
import 'package:pozitive/Util/global.dart' as globals;
import 'package:pozitive/Core/Model/user.dart';
import 'package:pozitive/Util/Pref.dart';
import './Tab/DirectDebitAgreement.dart';
import './Tab/UniqueRefNo.dart';
import './Tab/Electricity.dart';
import './Tab/BusinessDetails.dart';
import './Tab/Gas.dart';
import './Tab/SiteAddress.dart';
import './Tab/BillingAddress.dart';
import './Tab/EnergyAccountManager.dart';
import 'package:pozitive/Core/Services/database.dart';
import 'package:pozitive/Core/baseview.dart';
import 'package:pozitive/Core/Model/sharePrefModel/SaveAndGenerateContractIndividualModel.dart';
import 'package:pozitive/Core/Model/Api/SaveAndGenerateContractIndividualCredential.dart';
import 'package:pozitive/Core/ViewModel/quotation_page/GenerateContractIndividualViewModel.dart';
import 'package:pozitive/Core/enums/view_state.dart';
import 'package:pozitive/Core/AppConstact/appConstant.dart';

class GenerateContractIndividual extends StatefulWidget {
  final String quoteID;
  final String customerId;
  GenerateContractIndividual({this.quoteID, this.customerId});

  @override
  _GenerateContractState createState() => _GenerateContractState();
}

class _GenerateContractState extends State<GenerateContractIndividual>
    with SingleTickerProviderStateMixin {
  Database database = getIt<DatabaseImplementation>();
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  SaveAndGenerateContractIndividualModel
      saveAndGenerateContractIndividualModel =
      SaveAndGenerateContractIndividualModel();
  bool isLoading = true;
  @override
  void initState() {
    onApiCall();
    // globals.tabController6 = new TabController(length: 8, vsync: this);
    // globals.tabController6.addListener(_handleTabSelection);
    super.initState();
  }

  void onApiCall() async {
    print('customer Id${widget.customerId}');
    User _user = await Prefs.getUser();
    saveAndGenerateContractIndividualModel =
        await database.saveAndGenerateContactIndividual(
      SaveAndGenerateContractIndivualCredential(
        accountId: _user.accountId,
        type: 'Individual',
        intCustomerId: widget.customerId,
        //  intCustomerId: '39879',
        intGroupId: '0',
      ),
    );

    globals.tabController6 = new TabController(length: 8, vsync: this);
    globals.tabController6.addListener(_handleTabSelection);
    setState(() {
      isLoading = false;
    });
  }

  void _handleTabSelection() {
    setState(() {
      globals.tabController6.index;
    });
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double tabWidth = width / 3;
    return !isLoading
        ? BaseView<GenerateContractIndividualViewModel>(
            //   onModelReady: (model) => model.getIndividualContractDetails(),
            builder: (context, model, child) {
              if (model.state == ViewState.BUSY) {
                return AppConstant.circularProgressIndicator();
              }
              return Scaffold(
                backgroundColor: Colors.white,
                key: _scaffoldKey,
                appBar: appbar("Contract Customer Details", context,
                    _scaffoldKey, true, true),
                drawer: DrawerWidget(),
                body: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    Container(
                      width: MediaQuery.of(context).size.width,
                      color: Color.fromRGBO(228, 241, 215, 1),
                      child: TabBar(
                        unselectedLabelColor: Colors.grey,
                        labelColor: ThemeApp().purplecolor,
                        indicatorColor: ThemeApp().purplecolor,
                        isScrollable: true,
                        tabs: [
                          Container(
                            child: Text(
                              "Unique Ref. No.",
                              style: TextStyle(
                                  color: globals.tabController6.index == 0
                                      ? ThemeApp().purplecolor
                                      : Colors.grey,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Tab(
                            child: Text("Business Details",
                                style: TextStyle(
                                    color: globals.tabController6.index == 1
                                        ? ThemeApp().purplecolor
                                        : Colors.grey,
                                    fontWeight: FontWeight.bold)),
                          ),
                          Tab(
                            child: Text("Site Address",
                                style: TextStyle(
                                    color: globals.tabController6.index == 2
                                        ? ThemeApp().purplecolor
                                        : Colors.grey,
                                    fontWeight: FontWeight.bold)),
                          ),
                          Tab(
                            child: Text("Billing Address",
                                style: TextStyle(
                                    color: globals.tabController6.index == 3
                                        ? ThemeApp().purplecolor
                                        : Colors.grey,
                                    fontWeight: FontWeight.bold)),
                          ),
                          Tab(
                            child: Text("Energy Account Manager",
                                style: TextStyle(
                                    color: globals.tabController6.index == 4
                                        ? ThemeApp().purplecolor
                                        : Colors.grey,
                                    fontWeight: FontWeight.bold)),
                          ),
                          Tab(
                            child: Text("Electricity",
                                style: TextStyle(
                                    color: globals.tabController6.index == 5
                                        ? ThemeApp().purplecolor
                                        : Colors.grey,
                                    fontWeight: FontWeight.bold)),
                          ),
                          Tab(
                            child: Text("Gas",
                                style: TextStyle(
                                    color: globals.tabController6.index == 6
                                        ? ThemeApp().purplecolor
                                        : Colors.grey,
                                    fontWeight: FontWeight.bold)),
                          ),
                          Tab(
                            child: Text("Direct Debit Agreement",
                                style: TextStyle(
                                    color: globals.tabController6.index == 7
                                        ? ThemeApp().purplecolor
                                        : Colors.grey,
                                    fontWeight: FontWeight.bold)),
                          ),
                        ],
                        controller: globals.tabController6,
                      ),
                    ),
                    Expanded(
                      child: TabBarView(
                        children: [
                          UniqueRefNo(
                            individualModel:
                                saveAndGenerateContractIndividualModel,
                          ),
                          BusinessDetails(
                            individualModel:
                                saveAndGenerateContractIndividualModel,
                          ),
                          SiteAddress(
                            individualModel:
                                saveAndGenerateContractIndividualModel,
                          ),
                          BillingAddress(
                            individualModel:
                                saveAndGenerateContractIndividualModel,
                          ),
                          EnergyAccountManager(
                            individualModel:
                                saveAndGenerateContractIndividualModel,
                          ),
                          Electricity(
                            individualModel:
                                saveAndGenerateContractIndividualModel,
                          ),
                          Gas(
                            individualModel:
                                saveAndGenerateContractIndividualModel,
                          ),
                          DirectDebitAgreement(
                            individualModel:
                                saveAndGenerateContractIndividualModel,
                          ),
                        ],
                        controller: globals.tabController6,
                      ),
                    )
                  ],
                ),
              );
            },
          )
        : AppConstant.circularProgressIndicator();
  }
}
