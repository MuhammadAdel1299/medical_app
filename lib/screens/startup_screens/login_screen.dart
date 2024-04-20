import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:midical_app/components/auth_controller.dart';
import 'package:midical_app/consts/consts.dart';
import 'package:midical_app/components/nav_bar.dart';
import 'package:midical_app/screens/home_screens/home_screen.dart';
import 'package:midical_app/screens/startup_screens/sign_up_screen.dart';
import 'package:awesome_dialog/awesome_dialog.dart';

import '../../consts/consts.dart';
import '../../consts/consts.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(AuthController());
    return Scaffold(
      body: Container(
        margin: const EdgeInsetsDirectional.only(top: 40.0),
        padding: const EdgeInsetsDirectional.all(8.0),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                ColoredBox(
                  color: Colors.white,
                  child: Image.asset(
                    ImageAssets.loginPic,
                  ),
                ),
                20.heightBox,
                AppTextStyle.regular(
                  title: AppStrings.welcomeLogin,
                  size: 30.0,
                ),
                20.heightBox,
                Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomTextField(
                        hint: AppStrings.email,
                        borderColor: Colors.black,
                        textColor: Colors.black45,
                        preIcon: const Icon(Icons.email),
                        preIconColor: Colors.grey,
                        textController: controller.emailController,
                        validate: (value) {
                          if (value == null || value.isEmpty) {
                            return "Email can't be empty";
                          } else {
                            return null;
                          }
                        },
                        isSecured: false,
                      ),
                      10.heightBox,
                      CustomTextField(
                        hint: AppStrings.passwordHint,
                        borderColor: Colors.black,
                        textColor: Colors.black45,
                        preIcon: const Icon(Icons.lock),
                        sufIcon: const Icon(Icons.remove_red_eye),
                        preIconColor: Colors.grey,
                        sufIconColor: Colors.grey,
                        textController: controller.passwordController,
                        validate: (value) {
                          if (value == null || value.isEmpty) {
                            return "wrong password";
                          } else {
                            return null;
                          }
                        },
                        isSecured: true,
                      ),
                      20.heightBox,
                      GestureDetector(
                        onTap: () async {
                          if (controller.emailController.text == "") {
                            AwesomeDialog(
                                    context: context,
                                    dialogType: DialogType.error,
                                    animType: AnimType.rightSlide,
                                    title: "Error",
                                    desc: "Please Enter An Email !")
                                .show();
                            return;
                          }
                          try {
                            await FirebaseAuth.instance.sendPasswordResetEmail(
                                email: controller.emailController.text);
                            AwesomeDialog(
                                    context: context,
                                    dialogType: DialogType.success,
                                    animType: AnimType.rightSlide,
                                    title: "",
                                    desc: "Please Check Your Email !")
                                .show();
                            return;
                          } catch (e) {
                            AwesomeDialog(
                                    context: context,
                                    dialogType: DialogType.error,
                                    animType: AnimType.rightSlide,
                                    title: "Error",
                                    desc: "Please Enter Valid Email !")
                                .show();
                            return;
                          }
                        },
                        child: Align(
                            alignment: Alignment.topRight,
                            child: AppStrings.forgetPassword.text.bold.make()),
                      ),
                      20.heightBox,
                      CustomButton(
                          buttonText: AppStrings.login,
                          onTap: () async {
                            _formKey.currentState!.validate();
                            await controller.userLogin();
                            if (controller.userCredential != null) {
                              Get.offAll(() => const NavBar());
                            }
                          }),
                      20.heightBox,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          AppStrings.dontHaveAccount.text.make(),
                          6.widthBox,
                          GestureDetector(
                            onTap: () {
                              Get.to(() => SignUpScreen());
                            },
                            child: AppStrings.signUp.text.bold.make(),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
