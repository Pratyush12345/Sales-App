import 'package:flutter/material.dart';
import 'package:pozitive/Core/Model/broker_commission_model.dart';
import 'package:pozitive/Core/Model/custom_pop_up.dart';
import 'package:pozitive/Core/Model/user.dart';
import 'package:pozitive/Core/ViewModel/commission_statement_viewmodel.dart';
import 'package:pozitive/Pages/Commission/commission_statement.dart';
import 'package:pozitive/Widget/shapePopUp.dart';
import 'package:provider/provider.dart';

class CommissionStatementItemWidget extends StatefulWidget {
  final BrokerCommission brokerCommissionList;
  final int index;
  final bool partner;
  final CommissionStatementViewModel commissionStatementItemWidget;

  CommissionStatementItemWidget({this.brokerCommissionList, this.index, this.partner, this.commissionStatementItemWidget});

  @override
  _CommissionStatementItemWidgetState createState() => _CommissionStatementItemWidgetState();
}

class _CommissionStatementItemWidgetState extends State<CommissionStatementItemWidget> {
  @override
  Widget build(BuildContext context) {
    final user= Provider.of<User>(context);

    return Column(
      children: <Widget>[
        Container(
//                  width: MediaQuery.of(context).size.width,
          color: widget.index.isOdd?Colors.white:Color.fromRGBO(237, 243, 231, 1),
          child: Padding(
            padding:  EdgeInsets.only(top: MediaQuery.of(context).size.height*0.01,bottom:  MediaQuery.of(context).size.height*0.01),
            child: Row(
              children: <Widget>[
                SizedBox(
                  width:MediaQuery.of(context).size.width*.02,
                ),
                Container(
                    width: MediaQuery.of(context).size.width*.31,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("${widget.brokerCommissionList.invoiceNumber}",style: TextStyle(color: Colors.black,fontSize: MediaQuery.of(context).size.width*0.029),),
                    )
                ),
                InkWell(
                  child: Container(
                      width: MediaQuery.of(context).size.width*.28,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("${widget.brokerCommissionList.invoiceDate}",style: TextStyle(color: Colors.black,fontSize: MediaQuery.of(context).size.width*0.029),),
                      )
                  ),
                  onTap: (){
//                                          setState(() {
//                                            viewlist[index]["click"]=!viewlist[index]["click"];
//                                          });
                  },
                ),
                Container(
                    width: MediaQuery.of(context).size.width*.34,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: <Widget>[
                          SizedBox(
                              width: MediaQuery.of(context).size.width*.2           ,
                              child: Text("${widget.brokerCommissionList.invoiceTotal}",style: TextStyle(color: Colors.black,fontSize: MediaQuery.of(context).size.width*0.029),)),
                          Spacer(),
                          Transform.scale(
                            scale: 1,
                            child: SizedBox(
                              width: MediaQuery.of(context).size.width*.06,
                              child: PopupMenuButton<CustomPopupMenu>(
                                padding: EdgeInsets.all(0),
                                color: Colors.deepPurple,
                                shape: CustomRoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12)
                                ),
                                onSelected: (val){
                                  widget.commissionStatementItemWidget.onSelectDownload(user.accountId, widget.partner, val.title,widget.brokerCommissionList.intBrokerCommBillMstId.toString());
                                },
                                itemBuilder: (BuildContext context) {
                                  return choices.map((CustomPopupMenu choice) {
                                    return PopupMenuItem<CustomPopupMenu>(
                                      value: choice,
                                      child: Row(
                                        children: <Widget>[
                                          Image.asset(choice.assetImage,scale: 8,color: Colors.white,),
                                          SizedBox(
                                            width: MediaQuery.of(context).size.width*.02,
                                          ),
                                          Text(choice.title,style: TextStyle(
                                              color: Colors.white
                                          ),)
                                        ],
                                      ),
                                    );
                                  }).toList();
                                },
                              ),
                            ),
                          ),


                        ],
                      ),
                    )
                ),
              ],
            ),
          ),
        ),
