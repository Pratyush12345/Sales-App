import 'package:flutter/material.dart';
import 'package:pozitive/Core/Model/user.dart';
import 'package:pozitive/Core/ViewModel/DualFuelAddProspect-viewModel/InsertAddProspect-viewModel.dart';
import 'package:pozitive/Core/baseview.dart';
import 'Tab/PrimaryContactDetails.dart';
import 'package:pozitive/Util/theme.dart';
import 'package:provider/provider.dart';
import 'Tab/BusinessTypeDetailsDualFuel.dart';
import 'Tab/businessDetailsTab.dart';
import 'Tab/pymentDetails.dart';
import 'Tab/billingAddressTab.dart';
import 'Tab/energyAccountManagerTab.dart';
import 'Tab/groupDetails.dart';
import 'Tab/partnerDetails.dart';
import 'Tab/siteAddressTab.dart';
import 'Tab/electricityTab.dart';
import 'Tab/gastab.dart';
import 'package:pozitive/Util/global.dart' as globals;
import 'package:pozitive/Widget/drawerwidget.dart';

class DualFuelTabView extends StatefulWidget {
  bool fieldsDisable = false;
  DualFuelTabView({this.fieldsDisable});
  @override
  _DualFuelTabViewState createState() => _DualFuelTabViewState();
}

