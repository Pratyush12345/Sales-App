import 'package:flutter/material.dart';
import 'package:pozitive/Util/theme.dart';

class EffiliateItemReport extends StatefulWidget {
  final int index;
  final List viewlist;

  final List requestedlist;


  EffiliateItemReport({this.index, this.viewlist, this.requestedlist});
  @override
  _EffiliateItemReportState createState() => _EffiliateItemReportState();
}

class _EffiliateItemReportState extends State<EffiliateItemReport> {

  final ThemeApp themeApp = ThemeApp();
  @override
  Widget build(BuildContext context) {
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
                      child: Text("${widget.requestedlist[0]["invoice_number"]}",style: TextStyle(color: Colors.black,fontSize: MediaQuery.of(context).size.width*0.029),),
                    )
                ),
                InkWell(
                  child: Container(
                      width: MediaQuery.of(context).size.width*.28,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("${widget.requestedlist[0]["invoice_date"]}",style: TextStyle(color: Colors.black,fontSize: MediaQuery.of(context).size.width*0.029),),
                      )
                  ),
                  onTap: (){
//                                      setState(() {
//                                        viewlist[index]["click"]=!viewlist[index]["click"];
//                                      });
                  },
                ),

                InkWell(
                  child: Container(
                      width: MediaQuery.of(context).size.width*.32,
                      child:Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Image.asset("assets/view.png",scale: 12,),
                          SizedBox(
                            width:MediaQuery.of(context).size.width*.02,
                          ),
                          Text("View Details",style: TextStyle(fontWeight: FontWeight.bold,fontSize: MediaQuery.of(context).size.width*0.027,color:  themeApp.purplecolor),),
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
        widget.viewlist[ widget.index]["click"]?
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
                      child: Text("Name",textAlign: TextAlign.end,style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: MediaQuery.of(context).size.width*0.027,)),
                      width: MediaQuery.of(context).size.width*0.46,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width*.03,
                    ),
                    SizedBox(
                        width: MediaQuery.of(context).size.width*0.46,
                        child: Text(widget.requestedlist[0]["Name"],style: TextStyle(color: Colors.black,fontSize: MediaQuery.of(context).size.width*0.027)))
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
                        width: MediaQuery.of(context).size.width*0.46,
                        child: Text("Description",textAlign: TextAlign.end,style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: MediaQuery.of(context).size.width*0.027))),
                    SizedBox(
                      width: MediaQuery.of(context).size.width*.03,
                    ),
                    SizedBox(
                        width: MediaQuery.of(context).size.width*0.46,
                        child: Text(widget.requestedlist[0]["Description"],style: TextStyle(color: Colors.black,fontSize: MediaQuery.of(context).size.width*0.027)))
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
                        width: MediaQuery.of(context).size.width*0.46,
                        child: Text("Commission Excl. VAT(£)",textAlign: TextAlign.end,style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: MediaQuery.of(context).size.width*0.027))),
                    SizedBox(
                      width: MediaQuery.of(context).size.width*.03,
                    ),
                    SizedBox(
                        width: MediaQuery.of(context).size.width*0.46,
                        child: Text(widget.requestedlist[0]["ComExcVAT"],style: TextStyle(color: Colors.black,fontSize: MediaQuery.of(context).size.width*0.027)))
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
                      width: MediaQuery.of(context).size.width*0.46,
                      child: Text("VAT(£)",textAlign: TextAlign.end,style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: MediaQuery.of(context).size.width*0.027)),),
                    SizedBox(
                      width: MediaQuery.of(context).size.width*.03,
                    ),
                    SizedBox(
                        width: MediaQuery.of(context).size.width*0.46,
                        child: Text(widget.requestedlist[0]["VAT"],style: TextStyle(color: Colors.black,fontSize: MediaQuery.of(context).size.width*0.027)))
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
                        width: MediaQuery.of(context).size.width*0.46,child: Text("Commission Inc. VAT(£)",textAlign: TextAlign.end,style: TextStyle(color: Colors.black,fontSize: MediaQuery.of(context).size.width*0.027,fontWeight: FontWeight.bold))),
                    SizedBox(
                      width: MediaQuery.of(context).size.width*.03,
                    ),
                    SizedBox(
                        width: MediaQuery.of(context).size.width*0.46,
                        child: Text(widget.requestedlist[0]["ComIncVAT"],style: TextStyle(color: Colors.black,fontSize: MediaQuery.of(context).size.width*0.027)))
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: MediaQuery.of(context).size.height*0.01,top:  MediaQuery.of(context).size.height*0.01),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(width: MediaQuery.of(context).size.width*0.46,
                        child: Text("Invoice Total(£)",textAlign: TextAlign.end,style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: MediaQuery.of(context).size.width*0.027))),
                    SizedBox(
                      width: MediaQuery.of(context).size.width*.03,
                    ),
                    SizedBox(
                        width: MediaQuery.of(context).size.width*0.46,
                        child: Text(widget.requestedlist[0]["InvoiceTotal"],style: TextStyle(color: Colors.black,fontSize: MediaQuery.of(context).size.width*0.027)))
                  ],
                ),
              ),
            ],
          ),
        ):
        Container()
      ],
    );  }
}
