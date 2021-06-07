import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pozitive/Core/ViewModel/Group-Quotation/group_quotation/group_final_Qutation_viewmodel.dart';
import 'package:pozitive/Core/ViewModel/Group-Quotation/group_quotation/view_group_details_viewmodel.dart';
import 'package:pozitive/Pages/Group-Quotation/Tab/yearvisedetails.dart';
import 'package:pozitive/Util/theme.dart';
import 'package:pozitive/Core/Model/group_details_sub_model.dart';
import 'package:pozitive/Pages/Group-Quotation/Tab/view_price_ele_gas_1year.dart';
import 'package:pozitive/Core/Model/request_quote_viewbutton_model.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as htp;
import 'dart:convert';
import 'package:pozitive/Core/Model/user.dart';
import 'package:pozitive/Util/Pref.dart';
import 'package:pozitive/Pages/Group-Quotation/EditSite.dart';

class GroupQuotePriceList extends StatefulWidget {
  final int index;
  final List viewlist;
  final List<EachyYearList> groupDetailslst;
  final String type;
  final List<GroupDetailsSubModel> groupdetailsprice;
  GroupQuotePriceList(
      {this.index, this.viewlist, @required this.groupDetailslst, this.type,this.groupdetailsprice});

  @override
  _GroupQuotePriceListState createState() => _GroupQuotePriceListState();
}

class _GroupQuotePriceListState extends State<GroupQuotePriceList> {
  final ThemeApp themeApp = ThemeApp();
  String mpanOrMprn = '';
  RequestQuoteViewButtonModel requestQuoteViewButtonModel =
      RequestQuoteViewButtonModel();
  bool check = false;
  String title = '';

  String getMpanOrMprn() {
    //print(widget.groupDetailslst[widget.index].mprn);
    if (widget.groupDetailslst[widget.index].mpan == '') {
      {
        mpanOrMprn = widget.groupDetailslst[widget.index].mprn;
      }
    } else if (widget.groupDetailslst[widget.index].mprn == '') {
      {
        mpanOrMprn = widget.groupDetailslst[widget.index].mpan;
      }
    } else {
      mpanOrMprn =
          '${widget.groupDetailslst[widget.index].mpan} / ${widget.groupDetailslst[widget.index].mprn}';
    }
    // if(widget.type == "MPAN"){
    //   mpanOrMprn = widget.groupDetailslst[widget.index].mpan;
    // }
    // else{
    //   mpanOrMprn = widget.groupDetailslst[widget.index].mprn;
    // }

    return mpanOrMprn; //'MPAN : ' + widget.groupDetailslst[widget.index].mpan;
  }

