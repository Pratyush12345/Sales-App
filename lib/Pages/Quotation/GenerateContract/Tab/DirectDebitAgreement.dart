import 'package:flutter/material.dart';
import 'package:pozitive/Util/theme.dart';
import 'package:pozitive/Widget/commonWidget/appTextField.dart';
import 'package:pozitive/Core/AppConstact/appConstant.dart';
import 'package:pozitive/Core/AppConstact/appString.dart';
import 'package:pozitive/Widget/textfieldsforapp.dart';
import 'package:pozitive/Core/Model/sharePrefModel/SaveAndGenerateContractIndividualModel.dart';
import 'package:pozitive/Core/baseview.dart';
import 'package:pozitive/Core/enums/view_state.dart';
import 'package:signature/signature.dart';
import 'package:pozitive/Core/ViewModel/quotation_page/IndividualContractViewModels/DirectDebitAgreementViewModel.dart';

class DirectDebitAgreement extends StatefulWidget {
  final SaveAndGenerateContractIndividualModel individualModel;
  DirectDebitAgreement({this.individualModel});
  @override
  _DirectDebitAgreementState createState() => _DirectDebitAgreementState();
}

class _DirectDebitAgreementState extends State<DirectDebitAgreement> {
  bool _autovalidation = false;
  ThemeApp themeApp = ThemeApp();
  SignatureController signController =
      SignatureController(penStrokeWidth: 2, penColor: Colors.black);
  @override
  void initState() {
    super.initState();
    signController.addListener(() => print("Value changed"));
  }

