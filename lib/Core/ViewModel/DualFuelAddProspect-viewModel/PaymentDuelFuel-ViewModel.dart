import 'package:pozitive/Core/Model/Api/DualFuel-InsertAddProspect/DualFuelPaymentCredential.dart';
import 'package:get_it/get_it.dart';
import 'package:pozitive/Core/Services/database.dart';
import 'package:pozitive/Core/ViewModel/baseModel.dart';
import 'package:pozitive/Core/enums/view_state.dart';
import 'package:flutter/material.dart';
import 'package:pozitive/Core/Model/InsertAddProspect/GetAddProspectModel.dart';
import 'package:pozitive/Core/Model/Api/InsertAddProspect/ProspectGetAddPartnerCredetial.dart';
import 'package:pozitive/Util/dualFuel_Pref.dart';

GetIt getIt = GetIt.instance;

class PaymentDuelFuelViewModel extends BaseModel {
  bool autovalidation = false;
  TextEditingController accountName = TextEditingController();
  TextEditingController accountNumber = TextEditingController();
  TextEditingController sortCode = TextEditingController();
  TextEditingController bankName = TextEditingController();
  TextEditingController termDays = TextEditingController();
  TextEditingController banklistController = TextEditingController();

  TextEditingController cardNo = TextEditingController();
  TextEditingController ddAmount = TextEditingController();
  TextEditingController ddDays = TextEditingController();

  int paymentMethodSelected = 0;
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

  String paymentMethodType;
  int setPaymentType(String a) {
    if (a == '') {
      paymentMethodSelected = 0;
    } else if (a == 'BACS') {
      paymentMethodSelected = 1;
    } else if (a == "Variable Direct Debit") {
      paymentMethodSelected = 2;
    } else if (a == 'Card') {
      paymentMethodSelected = 3;
    } else if (a == 'Fixed Direct Debit') {
      paymentMethodSelected = 4;
    }
    return paymentMethodSelected;
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

  Database database = getIt<DatabaseImplementation>();

  DualFuelPaymentCredential credential = DualFuelPaymentCredential();

  void initialData(String accountId) async {
    final data = await DFPref.getDualFuelPaymentDetails();
    setState(ViewState.BUSY);

    if (data != null) {
      // paymentMethodSelected =
      //     data.strPaymentType != null ? int.parse(data.strPaymentType) : 0;
      paymentMethodSelected = setPaymentType(data.strPaymentType);

      accountName.text = data.strBankACName;
      accountNumber.text = data.strBankACNo;
      sortCode.text = data.strBankSortCode;
      termDays.text = data.intPaymentTermDays;
      banklistController.text = data.strBankName;
      cardNo.text = data.dfcardNo;
      ddDays.text = data.dfddDays;
      ddAmount.text = data.dfddAmounts;
    }
    getGroupDetails(ProspectGetAddCredential(
        accountID: accountId, companyId: "1", customerId: "0"));
    setState(ViewState.IDLE);
  }

  void onSaveAndNext() {
    setState(ViewState.BUSY);

    DFPref.setDualFuelPaymentDetails(DualFuelPaymentCredential(
      //strPaymentType: paymentMethodSelected.toString(),
      strPaymentType: getpaymentType(paymentMethodSelected),

      strBankACName: accountName.text,
      strBankACNo: accountNumber.text,
      strBankSortCode: sortCode.text,
      strBankName: banklistController.text,
      intPaymentTermDays: termDays.text.toString(),
     dfcardNo: cardNo.text,
     dfddDays: ddDays.text,
     dfddAmounts: ddAmount.text,
    ));
    setState(ViewState.IDLE);
  }
}
