import 'package:flutter/material.dart';
import 'package:pozitive/Core/ViewModel/GasAddProspectViewModel/GasBusinessViewModel.dart';
import 'package:pozitive/Widget/viewGasAddress/LLCAdress.dart';
import 'package:pozitive/Widget/viewGasAddress/PartnerShipAddress.dart';
import 'package:pozitive/Widget/viewGasAddress/charityAddress.dart';
import 'package:pozitive/Widget/viewGasAddress/emptyBusinessTypeAddress.dart';
import 'package:pozitive/Widget/viewGasAddress/llpAddress.dart';
import 'package:pozitive/Widget/viewGasAddress/ltdAddress.dart';
import 'package:pozitive/Widget/viewGasAddress/solePartnerAddress.dart';
import 'package:pozitive/Util/global.dart' as globals;
import 'package:pozitive/Core/baseview.dart';
import 'package:pozitive/Core/Model/user.dart';
import 'package:provider/provider.dart';

class GasBusinessTypeDetails extends StatefulWidget {
  @override
  _GasBusinessTypeDetailsState createState() => _GasBusinessTypeDetailsState();
}

class _GasBusinessTypeDetailsState extends State<GasBusinessTypeDetails> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);

    return user.accountId != null
        ? BaseView<GasBusinessAddProspectViewModel>(
            onModelReady: (model) => model.initialData((){}),
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
                        // model.gasbusinessTypeController.text.isEmpty
                        //     ? Container(
                        //         child: Container(),
                        //       )
                        //     : Container(),
                        model.gasbusinessTypeController.text == 'other'
                            ? Container(
                                child: emptyAddresses(),
                              )
                            : Container(),
                        // model.gasbusinessTypeController.text ==
                        //         'Select Business Type'
                        //     ? Container(
                        //         child: emptyAddresses(),
                        //       )
                        //     : Container(),
                        model.gasbusinessTypeController.text == 'Ltd'
                            ? Container(
                                child: ltdAddresses(),
                              )
                            : Container(),
                        model.gasbusinessTypeController.text ==
                                'Sole Proprietor'
                            ? Container(child: SoleAddresses())
                            : Container(),
                        model.gasbusinessTypeController.text == 'Partnership'
                            ? Container(child: PartnerShipAddresses())
                            : Container(),
                        model.gasbusinessTypeController.text == 'Charity'
                            ? Container(child: CharityAddresses())
                            : Container(),
                        model.gasbusinessTypeController.text == 'LLP'
                            ? Container(child: llpAddresses())
                            : Container(),
                        model.gasbusinessTypeController.text == 'LLC'
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