  @override
  Widget build(BuildContext context) {
    return BaseView<DirectDebitAgreementViewModel>(
      onModelReady: (model) => model.setDetails(widget.individualModel),
      builder: (context, model, child) {
        if (model.state == ViewState.BUSY) {
          Scaffold(
              body: AppConstant.circularProgressIndicator(),
              backgroundColor: Colors.white);
        }
        return Scaffold(
          backgroundColor: Colors.white,
          body: Container(
            padding: EdgeInsets.all(10),
            margin: EdgeInsets.all(5),
            child: ListView(
              children: [
                Text(
                  'Direct Debit Agreement	Instruction to your Bank or Building Society to pay by Direct Debit.',
                  style: TextStyle(
                      color: Colors.red,
                      fontSize: 14,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.022,
                ),
                Text(
                  "Please pay Pozitive Energy Limited Direct Debits from the account detailed on this instruction, subject to the safeguards assured by the Direct Debit Guarantee. I understand that this instruction may remain with Pozitive Energy Limited and, if so, details will be passed electronically to my Bank or Building Society.",
                  style: TextStyle(
                      fontSize: MediaQuery.of(context).size.height * .015,
                      color: Color.fromRGBO(31, 33, 29, 1)),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.022,
                ),
                AppTextField(
                  enabled: false,
                  title: 'Pozitive Energy Business Customer reference number',
                  controller: model.contractCustomerRefNo,
                  autoValidation: _autovalidation,
                  textInputType: TextInputType.number,
                  hintText: 'Customer Reference Number',
                  validator: (value) => AppConstant.stringValidator(
                      value, 'Customer Reference Number'),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.022,
                ),
                AppTextField(
                  title: 'Name of Account holder',
                  controller: model.contractAccountHolderName,
                  autoValidation: _autovalidation,
                  textInputType: TextInputType.text,
                  hintText: 'Name of Account holder',
                  validator: (value) => AppConstant.stringValidator(
                      value, 'Name of Account holder'),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.022,
                ),
                AppTextField(
                  title: AppString.businessName,
                  controller: model.contractBusinessName,
                  autoValidation: _autovalidation,
                  textInputType: TextInputType.text,
                  hintText: AppString.businessName,
                  validator: (value) => AppConstant.stringValidator(
                      value, AppString.businessName),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.022,
                ),
                Text(
                  'Branch Code',
                  style: TextStyle(
                      fontSize: MediaQuery.of(context).size.height * .015,
                      color: Color.fromRGBO(31, 33, 29, 1)),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.01,
                ),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        child: TextFormField(
                          controller: model.contractBranchCode1,
                          keyboardType: TextInputType.number,
                          autovalidate: _autovalidation,
                        ),
                        height: MediaQuery.of(context).size.height * 0.065,
                        width: MediaQuery.of(context).size.width * 0.13,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(
                                color: themeApp.textfieldbordercolor, width: 2),
                            borderRadius: BorderRadius.circular(3)),
                      ),
                      Container(
                        child: TextFormField(
                          controller: model.contractBranchCode2,
                          keyboardType: TextInputType.number,
                          autovalidate: _autovalidation,
                        ),
                        height: MediaQuery.of(context).size.height * 0.065,
                        width: MediaQuery.of(context).size.width * 0.13,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(
                                color: themeApp.textfieldbordercolor, width: 2),
                            borderRadius: BorderRadius.circular(3)),
                      ),
                      Container(
                        child: TextFormField(
                          controller: model.contractBranchCode3,
                          keyboardType: TextInputType.number,
                          autovalidate: _autovalidation,
                        ),
                        height: MediaQuery.of(context).size.height * 0.065,
                        width: MediaQuery.of(context).size.width * 0.13,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(
                                color: themeApp.textfieldbordercolor, width: 2),
                            borderRadius: BorderRadius.circular(3)),
                      ),
                      Container(
                        child: TextFormField(
                          controller: model.contractBranchCode4,
                          keyboardType: TextInputType.number,
                          autovalidate: _autovalidation,
                        ),
                        height: MediaQuery.of(context).size.height * 0.065,
                        width: MediaQuery.of(context).size.width * 0.13,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(
                                color: themeApp.textfieldbordercolor, width: 2),
                            borderRadius: BorderRadius.circular(3)),
                      ),
                      Container(
                        child: TextFormField(
                          controller: model.contractBranchCode5,
                          keyboardType: TextInputType.number,
                          autovalidate: _autovalidation,
                        ),
                        height: MediaQuery.of(context).size.height * 0.065,
                        width: MediaQuery.of(context).size.width * 0.13,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(
                                color: themeApp.textfieldbordercolor, width: 2),
                            borderRadius: BorderRadius.circular(3)),
                      ),
                      Container(
                        child: TextFormField(
                          controller: model.contractBranchCode6,
                          keyboardType: TextInputType.number,
                          autovalidate: _autovalidation,
                        ),
                        height: MediaQuery.of(context).size.height * 0.065,
                        width: MediaQuery.of(context).size.width * 0.13,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(
                                color: themeApp.textfieldbordercolor, width: 2),
                            borderRadius: BorderRadius.circular(3)),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.022,
                ),
                AppTextField(
                  title: 'Account Number',
                  controller: model.contractAccountNumber,
                  autoValidation: _autovalidation,
                  textInputType: TextInputType.number,
                  hintText: 'Account Number',
                  validator: (value) =>
                      AppConstant.stringValidator(value, 'Account Number'),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.022,
                ),
                AppTextField(
                  title: 'Owner Name',
                  controller: model.contractOwnerName,
                  autoValidation: _autovalidation,
                  textInputType: TextInputType.text,
                  hintText: 'Owner Name',
                  validator: (value) =>
                      AppConstant.stringValidator(value, 'Owner Name'),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.022,
                ),
                AppTextField(
                  title: 'To',
                  controller: model.contractToOwnerName,
                  autoValidation: _autovalidation,
                  textInputType: TextInputType.text,
                  hintText: 'Owner Name',
                  validator: (value) =>
                      AppConstant.stringValidator(value, 'Owner Name'),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.022,
                ),
                Text(
                  'DD Date Every Month',
                  style: TextStyle(
                      fontSize: MediaQuery.of(context).size.height * .015,
                      color: Color.fromRGBO(31, 33, 29, 1)),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.01,
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.065,
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(
                        width: MediaQuery.of(context).size.width * .04,
                      ),
                      InkWell(
                        child: Container(
                          height: MediaQuery.of(context).size.height * .062,
                          child: Row(
                            children: <Widget>[
                              model.isSeventh
                                  ? Icon(
                                      Icons.check_box,
                                      color: Color.fromRGBO(155, 119, 217, 1),
                                      size: MediaQuery.of(context).size.height *
                                          .023,
                                    )
                                  : InkWell(
                                      child: Icon(
                                        Icons.check_box_outline_blank,
                                        color: Color.fromRGBO(155, 119, 217, 1),
                                        size:
                                            MediaQuery.of(context).size.height *
                                                .023,
                                      ),
                                      onTap: () {
                                        model.toggleIsSeventh();
                                      },
                                    ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * .01,
                              ),
                              Text(
                                "7th",
                                style: TextStyle(
                                    fontSize:
                                        MediaQuery.of(context).size.height *
                                            .02,
                                    color: Color.fromRGBO(0, 0, 0, .8)),
                              ),
                            ],
                          ),
                        ),
                        onTap: () {
                          if (!model.isSeventh) {
                            model.isSeventh = !model.isSeventh;
                          }
                          model.toggleIsSeventh();
                        },
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * .04,
                      ),
                      InkWell(
                        child: Container(
                          height: MediaQuery.of(context).size.height * .062,
                          child: Row(
                            children: <Widget>[
                              model.isFourteenth
                                  ? Icon(Icons.check_box,
                                      size: MediaQuery.of(context).size.height *
                                          .023,
                                      color: Color.fromRGBO(155, 119, 217, 1))
                                  : InkWell(
                                      child: Icon(Icons.check_box_outline_blank,
                                          size: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              .023,
                                          color:
                                              Color.fromRGBO(155, 119, 217, 1)),
                                      onTap: () {
                                        model.toggleIsFourteenth();
                                      },
                                    ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * .01,
                              ),
                              Text(
                                "14th",
                                style: TextStyle(
                                    fontSize:
                                        MediaQuery.of(context).size.height *
                                            .02,
                                    color: Color.fromRGBO(0, 0, 0, .8)),
                              ),
                            ],
                          ),
                        ),
                        onTap: () {
                          if (!model.isFourteenth) {
                            model.isFourteenth = !model.isFourteenth;
                          }
                          model.toggleIsFourteenth();
                        },
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * .04,
                      ),
                      InkWell(
                        child: Container(
                          height: MediaQuery.of(context).size.height * .062,
                          child: Row(
                            children: <Widget>[
                              model.isTwentyFirst
                                  ? Icon(
                                      Icons.check_box,
                                      size: MediaQuery.of(context).size.height *
                                          .023,
                                      color: Color.fromRGBO(155, 119, 217, 1),
                                    )
                                  : InkWell(
                                      child: Icon(
                                        Icons.check_box_outline_blank,
                                        size:
                                            MediaQuery.of(context).size.height *
                                                .023,
                                        color: Color.fromRGBO(155, 119, 217, 1),
                                      ),
                                      onTap: () {
                                        model.toggleIsTwentyFirst();
                                      },
                                    ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * .01,
                              ),
                              Text(
                                "21st",
                                style: TextStyle(
                                    fontSize:
                                        MediaQuery.of(context).size.height *
                                            .02,
                                    color: Color.fromRGBO(0, 0, 0, .8)),
                              ),
                            ],
                          ),
                        ),
                        onTap: () {
                          if (!model.isTwentyFirst) {
                            model.isTwentyFirst = !model.isTwentyFirst;
                          }
                          model.toggleIsTwentyFirst();
                        },
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * .04,
                      ),
                      InkWell(
                        child: Container(
                          height: MediaQuery.of(context).size.height * .062,
                          child: Row(
                            children: <Widget>[
                              model.isTwentyEigth
                                  ? Icon(
                                      Icons.check_box,
                                      size: MediaQuery.of(context).size.height *
                                          .023,
                                      color: Color.fromRGBO(155, 119, 217, 1),
                                    )
                                  : InkWell(
                                      child: Icon(
                                        Icons.check_box_outline_blank,
                                        size:
                                            MediaQuery.of(context).size.height *
                                                .023,
                                        color: Color.fromRGBO(155, 119, 217, 1),
                                      ),
                                      onTap: () {
                                        model.toggleIsTwentyEight();
                                      },
                                    ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * .01,
                              ),
                              Text(
                                "28th",
                                style: TextStyle(
                                    fontSize:
                                        MediaQuery.of(context).size.height *
                                            .02,
                                    color: Color.fromRGBO(0, 0, 0, .8)),
                              ),
                            ],
                          ),
                        ),
                        onTap: () {
                          if (!model.isTwentyEigth) {
                            model.isTwentyEigth = !model.isTwentyEigth;
                          }
                          model.toggleIsTwentyEight();
                        },
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * .02,
                      ),
                    ],
                  ),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(
                          color: themeApp.textfieldbordercolor, width: 2),
                      borderRadius: BorderRadius.circular(3)),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.022,
                ),
                AppTextField(
                  title: 'Bank or Building Society Address & PostCode',
                  controller: model.contractBankSocietyAdd,
                  autoValidation: _autovalidation,
                  textInputType: TextInputType.text,
                  hintText: 'Bank or Building Society Address & PostCode',
                  validator: (value) => AppConstant.stringValidator(
                      value, 'Bank or Building Society Address & PostCode'),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.022,
                ),
                RichText(
                  text: TextSpan(
                    text: 'Signature',
                    style: TextStyle(
                        fontSize: MediaQuery.of(context).size.height * .015,
                        color: Color.fromRGBO(31, 33, 29, 1)),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.01,
                ),
                ListView(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  children: <Widget>[
                    //SIGNATURE CANVAS
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                            width: 2.0, color: Color.fromRGBO(128, 189, 40, 1)),
                      ),
                      child: SizedBox(
                          height: 200,
                          child: Signature(
                              controller: signController,
                              height: 300,
                              backgroundColor: Colors.white)),
                    ),
                    //OK AND CLEAR BUTTONS
                    Container(
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(18, 122, 69, 1),
                        border: Border.all(
                            width: 1.0, color: Color.fromRGBO(18, 122, 69, 1)),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        mainAxisSize: MainAxisSize.max,
                        children: <Widget>[
                          //SHOW EXPORTED IMAGE IN NEW ROUTE
                          // IconButton(
                          //   icon: const Icon(Icons.check),
                          //   color: Colors.white,
                          //   onPressed: () async {
                          //     if (signController.isNotEmpty) {
                          //       var data = await signController.toPngBytes();
                          //       Navigator.of(context).push(
                          //         MaterialPageRoute(
                          //           builder: (BuildContext context) {
                          //             return Scaffold(
                          //               appBar: AppBar(),
                          //               body: Center(
                          //                   child: Container(
                          //                       color: Colors.grey[300],
                          //                       child: Image.memory(data))),
                          //             );
                          //           },
                          //         ),
                          //       );
                          //     }
                          //   },
                          // ),
                          //CLEAR CANVAS
                          // IconButton(
                          //   icon: const Icon(Icons.clear),
                          //   color: Colors.white,
                          //   onPressed: () {
                          //     setState(() => signController.clear());
                          //   },
                          // ),
                          FlatButton(
                            onPressed: () {
                              setState(() => signController.clear());
                            },
                            child: Text('Clear',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold)),
                          )
                        ],
                      ),
                    ),
                  ],
                ),              
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.022,
                ),
                AppTextField(
                  title: AppString.name,
                  controller: model.contractName,
                  autoValidation: _autovalidation,
                  textInputType: TextInputType.text,
                  hintText: AppString.name,
                  validator: (value) =>
                      AppConstant.stringValidator(value, AppString.name),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.022,
                ),
                RichText(
                  text: TextSpan(
                    text: 'Date',
                    style: TextStyle(
                        fontSize: MediaQuery.of(context).size.height * .015,
                        color: Color.fromRGBO(31, 33, 29, 1)),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.01,
                ),
                InkWell(
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height * .062,
                    child: datetextfield(
                        model.contractDate,
                        false,
                        _autovalidation,
                        TextInputType.text,
                        "Select date", (value) {
                      if (value.isEmpty) {
                        return 'Please Select date';
                      }
                      return null;
                    }, context),
                  ),
                  onTap: () {
                    model.selectDate(context, "Required");
                  },
                ),
                // AppTextField(
                //   title: AppString.date,
                //   controller: model.contractDate,
                //   autoValidation: _autovalidation,
                //   textInputType: TextInputType.text,
                //   hintText: AppString.date,
                //   validator: (value) =>
                //       AppConstant.stringValidator(value, AppString.date),
                // ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.022,
                ),
                AppTextField(
                  title: 'Company Name',
                  controller: model.contractCompanyName,
                  autoValidation: _autovalidation,
                  textInputType: TextInputType.text,
                  hintText: 'Company Name',
                  validator: (value) =>
                      AppConstant.stringValidator(value, 'Company Name'),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.022,
                ),
                Text(
                  'Instruction to your Bank or Building Society to pay by Direct Debit',
                  style: TextStyle(
                      color: Colors.red,
                      fontSize: 14,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.015,
                ),
                Text(
                  "This Guarantee is offered by all Banks and Building Societies that accept instructions to pay Direct Debits. If there are any changes to the amount, date or frequency of your Direct Debit, Pozitive Energy Limited will notify you seven working days in advance of your account being debited or as otherwise agreed. If you request Pozitive Energy Limited to collect a payment, confirmation of the amount and date will be given to you at the time of the request. If an error is made in the payment of your Direct Debit by Pozitive Energy Limited or your Bank or Building Society, you are entitled to a full and immediate refund of the amount paid from your Bank or Building Society. If you receive a refund you are not entitled to, you must pay it back when Pozitive Energy Limited asks you to. You can cancel a Direct Debit at any time by simply contacting your Bank or Building Society. Written confirmation may be required. Please also notify us.",
                  style: TextStyle(
                      fontSize: MediaQuery.of(context).size.height * .015,
                      color: Color.fromRGBO(31, 33, 29, 1)),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.025,
                ),
                InkWell(
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.062,
                    child: Center(
                      child: Text(
                        "Save And Generate Contract",
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
                  onTap: () {
                    model.onSaveAndNext(context);
                    // model.saveAndDownloadContract(context);
                  },
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.025,
                ),
                InkWell(
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.062,
                    child: Center(
                      child: Text(
                        "Back to Quote",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize:
                                MediaQuery.of(context).size.height * 0.019,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    decoration: BoxDecoration(
                        // color: Color.fromRGBO(155, 119, 217, 1),
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(30)),
                  ),
                  onTap: () {
                    Navigator.of(context).pop();
                    // Navigator.pushReplacement(
                    //   context,
                    //   new MaterialPageRoute(
                    //     builder: (context) => ViewQuotationPage(),
                    //   ),
                    // );
                  },
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.025,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
