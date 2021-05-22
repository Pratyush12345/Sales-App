import 'package:flutter/material.dart';
import 'package:pozitive/Core/AppConstact/appColors.dart';

class AppButtonWidget extends StatelessWidget {
  final String title;
  final Function onTap;
  final double radius;
  AppButtonWidget({this.onTap,this.title,this.radius});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: MediaQuery.of(context).size.width*.46,
        height: MediaQuery.of(context).size.height*0.062,
        child: Center(
          child: Text(title,
            style: TextStyle(color: Colors.white,fontSize: MediaQuery.of(context).size.height*0.019,
              fontWeight: FontWeight.bold),),
        ),
        decoration: BoxDecoration(
            color:AppColors.purple,
            borderRadius: BorderRadius.circular(radius??30)
        ),
      ),
    );
  }
}
