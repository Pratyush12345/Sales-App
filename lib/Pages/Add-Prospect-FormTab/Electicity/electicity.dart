import 'package:flutter/material.dart';
import 'package:pozitive/Core/Model/user.dart';
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
import 'package:pozitive/Util/electricity_pref.dart';
import 'package:pozitive/Core/Model/Api/Electricity-InsertAddProspect/EleBusCredential.dart';

class ElecticityTab extends StatefulWidget {

  @override
  _ElecticityTabState createState() => _ElecticityTabState();
}

class _ElecticityTabState extends State<ElecticityTab>
    with TickerProviderStateMixin {
  // TabController _tabController;
  List<Tab> _tabs = List<Tab>();
  List<Widget> _generalWidgets = List<Widget>();

  @override
  void initState() {
    _tabs = getTabs(9);
    globals.tabController1 = getTabController();
    super.initState();
  }

  TabController getTabController() {
    return TabController(length: _tabs.length, vsync: this);
  }

  @override
  dispose() {
    globals.tabController1.dispose(); // you need this
    super.dispose();
  }

  EleBusCredential business;

  void updatePage() async {
    business = await ElectricityPref.getElectricityBusValues();

    setState(() {
      if (business.business_Type != null) {
        print(business?.business_Type.toString() + 'This is business type');

        if (globals.tabController1.length == 9) {
          print('gassssssss${_tabs.length}');
          globals.tabController1.index = 0;

          _tabs = getTabs(_tabs.length + 1);
          globals.tabController1 = TabController(length: 10, vsync: this);
          globals.tabController1 = getTabController();
          print('gassssssssdasffffffffffs${_tabs.length}');
        }
      }
    });
  }

  // void updatePage() {
  //   if (globals.tabController1.length == 9) {
  //     _tabs = getTabs(_tabs.length + 1);
  //     globals.tabController1.index = 0;
  //     globals.tabController1 = TabController(length: 10, vsync: this);
  //     print('gassssssss${_tabs.length}');
  //   }
  // }
  void removeTab() async {
    business = await ElectricityPref.getElectricityBusValues();
    if (business.business_Type.isEmpty) {
      globals.tabController1 = TabController(length: 10, vsync: this);
      _tabs = getTabs(_tabs.length - 1);
      globals.tabController1.index = 0;
      globals.tabController1 = getTabController();
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
        Electicity(
          incrementTab: updatePage,
        ),
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
        BusinessDetailsTab(),
        SiteAddressTab(),
        BillingAddressTab(),
        PrimaryContactDetail(),
        EnergyAccountManager(),
        EleBusinessTypeDetails(),
        PaymentDetailsTab(),
        PartnerDetailsTab(),
        GroupDetailsTab(removeTab: removeTab)
      ];
    }
  }

  // void _handleTabSelection() {
  //   setState(() {
  //     globals.tabController1.index;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);

    return Scaffold(
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
  }
}
