import 'package:flutter/material.dart';
import 'package:pozitive/Core/AppConstact/appString.dart';
import 'package:pozitive/Core/AppConstact/sizeConfig.dart';
import 'package:pozitive/Core/Model/dashBoardDetailsDataModel.dart';
import 'package:pozitive/Util/theme.dart';
import 'package:pozitive/Widget/DashBorad/dashboard_list_item_widget.dart';

class DashBoardListWidget extends StatefulWidget {
  final DashBoardDetailDataModel dashBoardDetailDataModel;
  final String type;
  final int Qid;
  final Lstgetdetail lstgetdetail;
  final String title;
  final List<String> validUpToMsg;

  const DashBoardListWidget(
      {this.dashBoardDetailDataModel,
      this.type,
      this.Qid,
      this.lstgetdetail,
      this.title,
      this.validUpToMsg});
  @override
  _DashBoardListWidgetState createState() => _DashBoardListWidgetState();
}

class _DashBoardListWidgetState extends State<DashBoardListWidget> {
  ThemeApp themeApp = ThemeApp();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          width: MediaQuery.of(context).size.width,
          color: Color.fromRGBO(48, 142, 58, 1),
          child: Padding(
            padding: EdgeInsets.only(
              top: MediaQuery.of(context).size.height * 0.01,
              bottom: MediaQuery.of(context).size.height * 0.01,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Expanded(
                    flex: 2,
                    child: Padding(
                      padding: SizeConfig.innersidepadding,
                      child: Text(AppString.status,
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize:
                                  MediaQuery.of(context).size.height * 0.02),
                          textAlign: TextAlign.start),
                    )),
                Expanded(
                    flex: 2,
                    child: Text(
                      AppString.businessName,
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: MediaQuery.of(context).size.height * 0.02),
                      textAlign: TextAlign.start,
                    )),
                Expanded(
                    flex: 2,
                    child: Text(
                      '       ${AppString.action}',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: MediaQuery.of(context).size.height * 0.02),
                    )),
              ],
            ),
          ),
        ),
        ListView.builder(
            padding: EdgeInsets.all(0),
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: widget.dashBoardDetailDataModel.lstgetdetail.length,
            itemBuilder: (BuildContext context, int index) {
              return DashBoardListItemWidget(
                lstDetail: widget.dashBoardDetailDataModel.lstgetdetail[index],
                index: index,
                type: widget.type,
                quoteId: widget.Qid.toString(),
                title: widget.title,
                validUpToMsg: widget.validUpToMsg,
              );
            })
      ],
    );
  }
}
