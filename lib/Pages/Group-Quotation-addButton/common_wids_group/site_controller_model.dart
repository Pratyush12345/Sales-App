import 'package:flutter/material.dart';

class SiteControllerModel {
  Widget child;
  SiteControllerModel({
    this.child,
  });
}

class TextContollerList{
   TextEditingController businessNameCont = TextEditingController();
  TextEditingController mpanCoreCont = TextEditingController();
  TextEditingController mprnCont = TextEditingController();
  TextEditingController prefStartDateCont = TextEditingController();
  int index;
  TextContollerList({this.businessNameCont,this.mpanCoreCont,this.mprnCont,this.prefStartDateCont,this.index});
}
