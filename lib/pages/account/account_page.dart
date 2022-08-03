import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/utils/colors.dart';
import 'package:food_delivery/utils/dimensions.dart';
import 'package:food_delivery/widgets/account_widget.dart';
import 'package:food_delivery/widgets/app_icon.dart';
import 'package:food_delivery/widgets/big_text.dart';

class Accountpage extends StatelessWidget {
  const Accountpage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.mainColor,
        title: Center(
          child: BigText(
            text: "Profile", size: 24, color: Colors.white,
          ),
        ),
      ),
      body: Container(
        width: double.maxFinite,
        margin: EdgeInsets.only(
          top: Dimensions.height20
        ),
        child: Column(
          children: [
            //profile icon
            AppIcon(icon:
            Icons.person,
            backgroundColor: AppColors.mainColor,
              iconSize: Dimensions.height45+Dimensions.height30,
              iconColor: Colors.white,
              size: Dimensions.height15*10,
            ),
            SizedBox(height: Dimensions.height20,),
            
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    //name
                    AccountWidget(
                        appIcon: AppIcon(icon:
                        Icons.person,
                          backgroundColor: AppColors.mainColor,
                          iconSize: Dimensions.height10*5/2,
                          iconColor: Colors.white,
                          size: Dimensions.height10*5,
                        ),
                        bigtext: BigText(
                          text: "Kishor",
                        )
                    ),
                    SizedBox(height: Dimensions.height20,),
                    //telephone
                    AccountWidget(
                        appIcon: AppIcon(icon:
                        Icons.phone,
                          backgroundColor: AppColors.yellowColor,
                          iconSize: Dimensions.height10*5/2,
                          iconColor: Colors.white,
                          size: Dimensions.height10*5,
                        ),
                        bigtext: BigText(
                          text: "9806062869",
                        )
                    ),
                    SizedBox(height: Dimensions.height20,),
                    //email
                    AccountWidget(
                        appIcon: AppIcon(icon:
                        Icons.email,
                          backgroundColor: AppColors.yellowColor,
                          iconSize: Dimensions.height10*5/2,
                          iconColor: Colors.white,
                          size: Dimensions.height10*5,
                        ),
                        bigtext: BigText(
                          text: "Kishorkatuwal96@gmail.com",
                        )
                    ),
                    SizedBox(height: Dimensions.height20,),
                    //address
                    AccountWidget(
                        appIcon: AppIcon(icon:
                        Icons.location_on,
                          backgroundColor: AppColors.yellowColor,
                          iconSize: Dimensions.height10*5/2,
                          iconColor: Colors.white,
                          size: Dimensions.height10*5,
                        ),
                        bigtext: BigText(
                          text: "Damak-1,Jhapa",
                        )
                    ),
                    SizedBox(height: Dimensions.height20,),
                    //message
                    AccountWidget(
                        appIcon: AppIcon(icon:
                        Icons.message,
                          backgroundColor: AppColors.yellowColor,
                          iconSize: Dimensions.height10*5/2,
                          iconColor: Colors.white,
                          size: Dimensions.height10*5,
                        ),
                        bigtext: BigText(
                          text: "I am learning Flutter",
                        )
                    ),
                    SizedBox(height: Dimensions.height20,),



                  ],
                ),
              ),
            )

          ],
        ),
      ),
    );
  }
}
