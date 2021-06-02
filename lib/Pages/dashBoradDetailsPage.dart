import 'package:flutter/material.dart';
import 'package:pozitive/Core/Model/Api/dashBoadDetailCredential.dart';
import 'package:pozitive/Core/Model/QuotationHistory_Pop-up.dart';
import 'package:pozitive/Core/Model/user.dart';
import 'package:pozitive/Core/Services/AuthService.dart';
import 'package:pozitive/Core/ViewModel/dashBoardDetailsViewModel.dart';
import 'package:pozitive/Core/baseview.dart';
import 'package:pozitive/Core/enums/view_state.dart';
import 'package:pozitive/Util/theme.dart';
import 'package:pozitive/Widget/DashBorad/dashBoard_detail_list_widget.dart';
import 'package:pozitive/Widget/appbar.dart';
import 'package:pozitive/Widget/commonWidget/paginationwidget.dart';
import 'package:pozitive/Widget/drawerwidget.dart';
import 'package:provider/provider.dart';

class DashBordDetailsPage extends StatelessWidget {
  final String title;
  final String type;
  final int totalItem;
  DashBordDetailsPage({this.title, this.type, this.totalItem: 2});
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      value: AutService().user,
      initialData: User(),
      child: DeshbordDetails(
        title: title,
        type: type,
        totleItem: totalItem,
      ),
    );
  }
}

class DeshbordDetails extends StatefulWidget {
  String title;
  String type;
  int totleItem;

  DeshbordDetails({this.title, this.type, this.totleItem});
  @override
  _DeshbordDetailsPageState createState() => _DeshbordDetailsPageState();
}

class _DeshbordDetailsPageState extends State<DeshbordDetails> {
  int page = 1;

  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  List assginuserlist = ["Abc", "Gdgd", "Xyz"];
  TextEditingController assignusercontroller = TextEditingController();
  TextEditingController searchcontroller = TextEditingController();

  Widget userview() {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: assginuserlist.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            child: ListTile(
              title: Text(
                assginuserlist[index],
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              onTap: () {
                setState(() {
                  assignusercontroller.text = assginuserlist[index];
                });

                Navigator.pop(context);
              },
            ),
          );
        });
  }

  ThemeApp themeApp = ThemeApp();

  List requestedlist = [
    {
      "Status": "Amber",
      "Timer": "18:15",
      "No": "l155455",
      "partner_name": "Black Sheep Utitlities",
      "Last Access": "Quotes Support",
      "Business_name": "Mr M F and Mrs H E Way ta Way Fuels",
      "Required By Date": "02/12/2019",
      "Created/Rerequested Date": "02/12/2019 08:20:16"
    }
  ];
  // List viewlist = [];
  // List<QuotationPopupMenu> quotationHistory = <QuotationPopupMenu>[
  //   QuotationPopupMenu(history: 'QUOTED HISTORY'),
  //   QuotationPopupMenu(history: 'MOVE TO QUOTED'),
  //   QuotationPopupMenu(history: 'REFRESH'),
  //   QuotationPopupMenu(history: 'VALID UP TO'),
  // ];

  // bool isSwitched = false;
  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   for (int i = 0; i < 20; i++) {
  //     setState(() {
  //       viewlist.add({"view": false, "click": false, "checkbox": false});
  //     });
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    return user.accountId != null
        ? BaseView<DashBoardDetailsViewModel>(
            onModelReady: (model) =>
                model.getDashBoardDetails(DashBoardDetailsCredential(
                    accountId: user.accountId,
                    type: widget.type != null ? widget.type.toLowerCase() : "",
                    strstatus: widget.title == "Contract send but not received"
                        ? "CNR"
                        : widget.title == null
                            ? "CNR"
                            : widget.title,
                    noOfRows: '10',
                    txtSearch: '')),
            builder: (context, model, child) {
              if (model.state == ViewState.BUSY) {
                return Scaffold(
                  body: Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              } else {
                return Scaffold(
                  key: _scaffoldKey,
                  appBar: appbar("${widget.type}(${widget.title})", context,
                      _scaffoldKey, true, true),
                  drawer: DrawerWidget(),
                  body: ListView(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(
                            bottom: MediaQuery.of(context).size.width * .02,
                            left: MediaQuery.of(context).size.width * .02,
                            right: MediaQuery.of(context).size.width * .02),
                        child: TextField(
                          controller: searchcontroller,
                          onChanged: (val) {
                            model
                                .getDashBoardDetails(DashBoardDetailsCredential(
                              accountId: user.accountId,
                              txtSearch: val,
                              type: widget.type.toLowerCase(),
                              strstatus: widget.title ==
                                      "Contract send but not received"
                                  ? "CNR"
                                  : widget.title,
                            ));
                          },
                          onSubmitted: (val) {
                            model
                                .getDashBoardDetails(DashBoardDetailsCredential(
                              accountId: user.accountId,
                              txtSearch: val,
                              type: widget.type.toLowerCase(),
                              strstatus: widget.title ==
                                      "Contract send but not received"
                                  ? "CNR"
                                  : widget.title,
                            ));
                          },
                          decoration: InputDecoration(
                              suffixIcon: Image.asset(
                                "assets/search.png",
                                scale: 10,
                              ),
                              hintText: "Search here..."),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            left: MediaQuery.of(context).size.width * .02,
                            right: MediaQuery.of(context).size.width * .02),
                        child: DashBoardListWidget(
                          type: widget.type,
                          dashBoardDetailDataModel:
                              model.dashBoardDetailDataModel,
                          title: widget.title,
                          validUpToMsg: model.validUpToMsg,

                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * .022,
                      ),
                      widget.totleItem > 0
                          ? Paginationwidget(
                              curentpage: page,
                              totalItem: widget.totleItem,
                              perpage: model
                                          .dashBoardDetailDataModel.noOfRows !=
                                      null
                                  ? int.parse(
                                      model.dashBoardDetailDataModel.noOfRows)
                                  : 1,
                              selectDecreaseFunction: () {
                                if (page > 1) {
                                  setState(() {
                                    page--;
                                  });
                                  model.getDashBoardDetails(
                                      DashBoardDetailsCredential(
                                    accountId: user.accountId,
                                    type: widget.type.toLowerCase(),
                                    strstatus: widget.title ==
                                            "Contract send but not received"
                                        ? "CNR"
                                        : widget.title,
                                    pageNo: "$page",
                                  ));
                                }
                              },
                              selectIndexFunction: (value) {
                                model.getDashBoardDetails(
                                    DashBoardDetailsCredential(
                                        accountId: user.accountId,
                                        type: widget.type.toLowerCase(),
                                        strstatus: widget.title ==
                                                "Contract send but not received"
                                            ? "CNR"
                                            : widget.title,
                                        pageNo: "$value"));
                                setState(() {
                                  page = value;
                                });
                              },
                              selectIncreaseFunction: () {
                                print(widget.totleItem);
                                print(page);

                                if (page <= (widget.totleItem / 10)) {
                                  setState(() {
                                    page++;
                                  });
                                  model.getDashBoardDetails(
                                      DashBoardDetailsCredential(
                                          accountId: user.accountId,
                                          type: widget.type.toLowerCase(),
                                          strstatus: widget.title ==
                                                  "Contract send but not received"
                                              ? "CNR"
                                              : widget.title,
                                          pageNo: "$page"));
                                }
                              },
                            )
                          : Container(),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * .022,
                      ),
                    ],
                  ),
                );
              }
            },
          )
        : Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
  }
}
