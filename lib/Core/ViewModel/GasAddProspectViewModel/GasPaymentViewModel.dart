import 'package:pozitive/Core/Model/Api/Gas-Insert-AddProspect/Gas_Payment_Credential.dart';
import 'package:pozitive/Util/gas_pref.dart';
import 'package:pozitive/Core/Services/database.dart';
import 'package:pozitive/Core/ViewModel/baseModel.dart';
import 'package:pozitive/Core/enums/view_state.dart';
import 'package:flutter/material.dart';

import 'package:pozitive/Core/Model/InsertAddProspect/GetAddProspectModel.dart';
import 'package:pozitive/Core/Model/Api/InsertAddProspect/ProspectGetAddPartnerCredetial.dart';

import '../../baseview.dart';

Database database = getIt<DatabaseImplementation>();

GasPaymentCredential credential = GasPaymentCredential();

class GasPaymentAddProspectViewModel extends BaseModel {
  bool autovalidation = false;
  TextEditingController accountName = TextEditingController();
  TextEditingController accountNumber = TextEditingController();
  TextEditingController sortCode = TextEditingController();
  TextEditingController bankName = TextEditingController();
  TextEditingController termDays = TextEditingController();
  TextEditingController cardNo = TextEditingController();
  TextEditingController ddAmount = TextEditingController();
  TextEditingController ddDays = TextEditingController();

  TextEditingController banklistController = TextEditingController();

  int paymentMethodSelected = 0;
  int intPaymentMethod;

  String paymentMethodType;
  ProspectGetAddPartnerModel addPartnerModel;
  List<LSTBankList> bankList = [];
  List days = [
    "Select Fixed DD Days",
    "01",
    "02",
    "03",
    "04",
    "05",
    "06",
    "07",
    "08",
    "09",
    "10",
    "11",
    "12",
    "13",
    "14",
    "15",
    "16",
    "17",
    "18",
    "19",
    "20",
    "21",
    "22",
    "23",
    "24",
    "25",
    "26",
    "27",
    "28"
  ];
  Widget fixeDDDays() {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: days.length,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          child: ListTile(
            title: Text(
              days[index],
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            onTap: () {
              setState(ViewState.BUSY);
              ddDays.text = days[index];
              setState(ViewState.IDLE);

              Navigator.pop(context);
            },
          ),
        );
      },
    );
  }

  void getGroupDetails(ProspectGetAddCredential credential) async {
    assert(credential != null);

    setState(ViewState.BUSY);

    final response = await database.getAddProspectService(credential);
    addPartnerModel = response;

    print('rrrrr${addPartnerModel.toJson()}  ==');
    if (isNotError(response)) {
      addPartnerModel = response;
      print(response);
    } else {
      print("error");
    }

    setState(ViewState.IDLE);
  }

  int setPaymentType(String a) {
    if (a == '') {
      intPaymentMethod = 0;
    } else if (a == 'BACS') {
      intPaymentMethod = 1;
    } else if (a == "Variable Direct Debit") {
      intPaymentMethod = 2;
    } else if (a == 'Card') {
      intPaymentMethod = 3;
    } else if (a == 'Fixed Direct Debit') {
      intPaymentMethod = 4;
    }
    return intPaymentMethod;
  }

  String getpaymentType(int a) {
    if (a == 1) {
      paymentMethodType = "BACS";

      //return "BACS";
    } else if (a == 2) {
      paymentMethodType = "Variable Direct Debit";

      // return "Variable Direct Debit";
    } else if (a == 3) {
      paymentMethodType = "Card";

      // return "Card";
    } else if (a == 4) {
      paymentMethodType = "Fixed Direct Debit";

      //return "Fixed Direct Debit";
    }

    return paymentMethodType;
  }

  List banklist = ["Bank 1", "Bank 2", "Bank 3"];
  Widget bankView() {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: banklist.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            child: ListTile(
              title: Text(
                banklist[index],
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              onTap: () {
                setState(ViewState.BUSY);
                banklistController.text = banklist[index];

                Navigator.pop(context);
              },
            ),
          );
        });
  }

  void initialData(String accountId) async {
    final data = await GasPref.getGasPaymentValues();
    setState(ViewState.BUSY);

    if (data != null) {
      accountName.text = data.gasstrBankACName;
      accountNumber.text = data.gasstrBankACNo;
      sortCode.text = data.gasstrBankSortCode;
      termDays.text = data.gasgasPaymentTermDays.toString();
      paymentMethodSelected = setPaymentType(data.gasstrPaymentType);
      // paymentMethodSelected = data.gasstrPaymentType != null
      //     ? int.parse(data.gasstrPaymentType)
      //     : 0;
      banklistController.text = data.gasstrBankName;
      cardNo.text = data.gascardNo;
      ddDays.text = data.gasddDays;
      ddAmount.text = data.gasddAmounts;
    }
    getGroupDetails(ProspectGetAddCredential(
        accountID: accountId, companyId: "1", customerId: "0"));
    setState(ViewState.IDLE);
  }

  void onSaveAndNextFinal() {
    setState(ViewState.BUSY);
    GasPref.setGasPaymentValues(GasPaymentCredential(
      gasstrBankACName: accountName.text,
      gasstrBankACNo: accountNumber.text,
      gasstrBankSortCode: sortCode.text,
      gasstrBankName: banklistController.text,
      gasgasPaymentTermDays: termDays.text,
      gasstrPaymentType: getpaymentType(paymentMethodSelected),
      gascardNo: cardNo.text,
      gasddDays: ddDays.text,
      gasddAmounts: ddAmount.text,
    ));
    setState(ViewState.IDLE);
  }
}
