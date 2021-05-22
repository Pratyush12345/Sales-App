import 'package:flutter/material.dart';

import 'package:pozitive/Widget/drawerwidget.dart';
import 'package:pozitive/Core/AppConstact/appString.dart';
import '../Widget/appointmentWidget.dart';
import 'package:pozitive/Core/Model/user.dart';
import 'package:pozitive/Core/Services/AuthService.dart';
import 'package:provider/provider.dart';
import 'package:pozitive/Widget/appbar.dart';

class Appointment extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      value: AutService().user,
      initialData: User(),
      child: AppointmentPage(),
    );
  }
}

class AppointmentPage extends StatefulWidget {
  @override
  _AppointmentPageState createState() => _AppointmentPageState();
}

class _AppointmentPageState extends State<AppointmentPage> {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: appbar("Profile", context, _scaffoldKey, true, true),
      drawer: DrawerWidget(),
      body: Column(
        children: [
          Container(
            color: Colors.white,
            width: MediaQuery.of(context).size.width * .45,
            height: MediaQuery.of(context).size.height * .092,
            child: Row(
              children: <Widget>[
                Container(
                  height: MediaQuery.of(context).size.height * .092,
                  width: MediaQuery.of(context).size.width * .16,
                  child: Center(
                    child: Image.asset(
                      'assets/Contract-sent-but-not.png',
                      scale: 6,
                    ),
                  ),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                        colors: [
                          Color.fromRGBO(122, 68, 191, 1),
                          Color.fromRGBO(146, 112, 207, 1)
                        ]),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * .29,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "title",
                        style: TextStyle(
                            color: Color.fromRGBO(0, 0, 0, 1),
                            fontSize: MediaQuery.of(context).size.height * .014,
                            fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * .005,
                      ),
                      Text("12",
                          style: TextStyle(
                              color: Color.fromRGBO(48, 142, 58, 1),
                              fontSize:
                                  MediaQuery.of(context).size.height * .02,
                              fontWeight: FontWeight.bold))
                    ],
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * .04,
          ),
          InkWell(
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.063,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(
                    Icons.add,
                    color: Colors.white,
                    size: MediaQuery.of(context).size.height * 0.04,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * .02,
                  ),
                  Text(
                    AppString.aDDQUOT,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: MediaQuery.of(context).size.height * 0.0182,
                        fontWeight: FontWeight.bold),
                  )
                ],
              ),
              decoration: BoxDecoration(
                  color: Color.fromRGBO(155, 119, 217, 1),
                  borderRadius: BorderRadius.circular(30)),
            ),
            onTap: () {
              Navigator.of(context).push(new MaterialPageRoute(
                  builder: (context) => AppointmentWidget()));
            },
          ),
        ],
      ),
    );
  }
}
