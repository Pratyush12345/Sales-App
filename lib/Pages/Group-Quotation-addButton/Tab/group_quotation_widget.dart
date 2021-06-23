import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:pozitive/Core/AppConstact/appColors.dart';
import 'package:pozitive/Core/AppConstact/appConstant.dart';
import 'package:pozitive/Core/AppConstact/appString.dart';
import 'package:pozitive/Core/ViewModel/group_quotation_viewmodel.dart';
import 'package:pozitive/Pages/Group-Quotation-addButton/common_wids_group/check_box_field_widget.dart';
import 'package:pozitive/Pages/Group-Quotation-addButton/common_wids_group/site_detail_widget.dart';
import 'package:pozitive/Pages/Group-Quotation-addButton/common_wids_group/term_widget.dart';
import 'package:pozitive/Util/theme.dart';
import 'package:pozitive/Widget/commonWidget/appTextField.dart';
import 'package:pozitive/Widget/commonWidget/date_text_field_widget.dart';
import 'package:pozitive/Widget/textfieldsforapp.dart';
import 'package:pozitive/Core/baseview.dart';
import 'package:pozitive/Core/enums/view_state.dart';
import 'package:provider/provider.dart';
import 'package:pozitive/providers/site_list_provider.dart';
import 'package:pozitive/providers/tabcontroller3_provider.dart';
import 'package:pozitive/providers/quotation_detail_provider.dart';

class GroupQuotationWidget extends StatefulWidget {
  final String groupId;

  GroupQuotationWidget({
    this.groupId,
  });

  @override
  _GroupQuotationWidgetState createState() => _GroupQuotationWidgetState();
}

class _GroupQuotationWidgetState extends State<GroupQuotationWidget> {
  @override
  bool datecheck ;
  void initState() {
    super.initState();
    datecheck = false;
    autovalidation = false;
  }

  bool autovalidation = false;
  final ThemeApp themeApp = ThemeApp();
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final _formKey2 = GlobalKey<FormState>();