class _DualFuelTabViewState extends State<DualFuelTabView>
    with SingleTickerProviderStateMixin {
  // TabController _tabController;
  bool isSelected = false;

  List<Tab> _tabs = List<Tab>();
  List<Widget> _generalWidgets = List<Widget>();

  @override
  void initState() {
    _tabs = getTabs(11);
    globals.tabController2 = getTabController();
    super.initState();
  }

  TabController getTabController() {
    return TabController(length: _tabs.length, vsync: this);
  }

  void updatePage() {
    print('ffffffffffff${_tabs.length}');
    _tabs = getTabs(_tabs.length + 1);

    globals.tabController2.index = 0;
    globals.tabController2 = TabController(length: 11, vsync: this);

    setState(() {});
  }

  List<Tab> getTabs(int count) {
    _tabs.clear();
    for (int i = 0; i < count; i++) {
      _tabs.add(getTab(i));
    }
    return _tabs;
  }

  Tab getTab(int widgetNumber) {
    new Tab(
      child: Text(
        "Electricity",
        style: TextStyle(
            color: ThemeApp().purplecolor, fontWeight: FontWeight.bold),
      ),
    );
    new Tab(
      child: Text("Gas",
          style: TextStyle(
              color: ThemeApp().purplecolor, fontWeight: FontWeight.bold)),
    );
    new Tab(
      child: Text("Business Details",
          style: TextStyle(
              color: ThemeApp().purplecolor, fontWeight: FontWeight.bold)),
    );
    new Tab(
      child: Text("Site Address",
          style: TextStyle(
              color: ThemeApp().purplecolor, fontWeight: FontWeight.bold)),
    );
    new Tab(
      child: Text("Billing Address",
          style: TextStyle(
              color: ThemeApp().purplecolor, fontWeight: FontWeight.bold)),
    );
    new Tab(
      child: Text("Primary Contact Detail",
          style: TextStyle(
              color: ThemeApp().purplecolor, fontWeight: FontWeight.bold)),
    );
    new Tab(
      child: Text("Energy Account Manager",
          style: TextStyle(
              color: ThemeApp().purplecolor, fontWeight: FontWeight.bold)),
    );
    new Tab(
      child: Text("Business OwnerShip Details",
          style: TextStyle(
              color: ThemeApp().purplecolor, fontWeight: FontWeight.bold)),
    );
    new Tab(
      child: Text("Payment Details",
          style: TextStyle(
              color: ThemeApp().purplecolor, fontWeight: FontWeight.bold)),
    );
    new Tab(
      child: Text("Partner Details",
          style: TextStyle(
              color: ThemeApp().purplecolor, fontWeight: FontWeight.bold)),
    );
    new Tab(
      child: Text("Group Details",
          style: TextStyle(
              color: ThemeApp().purplecolor, fontWeight: FontWeight.bold)),
    );
  }

  List<Widget> getTabRow() {
    if (_tabs.length == 10) {
      return [
        new Tab(
          child: Text(
            "Electricity",
            style: TextStyle(
                color: ThemeApp().purplecolor, fontWeight: FontWeight.bold),
          ),
        ),
        new Tab(
          child: Text("Gas",
              style: TextStyle(
                  color: ThemeApp().purplecolor, fontWeight: FontWeight.bold)),
        ),
        new Tab(
          child: Text("Business Details",
              style: TextStyle(
                  color: ThemeApp().purplecolor, fontWeight: FontWeight.bold)),
        ),
        new Tab(
          child: Text("Site Address",
              style: TextStyle(
                  color: ThemeApp().purplecolor, fontWeight: FontWeight.bold)),
        ),
        new Tab(
          child: Text("Billing Address",
              style: TextStyle(
                  color: ThemeApp().purplecolor, fontWeight: FontWeight.bold)),
        ),
        new Tab(
          child: Text("Primary Contact Detail",
              style: TextStyle(
                  color: ThemeApp().purplecolor, fontWeight: FontWeight.bold)),
        ),
        new Tab(
          child: Text("Energy Account Manager",
              style: TextStyle(
                  color: ThemeApp().purplecolor, fontWeight: FontWeight.bold)),
        ),
        new Tab(
          child: Text("Payment Details",
              style: TextStyle(
                  color: ThemeApp().purplecolor, fontWeight: FontWeight.bold)),
        ),
        new Tab(
          child: Text("Partner Details",
              style: TextStyle(
                  color: ThemeApp().purplecolor, fontWeight: FontWeight.bold)),
        ),
        new Tab(
          child: Text("Group Details",
              style: TextStyle(
                  color: ThemeApp().purplecolor, fontWeight: FontWeight.bold)),
        ),
      ];
    } else {
      return [
        new Tab(
          child: Text(
            "Electricity",
            style: TextStyle(
                color: ThemeApp().purplecolor, fontWeight: FontWeight.bold),
          ),
        ),
        new Tab(
          child: Text("Gas",
              style: TextStyle(
                  color: ThemeApp().purplecolor, fontWeight: FontWeight.bold)),
        ),
        new Tab(
          child: Text("Business Details",
              style: TextStyle(
                  color: ThemeApp().purplecolor, fontWeight: FontWeight.bold)),
        ),
        new Tab(
          child: Text("Site Address",
              style: TextStyle(
                  color: ThemeApp().purplecolor, fontWeight: FontWeight.bold)),
        ),
        new Tab(
          child: Text("Billing Address",
              style: TextStyle(
                  color: ThemeApp().purplecolor, fontWeight: FontWeight.bold)),
        ),
        new Tab(
          child: Text("Primary Contact Detail",
              style: TextStyle(
                  color: ThemeApp().purplecolor, fontWeight: FontWeight.bold)),
        ),
        new Tab(
          child: Text("Energy Account Manager",
              style: TextStyle(
                  color: ThemeApp().purplecolor, fontWeight: FontWeight.bold)),
        ),
        new Tab(
          child: Text("Business OwnerShip Details",
              style: TextStyle(
                  color: ThemeApp().purplecolor, fontWeight: FontWeight.bold)),
        ),
        new Tab(
          child: Text("Payment Details",
              style: TextStyle(
                  color: ThemeApp().purplecolor, fontWeight: FontWeight.bold)),
        ),
        new Tab(
          child: Text("Partner Details",
              style: TextStyle(
                  color: ThemeApp().purplecolor, fontWeight: FontWeight.bold)),
        ),
        new Tab(
          child: Text("Group Details",
              style: TextStyle(
                  color: ThemeApp().purplecolor, fontWeight: FontWeight.bold)),
        ),
      ];
    }
  }

  List<Widget> getWidgets() {
    if (_tabs.length == 10) {
      return [
        ElecticityData(
          fieldsDisable: widget.fieldsDisable ?? false,
        ),
        GasTab(),
        BusinessDetailsTab(
          increment: updatePage,
        ),
        SiteAddressTab(),
        BillingAddressTab(),
        PrimaryContactDetail(),
        EnergyAccountManager(),
        PaymentDetailsTab(),
        PartnerDetailsTab(),
        GroupDetailsTab()
      ];
    } else {
      return [
        ElecticityData(),
        GasTab(),
        BusinessDetailsTab(
          increment: updatePage,
        ),
        SiteAddressTab(),
        BillingAddressTab(),
        PrimaryContactDetail(),
        EnergyAccountManager(),
        DualFuelBusinessTypeDetails(),
        PaymentDetailsTab(),
        PartnerDetailsTab(),
        GroupDetailsTab()
      ];
    }
  }

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);

    return user.accountId != null
        ? BaseView<DualFuelAddProspectViewModel>(
            // onModelReady: (model)=>model.getDualFuelProspect(DualFuelInsertAddProspectCredential()),

            builder: (context, model, child) {
            return Scaffold(
              appBar: AppBar(
                title: Text('DualFuel'),
              ),
              //drawer: DrawerWidget(),
              backgroundColor: Colors.white,
              body: Column(
                children: <Widget>[
                  Container(
                    color: Color.fromRGBO(228, 241, 215, 1),
                    child: TabBar(
                      unselectedLabelColor: Colors.grey,
                      labelColor: ThemeApp().purplecolor,
                      indicatorColor: ThemeApp().purplecolor,
                      isScrollable: true,
                      tabs: getTabRow(),
                      controller: globals.tabController2,
                    ),
                  ),
                  Expanded(
                    child: TabBarView(
                      children: getWidgets(),
                      controller: globals.tabController2,
                    ),
                  )
                ],
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
