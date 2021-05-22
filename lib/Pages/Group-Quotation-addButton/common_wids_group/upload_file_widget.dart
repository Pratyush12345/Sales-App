import 'package:flutter/material.dart';
import 'package:pozitive/Core/AppConstact/appString.dart';
import 'package:pozitive/Util/theme.dart';

class UploadFileWidget extends StatelessWidget {
  final Function onTapChooseFile;
  final String path;
  UploadFileWidget({@required this.onTapChooseFile, @required this.path});

  @override
  Widget build(BuildContext context) {
    final ThemeApp themeApp = ThemeApp();
    return Container(
      height: MediaQuery.of(context).size.height * .065,
      width: MediaQuery.of(context).size.width,
      child: Row(
        children: <Widget>[
          SizedBox(
            width: MediaQuery.of(context).size.width * .02,
          ),
          InkWell(
            child: Container(
              height: MediaQuery.of(context).size.height * .042,
              width: MediaQuery.of(context).size.width * .24,
              child: Center(
                child: Text(
                  AppString.chooseFile,
                  style: TextStyle(
                      fontSize: MediaQuery.of(context).size.height * .017,
                      color: Colors.white),
                ),
              ),
              decoration: BoxDecoration(
                color: themeApp.purplecolor,
                borderRadius: BorderRadius.circular(14),
              ),
            ),
            onTap: onTapChooseFile,
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * .02,
          ),
          path != null
              ? Expanded(
                  child: Text(path.substring(path.lastIndexOf("/") + 1),
                      style: TextStyle(
                          fontSize: MediaQuery.of(context).size.height * .019,
                          color: Color.fromRGBO(0, 0, 0, .8))),
                )
              : Text(
                  AppString.noFileChosen,
                  style: TextStyle(
                    fontSize: MediaQuery.of(context).size.height * .019,
                    color: Color.fromRGBO(0, 0, 0, .6),
                  ),
                ),
        ],
      ),
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: themeApp.textfieldbordercolor, width: 2),
          borderRadius: BorderRadius.circular(3)),
    );
  }
}
