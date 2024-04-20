import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:midical_app/components/auth_controller.dart';
import 'package:midical_app/components/nav_bar.dart';
import 'package:midical_app/consts/consts.dart';
import 'package:midical_app/screens/home_screens/home_screen.dart';

class SignUpScreen extends StatelessWidget {
   SignUpScreen({super.key});
  final _formKey = GlobalKey<FormState>();
  FirebaseFirestore sure = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(AuthController());

    return Scaffold(
      body: Container(
        margin: const EdgeInsetsDirectional.only(top: 40.0),
        padding: const EdgeInsetsDirectional.all(8.0),
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                Container(
                  color: Colors.white,
                  child: Image.asset(
                    ImageAssets.loginPic,
                  ),
                ),
                20.heightBox,
                AppTextStyle.regular(
                  title: AppStrings.welcomeSignup,
                  size: 24.0,
                ),
                //AppStrings.welcome.text.make(),
                20.heightBox,
                Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomTextField(
                        hint: AppStrings.fullName,
                        borderColor: Colors.black,
                        textColor: Colors.black45,
                        textController: controller.fullNameController,
                        validate: (emailController) {
                          if (emailController == null ||
                              emailController.isEmpty) {
                            return "please enter your name";
                          } else {
                            return null;
                          }
                        },
                        isSecured: false,
                      ),
                      10.heightBox,
                      CustomTextField(
                        hint: AppStrings.email,
                        borderColor: Colors.black,
                        textColor: Colors.black45,
                        textController: controller.emailController,
                        validate: (value) {
                          if (value == null || value.isEmpty) {
                            return "Email can't be empty";
                          } else if (sure.collection('users').doc('email').toString() == controller.emailController.text){
                            return "this email is already used";
                          }
                        }, isSecured: false,
                      ),
                      10.heightBox,
                      CustomTextField(
                        hint: AppStrings.passwordHint,
                        borderColor: Colors.black,
                        textColor: Colors.black45,
                        textController: controller.passwordController,
                        validate: (emailController) {
                          if (emailController == null ||
                              emailController.isEmpty) {
                            return "email error";
                          }
                          else {
                            return null;
                          }
                        },
                        isSecured: false,
                      ),
                      20.heightBox,
                      CustomButton(
                        buttonText: AppStrings.signUp,
                        onTap: () async {
                          _formKey.currentState!.validate();
                          await controller.userSignUp();
                          if (controller.userCredential != null) {
                            Get.offAll(() => const NavBar());
                          }
                        },
                      ),
                      20.heightBox,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          AppStrings.haveAnAccount.text.make(),
                          6.widthBox,
                          GestureDetector(
                            /////// Button
                            onTap: () {
                              Get.offAll(() =>  LoginScreen());
                            },
                            child: AppStrings.login.text.bold.make(),
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
