
import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:pozitive/Core/AppConstact/appConstant.dart';
import 'package:pozitive/Core/Model/InsertAddProspect/GetAddProspectModel.dart';
import 'package:pozitive/Core/ViewModel/GasAddProspectViewModel/GasGroupViewModel.dart';
import 'package:pozitive/Core/enums/view_state.dart';

class GASGroupSearch extends StatefulWidget {
  final GasGroupAddProspectViewModel model;

  const GASGroupSearch({Key key, this.model}) : super(key: key);
  @override
  _GASGroupSearchState createState() => _GASGroupSearchState();
}

class _GASGroupSearchState extends State<GASGroupSearch> {

  @override
  Widget build(BuildContext context) {
    if (widget.model.state == ViewState.BUSY) {
      return AppConstant.circularProgressIndicator();
    }
    return Column(
      //mainAxisSize: MainAxisSize.min,
      children: [
        TypeAheadField<LstGroup>(
            getImmediateSuggestions: true,
            textFieldConfiguration: TextFieldConfiguration(
              autofocus: true,
              controller: widget.model.groupName,
              decoration: InputDecoration(
                suffixIcon: Image.asset("assets/search.png", scale: 10,),
                hintText: "Select",
              ),
            ),

            onSuggestionSelected: (data) {
              print('selected: ${data.text}');
            },
            suggestionsCallback: (s) =>
                widget.model.addPartnerModel.lstGroup.where((c) =>
                    c.text.toLowerCase().contains(s.toLowerCase())),
            keepSuggestionsOnLoading: true,
            itemBuilder: (context, data) {
              return ListTile(
                title: Text(
                  data.text,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                onTap: () {
                  setState(() {
                    widget.model.groupName.text = data.text;
                  });
                  Navigator.pop(context);
                },
              );
            }
        ),
      ],
    );
  }
}