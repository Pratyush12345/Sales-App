import 'package:flutter/material.dart';
import 'package:pozitive/Core/ViewModel/DualFuelAddProspect-viewModel/DualFuelBusiness-ViewModel.dart';
import 'package:pozitive/Widget/DualFuelAddProspWidgets/LLCAdress.dart';
import 'package:pozitive/Widget/DualFuelAddProspWidgets/charityAddress.dart';
import 'package:pozitive/Widget/DualFuelAddProspWidgets/llpAddress.dart';
import 'package:pozitive/Widget/DualFuelAddProspWidgets/ltdAddress.dart';
import 'package:pozitive/Widget/DualFuelAddProspWidgets/solePartnerAddress.dart';
import 'package:pozitive/Widget/DualFuelAddProspWidgets/emptyBusinessTypeAddress.dart';
import 'package:pozitive/Widget/DualFuelAddProspWidgets/PartnerShipAddress.dart';
import 'package:pozitive/Core/baseview.dart';
import 'package:pozitive/Core/Model/user.dart';
import 'package:provider/provider.dart';

class DualFuelBusinessTypeDetails extends StatefulWidget {
  @override
  _DualFuelBusinessTypeDetailsState createState() =>
      _DualFuelBusinessTypeDetailsState();
}

class _DualFuelBusinessTypeDetailsState
    extends State<DualFuelBusinessTypeDetails> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);

    return user.accountId != null
        ? BaseView<DualFuelAddProspectBusinessViewModel>(
            onModelReady: (model) => model.initialData(() {}),
            builder: (context, model, child) {
              return Scaffold(
                backgroundColor: Colors.white,
                body: Padding(
                  padding: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width * 0.03,
                      right: MediaQuery.of(context).size.width * 0.03),
                  child: Form(
                    key: _formKey,
                    child: ListView(
                      children: [
                        model.businessTypeController.text == 'Other'
                            ? Container(
                                child: emptyAddresses(),
                              )
                            : Container(),
                        model.businessTypeController.text == 'Ltd'
                            ? Container(
                                child: ltdAddresses(),
                              )
                            : Container(),
                        model.businessTypeController.text == 'Sole Proprietor'
                            ? Container(child: SoleAddresses())
                            : Container(),
                        model.businessTypeController.text == 'Partnership'
                            ? Container(child: PartnerShipAddresses())
                            : Container(),
                        model.businessTypeController.text == 'Charity'
                            ? Container(child: CharityAddresses())
                            : Container(),
                        model.businessTypeController.text == 'LLP'
                            ? Container(child: llpAddresses())
                            : Container(),
                        model.businessTypeController.text == 'LLC'
                            ? Container(child: llcAddresses())
                            : Container(),
                      ],
                    ),
                  ),
                ),
              );
            })
        : Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
  }
}
