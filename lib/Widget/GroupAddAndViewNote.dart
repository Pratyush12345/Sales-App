import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pozitive/Core/AppConstact/appConstant.dart';
import 'package:pozitive/Core/AppConstact/appString.dart';
import 'package:pozitive/Core/AppConstact/sizeConfig.dart';
import 'package:pozitive/Core/Model/Api/groupAddQuoteNoteCredential.dart';
import 'package:pozitive/Core/Model/Api/groupQuoteNoteCredential.dart';
import 'package:pozitive/Core/Model/user.dart';
import 'package:pozitive/Core/Services/AuthService.dart';
import 'package:pozitive/Core/ViewModel/Group-addViewNoteModel.dart';
import 'package:pozitive/Core/baseview.dart';
import 'package:pozitive/Core/enums/view_state.dart';
import 'package:pozitive/Widget/TextField/innerTextField.dart';
import 'package:provider/provider.dart';

class GroupAddAndViewNote extends StatelessWidget {
  final String groupId;

  const GroupAddAndViewNote({this.groupId});

  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      value: AutService().user,
      initialData: User(),
      child: AddAndViewNoteView(
        groupId: groupId,
      ),
    );
  }
}

class AddAndViewNoteView extends StatefulWidget {
  final String groupId;

  const AddAndViewNoteView({this.groupId});

  @override
  _AddAndViewNoteState createState() => _AddAndViewNoteState();
}

class _AddAndViewNoteState extends State<AddAndViewNoteView> {
  TextEditingController _textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    return user.accountId != null
        ? BaseView<GroupsAddandViewNoteViewModel>(
            onModelReady: (model) => model.getGroupQuoteNoteList(
                GroupQuoteNoteCredential(
                    accountId: user.accountId, groupId: widget.groupId)),
            builder: (context, model, child) {
              if (model.state == ViewState.BUSY) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                return SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(
                            top: SizeConfig.screenHeight * .01,
                            bottom: SizeConfig.screenHeight * .01,
                            left: SizeConfig.screenWidth * .02),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              AppString.notes,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: MediaQuery.of(context).size.height *
                                      0.02),
                            ),
                            IconButton(
                                icon: Icon(Icons.close),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                })
                          ],
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: 2,
                        color: Colors.grey.withOpacity(.2),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            top: SizeConfig.screenHeight * .01,
                            left: SizeConfig.screenWidth * .02,
                            right: SizeConfig.screenWidth * .02),
                        child: InnerTextField(
                          controller: _textEditingController,
                          maxline: 5,
                        ),
                      ),
                      SizedBox(
                        height: heightOfBox(model.quoteNote.notes.length),
                        child: ListView.builder(
                            padding: EdgeInsets.all(0),
                            itemCount: model.quoteNote.notes.length,
                            shrinkWrap: true,
                            itemBuilder: (BuildContext context, int index) {
                              return Padding(
                                padding: EdgeInsets.only(
                                    bottom: SizeConfig.screenHeight * .01),
                                child: Container(
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                        left: SizeConfig.screenWidth * .02,
                                        right: SizeConfig.screenWidth * .02),
                                    child: Row(
                                      children: <Widget>[
                                        Expanded(
                                            child: Text(model.quoteNote
                                                .notes[index].strNote)),
                                        Text(
                                            "- ${model.quoteNote.notes[index].noteCreator}"),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            }),
                      ),
                      SizedBox(
                        height: SizeConfig.screenHeight * .01,
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            left: SizeConfig.screenWidth * .02,
                            right: SizeConfig.screenWidth * .02),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            RaisedButton(
                              onPressed: () {
                                model
                                    .uppdateGroupQuoteNote(
                                        GroupAddQuoteNoteCredential(
                                            accountId: user.accountId,
                                            groupid: widget.groupId,
                                            notesText:
                                                _textEditingController.text))
                                    .then((value) {
                                  print('value===$value');
                                  if (value['status'] == "1") {
                                    _textEditingController.clear();
                                    model.getGroupQuoteNoteList(
                                        GroupQuoteNoteCredential(
                                            accountId: user.accountId,
                                            groupId: widget.groupId));
                                    AppConstant.showSuccessToast(
                                        context, value['msg']);
                                  } else {
                                    AppConstant.showFailToast(
                                        context, value['msg']);
                                  }
                                });
                              },
                              child: Text(
                                'ADD',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                              color: Colors.blue,
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: SizeConfig.screenHeight * .01,
                      ),
                    ],
                  ),
                );
              }
            },
          )
        : Center(
            child: CircularProgressIndicator(),
          );
  }
}

double heightOfBox(int length) {
  if (length == 1) {
    return SizeConfig.screenHeight * .03;
  } else if (length == 2) {
    return SizeConfig.screenHeight * .06;
  } else if (length > 2) {
    return SizeConfig.screenHeight * .5;
  } else if (length == 0) {
    return 0.0;
  } else {
    return 0.0;
  }
}
