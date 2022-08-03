import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/utils/dimensions.dart';
import 'package:food_delivery/widgets/big_text.dart';
import 'app_icon.dart';

class AccountWidget extends StatelessWidget {
  AppIcon appIcon;
  BigText bigtext;

  AccountWidget({Key? key, required this.appIcon, required this.bigtext})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.white,
      padding: EdgeInsets.only(
          left: Dimensions.width20,
          top: Dimensions.height10,
          bottom: Dimensions.height10),
      child: Row(
        children: [
          appIcon,
          SizedBox(width: Dimensions.width20),
          bigtext
        ],
      ),
      // decoration: BoxDecoration(
      //   color: Colors.white,
      //     boxShadow: [
      //     BoxShadow(
      //       blurRadius: 1,
      //       offset: Offset(0, 2),
      //       color: Colors.grey.withOpacity(0.2),
      //     )
      //   ]
      // ),

      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
            bottomLeft: Radius.circular(10),
            bottomRight: Radius.circular(10)
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),

      //7:18:42

    );
  }
}






