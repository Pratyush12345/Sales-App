import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pozitive/Core/AppConstact/appConstant.dart';
import 'package:pozitive/Core/AppConstact/appString.dart';
import 'package:pozitive/Core/Model/user.dart';
import 'package:pozitive/Core/ViewModel/ViewRequestQuoteViewModels/ViewQuotationPageViewModel.dart';
import 'package:pozitive/Core/baseview.dart';
import 'package:pozitive/Core/enums/view_state.dart';
import 'package:pozitive/Util/theme.dart';
import 'package:pozitive/Widget/commonWidget/appTextField.dart';
import 'package:pozitive/Widget/commonWidget/diabledFieldsTextField.dart';
import 'package:pozitive/Util/global.dart' as globals;
import 'package:provider/provider.dart';
import 'package:pozitive/Widget/commonWidget/appTextField.dart';
import 'package:pozitive/Widget/textfieldsforapp.dart';
import 'package:pozitive/Core/Model/sharePrefModel/quotation_individual_model_Rq.dart';
import 'package:pozitive/Core/Model/sharePrefModel/quotation_electricity_model_Rq.dart';
import 'package:pozitive/Util/Pref.dart';
import 'package:pozitive/Core/Services/database.dart';
import 'package:pozitive/Core/ViewModel/baseModel.dart';
import 'package:pozitive/Core/Model/Api/quotation_invidual/update_button_credentials.dart';

class ViewGas extends StatefulWidget {
  TextEditingController mprn = TextEditingController();
  TextEditingController aqCharge = TextEditingController();
  final String quoteID;
  final String title;
  final String companyId;
  ViewGas({
    this.quoteID,
    this.mprn,
    this.aqCharge,
    this.title,
    this.companyId,
  });
  @override
  _ViewGasState createState() => _ViewGasState();
}

class _ViewGasState extends State<ViewGas> {
  Database database = getIt<DatabaseImplementation>();
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  ThemeApp themeApp = ThemeApp();
  bool gasFieldsEnabled = false;

  bool _autovalidation = false;
  final _formKey = GlobalKey<FormState>();

  //Rq
  TextEditingController mprnRq = TextEditingController();
  TextEditingController aqChargeRq = TextEditingController();
  bool isMprnEnteredRq = false;
  QuotationIndividualModelRq individualModelRq;
  QuotationElectricityModelRq electricityModelRq;

  @override
  void initState() {
    if (widget.title == 'Requested') {
      gasFieldsEnabled = true;
      mprnRq.text = widget.mprn.text;
      aqChargeRq.text = widget.aqCharge.text;
    }
    super.initState();
  }

  void checkOtherDetailsRq(String quoteId) async {
    individualModelRq = await Prefs.getQuotationInvidualDetailsRq();
    electricityModelRq = await Prefs.getQuotationElectricityDetailsRq();
    if ((electricityModelRq?.wholeMpanRq != '') || (mprnRq.text != '')) {
      onUpdateQuote(quoteId);
    } else {
      AppConstant.showFailToast(context, 'Enter either MPAN or MPRN');
    }
  }

