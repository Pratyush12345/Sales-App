import 'dart:convert';
import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pozitive/Core/AppConstact/appColors.dart';
import 'package:pozitive/Core/AppConstact/appConstant.dart';
import 'package:pozitive/Core/AppConstact/appString.dart';
import 'package:pozitive/Core/Model/user.dart';
import 'package:pozitive/Core/ViewModel/Group-Quotation/group_quotation/TemplateGroupQuoteViewModel.dart';
import 'package:pozitive/Core/baseview.dart';
import 'package:pozitive/Util/theme.dart';
import 'package:pozitive/Widget/commonWidget/appTextField.dart';
import 'package:provider/provider.dart';
import 'package:pozitive/Util/global.dart' as globals;



class TemplateQuotation extends StatefulWidget {
  @override
  _TemplateQuotationState createState() => _TemplateQuotationState();
}

class _TemplateQuotationState extends State<TemplateQuotation> {


  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);

    return user.accountId != null
        ? BaseView<TemplateQuotationGroupViewModel>(
     //   onModelReady: (model) => model.initializeData(),

        builder: (context, model, child) {
    return Scaffold(
      backgroundColor: Colors.white,
      //appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.only(
            left: MediaQuery.of(context).size.width * 0.03,
            right: MediaQuery.of(context).size.width * 0.03),
        child: ListView(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.018,
            ),
            Container(
              child: Text("Select"),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.018,
            ),
            Container(
              height: MediaQuery.of(context).size.height*.062,
              width: MediaQuery.of(context).size.width,
              child: Row(
                children: <Widget>[
                  SizedBox(
                    width: MediaQuery.of(context).size.width*.02,
                  ),
                  InkWell(
                    child: Container(
                      height: MediaQuery.of(context).size.height*.043,
                      width: MediaQuery.of(context).size.width*.24,
                      child: Center(
                        child: Text("Choose File",style: TextStyle(fontSize: MediaQuery.of(context).size.height*.017,color: Colors.white),),
                      ),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(14),
                          color: model.themeApp.purplecolor
                      ),
                    ),
                    onTap: ()async{
                      FocusScope.of(context).requestFocus(FocusNode());
                      FilePickerResult result = await FilePicker.platform.pickFiles(
                        type: FileType.any,
                      );
                      model.path = result.files.first.path;
                      setState(() {
                        model.pathData=model.path;
                        var bytes = utf8.encode(model.pathData);
                        var base64Str = base64.encode(bytes);
                        print(base64Str);
                      });
                      model.pdffile=File(model.path);
                      final bytes = model.pdffile.readAsBytesSync();
                      model.img64 = base64Encode(bytes);
                      print(model.img64);

                    },
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width*.02,
                  ),
                  model.pathData!=null?Text(model.pathData.substring(model.pathData.lastIndexOf("/") + 1),style: TextStyle(fontSize: MediaQuery.of(context).size.height*.017,color: Color.fromRGBO(0, 0, 0, .5))):Text("No File Chosen",style: TextStyle(fontSize: MediaQuery.of(context).size.height*.017,color: Color.fromRGBO(0, 0, 0, .5)),),


                ],
              ),
              decoration: BoxDecoration(
                  color: Colors.white,
                  border:Border.all(color: model.themeApp.textfieldbordercolor,width: 2),
                  borderRadius: BorderRadius.circular(3)
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height*0.025,
            ),
            InkWell(
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height*0.062,
                child: Center(
                  child: Text("Downloads",style: TextStyle(color: Colors.white,fontSize: MediaQuery.of(context).size.height*0.019,
                      fontWeight: FontWeight.bold),),
                ),
                decoration: BoxDecoration(
                    color: Color.fromRGBO(155, 119, 217, 1),
                    borderRadius: BorderRadius.circular(30)
                ),
              ),
              onTap: (){
                model.onClickDownloadTemplate(user.accountId,context);
              },
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height*0.018,
            ),

            AppTextField(
              title: AppString.uniqueRefCode,
              controller: model.uniqueRefCode,
              autoValidation: model.autovalidation,
              textInputType: TextInputType.number,
              hintText: AppString.uniqueRefCode,
              textInputFormatter: [new WhitelistingTextInputFormatter(RegExp("[0-9]")),],
              validator: (value)=>AppConstant.stringValidator(value, AppString.uniqueRefCode),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height*0.022,
            ),

            Text("Terms",style: TextStyle(fontSize: MediaQuery.of(context).size.height*.015,color: Color.fromRGBO(31, 33, 29, 1)),),
            SizedBox(
              height: MediaQuery.of(context).size.height*0.01,
            ),
                 Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  border:Border.all(color: model.themeApp.textfieldbordercolor,width: 2),
                  borderRadius: BorderRadius.circular(3)
              ),
              padding: EdgeInsets.all(10),
              child: Center(
                child: Column(
                  //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height*.02,

                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
//ltd
                          InkWell(
                            child: Container(
                              //height: MediaQuery.of(context).size.height*.062,
                              child: Row(
                                children: <Widget>[
                                  model.ltd?Icon(Icons.check_box,color: Color.fromRGBO(155, 119, 217, 1),size: MediaQuery.of(context).size.height*.023,):InkWell(child: Icon(Icons.check_box_outline_blank,color: Color.fromRGBO(155, 119, 217, 1),size: MediaQuery.of(context).size.height*.023,),
                                    onTap: (){
                                      setState(() {
                                        model.ltd=! model.ltd;
                                      });
                                    },),
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width*.02,
                                  ),
                                  Text("LTD",style: TextStyle(fontSize: MediaQuery.of(context).size.height*.02,color: Color.fromRGBO(0, 0, 0, .8)),),
                                ],
                              ),
                            ),
                            onTap: (){
                              setState(() {
                                model.ltd=!model.ltd;
                              });
                            },
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width*0.035,
                          ),
                          InkWell(
                            child: Container(
                              height: MediaQuery.of(context).size.height*.062,
                              child: Row(
                                children: <Widget>[
                                  model.limitedLiab?Icon(Icons.check_box,color: Color.fromRGBO(155, 119, 217, 1),size: MediaQuery.of(context).size.height*.023,):InkWell(child: Icon(Icons.check_box_outline_blank,color: Color.fromRGBO(155, 119, 217, 1),size: MediaQuery.of(context).size.height*.023,),
                                    onTap: (){
                                      setState(() {
                                        model.limitedLiab=!model.limitedLiab;
                                      });
                                    },),
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width*.02,
                                  ),
                                  Text("Limited Liability Partnership",style: TextStyle(fontSize: MediaQuery.of(context).size.height*.02,color: Color.fromRGBO(0, 0, 0, .8)),),
                                ],
                              ),
                            ),
                            onTap: (){
                              setState(() {
                                model.limitedLiab=!model.limitedLiab;
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height*0.018,
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height*.02,

                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,

                        children: [
                          InkWell(
                            child: Container(
                             // height: MediaQuery.of(context).size.height*.062,
                              child: Row(
                                children: <Widget>[
                                  model.publicSec?Icon(Icons.check_box,color: Color.fromRGBO(155, 119, 217, 1),size: MediaQuery.of(context).size.height*.023,):InkWell(child: Icon(Icons.check_box_outline_blank,color: Color.fromRGBO(155, 119, 217, 1),size: MediaQuery.of(context).size.height*.023,),
                                    onTap: (){
                                      setState(() {
                                        model.publicSec=!model.publicSec;
                                      });
                                    },),
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width*.02,
                                  ),
                                  Text("Public Sector",style: TextStyle(fontSize: MediaQuery.of(context).size.height*.02,color: Color.fromRGBO(0, 0, 0, .8)),),
                                ],
                              ),
                            ),
                            onTap: (){
                              setState(() {
                                model.publicSec=!model.publicSec;
                              });
                            },
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width*0.035,
                          ),
                          InkWell(
                            child: Container(
                              //height: MediaQuery.of(context).size.height*.062,
                              child: Row(
                                children: <Widget>[
                                  model.soleProperty?Icon(Icons.check_box,color: Color.fromRGBO(155, 119, 217, 1),size: MediaQuery.of(context).size.height*.023,):InkWell(child: Icon(Icons.check_box_outline_blank,color: Color.fromRGBO(155, 119, 217, 1),size: MediaQuery.of(context).size.height*.023,),
                                    onTap: (){
                                      setState(() {
                                        model.soleProperty=!model.soleProperty;
                                      });
                                    },),
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width*.02,
                                  ),
                                  Text("Sole Proprietor",style: TextStyle(fontSize: MediaQuery.of(context).size.height*.02,color: Color.fromRGBO(0, 0, 0, .8)),),
                                ],
                              ),
                            ),
                            onTap: (){
                              setState(() {
                                model.soleProperty=!model.soleProperty;
                              });
                            },
                          ),

                        ],
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height*0.018,
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height*.02,

                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                           InkWell(
                             child: Container(
                             //  height: MediaQuery.of(context).size.height*.062,
                               child: Row(
                                 children: <Widget>[
                                   model.partner?Icon(Icons.check_box,color: Color.fromRGBO(155, 119, 217, 1),size: MediaQuery.of(context).size.height*.023,):InkWell(child: Icon(Icons.check_box_outline_blank,color: Color.fromRGBO(155, 119, 217, 1),size: MediaQuery.of(context).size.height*.023,),
                                     onTap: (){
                                       setState(() {
                                         model.partner=!model.partner;
                                       });
                                     },),
                                   SizedBox(
                                     width: MediaQuery.of(context).size.width*.02,
                                   ),
                                   Text("Partnership",style: TextStyle(fontSize: MediaQuery.of(context).size.height*.02,color: Color.fromRGBO(0, 0, 0, .8)),),
                                 ],
                               ),
                             ),
                             onTap: (){
                               setState(() {
                                 model.partner=!model.partner;
                               });
                             },
                           ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width*0.035,
                          ),
                          //plc
                          InkWell(
                            child: Container(
                              // height: MediaQuery.of(context).size.height*.062,
                              child: Row(
                                children: <Widget>[
                                  model.plc?Icon(Icons.check_box,color: Color.fromRGBO(155, 119, 217, 1),size: MediaQuery.of(context).size.height*.023,):InkWell(child: Icon(Icons.check_box_outline_blank,color: Color.fromRGBO(155, 119, 217, 1),size: MediaQuery.of(context).size.height*.023,),
                                    onTap: (){
                                      setState(() {
                                        model.plc=!model.plc;
                                      });
                                    },),
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width*.02,
                                  ),
                                  Text("PLC",style: TextStyle(fontSize: MediaQuery.of(context).size.height*.02,color: Color.fromRGBO(0, 0, 0, .8)),),
                                ],
                              ),
                            ),
                            onTap: (){
                              setState(() {
                                model.plc=!model.plc;
                              });
                            },
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width*0.035,
                          ),
//Charity
                          InkWell(
                            child: Container(
                              //height: MediaQuery.of(context).size.height*.062,
                              child: Row(
                                children: <Widget>[
                                  model.charity?Icon(Icons.check_box,color: Color.fromRGBO(155, 119, 217, 1),size: MediaQuery.of(context).size.height*.023,):InkWell(child: Icon(Icons.check_box_outline_blank,color: Color.fromRGBO(155, 119, 217, 1),size: MediaQuery.of(context).size.height*.023,),
                                    onTap: (){
                                      setState(() {
                                        model.charity=!model.charity;
                                      });
                                    },),
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width*.02,
                                  ),
                                  Text("Charity",style: TextStyle(fontSize: MediaQuery.of(context).size.height*.02,color: Color.fromRGBO(0, 0, 0, .8)),),
                                ],
                              ),
                            ),
                            onTap: (){
                              setState(() {
                                model.charity=!model.charity;
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height*0.018,
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height*.02,
                      child: Row(
                        children: [
                          InkWell(
                            child: Container(
                              height: MediaQuery.of(context).size.height*.062,
                              child: Row(
                                children: <Widget>[
                                  model.llc?Icon(Icons.check_box,color: Color.fromRGBO(155, 119, 217, 1),size: MediaQuery.of(context).size.height*.023,):InkWell(child: Icon(Icons.check_box_outline_blank,color: Color.fromRGBO(155, 119, 217, 1),size: MediaQuery.of(context).size.height*.023,),
                                    onTap: (){
                                      setState(() {
                                        model.llc=!model.llc;
                                      });
                                    },),
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width*.02,
                                  ),
                                  Text("LLC",style: TextStyle(fontSize: MediaQuery.of(context).size.height*.02,color: Color.fromRGBO(0, 0, 0, .8)),),
                                ],
                              ),
                            ),
                            onTap: (){
                              setState(() {
                                model.llc=!model.llc;
                              });
                            },
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width*0.030,
                          ),
                          InkWell(
                            child: Container(
                              height: MediaQuery.of(context).size.height*.062,
                              child: Row(
                                children: <Widget>[
                                  model.microBusines?Icon(Icons.check_box,color: Color.fromRGBO(155, 119, 217, 1),size: MediaQuery.of(context).size.height*.023,):InkWell(child: Icon(Icons.check_box_outline_blank,color: Color.fromRGBO(155, 119, 217, 1),size: MediaQuery.of(context).size.height*.023,),
                                    onTap: (){
                                      setState(() {
                                        model.microBusines=!model.microBusines;
                                      });
                                    },),
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width*.02,
                                  ),
                                  Text("MicroBusiness",style: TextStyle(fontSize: MediaQuery.of(context).size.height*.02,color: Color.fromRGBO(0, 0, 0, .8)),),
                                ],
                              ),
                            ),
                            onTap: (){
                              setState(() {
                                model.microBusines=!model.microBusines;
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

            ),

     //commented
       /*     Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  border:Border.all(color: model.themeApp.textfieldbordercolor,width: 2),
                  borderRadius: BorderRadius.circular(3)
              ),
              padding: EdgeInsets.all(10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: InkWell(
                          child: Container(
                            height: MediaQuery.of(context).size.height*.062,
                            child: Row(
                              children: <Widget>[
                                ltd?Icon(Icons.check_box,color: Color.fromRGBO(155, 119, 217, 1),size: MediaQuery.of(context).size.height*.023,):InkWell(child: Icon(Icons.check_box_outline_blank,color: Color.fromRGBO(155, 119, 217, 1),size: MediaQuery.of(context).size.height*.023,),
                                  onTap: (){
                                    setState(() {
                                      ltd=!ltd;
                                    });
                                  },),
                                SizedBox(
                                  width: MediaQuery.of(context).size.width*.02,
                                ),
                                Text("LTD",style: TextStyle(fontSize: MediaQuery.of(context).size.height*.02,color: Color.fromRGBO(0, 0, 0, .8)),),
                              ],
                            ),
                          ),
                          onTap: (){
                            setState(() {
                              ltd=!ltd;
                            });
                          },
                        ),
                      ),
                      Expanded(
                        child: Container(
                          height: 20,
                          child:  InkWell(
                            child: Container(
                              height: MediaQuery.of(context).size.height*.062,
                              child: Row(
                                children: <Widget>[
                                  plc?Icon(Icons.check_box,color: Color.fromRGBO(155, 119, 217, 1),size: MediaQuery.of(context).size.height*.023,):InkWell(child: Icon(Icons.check_box_outline_blank,color: Color.fromRGBO(155, 119, 217, 1),size: MediaQuery.of(context).size.height*.023,),
                                    onTap: (){
                                      setState(() {
                                        plc=!plc;
                                      });
                                    },),
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width*.02,
                                  ),
                                  Text("PLC",style: TextStyle(fontSize: MediaQuery.of(context).size.height*.02,color: Color.fromRGBO(0, 0, 0, .8)),),
                                ],
                              ),
                            ),
                            onTap: (){
                              setState(() {
                                plc=!plc;
                              });
                            },
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          height: 20,
                          child:  InkWell(
                            child: Container(
                              height: MediaQuery.of(context).size.height*.062,
                              child: Row(
                                children: <Widget>[
                                  charity?Icon(Icons.check_box,color: Color.fromRGBO(155, 119, 217, 1),size: MediaQuery.of(context).size.height*.023,):InkWell(child: Icon(Icons.check_box_outline_blank,color: Color.fromRGBO(155, 119, 217, 1),size: MediaQuery.of(context).size.height*.023,),
                                    onTap: (){
                                      setState(() {
                                        charity=!charity;
                                      });
                                    },),
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width*.02,
                                  ),
                                  Text("Charity",style: TextStyle(fontSize: MediaQuery.of(context).size.height*.02,color: Color.fromRGBO(0, 0, 0, .8)),),
                                ],
                              ),
                            ),
                            onTap: (){
                              setState(() {
                                charity=!charity;
                              });
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height*0.028,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          height: 20,
                          child:  InkWell(
                            child: Container(
                              height: MediaQuery.of(context).size.height*.062,
                              child: Row(
                                children: <Widget>[
                                  publicSec?Icon(Icons.check_box,color: Color.fromRGBO(155, 119, 217, 1),size: MediaQuery.of(context).size.height*.023,):InkWell(child: Icon(Icons.check_box_outline_blank,color: Color.fromRGBO(155, 119, 217, 1),size: MediaQuery.of(context).size.height*.023,),
                                    onTap: (){
                                      setState(() {
                                        publicSec=!publicSec;
                                      });
                                    },),
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width*.02,
                                  ),
                                  Text("Public Sector",style: TextStyle(fontSize: MediaQuery.of(context).size.height*.02,color: Color.fromRGBO(0, 0, 0, .8)),),
                                ],
                              ),
                            ),
                            onTap: (){
                              setState(() {
                                publicSec=!publicSec;
                              });
                            },
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          height: 20,
                          child:  InkWell(
                            child: Container(
                              height: MediaQuery.of(context).size.height*.062,
                              child: Row(
                                children: <Widget>[
                                  soleProperty?Icon(Icons.check_box,color: Color.fromRGBO(155, 119, 217, 1),size: MediaQuery.of(context).size.height*.023,):InkWell(child: Icon(Icons.check_box_outline_blank,color: Color.fromRGBO(155, 119, 217, 1),size: MediaQuery.of(context).size.height*.023,),
                                    onTap: (){
                                      setState(() {
                                        soleProperty=!soleProperty;
                                      });
                                    },),
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width*.02,
                                  ),
                                  Text("Sole Proprietor",style: TextStyle(fontSize: MediaQuery.of(context).size.height*.02,color: Color.fromRGBO(0, 0, 0, .8)),),
                                ],
                              ),
                            ),
                            onTap: (){
                              setState(() {
                                soleProperty=!soleProperty;
                              });
                            },
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          height: 20,
                          child:  InkWell(
                            child: Container(
                              height: MediaQuery.of(context).size.height*.062,
                              child: Row(
                                children: <Widget>[
                                  partner?Icon(Icons.check_box,color: Color.fromRGBO(155, 119, 217, 1),size: MediaQuery.of(context).size.height*.023,):InkWell(child: Icon(Icons.check_box_outline_blank,color: Color.fromRGBO(155, 119, 217, 1),size: MediaQuery.of(context).size.height*.023,),
                                    onTap: (){
                                      setState(() {
                                        partner=!partner;
                                      });
                                    },),
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width*.02,
                                  ),
                                  Text("Partnership",style: TextStyle(fontSize: MediaQuery.of(context).size.height*.02,color: Color.fromRGBO(0, 0, 0, .8)),),
                                ],
                              ),
                            ),
                            onTap: (){
                              setState(() {
                                partner=!partner;
                              });
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height*0.018,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        height: 20,
                        child:  InkWell(
                          child: Container(
                            height: MediaQuery.of(context).size.height*.062,
                            child: Row(
                              children: <Widget>[
                                limitedLiab?Icon(Icons.check_box,color: Color.fromRGBO(155, 119, 217, 1),size: MediaQuery.of(context).size.height*.023,):InkWell(child: Icon(Icons.check_box_outline_blank,color: Color.fromRGBO(155, 119, 217, 1),size: MediaQuery.of(context).size.height*.023,),
                                  onTap: (){
                                    setState(() {
                                      limitedLiab=!limitedLiab;
                                    });
                                  },),
                                SizedBox(
                                  width: MediaQuery.of(context).size.width*.02,
                                ),
                                Text("Limited Liability Partnership",style: TextStyle(fontSize: MediaQuery.of(context).size.height*.02,color: Color.fromRGBO(0, 0, 0, .8)),),
                              ],
                            ),
                          ),
                          onTap: (){
                            setState(() {
                              limitedLiab=!limitedLiab;
                            });
                          },
                        ),
                      ),
                      SizedBox(
                        width: 50,
                      ),

                      Container(
                        height: 20,
                        child:  InkWell(
                          child: Container(
                            height: MediaQuery.of(context).size.height*.062,
                            child: Row(
                              children: <Widget>[
                                llc?Icon(Icons.check_box,color: Color.fromRGBO(155, 119, 217, 1),size: MediaQuery.of(context).size.height*.023,):InkWell(child: Icon(Icons.check_box_outline_blank,color: Color.fromRGBO(155, 119, 217, 1),size: MediaQuery.of(context).size.height*.023,),
                                  onTap: (){
                                    setState(() {
                                      llc=!llc;
                                    });
                                  },),
                                SizedBox(
                                  width: MediaQuery.of(context).size.width*.02,
                                ),
                                Text("LLC",style: TextStyle(fontSize: MediaQuery.of(context).size.height*.02,color: Color.fromRGBO(0, 0, 0, .8)),),
                              ],
                            ),
                          ),
                          onTap: (){
                            setState(() {
                              llc=!llc;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height*0.018,
                  ),
                  Container(
                    height: 20,
                    child: InkWell(
                      child: Container(
                        height: MediaQuery.of(context).size.height*.062,
                        child: Row(
                          children: <Widget>[
                            microBusines?Icon(Icons.check_box,color: Color.fromRGBO(155, 119, 217, 1),size: MediaQuery.of(context).size.height*.023,):InkWell(child: Icon(Icons.check_box_outline_blank,color: Color.fromRGBO(155, 119, 217, 1),size: MediaQuery.of(context).size.height*.023,),
                              onTap: (){
                                setState(() {
                                  microBusines=!microBusines;
                                });
                              },),
                            SizedBox(
                              width: MediaQuery.of(context).size.width*.02,
                            ),
                            Text("MicroBusiness",style: TextStyle(fontSize: MediaQuery.of(context).size.height*.02,color: Color.fromRGBO(0, 0, 0, .8)),),
                          ],
                        ),
                      ),
                      onTap: (){
                        setState(() {
                          microBusines=!microBusines;
                        });
                      },
                    ),
                  ),
                ],
              ),

            ),*/
            SizedBox(
              height: MediaQuery.of(context).size.height*0.022,
            ),
            Container(
              padding: EdgeInsets.only(top:15),
              child: Text("Business Detail",style: TextStyle(color: AppColors.purple,fontSize: 24,fontWeight: FontWeight.bold),),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height*0.022,
            ),
            AppTextField(
              title: AppString.businessName,
              controller: model.businessName,
              autoValidation: model.autovalidation,
              textInputType: TextInputType.text,
              validator: (value)=>AppConstant.stringValidator(value, AppString.businessName),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height*0.018,
            ),
            AppTextField(
              title: "Register Company Name",
              controller: model.regCompName,
              autoValidation: model.autovalidation,
              textInputType: TextInputType.text,
              validator: (value)=>AppConstant.stringValidator(value, AppString.gasMprn),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height*0.018,
            ),
            AppTextField(
              title: "Company Reg. No.",
              controller: model.regCompNo,
              autoValidation: model.autovalidation,
              textInputType: TextInputType.text,
              validator: (value)=>AppConstant.stringValidator(value, AppString.gasMprn),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height*0.018,
            ),
            AppTextField(
              title: "Charity Reg. No.",
              controller: model.charityRegNo,
              autoValidation: model.autovalidation,
              textInputType: TextInputType.text,
              validator: (value)=>AppConstant.stringValidator(value, AppString.gasMprn),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height*0.018,
            ),
            Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  border:Border.all(color: model.themeApp.textfieldbordercolor,width: 2),
                  borderRadius: BorderRadius.circular(3)
              ),
              width: MediaQuery.of(context).size.width,
              child: InkWell(
                child: Container(
                  height: MediaQuery.of(context).size.height*.062,
                  padding: EdgeInsets.only(left:15),
                  child: Row(
                    children: <Widget>[
                      model.microBusines1?Icon(Icons.check_box,color: Color.fromRGBO(155, 119, 217, 1),size: MediaQuery.of(context).size.height*.023,):InkWell(child: Icon(Icons.check_box_outline_blank,color: Color.fromRGBO(155, 119, 217, 1),size: MediaQuery.of(context).size.height*.023,),
                        onTap: (){
                          setState(() {
                            model.microBusines1=!model.microBusines1;
                          });
                        },),
                      SizedBox(
                        width: MediaQuery.of(context).size.width*.02,
                      ),
                      Text("Same billing address for all customer",style: TextStyle(fontSize: MediaQuery.of(context).size.height*.02,color: Color.fromRGBO(0, 0, 0, .8)),),
                    ],
                  ),
                ),
                onTap: (){
                  setState(() {
                    model.microBusines1=!model.microBusines1;
                  });
                },
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height*0.022,
            ),
            Container(
              padding: EdgeInsets.only(top:15),
              child: Text("Billing Address",style: TextStyle(color: AppColors.purple,fontSize: 24,fontWeight: FontWeight.bold),),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height*0.022,
            ),
            AppTextField(
              title: "Address",
              controller: model.billingAddress,
              autoValidation: model.autovalidation,
              textInputType: TextInputType.text,
              validator: (value)=>AppConstant.stringValidator(value, AppString.gasMprn),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height*0.018,
            ),
            AppTextField(
              title: "Town/City",
              controller: model.billingtown,
              autoValidation: model.autovalidation,
              textInputType: TextInputType.text,
              validator: (value)=>AppConstant.stringValidator(value, AppString.gasMprn),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height*0.018,
            ),
            AppTextField(
              title: "PostCode",
              controller: model.billingpostCode,
              autoValidation: model.autovalidation,
              textInputType: TextInputType.text,
              validator: (value)=>AppConstant.stringValidator(value, AppString.gasMprn),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height*0.018,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height*0.022,
            ),
            Container(
              padding: EdgeInsets.only(top:15),
              child: Text("Energy Account Manager",style: TextStyle(color: AppColors.purple,fontSize: 24,fontWeight: FontWeight.bold),),
            ),
            Container(
              child: Text("(For day to day running of account)",style: TextStyle(color: AppColors.purple,fontWeight: FontWeight.bold),),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height*0.022,
            ),
            AppTextField(
              title: "Name",
              controller: model.EAname,
              autoValidation: model.autovalidation,
              textInputType: TextInputType.text,
              validator: (value)=>AppConstant.stringValidator(value, AppString.gasMprn),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height*0.018,
            ),
            AppTextField(
              title: "Email Address",
              controller: model.EAEmail,
              autoValidation: model.autovalidation,
              textInputType: TextInputType.text,
              validator: (value)=>AppConstant.stringValidator(value, AppString.gasMprn),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height*0.018,
            ),
            AppTextField(
              title: "Phone No.",
              controller: model.EAPhone,
              autoValidation: model.autovalidation,
              textInputType: TextInputType.text,
              validator: (value)=>AppConstant.stringValidator(value, AppString.gasMprn),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height*0.018,
            ),
            AppTextField(
              title: "Mobile No.",
              controller: model.EAMobile,
              autoValidation: model.autovalidation,
              textInputType: TextInputType.text,
              validator: (value)=>AppConstant.stringValidator(value, AppString.gasMprn),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height*0.018,
            ),
            Container(
              padding: EdgeInsets.only(top:15),
              child: Text("Declaration and signature",style: TextStyle(color: AppColors.red,fontWeight: FontWeight.bold),),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height*0.018,
            ),
            Container(
              child: Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",style: TextStyle(color: Colors.grey),),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height*0.018,
            ),
            AppTextField(
              title: "Signature 1",
              controller: model.signature1,
              autoValidation: model.autovalidation,
              textInputType: TextInputType.text,
              validator: (value)=>AppConstant.stringValidator(value, AppString.gasMprn),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height*0.018,
            ),
            AppTextField(
              title: "Name 1",
              controller: model.name1,
              autoValidation: model.autovalidation,
              textInputType: TextInputType.text,
              validator: (value)=>AppConstant.stringValidator(value, AppString.gasMprn),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height*0.018,
            ),
            AppTextField(
              title: "Date",
              controller: model.date1,
              autoValidation: model.autovalidation,
              textInputType: TextInputType.text,
              validator: (value)=>AppConstant.stringValidator(value, AppString.gasMprn),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height*0.018,
            ),
            AppTextField(
              title: "Signature 2",
              controller: model.signature2,
              autoValidation: model.autovalidation,
              textInputType: TextInputType.text,
              validator: (value)=>AppConstant.stringValidator(value, AppString.gasMprn),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height*0.018,
            ),
            AppTextField(
              title: "Name 2",
              controller: model.name2,
              autoValidation: model.autovalidation,
              textInputType: TextInputType.text,
              validator: (value)=>AppConstant.stringValidator(value, AppString.gasMprn),

            ),
            SizedBox(
              height: MediaQuery.of(context).size.height*0.018,
            ),
            AppTextField(
              title: "Date",
              controller: model.date2,
              autoValidation: model.autovalidation,
              textInputType: TextInputType.text,
              validator: (value)=>AppConstant.stringValidator(value, AppString.gasMprn),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height*0.018,
            ),
            Container(
              child: Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",style: TextStyle(color: Colors.grey),),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height*0.018,
            ),
            InkWell(
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height*0.062,
                child: Center(
                  child: Text("SAVE AND GENERATE CONTRACT",style: TextStyle(color: Colors.white,fontSize: MediaQuery.of(context).size.height*0.019,
                      fontWeight: FontWeight.bold),),
                ),
                decoration: BoxDecoration(
                    color: Color.fromRGBO(155, 119, 217, 1),
                    borderRadius: BorderRadius.circular(30)
                ),
              ),
              onTap: (){
                model.onSaveAndGenerateContract(user.accountId, context);

              },
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height*0.018,
            ),
            InkWell(
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height*0.062,
                child: Center(
                  child: Text("Back to Quote",style: TextStyle(color: Colors.white,fontSize: MediaQuery.of(context).size.height*0.019,
                      fontWeight: FontWeight.bold),),
                ),
                decoration: BoxDecoration(
                    color: Color.fromRGBO(155, 119, 217, 1),
                    borderRadius: BorderRadius.circular(30)
                ),
              ),
              onTap: (){
                globals.tabController3.animateTo(1);

              },
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height*0.018,
            ),
          ],
        ),
      ),
    );
  }):
  Scaffold(
  body: Center(
  child: CircularProgressIndicator(),
  ),
  );
}
}
