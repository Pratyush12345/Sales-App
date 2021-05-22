/// preview from excel sheet

import 'package:flutter/material.dart';
import 'package:pozitive/Core/AppConstact/appString.dart';
import 'package:pozitive/Core/AppConstact/assetApp.dart';
import 'package:pozitive/Core/AppConstact/sizeConfig.dart';
import 'package:pozitive/Core/ViewModel/Group-Quotation/group_quotation/group_quotation_tab_viewmodel.dart';
import 'package:pozitive/Core/ViewModel/group_quotation_viewmodel.dart';
import 'package:pozitive/Core/baseview.dart';
import 'package:pozitive/Util/theme.dart';
import 'package:provider/provider.dart';
import './PrivewList.dart';
import 'package:intl/intl.dart';

class Preview extends StatefulWidget {
  String groupID;
  String downloadUrl;
  Preview({this.groupID, this.downloadUrl});

  @override
  _PreviewState createState() => _PreviewState();
}

class _PreviewState extends State<Preview> {
  ThemeApp themeApp = ThemeApp();
  bool _autovalidation = false;
  DateFormat dateFormatD = DateFormat("dd/MM/yyyy hh:mm");

  @override
  Widget build(BuildContext context) {
    return Consumer<GroupQuotationViewModel>(
        builder: (context, groupModel, child) {
      // if (groupModel.excelDataBnaam == null) {
      //   return Column(
      //     mainAxisAlignment: MainAxisAlignment.center,
      //     children: [
      //       AppConstant.circularProgressIndicator(),
      //       Text("Please Upload Group File"),
      //     ],
      //   );
      // }

      return BaseView<GroupQuotationTabViewModel>(
          //onModelReady: (model) => model.setPrevData(),
          builder: (context, model, child) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            children: <Widget>[
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                color: Color.fromRGBO(48, 142, 58, 1),
                child: Padding(
                  padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.01,
                    bottom: MediaQuery.of(context).size.height * 0.01,
                    left: MediaQuery.of(context).size.height * 0.03,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Expanded(
                          flex: 2,
                          child: Text(
                            AppString.partnerName,
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize:
                                    MediaQuery.of(context).size.height * 0.02),
                            textAlign: TextAlign.start,
                          )),
                      Expanded(
                          flex: 2,
                          child: Text(
                            AppString.action,
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize:
                                    MediaQuery.of(context).size.height * 0.02),
                          )),
                      //Text('jkfk${widget.groupModel?.excelData[0][1]}'),
                    ],
                  ),
                ),
              ),
              ListView.builder(
                  padding: EdgeInsets.all(0),
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: 5,

                  // itemCount: groupModel.excelDataBnaam.length,
                  itemBuilder: (BuildContext context, int index) {
                    // return Column(
                    //   children: [
                    //     Text('${groupModel?.excelData[index]}'),
                    //     //PreviewListItemWidget(index: index,groupModel: groupModel?.excelData[index],),
                    //   ],
                    // );
                    return Column(
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.only(
                              top: MediaQuery.of(context).size.height * 0.01,
                              bottom:
                                  MediaQuery.of(context).size.height * 0.01),
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                  flex: 4,
                                  child: Padding(
                                    padding: SizeConfig.innersidepadding,
                                    child: Text("business name",
                                        //groupModel.excelDataBnaam[index],
                                        style: TextStyle(
                                            //color: Colors.amber,
                                            fontSize: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.029),
                                        textAlign: TextAlign.start),
                                  )),
                              Expanded(
                                flex: 2,
                                child: InkWell(
                                   child: Text("mpan name",
                               //   child: Text("${groupModel.excelDataMpanNaam1[index] + groupModel.excelDataMpanNaam2[index]}",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.029),
                                      textAlign: TextAlign.start),
                                  onTap: () {
//                      setState(() {
//                        widget.dashBoardDetailDataModel.lstgetdetail[index].click=! widget.dashBoardDetailDataModel.lstgetdetail[index].click;
//                      });
                                  },
                                ),
                              ),
                              Expanded(
                                flex: 2,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    InkWell(
                                      child: Row(
                                        children: [
                                          Image.asset(
                                            AppAssets.view,
                                            scale: 12,
                                          ),
                                          Text(
                                            AppString.view,
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.027,
                                                color: themeApp.purplecolor),
                                          ),
                                        ],
                                      ),
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => PreviewList(
                                                groupID: widget.groupID,
                                                downloadUrl: widget.downloadUrl,
                                                groupModel: groupModel,
                                                index: index,
                                                model: model),
                                          ),
                                        );
                                      },
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    );
                  })
            ],
          ),
        );
      });
    });
  }
}