  void onUpdateQuote(String quoteId) async {
    User _user = await Prefs.getUser();

    final response = await database.updateRequestQuoteIndividual(
      UpdateButtonCredentials(
        accountId: _user.accountId,
        fullMPAN: electricityModelRq?.wholeMpanRq ?? '',
        mPRN: mprnRq.text ?? '',
        intCompanyId: widget.companyId.toString(),
        quoteid: quoteId,
        businessName: individualModelRq?.businessNameRq ?? '',
        postCode: individualModelRq?.postCodeRq ?? '',
        emailId: _user.emailId ?? '',
        phoneNo: _user.phoneNo ?? '',
        eACDay: electricityModelRq?.eACDayRq ?? '',
        eACNight: electricityModelRq?.eACNightRq ?? '',
        eACEWE: electricityModelRq?.eWERq ?? '',
        isforFirstyear: individualModelRq?.isforFirstyearRq ?? false,
        isforSecondyear: individualModelRq?.isforSecondyearRq ?? false,
        isforThirdyear: individualModelRq?.isforThirdyearRq ?? false,
        isforFourthyear: individualModelRq?.isforFourthyearRq ?? false,
        isforFifthyear: individualModelRq?.isForFifthyearRq ?? false,
        isforOtheryear: individualModelRq?.isforOtheryearRq ?? false,
        requiredByDate: individualModelRq?.requireByDateRq ?? '',
        aQ: aqChargeRq.text ?? '',
        qouteNotes: '',
        preferredStartDate: individualModelRq?.preferredByDateRq ?? '',
        preferredEndDate: individualModelRq?.preferredEndDateRq ?? '',
        preferredEndDate1: '',
        preferredEndDate2: '',
        thirdPartyMOP: individualModelRq?.thirdPartyMOPRq ?? false,
        thirdPartyDADC: individualModelRq?.thirdPartyDADCRq ?? false,
        isStarkDADC: individualModelRq?.isStarkDADCRq ?? false,
        intDADCId: individualModelRq?.isStarkDADCRq ?? '0',
        customerId: '0',
        singleRate: individualModelRq?.singleRateRq ?? false,
        image64HHFile: electricityModelRq?.hhFilePathRq ?? '',
      ),
    );
    if (response != null) {
      AppConstant.showSuccessToast(context, 'Success');
    } else {
      AppConstant.showFailToast(context, 'Failed');
    }
  }

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.white,
      body: BaseView<ViewRequestQuoteViewModel>(
        //   onModelReady: (model) => model.getViewQuoteViewButtonDetails(
        //  user.accountId, AppString.indvidual, '54550', context),
        builder: (context, model, child) {
          if (model.state == ViewState.BUSY) {
            return AppConstant.circularProgressIndicator();
          }
          return Padding(
            padding: EdgeInsets.only(
                left: MediaQuery.of(context).size.width * 0.03,
                right: MediaQuery.of(context).size.width * 0.03),
            child: Form(
              key: _formKey,
              child: ListView(
                children: <Widget>[
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.018,
                  ),
                  RichText(
                    text: TextSpan(
                      text: 'MPRN',
                      style: TextStyle(
                          fontSize: MediaQuery.of(context).size.height * .015,
                          color: Color.fromRGBO(31, 33, 29, 1)),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.01,
                  ),
                  gasFieldsEnabled
                      ? SizedBox(
                          child: innertextfield2(mprnRq, false, _autovalidation,
                              TextInputType.number, "MPRN", (value) {
                            String patttern = '[0-9]';

                            if (value.length != 0) {
                              setState(() {
                                isMprnEnteredRq = true;
                              });
                              if (value.length < 6 || value.length > 10) {
                                return 'Please enter a valid Mprn';
                              }
                            }
                            if (value.length == 0) {
                              setState(() {
                                isMprnEnteredRq = false;
                              });
                            }

                            return null;
                          }, context, 10),
                        )
                      : DisableFieldTextField(
                          controller: widget.mprn,
                          autoValidation: _autovalidation,
                          textInputType: TextInputType.number,
                          hintText: AppString.gasMprn,
                          textInputFormatter: [
                            new WhitelistingTextInputFormatter(RegExp("[0-9]")),
                          ],
                          validator: (value) => AppConstant.stringValidator(
                              value, AppString.gasMprn),
                        ),
                  gasFieldsEnabled
                      ? SizedBox()
                      : SizedBox(
                          height: MediaQuery.of(context).size.height * 0.025,
                        ),
                  gasFieldsEnabled
                      ? AppTextField(
                          title: AppString.aQ,
                          controller: aqChargeRq,
                          autoValidation: _autovalidation,
                          textInputType: TextInputType.number,
                          hintText: AppString.aQ,
                          textInputFormatter: [
                            new WhitelistingTextInputFormatter(RegExp("[0-9]")),
                          ],
                          validator: (value) {
                            if (isMprnEnteredRq) {
                              return AppConstant.stringValidator(
                                  value, AppString.aQ);
                            }
                          })
                      : DisableFieldTextField(
                          title: AppString.aQ,
                          controller: widget.aqCharge,
                          autoValidation: _autovalidation,
                          textInputType: TextInputType.number,
                          hintText: AppString.aQ,
                          textInputFormatter: [
                            new WhitelistingTextInputFormatter(RegExp("[0-9]")),
                          ],
                          validator: (value) =>
                              AppConstant.stringValidator(value, AppString.aQ),
                        ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.025,
                  ),
                  gasFieldsEnabled
                      ? InkWell(
                          onTap: () async {
                            individualModelRq =
                                await Prefs.getQuotationInvidualDetailsRq();
                            if (individualModelRq != null) {
                              if (_formKey.currentState.validate()) {
                                checkOtherDetailsRq(widget.quoteID);
                              }
                            } else {
                              AppConstant.showFailToast(
                                  context, 'Fill individual fields');
                            }
                          },
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height * 0.062,
                            child: Center(
                              child: Text(
                                "Update Quote",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize:
                                        MediaQuery.of(context).size.height *
                                            0.019,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            decoration: BoxDecoration(
                                color: Color.fromRGBO(155, 119, 217, 1),
                                // color: Colors.grey,
                                borderRadius: BorderRadius.circular(30)),
                          ),
                        )
                      : Container(),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.028,
                  ),
                  InkWell(
                    onTap: () {
                      globals.tabController3.animateTo(3);
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 0.062,
                      child: Center(
                        child: Text(
                          "Go to Next",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize:
                                  MediaQuery.of(context).size.height * 0.019,
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
          );
        },
      ),
    );
  }
}