//                              viewlist[index]["click"]?Container(
//                                decoration: BoxDecoration(
//                                    color: Color.fromRGBO(243, 249, 237, 1),
//                                    border: Border.all(color: Colors.grey.withOpacity(.5))
//                                ),
//                                child: Column(
//                                  crossAxisAlignment: CrossAxisAlignment.center,
//                                  mainAxisAlignment: MainAxisAlignment.center,
//                                  children: <Widget>[
//                                    Padding(
//                                      padding: EdgeInsets.only(bottom: MediaQuery.of(context).size.height*0.01,top:  MediaQuery.of(context).size.height*0.01),
//                                      child: Row(
//                                        crossAxisAlignment: CrossAxisAlignment.center,
//                                        mainAxisAlignment: MainAxisAlignment.center,
//                                        children: <Widget>[
//                                          SizedBox(
//                                            child: Text("Status",textAlign: TextAlign.end,style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: MediaQuery.of(context).size.width*0.027,)),
//                                            width: MediaQuery.of(context).size.width*0.46,
//                                          ),
//                                          SizedBox(
//                                            width: MediaQuery.of(context).size.width*.03,
//                                          ),
//                                          SizedBox(
//                                              width: MediaQuery.of(context).size.width*0.46,
//                                              child: Text(requestedlist[0]["Status"],style: TextStyle(color: Colors.black,fontSize: MediaQuery.of(context).size.width*0.027)))
//                                        ],
//                                      ),
//                                    ),
//                                    Padding(
//                                      padding: EdgeInsets.only(bottom: MediaQuery.of(context).size.height*0.01,top:  MediaQuery.of(context).size.height*0.01),
//                                      child: Row(
//                                        crossAxisAlignment: CrossAxisAlignment.center,
//                                        mainAxisAlignment: MainAxisAlignment.center,
//                                        children: <Widget>[
//                                          SizedBox(
//                                              width: MediaQuery.of(context).size.width*0.46,
//                                              child: Text("Timer",textAlign: TextAlign.end,style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: MediaQuery.of(context).size.width*0.027))),
//                                          SizedBox(
//                                            width: MediaQuery.of(context).size.width*.03,
//                                          ),
//                                          SizedBox(
//                                              width: MediaQuery.of(context).size.width*0.46,
//                                              child: Text(requestedlist[0]["Timer"],style: TextStyle(color: Colors.black,fontSize: MediaQuery.of(context).size.width*0.027)))
//                                        ],
//                                      ),
//                                    ),
//                                    Padding(
//                                      padding: EdgeInsets.only(bottom: MediaQuery.of(context).size.height*0.01,top:  MediaQuery.of(context).size.height*0.01),
//                                      child: Row(
//                                        crossAxisAlignment: CrossAxisAlignment.center,
//                                        mainAxisAlignment: MainAxisAlignment.center,
//                                        children: <Widget>[
//                                          SizedBox(
//                                              width: MediaQuery.of(context).size.width*0.46,
//                                              child: Text("No",textAlign: TextAlign.end,style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: MediaQuery.of(context).size.width*0.027))),
//                                          SizedBox(
//                                            width: MediaQuery.of(context).size.width*.03,
//                                          ),
//                                          SizedBox(
//                                              width: MediaQuery.of(context).size.width*0.46,
//                                              child: Text(requestedlist[0]["No"],style: TextStyle(color: Colors.black,fontSize: MediaQuery.of(context).size.width*0.027)))
//                                        ],
//                                      ),
//                                    ),
//                                    Padding(
//                                      padding: EdgeInsets.only(bottom: MediaQuery.of(context).size.height*0.01,top:  MediaQuery.of(context).size.height*0.01),
//                                      child: Row(
//                                        crossAxisAlignment: CrossAxisAlignment.center,
//                                        mainAxisAlignment: MainAxisAlignment.center,
//                                        children: <Widget>[
//                                          SizedBox(
//                                            width: MediaQuery.of(context).size.width*0.46,
//                                            child: Text("Partner Name",textAlign: TextAlign.end,style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: MediaQuery.of(context).size.width*0.027)),),
//                                          SizedBox(
//                                            width: MediaQuery.of(context).size.width*.03,
//                                          ),
//                                          SizedBox(
//                                              width: MediaQuery.of(context).size.width*0.46,
//                                              child: Text(requestedlist[0]["partner_name"],style: TextStyle(color: Colors.black,fontSize: MediaQuery.of(context).size.width*0.027)))
//                                        ],
//                                      ),
//                                    ),
//                                    Padding(
//                                      padding: EdgeInsets.only(bottom: MediaQuery.of(context).size.height*0.01,top:  MediaQuery.of(context).size.height*0.01),
//                                      child: Row(
//                                        crossAxisAlignment: CrossAxisAlignment.center,
//                                        mainAxisAlignment: MainAxisAlignment.center,
//                                        children: <Widget>[
//                                          SizedBox(
//                                              width: MediaQuery.of(context).size.width*0.46,child: Text("Last Access",textAlign: TextAlign.end,style: TextStyle(color: Colors.black,fontSize: MediaQuery.of(context).size.width*0.027,fontWeight: FontWeight.bold))),
//                                          SizedBox(
//                                            width: MediaQuery.of(context).size.width*.03,
//                                          ),
//                                          SizedBox(
//                                              width: MediaQuery.of(context).size.width*0.46,
//                                              child: Text(requestedlist[0]["Last Access"],style: TextStyle(color: Colors.black,fontSize: MediaQuery.of(context).size.width*0.027)))
//                                        ],
//                                      ),
//                                    ),
//                                    Padding(
//                                      padding: EdgeInsets.only(bottom: MediaQuery.of(context).size.height*0.01,top:  MediaQuery.of(context).size.height*0.01),
//                                      child: Row(
//                                        crossAxisAlignment: CrossAxisAlignment.center,
//                                        mainAxisAlignment: MainAxisAlignment.center,
//                                        children: <Widget>[
//                                          SizedBox(width: MediaQuery.of(context).size.width*0.46,
//                                              child: Text("Business Name",textAlign: TextAlign.end,style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: MediaQuery.of(context).size.width*0.027))),
//                                          SizedBox(
//                                            width: MediaQuery.of(context).size.width*.03,
//                                          ),
//                                          SizedBox(
//                                              width: MediaQuery.of(context).size.width*0.46,
//                                              child: Text(requestedlist[0]["Business_name"],style: TextStyle(color: Colors.black,fontSize: MediaQuery.of(context).size.width*0.027)))
//                                        ],
//                                      ),
//                                    ),
//                                    Padding(
//                                      padding: EdgeInsets.only(bottom: MediaQuery.of(context).size.height*0.01,top:  MediaQuery.of(context).size.height*0.01),
//                                      child: Row(
//                                        crossAxisAlignment: CrossAxisAlignment.center,
//                                        mainAxisAlignment: MainAxisAlignment.center,
//                                        children: <Widget>[
//                                          SizedBox(
//                                              width: MediaQuery.of(context).size.width*0.46,
//                                              child: Text("Required By Date",textAlign: TextAlign.end,style: TextStyle(color: Colors.black,fontSize: MediaQuery.of(context).size.width*0.027,fontWeight: FontWeight.bold))),
//                                          SizedBox(
//                                            width: MediaQuery.of(context).size.width*.03,
//                                          ),
//                                          SizedBox(
//                                              width: MediaQuery.of(context).size.width*0.46,
//                                              child: Text(requestedlist[0]["Required By Date"],style: TextStyle(color: Colors.black,fontSize: MediaQuery.of(context).size.width*0.027)))
//                                        ],
//                                      ),
//                                    ),
//                                    Padding(
//                                      padding: EdgeInsets.only(bottom: MediaQuery.of(context).size.height*0.01,top:  MediaQuery.of(context).size.height*0.01),
//                                      child: Row(
//                                        crossAxisAlignment: CrossAxisAlignment.center,
//                                        mainAxisAlignment: MainAxisAlignment.center,
//                                        children: <Widget>[
//                                          SizedBox(
//                                              width: MediaQuery.of(context).size.width*0.46,
//                                              child: Text("Created/Rerequested Date",textAlign: TextAlign.end,style: TextStyle(color: Colors.black,fontSize: MediaQuery.of(context).size.width*0.027,fontWeight: FontWeight.bold))),
//                                          SizedBox(
//                                            width: MediaQuery.of(context).size.width*.03,
//                                          ),
//                                          SizedBox(
//                                              width: MediaQuery.of(context).size.width*0.46,
//                                              child: Text(requestedlist[0]["Created/Rerequested Date"],style: TextStyle(color: Colors.black,fontSize: MediaQuery.of(context).size.width*0.027)))
//                                        ],
//                                      ),
//                                    )
//                                  ],
//                                ),
//                              ):Container()
      ],
    );
  }
}
