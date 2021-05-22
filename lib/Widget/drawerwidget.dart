import 'package:flutter/material.dart';
import 'package:pozitive/Core/AppConstact/appConstant.dart';
import 'package:pozitive/Core/AppConstact/appString.dart';
import 'package:pozitive/Core/AppConstact/assetApp.dart';
import 'package:pozitive/Core/Model/user.dart';
import 'package:pozitive/Core/Services/AuthService.dart';
import 'package:pozitive/Pages/Commission/commissionPage.dart';
import 'package:pozitive/Pages/addProspectPage.dart';
import 'package:pozitive/Pages/homepage.dart';
import 'package:pozitive/Pages/loginpage.dart';
import 'package:pozitive/Util/Pref.dart';
import 'package:pozitive/Pages/profile.dart';
import 'package:pozitive/Pages/appointmentPage.dart';
import 'package:provider/provider.dart';
import 'package:pozitive/Util/dualFuel_Pref.dart';
import 'package:pozitive/Core/ViewModel/AddProspectClearTabs.dart';
import 'package:pozitive/Util/PrefBusinessType/PrefBusinessType.dart';

import 'package:pozitive/Util/PrefBusinessType/GasPrefBusinessType.dart';
import 'package:pozitive/Util/gas_pref.dart';
import 'package:pozitive/Util/PrefBusinessType/ElePrefBusines.dart';
import 'package:pozitive/Util/electricity_pref.dart';

class DrawerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      value: AutService().user,
      initialData: User(),
      child: DrawerWidgetView(),
    );
  }
}

class DrawerWidgetView extends StatefulWidget {
  @override
  _DrawerWidgetViewState createState() => _DrawerWidgetViewState();
}

