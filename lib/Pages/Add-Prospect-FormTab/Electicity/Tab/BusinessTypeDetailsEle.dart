import 'package:flutter/material.dart';
import 'package:pozitive/Core/ViewModel/EleAddProspectViewModels/ele_business_viewmodel.dart';
import 'package:pozitive/Widget/EleAddProspWidgets/PartnerShipAddress.dart';
import 'package:pozitive/Widget/EleAddProspWidgets/emptyBusinessTypeAddress.dart';
import 'package:pozitive/Widget/EleAddProspWidgets/LLCAdress.dart';
import 'package:pozitive/Widget/EleAddProspWidgets/charityAddress.dart';
import 'package:pozitive/Widget/EleAddProspWidgets/llpAddress.dart';
import 'package:pozitive/Widget/EleAddProspWidgets/ltdAddress.dart';
import 'package:pozitive/Widget/EleAddProspWidgets/solePartnerAddress.dart';
import 'package:pozitive/Core/baseview.dart';
import 'package:pozitive/Core/Model/user.dart';
import 'package:provider/provider.dart';

class EleBusinessTypeDetails extends StatefulWidget {
  @override
  _EleBusinessTypeDetailsState createState() => _EleBusinessTypeDetailsState();
}

class _EleBusinessTypeDetailsState extends State<EleBusinessTypeDetails> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);

    return user.accountId != null
        ? BaseView<EleBusAddProspectViewModel>(
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
                            ///
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
