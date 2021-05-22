import 'package:flutter/material.dart';
import 'package:pozitive/Core/Model/user.dart';
import 'package:pozitive/Core/ViewModel/EleAddProspectViewModels/ele_ele_viewmodel.dart';
import 'package:pozitive/Core/baseview.dart';
import 'package:pozitive/Pages/Add-Prospect-FormTab/Electicity/Tab/BusinessTypeDetailsEle.dart';
import 'package:pozitive/Pages/Add-Prospect-FormTab/Electicity/Tab/PrimaryContactDetails.dart';
import 'package:pozitive/Util/theme.dart';
import 'package:provider/provider.dart';
import 'Tab/businessDetailsTab.dart';
import 'Tab/pymentDetails.dart';
import 'Tab/billingAddressTab.dart';
import 'Tab/energyAccountManagerTab.dart';
import 'Tab/groupDetails.dart';
import 'Tab/partnerDetails.dart';
import 'Tab/siteAddressTab.dart';
import 'Tab/electricityTab.dart';
import 'package:pozitive/Util/global.dart' as globals;
import 'package:pozitive/Widget/drawerwidget.dart';

class ElecticityTab extends StatefulWidget {
  @override
  _ElecticityTabState createState() => _ElecticityTabState();
}

class _ElecticityTabState extends State<ElecticityTab>
    with SingleTickerProviderStateMixin {
  // TabController _tabController;
  List<Tab> _tabs = List<Tab>();
  List<Widget> _generalWidgets = List<Widget>();

  @override
  void initState() {
    _tabs = getTabs(10);
    globals.tabController1 = getTabController();
    super.initState();
  }

  TabController getTabController() {
    return TabController(length: _tabs.length, vsync: this);
  }

  void updatePage() {
    if (globals.tabController1.length == 9) {
      setState(() {
        _tabs = getTabs(_tabs.length + 1);
        globals.tabController1.index = 0;

        globals.tabController1 = TabController(length: 10, vsync: this);
        print('gassssssss${_tabs.length}');
      });
    }
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
    if (_tabs.length == 9) {
      return [
        new Tab(
          child: Text(
            "Electricity",
            style: TextStyle(
                color: ThemeApp().purplecolor, fontWeight: FontWeight.bold),
          ),
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
    if (_tabs.length == 9) {
      return [
        Electicity(),
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
        Electicity(),
        BusinessDetailsTab(
          increment: updatePage,
        ),
        SiteAddressTab(),
        BillingAddressTab(),
        PrimaryContactDetail(),
        EnergyAccountManager(),
        EleBusinessTypeDetails(),
        PaymentDetailsTab(),
        PartnerDetailsTab(),
        GroupDetailsTab()
      ];
    }
  }

  void _handleTabSelection() {
    setState(() {
      globals.tabController1.index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);

    return user.accountId != null
        ? BaseView<EleEleAddProspectViewModel>(
            // onModelReady: (model)=>model.getDualFuelProspect(DualFuelInsertAddProspectCredential()),

            builder: (context, model, child) {
            return Scaffold(
              appBar: AppBar(
                title: Text('Electricity'),
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
                      controller: globals.tabController1,
                    ),
                  ),
                  Expanded(
                    child: TabBarView(
                      children: getWidgets(),
                      controller: globals.tabController1,
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
