import 'package:flutter/material.dart';
import 'package:pozitive/Core/Model/Api/DualFuel-InsertAddProspect/PrimaryContactCredential.dart';
import 'package:pozitive/Core/ViewModel/baseModel.dart';
import 'package:pozitive/Core/enums/view_state.dart';
import 'package:pozitive/Util/dualFuel_Pref.dart';


DFPrimaryContactCredential _primaryContactCredential =DFPrimaryContactCredential();
class DFPrimaryContactViewModel extends BaseModel {

  TextEditingController primaryTitle = TextEditingController();
  TextEditingController primaryFirstName = TextEditingController();
  TextEditingController primaryLastName = TextEditingController();
  TextEditingController primaryPhone = TextEditingController();
  TextEditingController primaryEmail = TextEditingController();

  bool autovalidation = false;
  List nameTitle = ["Mr", "Mrs", "Miss", "Ms", "Sir", "Dr"];

  Widget nameList() {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: nameTitle.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            child: ListTile(
              title: Text(
                nameTitle[index],
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              onTap: () {
                setState(ViewState.BUSY);
                  primaryTitle.text = nameTitle[index];
                setState(ViewState.IDLE);
                Navigator.pop(context);
              },
            ),
          );
        });
  }

  void initialData() async {
    final data = await DFPref.getDualFuelPrimaryContact();
    setState(ViewState.BUSY);
    if(data!=null){
      primaryTitle.text = data.primaryTitle;
      primaryFirstName.text = data.primaryFirstName;
      primaryLastName.text = data.primaryLastName;
      primaryPhone.text = data.primaryPhone;
      primaryEmail.text = data.primaryEmail;
    }
    setState(ViewState.IDLE);
  }

  void onSaveAndNext(){
    setState(ViewState.BUSY);
    DFPref.setDualFuelPrimaryContact(DFPrimaryContactCredential(
      primaryTitle: primaryTitle.text,
      primaryFirstName: primaryFirstName.text,
      primaryLastName: primaryLastName.text,
      primaryPhone: primaryPhone.text,
      primaryEmail: primaryEmail.text,

    ));
    setState(ViewState.IDLE);
  }

}