  bool mprn = false;
  String titlestring() {
    if (widget.groupDetailslst[widget.index].mpan == '') {
      {
        title = 'MPRN';
      }
    } else if (widget.groupDetailslst[widget.index].mprn == '') {
      {
        title = 'MPAN';
      }
    }

    return title + ' : ';
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          child: Padding(
            padding: EdgeInsets.only(
              top: MediaQuery.of(context).size.height * 0.01,
              bottom: MediaQuery.of(context).size.height * 0.01,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  width: MediaQuery.of(context).size.width * .02,
                ),
                // Expanded(
                //   flex: 3,
                //   child: Padding(
                //     padding: const EdgeInsets.all(5.0),
                //     child: Text(
                //       widget.groupDetailslst[widget.index].tremtype ?? "",
                //       textAlign: TextAlign.center,
                //       style: TextStyle(
                //           color: Colors.grey,
                //           fontSize: MediaQuery.of(context).size.width * 0.033),
                //     ),
                //   ),
                // ),
                check
                    ? InkWell(
                        onTap: () {
                          setState(() {
                            check = false;
                            if (widget.groupDetailslst[widget.index].tremtype ==
                                '1') {
                              oneYear[widget.index].checkItem = false;
                            } else if (widget
                                    .groupDetailslst[widget.index].tremtype ==
                                '2') {
                              twoYear[widget.index].checkItem = false;
                            } else if (widget
                                    .groupDetailslst[widget.index].tremtype ==
                                '3') {
                              threeYear[widget.index].checkItem = false;
                            } else if (widget
                                    .groupDetailslst[widget.index].tremtype ==
                                '4') {
                              fourYear[widget.index].checkItem = false;
                            }
                            print(check);
                            print(widget.index);
                          });
                        },
                        child: Icon(
                          Icons.check_box,
                          color: Colors.green,
                          size: MediaQuery.of(context).size.height * .03,
                        ),
                      )
                    : InkWell(
                        child: Icon(
                          Icons.check_box_outline_blank,
                          color: Colors.green,
                          size: MediaQuery.of(context).size.height * .03,
                        ),
                        onTap: () {
                          setState(() {
                            check = true;
                            if (widget.groupDetailslst[widget.index].tremtype ==
                                '1') {
                              oneYear[widget.index].checkItem = true;
                            } else if (widget
                                    .groupDetailslst[widget.index].tremtype ==
                                '2') {
                              twoYear[widget.index].checkItem = true;
                            } else if (widget
                                    .groupDetailslst[widget.index].tremtype ==
                                '3') {
                              threeYear[widget.index].checkItem = true;
                            } else if (widget
                                    .groupDetailslst[widget.index].tremtype ==
                                '4') {
                              fourYear[widget.index].checkItem = true;
                            }
                            print(check);
                          });
                        },
                      ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * .001,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 5.0),
                  child: Text(
                    titlestring(),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 5),
                  child: Text(
                    getMpanOrMprn(),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                    ),
                  ),
                ),
                title == "MPRN" ?
                SizedBox(
                        width: MediaQuery.of(context).size.width * .33,
                      ) :
                mpanOrMprn.length == 13 ? SizedBox(
                  width: MediaQuery.of(context).size.width * .23,
                ) : SizedBox(
                  width: MediaQuery.of(context).size.width * .06,
                )
                ,
                Container(
                  padding: EdgeInsets.only(left: 5),
                  child: CupertinoButton(
                    onPressed: () async {
                      print(widget.groupDetailslst[widget.index].mpan);
                      await Editsite(
                        groupDetailslst: widget.groupDetailslst,
                        groupdetailsprice: widget.groupdetailsprice,
                        index: widget.index,

                      );
                      showDialog(
                          context: context,
                          builder: (ctx) {
                            return Dialog(
                              child: Container(
                                height: title == "MPAN" ? MediaQuery.of(context).size.height * 0.6 : MediaQuery.of(context).size.height * 0.47,
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
                                            title,
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
                                        title == "MPAN" ? Column(
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
                                            title == "MPAN" ? "Day EAC" : "AQ",
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
                                              controller:   title == "MPAN" ?  dayEAC: strAq,
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
                                        title == "MPAN" ? Column(
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
                                                var res = await Editsitecallapi(
                                                  groupDetailslst1: widget.groupDetailslst,
                                                  groupdetailsprice: widget.groupdetailsprice,
                                                  index: widget.index,
                                                );
                                                if(res['status'] == "1"){
                                                  setState(() {
                                                    widget.groupDetailslst[widget.index].mpan = mpan1.text + mpan2.text + mpan3.text + mpan4.text + mpan5.text + mpan6.text + mpan7.text ;
                                                    widget.groupDetailslst[widget.index].mprn = mprnedit.text;
                                                    widget.groupDetailslst[widget.index].contractStartDate = conStartDate.text;
                                                  });
                                                  Navigator.of(context).pop();
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
                                                   Navigator.of(context).pop();
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
                              ),
                              // EditSitewidget(
                              //   context: context,
                              //   ctx: ctx,
                              //   groupDetailslst: widget.groupDetailslst,
                              //   index: widget.index,
                              //   type: title,
                              // ),
                              //dialogcontainer(context, ctx, widget.groupDetailslst,widget.index,title),
                            );
                          });
                      // setState(() {
                      //   widget.viewlist[widget.index]["click"] =
                      //   !widget.viewlist[widget.index]["click"];
                      // });
                    },
                    minSize: double.minPositive,
                    padding: EdgeInsets.zero,
                    //color: Colors.green,
                    child: Icon(
                      FontAwesomeIcons.pencilAlt,
                      color: Colors.green,
                      size: 18,
                    ),
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * .01,
                ),
                Container(
                  padding: EdgeInsets.only(left: 5),
                  child: CupertinoButton(
                    onPressed: () {
                      setState(() {
                        widget.viewlist[widget.index]["click"] =
                            !widget.viewlist[widget.index]["click"];
                      });
                    },
                    minSize: 16,
                    padding: EdgeInsets.zero,
                    // color: Colors.green,
                    child: Icon(
                      FontAwesomeIcons.plus,
                      color: Colors.green,
                      size: 18,
                    ),
                  ),

                  // IconButton(
                  //   //minSize: double.minPositive,
                  //   padding: EdgeInsets.zero,
                  //   onPressed: () {
                  //     setState(() {
                  //       widget.viewlist[widget.index]["click"] =
                  //           !widget.viewlist[widget.index]["click"];
                  //     });
                  //   },
                  //   color: Colors.green,
                  //   icon: FaIcon(FontAwesomeIcons.plus),
                  //   iconSize: 16.0,
                  // ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * .01,
                ),
                // InkWell(
                //   child: Container(
                //     //width: MediaQuery.of(context).size.width * .32,
                //       child: Row(
                //         mainAxisAlignment: MainAxisAlignment.start,
                //         children: <Widget>[
                //           Icon(
                //             FaIcon(FontAwesomeIcons.plus),
                //             color: Colors.pink,
                //             size: 24.0,
                //             semanticLabel: 'Text to announce in accessibility modes',
                //           ),
                //           // Image.asset(
                //           //   "assets/view.png",
                //           //   scale: 10,
                //           // ),
                //           SizedBox(
                //             width: MediaQuery.of(context).size.width * .02,
                //           ),
                //           //  Text("View Details",style: TextStyle(fontWeight: FontWeight.bold,fontSize: MediaQuery.of(context).size.width*0.027,color:  themeApp.purplecolor),),
                //         ],
                //       )),
                //   onTap: () {
                //     setState(() {
                //       widget.viewlist[widget.index]["click"] =
                //       !widget.viewlist[widget.index]["click"];
                //     });
                //   },
                // )
              ],
            ),
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: Colors.white24,
            border: Border.all(color: Colors.grey),
            // boxShadow: [
            //   BoxShadow(
            //     color: Colors.black26,
            //     blurRadius: 20.0,
            //   ),
            // ],
          ),
        ),
        Padding(padding: EdgeInsets.only(bottom: 10, top: 10)),
        widget.viewlist[widget.index]["click"]
            ? Container(
                padding: EdgeInsets.only(bottom: 20),
                child: Column(
                      children: [
                        play(
                          quoteId: '1',
                          requestQuote: requestQuoteViewButtonModel,
                          title: 'Requested Requote',
                          groupDetailslst: widget.groupDetailslst,
                          index: widget.index,
                          type: title,
                        ),
                        Padding(padding: EdgeInsets.only(bottom: 10, top: 10)),
                      ],
                    ),


              )
            : Container()
      ],
    );
  }


}
// ListView(
//   shrinkWrap: true,
//
//   children: [
//     play(
//       quoteId: '1',
//       requestQuote: requestQuoteViewButtonModel,
//       title: 'Requested Requote',
//       groupDetailslst: widget.groupDetailslst,
//
//     ),
//     //Padding(padding: EdgeInsets.only(bottom: 10,top: 10)),
//   ],
//
// ),
