import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pozitive/Core/AppConstact/appConstant.dart';
import 'package:pozitive/Core/AppConstact/appString.dart';
import 'package:pozitive/Core/Model/user.dart';
import 'package:pozitive/Core/ViewModel/quotation_page/quotation_gas_viewmodel.dart';
import 'package:pozitive/Core/baseview.dart';
import 'package:pozitive/Core/enums/view_state.dart';
import 'package:pozitive/Util/theme.dart';
import 'package:pozitive/Widget/commonWidget/appTextField.dart';
import 'package:pozitive/Util/global.dart' as globals;
import 'package:provider/provider.dart';
import 'package:pozitive/Pages/ViewQuotationIndividual/ViewQuotation_page.dart';
import 'package:pozitive/Widget/textfieldsforapp.dart';
import 'package:pozitive/Core/Model/sharePrefModel/quotation_individual_model.dart';
import 'package:pozitive/Util/Pref.dart';

class Gas extends StatefulWidget {
  final String quoteID;
  Gas({this.quoteID});
  @override
  _GasState createState() => _GasState();
}

class _GasState extends State<Gas> {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  ThemeApp themeApp = ThemeApp();

  TextEditingController mprn = TextEditingController();
  TextEditingController eac = TextEditingController();
  bool _autovalidation = false;
  final _formKey = GlobalKey<FormState>();
  bool isMprnEntered = false;
  QuotationIndividualModel individual;

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: BaseView<QuotationGasViewModel>(
          onModelReady: (model) => model.initializeData(),
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
                    SizedBox(
                      child: innertextfield2(
                          model.mPrnController,
                          false,
                          _autovalidation,
                          TextInputType.number,
                          "MPRN", (value) {
                        String patttern = '[0-9]';

                        if (value.length != 0) {
                          setState(() {
                            isMprnEntered = true;
                          });
                          if (value.length < 6 || value.length > 10) {
                            return 'Please enter a valid Mprn';
                          }
                        }
                        if (value.length == 0) {
                          setState(() {
                            isMprnEntered = false;
                          });
                        }

                        return null;
                      }, context, 10),
                    ),
                    AppTextField(
                        enabled: model.enableFields ? true : false,
                        title: AppString.aQ,
                        controller: model.aQController,
                        autoValidation: _autovalidation,
                        textInputType: TextInputType.number,
                        hintText: AppString.aQ,
                        textInputFormatter: [
                          new WhitelistingTextInputFormatter(RegExp("[0-9]")),
                        ],
                        validator: (value) {
                          if (isMprnEntered) {
                            return AppConstant.stringValidator(
                                value, AppString.aQ);
                          }
                        }),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.025,
                    ),
                    InkWell(
                      onTap: () async {
                        FocusScopeNode currentFocus = FocusScope.of(context);
                        if (!currentFocus.hasPrimaryFocus &&
                            currentFocus.focusedChild != null) {
                          currentFocus.focusedChild.unfocus();
                        }
                        individual = await Prefs.getQuotationInvidualDetails();
                        if (individual != null) {
                          if (_formKey.currentState.validate()) {
                            model.onAskQuote(widget.quoteID, context);
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
                            "ASK FOR QUOTE",
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
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.028,
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.028,
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }
}
