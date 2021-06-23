import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pozitive/Pages/Group-Quotation/Tab/IndividualPriceMpanorMprn.dart';
import 'package:pozitive/Util/theme.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as htp;
import 'dart:convert';
import 'package:pozitive/Core/Model/user.dart';
import 'package:pozitive/Util/Pref.dart';
import 'package:pozitive/Core/Model/group_details_sub_model.dart';
import 'package:pozitive/Core/ViewModel/Group-Quotation/group_quotation/view_group_details_viewmodel.dart';
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

Future<void> Editsite({int index,List groupDetailslst,List groupdetailsprice}) async {
  // setState(ViewState.BUSY);
  var s = groupDetailslst[index].mpan;
  mpan1.text='';
  mpan2.text='';
  mpan3.text='';
  mpan4.text='';
  mpan5.text='';
  mpan6.text='';
  mpan7.text='';
  mprnedit.text = "";
  conStartDate.text = "";
  dayEAC.text = "";
  nightEAC.text = "";
  strAq.text = "";
  if(s.length != 21 && s!="" && s!= null){
    for(int i=0;i<groupdetailsprice.length;i++){
      if(s == groupdetailsprice[i].mpan.substring(8)){
        s = groupdetailsprice[i].mpan;
        break;
      }
    }
  }
  if(s!='' && s.length == 21){

    for(int i=0;i<2;i++){
      mpan1.text +=  s[i];
      //print(s[i]);
    }

    for(int i=2;i<5;i++){
      mpan2.text += s[i];
    }

    for(int i=5;i<8;i++){
      mpan3.text += s[i];
    }
    mpan4.text='';
    for(int i=8;i<10;i++){
      mpan4.text += s[i];
    }
    mpan5.text='';
    for(int i=10;i<14;i++){
      mpan5.text += s[i];
    }
    mpan6.text='';
    for(int i=14;i<18;i++){
      mpan6.text += s[i];
    }
    mpan7.text='';
    for(int i=18;i<=20;i++){
      mpan7.text += s[i];
    }
    // conStartDate.text='';

    // if( widget.groupDetailslst[widget.index].mprn == ''){
    //   dayEAC.text = "0";
    //   nightEAC.text = "0";
    //   strAq.text = '0';
    // }
    // else{
    //   strAq.text = eacvalues[ widget.groupDetailslst[widget.index].mprn].strAq;
    //   // dayEAC.text = eacvalues[ widget.groupDetailslst[widget.index].mpan].EACDay;
    //   // nightEAC.text = eacvalues[ widget.groupDetailslst[widget.index].mpan].EACnight;
    // }
    // dayEAC.text = eacvalues[""].EACDay ?? "";
    // nightEAC.text = eacvalues[""].EACnight ?? "";

  }
  conStartDate.text = groupDetailslst[index].contractStartDate;

  if(groupDetailslst[index].mpan.length == 21){
    dayEAC.text = eacvalues[groupDetailslst[index].mpan.substring(8)].EACDay;
    nightEAC.text = eacvalues[groupDetailslst[index].mpan.substring(8)].EACnight;
  }else{
    dayEAC.text = eacvalues[groupDetailslst[index].mpan].EACDay;
    nightEAC.text = eacvalues[groupDetailslst[index].mpan].EACnight;
  }
  strAq.text = eacvalues[groupDetailslst[index].mprn].strAq;
  mprnedit.text = groupDetailslst[index].mprn;
  print(eacvalues);
  // print(eacvalues[widget.groupDetailslst[widget.index].mpan.substring(8)].EACDay);

}
Future<dynamic> Editsitecallapi({int index,List groupDetailslst1,List groupdetailsprice}) async{
  User _user = await Prefs.getUser();
  htp.Response response1 = await htp.post(
      Uri.parse('https://api.boshposh.com/api/Partner/GroupContractEditSite'),
      headers: {"Content-Type": "application/json"},
      // body: (json1.substring(1, lstLength - 1)),
      body: json.encode({
        "AccountId": _user.accountId,
        "GroupId": '${groupDetailslst1[index].grpId.toString()}',
        "QuoteId": '${groupDetailslst1[index].QuoteId.toString()}',
        "type": "group",
        "strfullMpan": mpan1.text + mpan2.text + mpan3.text + mpan4.text + mpan5.text + mpan6.text + mpan7.text ,
        "strDayEAC": dayEAC.text,
        "strNightEAC": nightEAC.text,
        "strEweEAC": "",
        "strMPRN": mprnedit.text,
        "strAQ": strAq.text,
        "dteContractStartDate": conStartDate.text,
        "dteContractEndDate":
        groupDetailslst1[index].contractEndDate,
      }));
  var ress = jsonDecode(response1.body);
  print(response1.body);

  htp.Response response2 = await htp.post(
      Uri.parse(
          'https://api.boshposh.com/api/Partner/GetPartnerQuoteGroup_Price'),
      headers: {"Content-Type": "application/json"},
      // body: (json1.substring(1, lstLength - 1)),
      body: json.encode({
        "AccountId": _user.accountId,
        "GroupId": '${groupDetailslst1[index].grpId.toString()}',
        "type": "group"
      })
  );
  var res  = jsonDecode(response2.body);
  print(res['data']['status']);
  if (res['status'] == '1') {

    if(oneYear != null){
      for(int i=0;i<oneYear.length;i++){
        if(oneYear[i].QuoteId == groupDetailslst1[index].QuoteId){
          oneYear[i].mpan = mpan1.text + mpan2.text + mpan3.text + mpan4.text + mpan5.text + mpan6.text + mpan7.text ;
          oneYear[i].mprn = mprnedit.text;
          oneYear[i].contractStartDate = conStartDate.text;
        }
      }
    }
    if(twoYear != null){
      for(int i=0;i<twoYear.length;i++){
        if(twoYear[i].QuoteId == groupDetailslst1[index].QuoteId){
          twoYear[i].mpan = mpan1.text + mpan2.text + mpan3.text + mpan4.text + mpan5.text + mpan6.text + mpan7.text ;
          twoYear[i].mprn = mprnedit.text;
          twoYear[i].contractStartDate = conStartDate.text;
        }
      }
    }
    if(threeYear != null){
      for(int i=0;i<threeYear.length;i++){
        if(threeYear[i].QuoteId == groupDetailslst1[index].QuoteId){
          threeYear[i].mpan = mpan1.text + mpan2.text + mpan3.text + mpan4.text + mpan5.text + mpan6.text + mpan7.text ;
          threeYear[i].mprn = mprnedit.text;
          threeYear[i].contractStartDate = conStartDate.text;
        }
      }
    }
    if(fourYear != null){
      for(int i=0;i<fourYear.length;i++){
        if(fourYear[i].QuoteId == groupDetailslst1[index].QuoteId){
          fourYear[i].mpan = mpan1.text + mpan2.text + mpan3.text + mpan4.text + mpan5.text + mpan6.text + mpan7.text ;
          fourYear[i].mprn = mprnedit.text;
          fourYear[i].contractStartDate = conStartDate.text;
        }
      }
    }
    if(fiveYear != null){
      for(int i=0;i<fiveYear.length;i++){
        if(fiveYear[i].QuoteId == groupDetailslst1[index].QuoteId){
          fiveYear[i].mpan = mpan1.text + mpan2.text + mpan3.text + mpan4.text + mpan5.text + mpan6.text + mpan7.text ;
          fiveYear[i].mprn = mprnedit.text;
          fiveYear[i].contractStartDate = conStartDate.text;
        }
      }
    }

    // print(oneYear.length);
    // print(twoYear.length);
    // print(threeYear.length);
    // print(fourYear.length);

    // setState(ViewState.IDLE);
    groupDetailslst.clear();
    if(eacvalues != null)
      eacvalues.clear();
    if(res['data']['lstGroupMaster'] != null){
      for (int i = 0;
      i < res['data']['lstGroupMaster'].length;
      i++) {
        groupDetailslst.add(
          GroupDetailsSubModel(
              businessName:
              res['data']['lstGroupMaster'][i]['Business_Name']  ??
                  "",
              mpan: res['data']['lstGroupMaster'][i]['Full_Mpan_Number'] ??
                  "",
              mprn: res['data']['lstGroupMaster'][i]['Gas_Mprn']?? "",
              industryEacAq:
              res['data']['lstGroupMaster'][i]['decIndustryEACAQ'] ??
                  "",
              currentSupplierName: res['data']['lstGroupMaster'][i]['strCurrentSupplierName'] ??
                  "",
              currentSupplierStartDate: res['data']['lstGroupMaster'][i]['strCurrentSupplierStartDate'] ??
                  "",
              siteAddress:
              res['data']['lstGroupMaster'][i]['strSiteAddress'] ??
                  "",
              meterType: res['data']['lstGroupMaster'][i]['strMeterType']??
                  "",
              relatedMeter:
              res['data']['lstGroupMaster'][i]['strRelatedMeter'] ?? ""),
        );
        if(eacvalues != null ){
          String tempmpan = res['data']['lstGroupMaster'][i]['Full_Mpan_Number'];
          if(res['data']['lstGroupMaster'][i]['Full_Mpan_Number'] != null && res['data']['lstGroupMaster'][i]['Full_Mpan_Number']!=""){
            eacvalues.addAll(
                {
                  tempmpan.substring(8) ?? "" :  EACvalues(
                    mpan: res['data']['lstGroupMaster'][i]['Full_Mpan_Number'] ?? "",
                    EACDay: res['data']['lstGroupMaster'][i]['ElectricityDay_EAC'] ?? "",
                    EACnight: res['data']['lstGroupMaster'][i]['ElectricityNight_EAC'] ?? "",
                  ),
                  res['data']['lstGroupMaster'][i]['Gas_Mprn'] ?? "" :  EACvalues(
                    mpan: res['data']['lstGroupMaster'][i]['Gas_Mprn'] ?? "",
                    EACDay: res['data']['lstGroupMaster'][i]['ElectricityDay_EAC'] ?? "",
                    EACnight: res['data']['lstGroupMaster'][i]['ElectricityNight_EAC'] ?? "",
                    strAq: res['data']['lstGroupMaster'][i]['GAS_EAC'] ?? "",
                  ),
                });
          }
          else{
            eacvalues.addAll(
                {
                  res['data']['lstGroupMaster'][i]['Full_Mpan_Number']?? "" :  EACvalues(
                    mpan: res['data']['lstGroupMaster'][i]['Full_Mpan_Number'] ?? "",
                    EACDay: res['data']['lstGroupMaster'][i]['ElectricityDay_EAC'] ?? "",
                    EACnight: res['data']['lstGroupMaster'][i]['ElectricityNight_EAC'] ?? "",
                  ),
                  res['data']['lstGroupMaster'][i]['Gas_Mprn'] ?? "" :  EACvalues(
                    mpan: res['data']['lstGroupMaster'][i]['Gas_Mprn'] ?? "",
                    EACDay: res['data']['lstGroupMaster'][i]['ElectricityDay_EAC'] ?? "",
                    EACnight: res['data']['lstGroupMaster'][i]['ElectricityNight_EAC'] ?? "",
                    strAq: res['data']['lstGroupMaster'][i]['GAS_EAC'] ?? "",
                  ),
                });
          }
        }
        else{
          String tempmpan = res['data']['lstGroupMaster'][i]['Full_Mpan_Number'];
          if(res['data']['lstGroupMaster'][i]['Full_Mpan_Number'] != null && res['data']['lstGroupMaster'][i]['Full_Mpan_Number']!=""){
            eacvalues =  {
              tempmpan.substring(8) ?? "" :  EACvalues(
                mpan: res['data']['lstGroupMaster'][i]['Full_Mpan_Number'] ?? "",
                EACDay: res['data']['lstGroupMaster'][i]['ElectricityDay_EAC'] ?? "",
                EACnight: res['data']['lstGroupMaster'][i]['ElectricityNight_EAC'] ?? "",
              ),
              res['data']['lstGroupMaster'][i]['Gas_Mprn'] ?? "" :  EACvalues(
                mpan: res['data']['lstGroupMaster'][i]['Gas_Mprn'] ?? "",
                EACDay: res['data']['lstGroupMaster'][i]['ElectricityDay_EAC'] ?? "",
                EACnight: res['data']['lstGroupMaster'][i]['ElectricityNight_EAC'] ?? "",
                strAq: res['data']['lstGroupMaster'][i]['GAS_EAC'] ?? "",
              ),
            };
          }else{
            eacvalues =  {
              res['data']['lstGroupMaster'][i]['Full_Mpan_Number'] :  EACvalues(
                mpan: res['data']['lstGroupMaster'][i]['Full_Mpan_Number'] ?? "",
                EACDay: res['data']['lstGroupMaster'][i]['ElectricityDay_EAC'] ?? "",
                EACnight: res['data']['lstGroupMaster'][i]['ElectricityNight_EAC'] ?? "",
              ),
              res['data']['lstGroupMaster'][i]['Gas_Mprn'] ?? "" :  EACvalues(
                mpan: res['data']['lstGroupMaster'][i]['Gas_Mprn'] ?? "",
                EACDay: res['data']['lstGroupMaster'][i]['ElectricityDay_EAC'] ?? "",
                EACnight: res['data']['lstGroupMaster'][i]['ElectricityNight_EAC'] ?? "",
                strAq: res['data']['lstGroupMaster'][i]['GAS_EAC'] ?? "",
              ),
            };
          }

        }

      }
    }
  }
  return ress;
}