class _DrawerWidgetViewState extends State<DrawerWidgetView> {
  Color devidercolor = Color.fromRGBO(75, 78, 123, 1);

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);

    print('@@@@@@@@@${user.accountId}');
    var shortestSide = MediaQuery.of(context).size.shortestSide;
    var useMobileLayout = shortestSide < 600;
    return SizedBox(
      width: MediaQuery.of(context).size.width * .85,
      child: Drawer(
        child: Container(
          color: Color.fromRGBO(39, 40, 58, 1),
          child: ListView(
            children: <Widget>[
              InkWell(
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  color: Color.fromRGBO(24, 26, 39, 1),
                  child: Padding(
                    padding: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * 0.04,
                        bottom: MediaQuery.of(context).size.height * 0.04),
                    child: Row(
                      children: <Widget>[
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.03,
                        ),
                        user != null
                            ? Container(
                                height:
                                    MediaQuery.of(context).size.width * 0.17,
                                width: MediaQuery.of(context).size.width * 0.17,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                        image: AssetImage(AppAssets.logo))),
                              )
                            : Container(
                                height:
                                    MediaQuery.of(context).size.width * 0.17,
                                width: MediaQuery.of(context).size.width * 0.17,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                        image: AssetImage(AppAssets.logo))),
                              ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.02,
                        ),
                        user != null
                            ? Text(
                                " ${user.accountId}",
                                style: TextStyle(color: Colors.white),
                              )
                            : Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    "tech@pozitive.energy",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize:
                                            MediaQuery.of(context).size.height *
                                                .027),
                                  ),
                                  Text(
                                    "Group/Basket",
                                    style: TextStyle(
                                        color: Colors.grey,
                                        fontSize:
                                            MediaQuery.of(context).size.height *
                                                .018),
                                  )
                                ],
                              )
                      ],
                    ),
                  ),
                ),
                onTap: () {
                  Navigator.of(context).pushReplacement(
                      new MaterialPageRoute(builder: (context) => Profile()));
                },
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width * 0.03,
                ),
                child: Column(
                  children: <Widget>[
                    InkWell(
                      child: Row(
                        children: <Widget>[
                          Image.asset(
                            AppAssets.dashboard,
                            scale: 8,
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.05,
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width * .7,
                            child: Padding(
                              padding: EdgeInsets.only(
                                  top: MediaQuery.of(context).size.height * .04,
                                  bottom:
                                      MediaQuery.of(context).size.height * .04),
                              child: Text(
                                AppString.dashboard,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize:
                                        MediaQuery.of(context).size.height *
                                            0.022,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                            decoration: BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(color: devidercolor))),
                          )
                        ],
                      ),
                      onTap: () {
                        if (Navigator.canPop(context)) {
                          Navigator.pop(context);
                        }
                        Navigator.of(context).pushReplacement(
                            new MaterialPageRoute(
                                builder: (context) => new HomePage()));
                      },
                    ),
                    InkWell(
                      child: Row(
                        children: <Widget>[
                          Image.asset(
                            AppAssets.addQuotationIndividual,
                            scale: 8,
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.05,
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width * .7,
                            child: Padding(
                              padding: EdgeInsets.only(
                                  top: MediaQuery.of(context).size.height * .04,
                                  bottom:
                                      MediaQuery.of(context).size.height * .04),
                              child: Text(
                                AppString.addProspect,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize:
                                        MediaQuery.of(context).size.height *
                                            0.022,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                            decoration: BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(color: devidercolor))),
                          )
                        ],
                      ),
                      onTap: () async {
                        User _user = await Prefs.getUser();
                        if (Navigator.canPop(context)) {
                          Navigator.pop(context);
                        }
                        //  DFPref.clearDFEleValues();
                        DFPref.clearDFEleValues();
                        DFPref.clearDFGasValues();
                        DFPref.clearDFBusinessValues();
                        DFPref.clearDFSiteAddValues();
                        DFPref.clearDFBillAddValues();
                        BusinessTypePref.clearDFOtherBusinessTypeAdd();
                        BusinessTypePref.clearDFLtdBusiness();
                        BusinessTypePref.clearDFCharityBusiness();
                        BusinessTypePref.clearDFLLPBusiness();
                        BusinessTypePref.clearDFLLCBusiness();
                        BusinessTypePref.clearDFSoleBusiness();
                        BusinessTypePref.clearDFPartnerBusiness();
                        DFPref.clearDFPrimaryContactValues();
                        DFPref.clearDFEAMValues();
                        DFPref.clearDFPaymentValues();
                        DFPref.clearDFPartnerValues();
                        DFPref.clearDFGroupValues();
                        ElectricityPref.clearEleEleValues();
                        ElectricityPref.clearEleBusinessValues();
                        ElectricityPref.clearEleSiteAddValues();
                        ElectricityPref.clearEleBillAddValues();
                        EleBusinessTypePref.clearELEOtherBusiness();
                        EleBusinessTypePref.clearELELTDBusiness();
                        EleBusinessTypePref.clearELECharityBusiness();
                        EleBusinessTypePref.clearELELLPBusiness();
                        EleBusinessTypePref.clearELELLCBusiness();
                        EleBusinessTypePref.clearELESoleBusiness();
                        EleBusinessTypePref.clearELEPartnerBusiness();
                        ElectricityPref.clearELEPrimaryContactValues();
                        ElectricityPref.clearEleEAMValues();
                        ElectricityPref.clearElePaymentValues();
                        ElectricityPref.clearElePartnerValues();
                        ElectricityPref.clearEleGroupValues();
                        GasPref.clearGasGasValues();
                        GasPref.clearGasBusinessValues();
                        GasPref.clearGasSiteAddressValues();
                        GasPref.clearGasBillAddressValues();
                        GasBusinessTypePref.clearGASOtherBusiness();
                        GasBusinessTypePref.clearGASLTDBusiness();
                        GasBusinessTypePref.clearGASCharityBusiness();
                        GasBusinessTypePref.clearGASLLPBusiness();
                        GasBusinessTypePref.clearGASLLCBusiness();
                        GasBusinessTypePref.clearGASSoleBusiness();
                        GasBusinessTypePref.clearGASPartnerBusiness();
                        GasPref.clearGASPrimaryContactValues();
                        GasPref.clearGasEAMValues();
                        GasPref.clearGasPaymentValues();
                        GasPref.clearGasPartnerValues();
                        GasPref.clearGasGroupValues();

                        // Navigator.of(context).push(new MaterialPageRoute(builder: (context)=>AddQuotationIndividualPage()));
                        Navigator.of(context).push(
                          new MaterialPageRoute(
                              builder: (context) => AddProspectPage(
                                    accountId: _user.accountId,
                                  )),
                        );
                      },
                    ),
                    InkWell(
                      child: Row(
                        children: <Widget>[
                          Image.asset(
                            AppAssets.addQuotationGroup,
                            scale: 8,
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.05,
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width * .7,
                            child: Padding(
                              padding: EdgeInsets.only(
                                  top: MediaQuery.of(context).size.height * .04,
                                  bottom:
                                      MediaQuery.of(context).size.height * .04),
                              child: Text(
                                AppString.commission,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize:
                                        MediaQuery.of(context).size.height *
                                            0.022,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                            decoration: BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(color: devidercolor))),
                          )
                        ],
                      ),
                      onTap: () {
                        if (Navigator.canPop(context)) {
                          Navigator.pop(context);
                        }
                        Navigator.of(context).pushReplacement(
                            new MaterialPageRoute(
                                builder: (context) => CommissionPage()));

//                        Navigator.of(context).push(new MaterialPageRoute(builder: (context)=>GroupQuotationPage()));
                      },
                    ),
                    InkWell(
                      child: Row(
                        children: <Widget>[
                          Image.asset(
                            AppAssets.requestQuoteIndividual,
                            scale: 8,
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.05,
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width * .7,
                            child: Padding(
                              padding: EdgeInsets.only(
                                  top: MediaQuery.of(context).size.height * .04,
                                  bottom:
                                      MediaQuery.of(context).size.height * .04),
                              child: Text(
                                "Request Quote",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize:
                                        MediaQuery.of(context).size.height *
                                            0.022,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                            decoration: BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(color: devidercolor))),
                          )
                        ],
                      ),
                      onTap: () {
                        if (Navigator.canPop(context)) {
                          Navigator.pop(context);
                        }
                        Navigator.of(context).push(
                          new MaterialPageRoute(builder: (context) => HomePage()
                              // builder: (context) => DashBordDetailsPage(
                              //   type: AppString.group,
                              //   title: AppString.requested,
                              // ),
                              ),
                        );
                      },
                    ),
                    InkWell(
                      child: Row(
                        children: <Widget>[
                          Image.asset(
                            AppAssets.appointment,
                            scale: 8,
                            color: Color(0xff0C9C53),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.05,
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width * .7,
                            child: Padding(
                              padding: EdgeInsets.only(
                                  top: MediaQuery.of(context).size.height * .04,
                                  bottom:
                                      MediaQuery.of(context).size.height * .04),
                              child: Text(
                                AppString.appointment,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize:
                                        MediaQuery.of(context).size.height *
                                            0.022,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                            decoration: BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(color: devidercolor))),
                          )
                        ],
                      ),
                      onTap: () {
                        if (Navigator.canPop(context)) {
                          Navigator.pop(context);
                        }
                        Navigator.of(context).push(
                          new MaterialPageRoute(
                              builder: (context) => Appointment()),
                        );
                      },
                    ),
                    InkWell(
                      child: Row(
                        children: <Widget>[
                          Image.asset(
                            "assets/menu/Request-Quote-Group.png",
                            scale: 8,
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.05,
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width * .7,
                            child: Padding(
                              padding: EdgeInsets.only(
                                  top: MediaQuery.of(context).size.height * .04,
                                  bottom:
                                      MediaQuery.of(context).size.height * .04),
                              child: Text(
                                "Profile",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize:
                                        MediaQuery.of(context).size.height *
                                            0.022,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                            decoration: BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(color: devidercolor))),
                          )
                        ],
                      ),
                      onTap: () {
                        if (Navigator.canPop(context)) {
                          Navigator.pop(context);
                        }
                        // Navigator.of(context).push(new MaterialPageRoute(builder: (context)=>AddProspectPage()));
                        Navigator.of(context).push(new MaterialPageRoute(
                            builder: (context) => Profile()));
                      },
                    ),
                    InkWell(
                      child: Row(
                        children: <Widget>[
                          Image.asset(
                            "assets/menu/Logout.png",
                            scale: 8,
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.05,
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width * .7,
                            child: Padding(
                              padding: EdgeInsets.only(
                                  top: MediaQuery.of(context).size.height * .04,
                                  bottom:
                                      MediaQuery.of(context).size.height * .04),
                              child: Text(
                                "Logout",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize:
                                        MediaQuery.of(context).size.height *
                                            0.022,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                            decoration: BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(color: devidercolor))),
                          )
                        ],
                      ),
                      onTap: () {
                        if (Navigator.canPop(context)) {
                          Navigator.pop(context);
                        }
                        Prefs.logOut();
                        AppConstant.showSuccessToast(
                            context, AppString.logoutMsg);

                        Navigator.of(context).pushReplacement(
                            new MaterialPageRoute(
                                builder: (context) => LogInPage()));
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.08,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
