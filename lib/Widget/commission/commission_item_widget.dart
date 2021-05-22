import 'package:flutter/material.dart';
import 'package:pozitive/Core/Model/GetDailyCommissonDetailModel.dart';
import 'package:pozitive/Util/theme.dart';


class CommissionItemWidget extends StatefulWidget {
  final LstGetDailycommission lstGetDailycommission;
  final int index;
  final List viewlist;
  final List requestedlist;

  CommissionItemWidget({this.lstGetDailycommission,this.index, this.viewlist,this.requestedlist});

  @override
  _CommissionItemWidgetState createState() => _CommissionItemWidgetState();
}

class _CommissionItemWidgetState extends State<CommissionItemWidget> {
  final ThemeApp themeApp = ThemeApp();



  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
//
//
//
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
                      child: Text("${widget.lstGetDailycommission.accountId}",style: TextStyle(color: Colors.black,fontSize: MediaQuery.of(context).size.width*0.029),),
                      // child: Text("${requestedlist[0]["business_name"]}",style: TextStyle(color: Colors.black,fontSize: MediaQuery.of(context).size.width*0.029),),
                    )
                ),
                InkWell(
                  child: Container(
                      width: MediaQuery.of(context).size.width*.28,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                       // child: Text(widget.lstGetDailycommission.brokerCommissionList.,style: TextStyle(color: Colors.black,fontSize: MediaQuery.of(context).size.width*0.029),),
                       child: Text("${widget.requestedlist[0]["customer_name"]}",style: TextStyle(color: Colors.black,fontSize: MediaQuery.of(context).size.width*0.029),),
                      )
                  ),
                  onTap: (){
                    setState(() {
                      widget.viewlist[widget.index]["click"]=!widget.viewlist[widget.index]["click"];
                    });
                  },
                ),

                InkWell(
                  child: Container(
                      width: MediaQuery.of(context).size.width*.28,
                      child:Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Image.asset("assets/view.png",scale: 12,),
                          SizedBox(
                            width:MediaQuery.of(context).size.width*.02,
                          ),
                          Text("View",style: TextStyle(fontWeight: FontWeight.bold,fontSize: MediaQuery.of(context).size.width*0.027,color: themeApp.purplecolor),),
                        ],
                      )
                  ),
                  onTap: (){
                    setState(() {
                      widget.viewlist[widget.index]["click"]=!widget.viewlist[widget.index]["click"];
                    });
                  },
                )
              ],
            ),
          ),
        ),
        widget.viewlist[widget.index]["click"]?
        Container(
          decoration: BoxDecoration(
              color: Color.fromRGBO(243, 249, 237, 1),
              border: Border.all(color: Colors.grey.withOpacity(.5))
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(bottom: MediaQuery.of(context).size.height*0.01,top:  MediaQuery.of(context).size.height*0.01),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                      child: Text("Post Code",textAlign: TextAlign.end,style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: MediaQuery.of(context).size.width*0.027,)),
                      width: MediaQuery.of(context).size.width*0.36,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width*.03,
                    ),
                    SizedBox(
                        width: MediaQuery.of(context).size.width*0.36,
                        child: Text(widget.requestedlist[0]["Postcode"],style: TextStyle(color: Colors.black,fontSize: MediaQuery.of(context).size.width*0.027)))
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: MediaQuery.of(context).size.height*0.01,top:  MediaQuery.of(context).size.height*0.01),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                        width: MediaQuery.of(context).size.width*0.36,
                        child: Text("Pozitive Cust ID",textAlign: TextAlign.end,style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: MediaQuery.of(context).size.width*0.027))),
                    SizedBox(
                      width: MediaQuery.of(context).size.width*.03,
                    ),
                    SizedBox(
                        width: MediaQuery.of(context).size.width*0.36,
                        child: Text(widget.requestedlist[0]["PozitiveCustID"],style: TextStyle(color: Colors.black,fontSize: MediaQuery.of(context).size.width*0.027)))
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: MediaQuery.of(context).size.height*0.01,top:  MediaQuery.of(context).size.height*0.01),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                        width: MediaQuery.of(context).size.width*0.36,
                        child: Text("Contract Start Date",textAlign: TextAlign.end,style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: MediaQuery.of(context).size.width*0.027))),
                    SizedBox(
                      width: MediaQuery.of(context).size.width*.03,
                    ),
                    SizedBox(
                        width: MediaQuery.of(context).size.width*0.36,
                        child: Text(widget.requestedlist[0]["ContractStartDate"],style: TextStyle(color: Colors.black,fontSize: MediaQuery.of(context).size.width*0.027)))
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: MediaQuery.of(context).size.height*0.01,top:  MediaQuery.of(context).size.height*0.01),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                      width: MediaQuery.of(context).size.width*0.36,
                      child: Text("Contract End Date",textAlign: TextAlign.end,style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: MediaQuery.of(context).size.width*0.027)),),
                    SizedBox(
                      width: MediaQuery.of(context).size.width*.03,
                    ),
                    SizedBox(
                        width: MediaQuery.of(context).size.width*0.36,
                        child: Text(widget.requestedlist[0]["ContractEndDate"],style: TextStyle(color: Colors.black,fontSize: MediaQuery.of(context).size.width*0.027)))
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: MediaQuery.of(context).size.height*0.01,top:  MediaQuery.of(context).size.height*0.01),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                        width: MediaQuery.of(context).size.width*0.36,child: Text("Fuel",textAlign: TextAlign.end,style: TextStyle(color: Colors.black,fontSize: MediaQuery.of(context).size.width*0.027,fontWeight: FontWeight.bold))),
                    SizedBox(
                      width: MediaQuery.of(context).size.width*.03,
                    ),
                    SizedBox(
                        width: MediaQuery.of(context).size.width*0.36,
                        child: Text(widget.requestedlist[0]["Fuel"],style: TextStyle(color: Colors.black,fontSize: MediaQuery.of(context).size.width*0.027)))
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: MediaQuery.of(context).size.height*0.01,top:  MediaQuery.of(context).size.height*0.01),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(width: MediaQuery.of(context).size.width*0.36,
                        child: Text("Mpan / Mprn number",textAlign: TextAlign.end,style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: MediaQuery.of(context).size.width*0.027))),
                    SizedBox(
                      width: MediaQuery.of(context).size.width*.03,
                    ),
                    SizedBox(
                        width: MediaQuery.of(context).size.width*0.36,
                        child: Text(widget.requestedlist[0]["Mpanprnno"],style: TextStyle(color: Colors.black,fontSize: MediaQuery.of(context).size.width*0.027)))
                  ],
                ),
              ),

              Padding(
                padding: EdgeInsets.only(bottom: MediaQuery.of(context).size.height*0.01,top:  MediaQuery.of(context).size.height*0.01),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(width: MediaQuery.of(context).size.width*0.36,
                        child: Text("Invoice No.",textAlign: TextAlign.end,style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: MediaQuery.of(context).size.width*0.027))),
                    SizedBox(
                      width: MediaQuery.of(context).size.width*.03,
                    ),
                    SizedBox(
                        width: MediaQuery.of(context).size.width*0.36,
                        child: Text(widget.requestedlist[0]["Invoiceno"],style: TextStyle(color: Colors.black,fontSize: MediaQuery.of(context).size.width*0.027)))
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: MediaQuery.of(context).size.height*0.01,top:  MediaQuery.of(context).size.height*0.01),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(width: MediaQuery.of(context).size.width*0.36,
                        child: Text("Supply From",textAlign: TextAlign.end,style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: MediaQuery.of(context).size.width*0.027))),
                    SizedBox(
                      width: MediaQuery.of(context).size.width*.03,
                    ),
                    SizedBox(
                        width: MediaQuery.of(context).size.width*0.36,
                        child: Text(widget.requestedlist[0]["Supplyfrom"],style: TextStyle(color: Colors.black,fontSize: MediaQuery.of(context).size.width*0.027)))
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: MediaQuery.of(context).size.height*0.01,top:  MediaQuery.of(context).size.height*0.01),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(width: MediaQuery.of(context).size.width*0.36,
                        child: Text("Supply To",textAlign: TextAlign.end,style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: MediaQuery.of(context).size.width*0.027))),
                    SizedBox(
                      width: MediaQuery.of(context).size.width*.03,
                    ),
                    SizedBox(
                        width: MediaQuery.of(context).size.width*0.36,
                        child: Text(widget.requestedlist[0]["Supplyto"],style: TextStyle(color: Colors.black,fontSize: MediaQuery.of(context).size.width*0.027)))
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: MediaQuery.of(context).size.height*0.01,top:  MediaQuery.of(context).size.height*0.01),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(width: MediaQuery.of(context).size.width*0.36,
                        child: Text("Bill Days",textAlign: TextAlign.end,style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: MediaQuery.of(context).size.width*0.027))),
                    SizedBox(
                      width: MediaQuery.of(context).size.width*.03,
                    ),
                    SizedBox(
                        width: MediaQuery.of(context).size.width*0.36,
                        child: Text(widget.requestedlist[0]["Billdays"],style: TextStyle(color: Colors.black,fontSize: MediaQuery.of(context).size.width*0.027)))
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: MediaQuery.of(context).size.height*0.01,top:  MediaQuery.of(context).size.height*0.01),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(width: MediaQuery.of(context).size.width*0.36,
                        child: Text("Mpan / Mprn number",textAlign: TextAlign.end,style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: MediaQuery.of(context).size.width*0.027))),
                    SizedBox(
                      width: MediaQuery.of(context).size.width*.03,
                    ),
                    SizedBox(
                        width: MediaQuery.of(context).size.width*0.36,
                        child: Text(widget.requestedlist[0]["Mpanprnno"],style: TextStyle(color: Colors.black,fontSize: MediaQuery.of(context).size.width*0.027)))
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: MediaQuery.of(context).size.height*0.01,top:  MediaQuery.of(context).size.height*0.01),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(width: MediaQuery.of(context).size.width*0.36,
                        child: Text("Billed DAY KWH for this period of time",textAlign: TextAlign.end,style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: MediaQuery.of(context).size.width*0.027))),
                    SizedBox(
                      width: MediaQuery.of(context).size.width*.03,
                    ),
                    SizedBox(
                        width: MediaQuery.of(context).size.width*0.36,
                        child: Text(widget.requestedlist[0]["Billeddaykwh"],style: TextStyle(color: Colors.black,fontSize: MediaQuery.of(context).size.width*0.027)))
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: MediaQuery.of(context).size.height*0.01,top:  MediaQuery.of(context).size.height*0.01),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(width: MediaQuery.of(context).size.width*0.36,
                        child: Text("Day Contract Price(p/kWh)",textAlign: TextAlign.end,style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: MediaQuery.of(context).size.width*0.027))),
                    SizedBox(
                      width: MediaQuery.of(context).size.width*.03,
                    ),
                    SizedBox(
                        width: MediaQuery.of(context).size.width*0.36,
                        child: Text(widget.requestedlist[0]["Daycontractprice"],style: TextStyle(color: Colors.black,fontSize: MediaQuery.of(context).size.width*0.027)))
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: MediaQuery.of(context).size.height*0.01,top:  MediaQuery.of(context).size.height*0.01),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(width: MediaQuery.of(context).size.width*0.36,
                        child: Text("Billed Night KWH for this period of time",textAlign: TextAlign.end,style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: MediaQuery.of(context).size.width*0.027))),
                    SizedBox(
                      width: MediaQuery.of(context).size.width*.03,
                    ),
                    SizedBox(
                        width: MediaQuery.of(context).size.width*0.36,
                        child: Text(widget.requestedlist[0]["Billednightkwh"],style: TextStyle(color: Colors.black,fontSize: MediaQuery.of(context).size.width*0.027)))
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: MediaQuery.of(context).size.height*0.01,top:  MediaQuery.of(context).size.height*0.01),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(width: MediaQuery.of(context).size.width*0.36,
                        child: Text("Night Contract Price(p/kWh)",textAlign: TextAlign.end,style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: MediaQuery.of(context).size.width*0.027))),
                    SizedBox(
                      width: MediaQuery.of(context).size.width*.03,
                    ),
                    SizedBox(
                        width: MediaQuery.of(context).size.width*0.36,
                        child: Text(widget.requestedlist[0]["Nightcontractprice"],style: TextStyle(color: Colors.black,fontSize: MediaQuery.of(context).size.width*0.027)))
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: MediaQuery.of(context).size.height*0.01,top:  MediaQuery.of(context).size.height*0.01),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(width: MediaQuery.of(context).size.width*0.36,
                        child: Text("Billed EWE KWH for this period of time",textAlign: TextAlign.end,style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: MediaQuery.of(context).size.width*0.027))),
                    SizedBox(
                      width: MediaQuery.of(context).size.width*.03,
                    ),
                    SizedBox(
                        width: MediaQuery.of(context).size.width*0.36,
                        child: Text(widget.requestedlist[0]["BilledEWEkwh"],style: TextStyle(color: Colors.black,fontSize: MediaQuery.of(context).size.width*0.027)))
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: MediaQuery.of(context).size.height*0.01,top:  MediaQuery.of(context).size.height*0.01),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(width: MediaQuery.of(context).size.width*0.36,
                        child: Text("EWE Contract Price(p/kWh)",textAlign: TextAlign.end,style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: MediaQuery.of(context).size.width*0.027))),
                    SizedBox(
                      width: MediaQuery.of(context).size.width*.03,
                    ),
                    SizedBox(
                        width: MediaQuery.of(context).size.width*0.36,
                        child: Text(widget.requestedlist[0]["EWEcontractprice"],style: TextStyle(color: Colors.black,fontSize: MediaQuery.of(context).size.width*0.027)))
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: MediaQuery.of(context).size.height*0.01,top:  MediaQuery.of(context).size.height*0.01),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(width: MediaQuery.of(context).size.width*0.36,
                        child: Text("Billed TOTAL KWH for this period of time",textAlign: TextAlign.end,style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: MediaQuery.of(context).size.width*0.027))),
                    SizedBox(
                      width: MediaQuery.of(context).size.width*.03,
                    ),
                    SizedBox(
                        width: MediaQuery.of(context).size.width*0.36,
                        child: Text(widget.requestedlist[0]["BilledTotalkwh"],style: TextStyle(color: Colors.black,fontSize: MediaQuery.of(context).size.width*0.027)))
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: MediaQuery.of(context).size.height*0.01,top:  MediaQuery.of(context).size.height*0.01),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(width: MediaQuery.of(context).size.width*0.36,
                        child: Text("SC Contract Price(p/day)",textAlign: TextAlign.end,style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: MediaQuery.of(context).size.width*0.027))),
                    SizedBox(
                      width: MediaQuery.of(context).size.width*.03,
                    ),
                    SizedBox(
                        width: MediaQuery.of(context).size.width*0.36,
                        child: Text(widget.requestedlist[0]["SCcontractprice"],style: TextStyle(color: Colors.black,fontSize: MediaQuery.of(context).size.width*0.027)))
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: MediaQuery.of(context).size.height*0.01,top:  MediaQuery.of(context).size.height*0.01),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(width: MediaQuery.of(context).size.width*0.36,
                        child: Text("SC Total Days",textAlign: TextAlign.end,style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: MediaQuery.of(context).size.width*0.027))),
                    SizedBox(
                      width: MediaQuery.of(context).size.width*.03,
                    ),
                    SizedBox(
                        width: MediaQuery.of(context).size.width*0.36,
                        child: Text(widget.requestedlist[0]["SCtotaldays"],style: TextStyle(color: Colors.black,fontSize: MediaQuery.of(context).size.width*0.027)))
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: MediaQuery.of(context).size.height*0.01,top:  MediaQuery.of(context).size.height*0.01),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(width: MediaQuery.of(context).size.width*0.36,
                        child: Text("p/kWh Sub Total(£)",textAlign: TextAlign.end,style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: MediaQuery.of(context).size.width*0.027))),
                    SizedBox(
                      width: MediaQuery.of(context).size.width*.03,
                    ),
                    SizedBox(
                        width: MediaQuery.of(context).size.width*0.36,
                        child: Text(widget.requestedlist[0]["Subtotal"],style: TextStyle(color: Colors.black,fontSize: MediaQuery.of(context).size.width*0.027)))
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: MediaQuery.of(context).size.height*0.01,top:  MediaQuery.of(context).size.height*0.01),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(width: MediaQuery.of(context).size.width*0.36,
                        child: Text("Fixed amount PA",textAlign: TextAlign.end,style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: MediaQuery.of(context).size.width*0.027))),
                    SizedBox(
                      width: MediaQuery.of(context).size.width*.03,
                    ),
                    SizedBox(
                        width: MediaQuery.of(context).size.width*0.36,
                        child: Text(widget.requestedlist[0]["Fixedamount"],style: TextStyle(color: Colors.black,fontSize: MediaQuery.of(context).size.width*0.027)))
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: MediaQuery.of(context).size.height*0.01,top:  MediaQuery.of(context).size.height*0.01),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(width: MediaQuery.of(context).size.width*0.36,
                        child: Text("Commission for amount claimed",textAlign: TextAlign.end,style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: MediaQuery.of(context).size.width*0.027))),
                    SizedBox(
                      width: MediaQuery.of(context).size.width*.03,
                    ),
                    SizedBox(
                        width: MediaQuery.of(context).size.width*0.36,
                        child: Text(widget.requestedlist[0]["Commissionamountclaimed"],style: TextStyle(color: Colors.black,fontSize: MediaQuery.of(context).size.width*0.027)))
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: MediaQuery.of(context).size.height*0.01,top:  MediaQuery.of(context).size.height*0.01),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(width: MediaQuery.of(context).size.width*0.36,
                        child: Text("Total claimed",textAlign: TextAlign.end,style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: MediaQuery.of(context).size.width*0.027))),
                    SizedBox(
                      width: MediaQuery.of(context).size.width*.03,
                    ),
                    SizedBox(
                        width: MediaQuery.of(context).size.width*0.36,
                        child: Text(widget.requestedlist[0]["Totalclaimed"],style: TextStyle(color: Colors.black,fontSize: MediaQuery.of(context).size.width*0.027)))
                  ],
                ),
              ),
            ],
          ),
        ):
        Container()
      ],
    );
  }
}
