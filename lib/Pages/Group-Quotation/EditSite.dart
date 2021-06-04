import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pozitive/Util/theme.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as htp;
import 'dart:convert';
import 'package:pozitive/Core/Model/user.dart';
import 'package:pozitive/Util/Pref.dart';
import 'package:pozitive/Core/Model/group_details_sub_model.dart';
TextEditingController mpan1 = TextEditingController();
TextEditingController mpan2 = TextEditingController();
TextEditingController mpan3 = TextEditingController();
TextEditingController mpan4 = TextEditingController();
TextEditingController mpan5 = TextEditingController();
TextEditingController mpan6 = TextEditingController();
TextEditingController mpan7 = TextEditingController();
TextEditingController mprnedit = TextEditingController();

TextEditingController dayEAC = TextEditingController();
TextEditingController nightEAC = TextEditingController();
TextEditingController strAq = TextEditingController();
TextEditingController conStartDate = TextEditingController();


Container dialogcontainer(BuildContext context, BuildContext ctx,List<EachyYearList> groupDetailslst,int index,String type) {
  final ThemeApp themeApp = ThemeApp();
  Future<void> Editsitecallapi() async{
    User _user = await Prefs.getUser();
    htp.Response response = await htp.post(
        Uri.parse('https://api.boshposh.com/api/Partner/GroupContractEditSite'),
        headers: {"Content-Type": "application/json"},
        // body: (json1.substring(1, lstLength - 1)),
        body: json.encode({
          "AccountId": _user.accountId,
          "GroupId": '${groupDetailslst[index].grpId.toString()}',
          "QuoteId": '${groupDetailslst[index].QuoteId.toString()}',
          "type": "group",
          "strfullMpan": mpan1.text + mpan2.text + mpan3.text + mpan4.text + mpan5.text + mpan6.text + mpan7.text ,
          "strDayEAC": dayEAC.text,
          "strNightEAC": nightEAC.text,
          "strEweEAC": "",
          "strMPRN": mprnedit.text,
          "strAQ": strAq.text,
          "dteContractStartDate": conStartDate.text,
          "dteContractEndDate":
          groupDetailslst[index].contractEndDate,
        }));
    var res = jsonDecode(response.body);
    print(response.body);
  }
  return Container(
    height: type == "MPAN" ? MediaQuery.of(context).size.height * 0.6 : MediaQuery.of(context).size.height * 0.47,
    width: MediaQuery.of(context).size.width ,
    child: ListView(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 50,
              color: Color.fromRGBO(128, 189, 40, 1),
              child: Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                        left: 10, right: 10),
                    child: Text(
                      "Edit Site Detail (GROUPID :- ${groupDetailslst[index].grpId})",
                      style: TextStyle(
                        fontSize: MediaQuery.of(context)
                            .size
                            .height *
                            .020,
                        color: Colors.white,
                        //fontWeight: ,
                      ),
                    ),
                  ),
                  CupertinoButton(
                    onPressed: () {
                      Navigator.of(ctx).pop();
                    },
                    minSize: 16,
                    padding: EdgeInsets.zero,
                    // color: Colors.green,
                    child: Icon(
                      FontAwesomeIcons.times,
                      color: Colors.white,
                      size: 20,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height:
              MediaQuery.of(context).size.height *
                  0.015,
            ),
            Padding(
              padding: EdgeInsets.only(left: 20,),
              child: Text(
                type,
                style: TextStyle(
                    fontSize: MediaQuery.of(context)
                        .size
                        .height *
                        .015,
                    color: Color.fromRGBO(31, 33, 29, 1)),
              ),
            ),
            SizedBox(
              height:
              MediaQuery.of(context).size.height *
                  0.010,
            ),
            type == "MPAN" ? Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 20,right: 10),
                  child: Container(
                    height: MediaQuery.of(context).size.height * .052,
                    width: MediaQuery.of(context).size.width *0.7,
                    child: Row(
                      children: [
                        Expanded(

                          child: Container(
                            margin: EdgeInsets.only(left: 10),
                            child:
                            TextFormField(
                              controller: mpan1,
                            ),
                            // width: MediaQuery.of(context).size.width *0.2,
                            decoration: BoxDecoration(
                                border: Border(
                                    right: BorderSide(
                                        color: Color.fromRGBO(
                                            128, 189, 40, 1)))),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            margin: EdgeInsets.only(left: 10),
                            child: TextFormField(
                              controller: mpan2,
                            ),
                            // width: MediaQuery.of(context).size.width *0.25,
                            decoration: BoxDecoration(
                                border: Border(
                                    right: BorderSide(
                                        color: Color.fromRGBO(
                                            128, 189, 40, 1)))),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            margin: EdgeInsets.only(left: 10),
                            child: TextFormField(
                              controller: mpan3,
                            ),
                            // width: MediaQuery.of(context).size.width *0.2,
                            decoration: BoxDecoration(
                                border: Border(
                                    right: BorderSide(
                                        color: Color.fromRGBO(
                                            128, 189, 40, 1)))),
                          ),
                        ),
                      ],
                    ),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                            color: themeApp.textfieldbordercolor, width: 2),
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(5),
                            bottomRight: Radius.circular(5))),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 20,right: 10),
                  child: Container(
                    height: MediaQuery.of(context).size.height * .052,
                    width: MediaQuery.of(context).size.width *0.7,
                    child: Row(
                      children: [
                        Expanded(

                          child: Container(
                            margin: EdgeInsets.only(left: 10),
                            child: TextFormField(
                              controller: mpan4,
                            ),
                            // width: MediaQuery.of(context).size.width *0.2,
                            decoration: BoxDecoration(
                                border: Border(
                                    right: BorderSide(
                                        color: Color.fromRGBO(
                                            128, 189, 40, 1)))),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            margin: EdgeInsets.only(left: 10),
                            child: TextFormField(
                              controller: mpan5,
                            ),
                            // width: MediaQuery.of(context).size.width *0.25,
                            decoration: BoxDecoration(
                                border: Border(
                                    right: BorderSide(
                                        color: Color.fromRGBO(
                                            128, 189, 40, 1)))),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            margin: EdgeInsets.only(left: 10),
                            child:
                            TextFormField(
                              controller: mpan6,
                            ),
                            // width: MediaQuery.of(context).size.width *0.2,
                            decoration: BoxDecoration(
                                border: Border(
                                    right: BorderSide(
                                        color: Color.fromRGBO(
                                            128, 189, 40, 1)))),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            margin: EdgeInsets.only(left: 10),
                            child: TextFormField(
                              controller: mpan7,
                            ),
                            // width: MediaQuery.of(context).size.width *0.2,
                            decoration: BoxDecoration(
                                border: Border(
                                    right: BorderSide(
                                        color: Color.fromRGBO(
                                            128, 189, 40, 1)))),
                          ),
                        ),
                      ],
                    ),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                            color: themeApp.textfieldbordercolor, width: 2),
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(5),
                            bottomRight: Radius.circular(5))),
                  ),
                ),
              ],
            ) : Column(
              children: [
                Container(
                  margin: EdgeInsets.only(left: 20),
                  width: MediaQuery.of(context).size.width *0.7,
                  height: MediaQuery.of(context).size.height * .052,
                  child: Padding(
                    padding: EdgeInsets.only(left: 5),
                    child: TextFormField(
                      controller: mprnedit,
                    ),
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                        color: themeApp.textfieldbordercolor, width: 2),
                    // borderRadius: BorderRadius.only(
                    //     bottomLeft: Radius.circular(5),
                    //     bottomRight: Radius.circular(5))
                  ),
                ),
              ],
            ),
            SizedBox(
              height:
              MediaQuery.of(context).size.height *
                  0.015,
            ),
            Padding(
              padding: EdgeInsets.only(left: 20,),
              child: Text(
                type == "MPAN" ? "Day EAC" : "AQ",
                style: TextStyle(
                    fontSize: MediaQuery.of(context)
                        .size
                        .height *
                        .015,
                    color: Color.fromRGBO(31, 33, 29, 1)),
              ),
            ),
            SizedBox(
              height:
              MediaQuery.of(context).size.height *
                  0.010,
            ),
            Container(
              margin: EdgeInsets.only(left: 20),
              width: MediaQuery.of(context).size.width *0.7,
              height: MediaQuery.of(context).size.height * .052,
              child: Padding(
                padding: EdgeInsets.only(left: 5),
                child: TextFormField(
                  controller:   type == "MPAN" ?  dayEAC: strAq,
                ),
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                    color: themeApp.textfieldbordercolor, width: 2),
                // borderRadius: BorderRadius.only(
                //     bottomLeft: Radius.circular(5),
                //     bottomRight: Radius.circular(5))
              ),
            ),
            SizedBox(
              height:
              MediaQuery.of(context).size.height *
                  0.015,
            ),
            type == "MPAN" ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 20,),
                  child: Text(
                    "Night EAC",
                    style: TextStyle(
                        fontSize: MediaQuery.of(context)
                            .size
                            .height *
                            .015,
                        color: Color.fromRGBO(31, 33, 29, 1)),
                  ),
                ),
                SizedBox(
                  height:
                  MediaQuery.of(context).size.height *
                      0.010,
                ),
                Container(
                  margin: EdgeInsets.only(left: 20),
                  width: MediaQuery.of(context).size.width *0.7,
                  height: MediaQuery.of(context).size.height * .052,
                  child: Padding(
                    padding: EdgeInsets.only(left: 5),
                    child: TextFormField(
                      controller: nightEAC,
                    ),
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                        color: themeApp.textfieldbordercolor, width: 2),
                    // borderRadius: BorderRadius.only(
                    //     bottomLeft: Radius.circular(5),
                    //     bottomRight: Radius.circular(5))
                  ),
                ),
              ],
            ) : Container(),
            SizedBox(
              height:
              MediaQuery.of(context).size.height *
                  0.015,
            ),
            Padding(
              padding: EdgeInsets.only(left: 20,),
              child: Text(
                "Contract Start Date",
                style: TextStyle(
                    fontSize: MediaQuery.of(context)
                        .size
                        .height *
                        .015,
                    color: Color.fromRGBO(31, 33, 29, 1)),
              ),
            ),
            SizedBox(
              height:
              MediaQuery.of(context).size.height *
                  0.010,
            ),
            Container(
              margin: EdgeInsets.only(left: 20),
              width: MediaQuery.of(context).size.width *0.7,
              height: MediaQuery.of(context).size.height * .052,
              child: Padding(
                padding: EdgeInsets.only(left: 5),
                child: TextFormField(
                  controller: conStartDate,
                ),
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                    color: themeApp.textfieldbordercolor, width: 2),
                // borderRadius: BorderRadius.only(
                //     bottomLeft: Radius.circular(5),
                //     bottomRight: Radius.circular(5))
              ),
            ),
            SizedBox(
              height:
              MediaQuery.of(context).size.height *
                  0.035,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.058,
                child: TextButton(
                  child: Text(
                    "Update",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: MediaQuery.of(context).size.height * 0.019,
                        fontWeight: FontWeight.bold),
                  ),
                  onPressed: () async {
                    await Editsitecallapi();
                    Navigator.of(ctx).pop();
                    showDialog(
                        context: context,
                        builder: (ctx) {
                          return AlertDialog(
                            title: Text(
                              "Successfully Edited site",

                            ),

                            actions: <Widget>[
                              FlatButton(
                                child: Text("ok"),
                                onPressed: () {
                                  Navigator.of(ctx).pop();
                                },
                              ),

                            ],
                          );
                        });
                  },
                ),
                decoration: BoxDecoration(
                    color: Color.fromRGBO(155, 119, 217, 1),
                    borderRadius: BorderRadius.circular(30)),
              ),
            ),
          ],
        ),
      ],

    ),
  );
}