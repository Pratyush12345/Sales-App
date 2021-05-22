import 'package:flutter/material.dart';
import 'package:pozitive/Core/AppConstact/appConstant.dart';
import 'package:pozitive/Widget/appbar.dart';
import 'package:pozitive/Widget/commission/affiliate_item_widget.dart';
import 'package:pozitive/Util/theme.dart';
import 'package:pozitive/Widget/textfieldsforapp.dart';

class AffiliatesReport extends StatefulWidget {
  @override
  _AffiliatesReportState createState() => _AffiliatesReportState();
}

class _AffiliatesReportState extends State<AffiliatesReport> {

  var key;
  bool isSwitched = false;
  bool _autovalidation = false;
  TextEditingController partnercontroller= TextEditingController();
  ThemeApp themeApp=ThemeApp();
  List requestedlist=[
    {
      "Name":"CO Alliance Managing Agents Ltd",
      "Description":"Affiliate Commissions",
      "ComExcVAT":"27.8500",
      "VAT":"5.5700",
      "ComIncVAT":"33.4200",
      "InvoiceTotal":"33.4200",
      "Business_name":"Mr M F and Mrs H E Way ta Way Fuels",
      "Required By Date":"02/12/2019",
      "Created/Rerequested Date":"02/12/2019 08:20:16",
      "invoice_number":"PZT/2020/02/14_4064",
      "invoice_date":"14/02/2020",
      "invoice_total":"Sales commissions"
    }
  ];
  List viewlist=[];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    for (int i = 0; i < 20; i++) {
      setState(() {
        viewlist.add({
          "view":false,
          "click":false,
          "checkbox":false
        });
      });

    }
  }
  List partner=[
    "Abc","Gdgd","Xyz"
  ];

  Widget partnerview(){
    return  ListView.builder(shrinkWrap:true,itemCount: partner.length,itemBuilder: (BuildContext context,int index){
      return Container(
        child: ListTile(
          title: Text(partner[index],style: TextStyle(fontWeight: FontWeight.bold),),
          onTap: (){
            setState(() {
              partnercontroller.text=partner[index];
            });

            Navigator.pop(context);
          },
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbar("Affiliates Report",context,key,false,true),
      body: Column(

        children: <Widget>[

          Padding(padding: EdgeInsets.only(left: MediaQuery.of(context).size.width*.02,right: MediaQuery.of(context).size.width*.02),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height:MediaQuery.of(context).size.width*.05,
              ),
              Text("Select Affiliate",style: TextStyle(fontSize: MediaQuery.of(context).size.height*.015,color: Color.fromRGBO(31, 33, 29, 1)),),
              SizedBox(
                height: MediaQuery.of(context).size.width*0.01,
              ),
              InkWell(
                child: SizedBox(
                  height: MediaQuery.of(context).size.height*.062,
                  child: dropdowntextfield(partnercontroller,false,_autovalidation,TextInputType.text,"Select Affiliate",
                          (value) {
                        if (value.isEmpty) {
                          return 'Please Select Affiliate';
                        }
                        return null;
                      },context),
                ),
                onTap: (){
                  FocusScope.of(context).requestFocus(FocusNode());
                  showDialog(context: context,
                  builder: (context)=>Dialog(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        SizedBox(height: MediaQuery.of(context).size.height*0.03,),
                        Text("Select Affiliate",style: TextStyle(fontWeight: FontWeight.bold,fontSize: MediaQuery.of(context).size.height*0.03),),
                        SizedBox(height: MediaQuery.of(context).size.height*0.02,),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          height: 1,
                          color: Colors.grey.withOpacity(.2),
                        ),

                        Container(
                          child:  partnerview(),
                        )

                      ],
                    ),

                  ));
                },
              ),
              SizedBox(
                height: MediaQuery.of(context).size.width*0.07,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  InkWell(
                    child: Container(
                      width: MediaQuery.of(context).size.width*.46,
                      height: MediaQuery.of(context).size.height*0.062,
                      child: Center(
                        child: Text("Clear",style: TextStyle(color: Colors.white,fontSize: MediaQuery.of(context).size.height*0.019,
                            fontWeight: FontWeight.bold),),
                      ),
                      decoration: BoxDecoration(
                          color: Color.fromRGBO(155, 119, 217, 1),
                          borderRadius: BorderRadius.circular(30)
                      ),
                    ),
                    onTap: (){
                      AppConstant.showComfirmDialogue(mainContext: context,function: (){
                        partnercontroller.text = '';
                      });

                    },
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width*.46,
                    height: MediaQuery.of(context).size.height*0.062,
                    child: Center(
                      child: Text("Submit",style: TextStyle(color: Colors.white,fontSize: MediaQuery.of(context).size.height*0.019,
                          fontWeight: FontWeight.bold),),
                    ),
                    decoration: BoxDecoration(
                        color: Color.fromRGBO(155, 119, 217, 1),
                        borderRadius: BorderRadius.circular(30)
                    ),
                  ),
                ],
              ),
            ],
          ),
          ),
          SizedBox(
            height:MediaQuery.of(context).size.width*.07,
          ),

          Expanded(
            child: Padding(
              padding:  EdgeInsets.only(left: MediaQuery.of(context).size.width*.02,right: MediaQuery.of(context).size.width*.02),
              child: Column(
                children: <Widget>[
                  Container(
//                  width: MediaQuery.of(context).size.width,
                    color: Color.fromRGBO(18, 122, 69, 1),
                    child: Padding(
                      padding:  EdgeInsets.only(top: MediaQuery.of(context).size.height*0.017,bottom:  MediaQuery.of(context).size.height*0.017),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          SizedBox(
                            width:MediaQuery.of(context).size.width*.02,
                          ),
                          Container(
                              width: MediaQuery.of(context).size.width*.31,
                              child: Text("Invoice Number",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: MediaQuery.of(context).size.height*0.02),)
                          ),
                          Container(
                              width: MediaQuery.of(context).size.width*.28,
                              child: Text("Invoice Date",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: MediaQuery.of(context).size.height*0.02),)
                          ),

                          Container(
                              width: MediaQuery.of(context).size.width*.30,
                              child: Text("Action   ",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: MediaQuery.of(context).size.height*0.02),textAlign: TextAlign.center,)
                          ),

                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(padding: EdgeInsets.all(0),shrinkWrap: true,itemCount: 20,itemBuilder: (BuildContext context,int index){
                      return EffiliateItemReport(
                      index: index,
                      viewlist: viewlist,
                      requestedlist: requestedlist,);
                    }),
                  )

                ],
              ),
            ),
          ),
        ],
      ),

    );
  }
}