Container dialogcontainer(BuildContext context, BuildContext ctx,List<EachyYearList> groupDetailslst,int index,String type) {
  final ThemeApp themeApp = ThemeApp();
  Future<dynamic> Editsitecallapi() async{
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
    return res;
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
                    var res = await Editsitecallapi();
                    Navigator.of(ctx).pop();
                    if(res['status'] == "1"){
                      groupDetailslst[index].mpan = mpan1.text + mpan2.text + mpan3.text + mpan4.text + mpan5.text + mpan6.text + mpan7.text ;
                      groupDetailslst[index].mprn = mprnedit.text;
                      groupDetailslst[index].contractStartDate = conStartDate.text;
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
                    }
                    else{
                      showDialog(
                          context: context,
                          builder: (ctx) {
                            return AlertDialog(
                              title: Text(
                                "Not Edited site Successfully",

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
                    }

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

class EditSitewidget extends StatefulWidget {
  BuildContext context;
  BuildContext ctx;
  List<EachyYearList>groupDetailslst;
  int index;
  String type;
  final List viewlist;
  final List<GroupDetailsSubModel> groupdetailsprice;
  EditSitewidget({this.context,this.ctx,this.groupDetailslst,this.index,this.type,this.groupdetailsprice,this.viewlist});
  @override
  _EditSitewidgetState createState() => _EditSitewidgetState();
}


class _EditSitewidgetState extends State<EditSitewidget> {
  final ThemeApp themeApp = ThemeApp();
  Future<dynamic> Editsitecallapi() async{
    User _user = await Prefs.getUser();
    htp.Response response = await htp.post(
        Uri.parse('https://api.boshposh.com/api/Partner/GroupContractEditSite'),
        headers: {"Content-Type": "application/json"},
        // body: (json1.substring(1, lstLength - 1)),
        body: json.encode({
          "AccountId": _user.accountId,
          "GroupId": '${widget.groupDetailslst[widget.index].grpId.toString()}',
          "QuoteId": '${widget.groupDetailslst[widget.index].QuoteId.toString()}',
          "type": "group",
          "strfullMpan": mpan1.text + mpan2.text + mpan3.text + mpan4.text + mpan5.text + mpan6.text + mpan7.text ,
          "strDayEAC": dayEAC.text,
          "strNightEAC": nightEAC.text,
          "strEweEAC": "",
          "strMPRN": mprnedit.text,
          "strAQ": strAq.text,
          "dteContractStartDate": conStartDate.text,
          "dteContractEndDate":
          widget.groupDetailslst[widget.index].contractEndDate,
        }));
    var res = jsonDecode(response.body);
    print(response.body);
    return res;
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.type == "MPAN" ? MediaQuery.of(context).size.height * 0.6 : MediaQuery.of(context).size.height * 0.47,
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
                        "Edit Site Detail (GROUPID :- ${widget.groupDetailslst[widget.index].grpId})",
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
                        Navigator.of(widget.ctx).pop();
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
                  widget.type,
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
              widget.type == "MPAN" ? Column(
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
                  widget.type == "MPAN" ? "Day EAC" : "AQ",
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
                    controller:   widget.type == "MPAN" ?  dayEAC: strAq,
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
              widget.type == "MPAN" ? Column(
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
                      var res = await Editsitecallapi();
                      if(res['status'] == "1"){
                       setState(() {
                         widget.groupDetailslst[widget.index].mpan = mpan1.text + mpan2.text + mpan3.text + mpan4.text + mpan5.text + mpan6.text + mpan7.text ;
                         widget.groupDetailslst[widget.index].mprn = mprnedit.text;
                         widget.groupDetailslst[widget.index].contractStartDate = conStartDate.text;
                       });
                       //Navigator.of(context).pop();
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
                      }
                      else{
                       // Navigator.of(context).pop();
                        showDialog(
                            context: context,
                            builder: (ctx) {
                              return AlertDialog(
                                title: Text(
                                  "Not Edited site Successfully",

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
                      }

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
}