  SiteListProvider siteListProviderData;
  GroupQuotaionDetailsProvider quotationDetailsProviderData;
  TabController3Provider tabController3Provider;
  @override
  Widget build(BuildContext context) {
    tabController3Provider = Provider.of<TabController3Provider>(context);
    siteListProviderData = Provider.of<SiteListProvider>(context);
    quotationDetailsProviderData =
        Provider.of<GroupQuotaionDetailsProvider>(context);
    return BaseView<GroupQuotationViewModel>(
      onModelReady: (model) => model.initializeData(context: context),
      builder: (context, model, child) {
        if (model.state == ViewState.BUSY) {
          return Container(
            height: MediaQuery.of(context).size.height,
            child: Scaffold(
              body: Center(
                child: AppConstant.circularProgressIndicator(),
              ),
            ),
          );
        }
        return Padding(
          padding: EdgeInsets.only(
            left: MediaQuery.of(context).size.width * 0.035,
            right: MediaQuery.of(context).size.width * 0.035,
          ),
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  //Business or Basket name TextField
                  AppTextField(
                    hintText: AppString.businessBasketName,
                    title: AppString.businessBasketName,
                    controller: model.businessNameController,
                    autoValidation: autovalidation,
                    textInputType: TextInputType.text,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Text(
                        AppString.pleaseNoteIndividualConracts,
                        style: TextStyle(
                          fontSize: MediaQuery.of(context).size.height * .015,
                          color: AppColors.greyColor,
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.015,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        width: MediaQuery.of(context).size.width * .41,
                        height: 2,
                        color: Color.fromRGBO(155, 155, 155, 1),
                      ),
                      Text(
                        AppString.or,
                        style: TextStyle(
                            color: themeApp.purplecolor,
                            fontSize: MediaQuery.of(context).size.height * .02,
                            fontWeight: FontWeight.bold),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * .41,
                        height: 2,
                        color: Color.fromRGBO(155, 155, 155, 1),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.013,
                  ),

                  //Group Name TextField
                  AppTextField(
                    title: AppString.groupName,
                    controller: model.groupNameController,
                    autoValidation: autovalidation,
                    textInputType: TextInputType.text,
                    hintText: AppString.groupName,
                    validator: (value) {
                      if (model.businessNameController.text == '' &&
                          model.groupNameController.text == '') {
                        return AppConstant.stringValidator(value,
                            'either business/basket name or group name.');
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * .004,
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Text(
                        AppString.pleaseNoteGroupContracts,
                        style: TextStyle(
                          fontSize: MediaQuery.of(context).size.height * .015,
                          color: AppColors.greyColor,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.005,
                  ),

                  //Company Name TextField
                  Text(
                    AppString.companyName,
                    style: TextStyle(
                        fontSize: MediaQuery.of(context).size.height * .015,
                        color: Color.fromRGBO(31, 33, 29, 1)),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.01,
                  ),
                  InkWell(
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * .062,
                      child: dropdowntextfield(
                          model.companyNameController,
                          false,
                          model.autoValidation,
                          TextInputType.text,
                          "Select", (value) {
                        // if (value.isEmpty) {
                        //   return 'Please select company name';
                        // }
                        return null;
                      }, context),
                    ),
                    onTap: () {
                      model.typeAheadController.clear();
                      FocusScope.of(context).requestFocus(FocusNode());
                      showDialog(
                        context: context,
                        builder: (context) => Dialog(
                          child: Column(
                            children: [
                              TypeAheadField(
                                keepSuggestionsOnSuggestionSelected: false,
                                hideSuggestionsOnKeyboardHide: false,
                                getImmediateSuggestions: false,
                                textFieldConfiguration: TextFieldConfiguration(
                                  autocorrect: false,
                                  enableInteractiveSelection: false,
                                  enableSuggestions: false,
                                  autofocus: true,
                                  controller: model.typeAheadController,
                                  decoration: InputDecoration(
                                    suffixIcon: Image.asset(
                                      "assets/search.png",
                                      scale: 10,
                                    ),
                                    hintText: "  Select  ",
                                  ),
                                ),
                                onSuggestionSelected: (data) {
                                  print('selected: ${data.text}');
                                },
                                suggestionsCallback: (s) => model.suggestions
                                    .where((c) => c.text
                                        .toLowerCase()
                                        .contains(s.toLowerCase())),
                                keepSuggestionsOnLoading: false,
                                itemBuilder: (context, data) {
                                  return ListTile(
                                    title: Text(
                                      data.text,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    onTap: () {
                                      setState(() {
                                        print(data.text);
                                        model.companyNameController.text =
                                            data.text;

                                        model.getCompanyRegNo(
                                          companyName: data.text,
                                          controller:
                                              model.companyRegNoController,
                                        );
                                      });
                                      Navigator.pop(context);
                                    },
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),

                  //Company Register no TextField
                  (model.companyRegNoEnabled)
                      ? AppTextField(
                          enabled: true,
                          title: AppString.companyRegNo,
                          controller: model.companyRegNoController,
                          autoValidation: autovalidation,
                          textInputType: TextInputType.text,
                          hintText: AppString.companyRegNo,

                          // validator: (value) => AppConstant.stringValidator(
                          //     value, AppString.companyRegNo),
                        )
                      : DisableAppTextField(
                          enabled: false,
                          title: AppString.companyRegNo,
                          controller: model.companyRegNoController,
                          autoValidation: autovalidation,
                          textInputType: TextInputType.number,
                          hintText: AppString.companyRegNo,
                        ),

                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),

                  //Displays terms
                  Text(
                    AppString.terms,
                    style: TextStyle(
                        fontSize: MediaQuery.of(context).size.height * .015,
                        color: Color.fromRGBO(31, 33, 29, 1)),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.008,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    height: MediaQuery.of(context).size.height * 0.13,
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            ShowTerm(
                              yearName: '1 Year',
                              year: model.oneYear,
                              onTapYear: () {
                                setState(() {
                                  model.termError = "";
                                });
                                model.toggleOneYear();
                              },
                              yearSelected: model.isTermSelected,
                            ),
                            ShowTerm(
                              yearName: '2 Year',
                              year: model.twoYear,
                              onTapYear: () {
                                setState(() {
                                  model.termError = "";
                                });
                                model.toggleTwoYear();
                              },
                              yearSelected: model.isTermSelected,
                            ),
                            ShowTerm(
                              yearName: '3 Year',
                              year: model.threeYear,
                              onTapYear: () {
                                setState(() {
                                  model.termError = "";
                                });
                                model.toggleThreeYear();
                              },
                              yearSelected: model.isTermSelected,
                            ),
                            ShowTerm(
                              yearName: '4 Year',
                              year: model.fourYear,
                              onTapYear: () {
                                setState(() {
                                  model.termError = "";
                                });
                                model.toggleFourYear();
                              },
                              yearSelected: model.isTermSelected,
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            ShowTerm(
                              yearName: '5 Year',
                              year: model.fiveYear,
                              onTapYear: () {
                                setState(() {
                                  model.termError = "";
                                });
                                model.toggleFiveYear();
                              },
                              yearSelected: model.isTermSelected,
                            ),
                            ShowTerm(
                              yearName: AppString.other,
                              year: model.other,
                              onTapYear: () {
                                setState(() {
                                  model.termError = "";
                                });
                                model.toggleOther(context);
                              },
                              yearSelected: model.isTermSelected,
                            ),
                            ShowTerm(
                              yearName: AppString.all,
                              year: model.all,
                              onTapYear: () {
                                setState(() {
                                  model.termError = "";
                                });
                                model.toggleAll();
                              },
                              yearSelected: model.isTermSelected,
                            ),
                            Opacity(
                              opacity: 0.0,
                              child: ShowTerm(
                                yearName: 'None       ',
                                year: false,
                                onTapYear: () {},
                                yearSelected: false,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                            color: themeApp.textfieldbordercolor, width: 2),
                        borderRadius: BorderRadius.circular(3)),
                  ),
                  model.termError != ''
                      ? Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.01,
                              ),
                              Text(
                                '   ' + model.termError,
                                style:
                                    TextStyle(color: Colors.red, fontSize: 12),
                              ),
                            ],
                          ),
                        )
                      : Container(),

                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),

                  model.other
                      ? CheckBoxFieldWidget(
                          labelText: AppString.setCommonEndDate,
                          checkBoxSelected: model.setCommonEndDate,
                          onTap: model.onToggleSetCommonEndDate,
                        )
                      : Container(),
                  model.other
                      ? SizedBox(
                          height: MediaQuery.of(context).size.height * 0.02,
                        )
                      : Container(),

                  //Required by date field
                  Text(
                    AppString.requiredByDate,
                    style: TextStyle(
                      fontSize: MediaQuery.of(context).size.height * .015,
                      color: Color.fromRGBO(31, 33, 29, 1),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.01,
                  ),
                  DateTextFieldWidget(
                    autoValidate: datecheck,
                    obscureText: false,
                    hintText: model.dateRFormat.format(DateTime.now()),
                    controller: model.requireByDateController,
                    textInputType: TextInputType.text,
                    validator: (value) {
                      if (value.isEmpty) {
                        return "Please Select Date";
                      }
                      return null;
                    },
                    onTap: () {
                      FocusScope.of(context).unfocus();
                      setState(() {
                        if(datecheck)
                          datecheck = false;
                        else
                        datecheck =true;
                      });
                      model.selectDate(
                          context: context,
                          controller: model.requireByDateController,
                          fromField: AppString.required);
                    },
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),

                  // Preferred End Date
                  (model.setCommonEndDate && model.other)
                      ? Text(
                          AppString.preferredEndDate,
                          style: TextStyle(
                            fontSize: MediaQuery.of(context).size.height * .015,
                            color: Color.fromRGBO(31, 33, 29, 1),
                          ),
                        )
                      : Container(),
                  (model.setCommonEndDate && model.other)
                      ? SizedBox(
                          height: MediaQuery.of(context).size.height * 0.01,
                        )
                      : Container(),
                  (model.setCommonEndDate && model.other)
                      ? DateTextFieldWidget(
                          autoValidate: autovalidation,
                          obscureText: false,
                          controller: model.preferredEndDateController,
                          hintText: AppString.selectDate,
                          textInputType: TextInputType.text,
                          validator: (value) {
                            if (value.isEmpty) {
                              return "Please Select Date";
                            }
                            return null;
                          },
                          onTap: () {
                            FocusScope.of(context).unfocus();
                            model.selectDate(
                                context: context,
                                controller: model.preferredEndDateController,
                                fromField: AppString.preferred);
                          },
                        )
                      : Container(),
                  (model.setCommonEndDate && model.other)
                      ? SizedBox(
                          height: MediaQuery.of(context).size.height * 0.02,
                        )
                      : Container(),

                  // CheckBoxes
                  CheckBoxFieldWidget(
                    labelText: AppString.customerThirdPartyMopContract,
                    checkBoxSelected: model.mop,
                    onTap: model.onToggleThirdPartyMop,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.024,
                  ),
                  CheckBoxFieldWidget(
                    labelText: AppString.customerThirdPartyDADCContract,
                    checkBoxSelected: model.daDc,
                    onTap: model.onToggleThirdPartyDADCContract,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.024,
                  ),
                  CheckBoxFieldWidget(
                    labelText: AppString.pozitiveEnergyToNominateStarkAsDADC,
                    checkBoxSelected: model.starkDaDc,
                    onTap: model.onToggleStarkDa,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),

                  //Site Detail Widget
                  Container(
                    child: Form(
                      key: _formKey2,
                      child: ListView.builder(
                        itemCount: model.siteControllerModelList.length,
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return model.siteControllerModelList[index].child;
                        },
                      ),
                    ),
                  ),

                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.033,
                  ),
                  //Buttons

                  InkWell(
                    onTap: () {
                      if (_formKey.currentState.validate() &&
                          model.checkTerms() &&
                          model.validateSiteDetails()) {
                        print("==========================================");
                        model.askForQuote(
                          tabController3Provider: tabController3Provider,
                          quotaionDetailsProvider: quotationDetailsProviderData,
                          siteListProviderData: siteListProviderData,
                          textlist: model.textlist,
                          context: context,
                          apiCommand: model.groupIdFromPref == null
                              ? "Insert"
                              : "Update",
                        );
                      } else {
                        model.sitevalidate(
                          context: context,
                        );
                        AppConstant.showFailToast(
                            context, "Please add required fields");
                        setState(() {
                          if (model.checkTerms()) {
                            model.termError = "";
                          } else {
                            model.termError = "Please select atleast one Term";
                          }
                          model.termsSelect = false;
                          model.autovalidation = true;
                          autovalidation = true;
                        });
                      }
                    },
                    child: Container(
                      margin: EdgeInsets.only(
                        bottom: MediaQuery.of(context).size.height * 0.03,
                      ),
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 0.062,
                      child: Center(
                        child: Text(
                          model.groupIdFromPref == null
                              ? AppString.askForQuote
                              : 'UPDATE QUOTE',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize:
                                  MediaQuery.of(context).size.height * 0.017,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      decoration: BoxDecoration(
                          color: Color.fromRGBO(155, 119, 217, 1),
                          borderRadius: BorderRadius.circular(30)),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
