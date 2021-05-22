import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pozitive/Core/AppConstact/appColors.dart';
import 'package:pozitive/Core/AppConstact/appString.dart';
import 'package:pozitive/Pages/Group-Quotation-addButton/common_wids_group/site_detail_widget.dart';
import 'package:pozitive/Util/theme.dart';
import 'package:pozitive/Pages/Group-Quotation-addButton/common_wids_group/purple_flat_button.dart';

class SiteDetailScreen extends StatefulWidget {
  @override
  _SiteDetailScreenState createState() => _SiteDetailScreenState();
}

class _SiteDetailScreenState extends State<SiteDetailScreen> {
  final bool fieldsEnabled = true;
  final _formKey = GlobalKey<FormState>();
  final bool autoValidation = false;
  DateFormat dateFormat = DateFormat("dd/MM/yyyy");
  DateFormat dateFormatD = DateFormat("dd/MM/yyyy hh:mm");
  TextEditingController preferredStartDateController = TextEditingController();
  TextEditingController preferredEndDateController = TextEditingController();
  final ThemeApp themeApp = ThemeApp();

  void selectDate(
    BuildContext context,
    String fromField,
  ) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null) {
      if (fromField == AppString.required) {
        setState(() {
          preferredStartDateController.text =
              dateFormatD.format(picked).toString();
        });
      } else if (fromField == AppString.preferred) {
        preferredEndDateController.text = dateFormat.format(picked);
      }
    }
  }

  int siteDetailCount = 1;
  void addSiteDetail() {
    setState(
      () {
        siteDetailCount = siteDetailCount + 1;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.defaultWhite,
      body: Padding(
        padding: EdgeInsets.only(
            left: MediaQuery.of(context).size.width * 0.03,
            right: MediaQuery.of(context).size.width * 0.03),
        child: Form(
          key: _formKey,
          child: ListView.builder(
            itemCount: siteDetailCount,
            itemBuilder: (BuildContext context, int index) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: EdgeInsets.only(left: 10, right: 10, top: 10),
                        child: Text(
                          AppString.siteDetail,
                          style: TextStyle(
                            fontSize: MediaQuery.of(context).size.height * .025,
                            color: themeApp.purplecolor,
                          ),
                        ),
                      ),
                      index == 0
                          ? Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                              ),
                              padding:
                                  EdgeInsets.only(left: 10, right: 10, top: 10),
                              child: FlatButton(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18.0),
                                ),
                                height: 30.0,
                                child: Text(
                                  '+ ADD',
                                  style: TextStyle(
                                      color: AppColors.defaultWhite,
                                      fontSize: 18),
                                ),
                                color: themeApp.greenappcolor,
                                onPressed: addSiteDetail,
                              ),
                            )
                          : Container(),
                    ],
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 10, right: 10),
                    child: Divider(
                      color: themeApp.purplecolor,
                      thickness: 2,
                    ),
                  ),
                  SiteDetailWidget(
                    autoValidation: autoValidation,
                    fieldsEnabled: fieldsEnabled,
                    selectDate: () {
                      selectDate(context, AppString.required);
                    },
                  ),
                  (index == siteDetailCount - 1)
                      ? Column(
                          children: [
                            PurpleFlatButton(
                              text: 'Save and Next',
                              onTap: () {},
                            ),
                            SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.027,
                            ),
                          ],
                        )
                      : Container(),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
