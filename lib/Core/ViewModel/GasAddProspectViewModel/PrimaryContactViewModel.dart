import 'package:flutter/material.dart';
import 'package:pozitive/Core/Model/Api/Gas-Insert-AddProspect/PrimaryContactC%20redential.dart';
import 'package:pozitive/Core/ViewModel/baseModel.dart';
import 'package:pozitive/Core/enums/view_state.dart';
import 'package:pozitive/Util/gas_pref.dart';

class GasPrimaryContactViewModel extends BaseModel {
  TextEditingController gasPrimaryTitle = TextEditingController();
  TextEditingController gasPrimaryFirstName = TextEditingController();
  TextEditingController gasPrimaryLastName = TextEditingController();
  TextEditingController gasPrimaryPhone = TextEditingController();
  TextEditingController gasPrimaryEmail = TextEditingController();

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
                gasPrimaryTitle.text = nameTitle[index];
                setState(ViewState.IDLE);
                Navigator.pop(context);
              },
            ),
          );
        });
  }

  void initialData() async {
    final data = await GasPref.getGASPrimaryContact();
    setState(ViewState.BUSY);
    if (data != null) {
      gasPrimaryTitle.text = data.primaryTitle;
      gasPrimaryFirstName.text = data.primaryFirstName;
      gasPrimaryLastName.text = data.primaryLastName;
      gasPrimaryPhone.text = data.primaryPhone;
      gasPrimaryEmail.text = data.primaryEmail;
    }
    setState(ViewState.IDLE);
  }

  void onSaveAndNext() {
    setState(ViewState.BUSY);
    GasPref.setGASPrimaryContact(GASPrimaryContactCredential(
      primaryTitle: gasPrimaryTitle.text,
      primaryFirstName: gasPrimaryFirstName.text,
      primaryLastName: gasPrimaryLastName.text,
      primaryPhone: gasPrimaryPhone.text,
      primaryEmail: gasPrimaryEmail.text,
    ));
    setState(ViewState.IDLE);
  }
}
