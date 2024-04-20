import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:midical_app/components/auth_controller.dart';
import 'package:midical_app/components/custom_list_tile.dart';
import 'package:midical_app/consts/colors.dart';
import 'package:midical_app/consts/consts.dart';
import 'package:midical_app/consts/lists.dart';
import 'package:midical_app/consts/strings.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(AuthController());
    return Scaffold(
      appBar: AppBar(
        title: const Text("Settings"),
        automaticallyImplyLeading: false,
      ),
      body: Column(
        children: [
          // Row(
          //   children: [
          //     const CircleAvatar(child: Icon(Icons.person),),
          //     Column(
          //       children: [
          //         AppTextStyle.bold(title: AppStrings.userName),
          //         AppTextStyle.bold(title: AppStrings.userName),
          //       ],
          //     ),
          //   ],
          // ),
          ListTile(
            leading: CircleAvatar(
              backgroundColor: AppColors.primaryColor,
              child:  Icon(Icons.person , color: AppColors.bgColor,),
            ),
            title: AppTextStyle.bold(title: controller.userCredential!.user!.displayName.toString()),
            subtitle: AppTextStyle.bold(title: controller.emailController.value.text),
          ),
          const Divider(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView(
              shrinkWrap: true,
              children: <Widget>[
                CustomList(
                  icon: const Icon(Icons.lock),
                  title: AppStrings.changePassword,
                ),
                CustomList(
                  icon: const Icon(Icons.file_copy_sharp),
                  title: AppStrings.terms,
                ),
                CustomList(
                  icon: const Icon(Icons.settings_phone_outlined),
                  title: AppStrings.contactUs,
                ),
                GestureDetector(
                  onTap: (){
                    AuthController().userSignOUt();
                    Get.offAll(() =>  LoginScreen());
                  },
                  child: CustomList(
                    icon: const Icon(Icons.logout),
                    title: AppStrings.signOut,
                  ),
                ),

                // ListTile(
                //   leading: Icon(Icons.map),
                //   title: Text('Map'),
                // ),
                // ListTile(
                //   leading: Icon(Icons.photo_album),
                //   title: Text('Album'),
                // ),
                // ListTile(
                //   leading: Icon(Icons.phone),
                //   title: Text('Phone'),
                // ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
