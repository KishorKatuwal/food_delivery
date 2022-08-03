import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/base/custom_loader.dart';
import 'package:food_delivery/base/show_custom_snackbar.dart';
import 'package:food_delivery/models/signup_body_model.dart';
import 'package:food_delivery/utils/dimensions.dart';
import 'package:food_delivery/widgets/app_text_field.dart';
import 'package:food_delivery/widgets/big_text.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../controllers/auth_controller.dart';
import '../../utils/colors.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var emailController = TextEditingController();
    var passwordController = TextEditingController();
    var nameController = TextEditingController();
    var phoneController = TextEditingController();
    var signUpImages = ["t.png", "f.png", "g.png"];
    void _registration(AuthController authController) {
      var authController = Get.find<AuthController>();
      String name = nameController.text.trim();
      String phone = phoneController.text.trim();
      String email = emailController.text.trim();
      String password = passwordController.text.trim();

      if (name.isEmpty) {
        showCustomSnackBar("Type in your name", title: "Name");
      } else if (phone.isEmpty) {
        showCustomSnackBar("Type in your Phone Number", title: "Phone");
      } else if (email.isEmpty) {
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
        // showCustomSnackBar("All went well", title: "Perfect");
        SignUpBody signUpBody = SignUpBody(
            name: name, phone: phone, email: email, password: password);

        authController.registration(signUpBody).then((status) {
          if (status.isSuccess) {
            print("Success Registgartion");

          } else {
            showCustomSnackBar(status.message);
          }
        });
      }
    }

    return Scaffold(
        backgroundColor: Colors.white,
        body: GetBuilder<AuthController>(
          builder: (_authController) {
            return !_authController.isLoading
                ? SingleChildScrollView(
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
                              backgroundImage:
                                  AssetImage("assets/image/logo part 1.png"),
                            ),
                          ),
                        ),

                        //fro text fields
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
                            icon: Icons.password, isObscure:true,),
                        SizedBox(
                          height: Dimensions.height20,
                        ),
                        //name
                        AppTextField(
                            textController: nameController,
                            hintText: "Name",
                            icon: Icons.person),
                        SizedBox(
                          height: Dimensions.height20,
                        ),
                        //phone
                        AppTextField(
                            textController: phoneController,
                            hintText: "Phone",
                            icon: Icons.phone),
                        SizedBox(
                          height: Dimensions.height20,
                        ),

                        GestureDetector(
                          onTap: () {
                            _registration(_authController);

                            print("pressed");
                          },
                          child: Container(
                            width: Dimensions.screenWidth / 2,
                            height: Dimensions.screenHeight / 15,
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.circular(Dimensions.radius30),
                                color: AppColors.mainColor),
                            child: Center(
                              child: BigText(
                                text: "Sign Up",
                                size: Dimensions.font26 + 4,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),

                        SizedBox(
                          height: Dimensions.height10,
                        ),

                        RichText(
                            text: TextSpan(
                          recognizer: TapGestureRecognizer()
                            ..onTap = () => Get.back(),
                          text: "Have an account already?",
                          style: TextStyle(
                              color: Colors.grey[500],
                              fontSize: Dimensions.font20),
                        )),

                        SizedBox(height: Dimensions.screenHeight * 0.05),

                        RichText(
                            text: TextSpan(
                          text: "Sign up using one of the following methods",
                          style: TextStyle(
                              color: Colors.grey[500],
                              fontSize: Dimensions.font16),
                        )),
                        Wrap(
                            children: List.generate(
                                3,
                                (index) => Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: CircleAvatar(
                                        radius: Dimensions.radius30,
                                        backgroundImage: AssetImage(
                                            "assets/image/" +
                                                signUpImages[index]),
                                      ),
                                    )))
                      ],
                    ),
                  )
                : CustomLoader();
          },
        ));
  }
}
