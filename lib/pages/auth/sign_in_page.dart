import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/base/custom_loader.dart';
import 'package:food_delivery/pages/auth/sign_up_page.dart';
import 'package:food_delivery/routes/route_helper.dart';
import 'package:food_delivery/utils/dimensions.dart';
import 'package:food_delivery/widgets/app_text_field.dart';
import 'package:food_delivery/widgets/big_text.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../base/show_custom_snackbar.dart';
import '../../controllers/auth_controller.dart';
import '../../utils/colors.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var emailController = TextEditingController();
    var passwordController = TextEditingController();
    // var nameController = TextEditingController();
    // var phoneController = TextEditingController();

    void _login(AuthController authController) {
      // var authController = Get.find<AuthController>();
      String email = emailController.text.trim();
      String password = passwordController.text.trim();

      if (email.isEmpty) {
        showCustomSnackBar("Type in your Email address",
            title: "Email address");
      } else if (!GetUtils.isEmail(email)) {
        showCustomSnackBar("Type a valid Email Address",
            title: "Valid Email Address");
      } else if (password.isEmpty) {
        showCustomSnackBar("Type in your Password", title: "Password");
      } else if (password.length < 6) {
        showCustomSnackBar("Password can't be less than 6 characters",
            title: "Password");
      } else {

        Get.toNamed(RouteHelper.getInitial());

        //commenting beacuse of error
        // authController.login(email, password).then((status) {
        //   if (status.isSuccess) {
        //     print("Success Login");
        //     Get.toNamed(RouteHelper.getInitial());
        //   } else {
        //     showCustomSnackBar(status.message);
        //   }
        // }
        // );

      }
    }

    return Scaffold(
      backgroundColor: Colors.white,
      body: GetBuilder<AuthController>(builder: (authController){
        return !authController.isLoading?
        SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: [
              //app logo
              SizedBox(height: Dimensions.screenHeight * 0.05),
              Container(
                height: Dimensions.screenHeight * 0.25,
                child: Center(
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: Dimensions.radius20 * 8,
                    backgroundImage: AssetImage("assets/image/logo part 1.png"),
                  ),
                ),
              ),

              Container(
                width: double.maxFinite,
                margin: EdgeInsets.only(left: Dimensions.width20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Hello",
                      style: TextStyle(
                        fontSize: Dimensions.font20 * 3 + Dimensions.font20 / 2,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "Sign in to your account",
                      style: TextStyle(
                          fontSize: Dimensions.font20, color: Colors.grey[500]),
                    )
                  ],
                ),
              ),

              SizedBox(
                height: Dimensions.height10,
              ),
              //for email
              AppTextField(
                  textController: emailController,
                  hintText: "Email",
                  icon: Icons.email),
              SizedBox(
                height: Dimensions.height20,
              ),

              //for password
              AppTextField(
                textController: passwordController,
                hintText: "Password",
                icon: Icons.password, isObscure: true,),

              SizedBox(
                height: Dimensions.height20,
              ),

              Row(
                children: [
                  Expanded(child: Container()),
                  RichText(
                      text: TextSpan(
                        text: "Sign into your account",
                        style: TextStyle(
                            color: Colors.grey[500], fontSize: Dimensions.font20),
                      )),
                  SizedBox(width: Dimensions.width20, )
                ],
              ),
              SizedBox(
                height: Dimensions.screenHeight * 0.05,
              ),
              //sign in button
              GestureDetector(
                onTap: () {
                  _login(authController);

                },
                child: Container(
                  width: Dimensions.screenWidth / 2,
                  height: Dimensions.screenHeight / 15,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(Dimensions.radius30),
                      color: AppColors.mainColor),
                  child: Center(
                    child: BigText(
                      text: "Sign In",
                      size: Dimensions.font26 + 4,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),

              SizedBox(
                height: Dimensions.screenHeight * 0.05,
              ),

              SizedBox(height: Dimensions.screenHeight * 0.05),

              RichText(
                  text: TextSpan(
                      text: "Don't have an account?",
                      style: TextStyle(
                          color: Colors.grey[500], fontSize: Dimensions.font20),
                      children: [
                        TextSpan(
                          recognizer: TapGestureRecognizer()
                            ..onTap = () => Get.to(() => SignUpPage(),
                                transition: Transition.fade),
                          text: "  Create",
                          style: TextStyle(
                              color: AppColors.mainBlackColor,
                              fontSize: Dimensions.font20+4,
                              fontWeight: FontWeight.bold),
                        )
                      ])),
            ],
          ),
        ):
        CustomLoader();
      },),
    );
  }
}

