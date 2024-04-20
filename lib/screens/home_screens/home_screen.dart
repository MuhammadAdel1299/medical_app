import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:midical_app/consts/colors.dart';
import 'package:midical_app/consts/consts.dart';
import 'package:midical_app/consts/lists.dart';
import 'package:midical_app/consts/strings.dart';
import 'package:midical_app/screens/sub_screens/doctor_profile.dart';

import '../sub_screens/category_datails.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: AppStrings.appBar.text.bold.white.make(),
        backgroundColor: AppColors.primaryColor,
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsetsDirectional.all(20.0),
              height: 150.0,
              color: AppColors.primaryColor,
              child: CustomTextField(
                hint: AppStrings.search,
                borderColor: Colors.black,
                textColor: Colors.white70,
                preIcon: const Icon(Icons.search), isSecured: false,
              ),
            ),
            20.heightBox,
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: SizedBox(
                height: 150.0,
                child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemCount: iconList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () {
                        Get.to(() => const CategoryDetails());
                        print("Done");
                      },
                      child: Container(
                        margin: const EdgeInsets.only(right: 8.0),
                        padding: const EdgeInsets.all(20.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          color: AppColors.primaryColor,
                        ),
                        height: 50.0,
                        width: 100.0,
                        child: Column(
                          children: [
                            Image.asset(
                              iconList[index],
                            ),
                            5.heightBox,
                            Align(
                              alignment: Alignment.bottomCenter,
                              child: AppTextStyle.bold(
                                  title: iconTitleList[index],
                                  color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: Text(
                  "Most Popular Doctors",
                  style: TextStyle(
                    fontSize: 20.0,
                    color: AppColors.primaryColor,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 400.0,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: doctorsList.length,
                  physics: const BouncingScrollPhysics(),
                  padding: const EdgeInsets.only(
                    left: 10.0,
                    right: 10.0,
                  ),
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () {
                        Get.to(() => const DoctorProfile());
                      },
                      child: Container(
                        clipBehavior: Clip.hardEdge,
                        margin: const EdgeInsets.all(10.0),
                        padding: const EdgeInsets.only(bottom: 10.0),
                        height: double.infinity,
                        width: 200.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.0),
                          color: Colors.blueGrey,
                        ),
                        child: Column(
                          children: [
                            Image.asset(
                              doctorsList[index],
                            ),
                            Expanded(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  AppTextStyle.bold(
                                    title: doctorNameList[index],
                                    color: Colors.black,
                                    size: 20.0,
                                  ),
                                  AppTextStyle.bold(
                                      title: "Category", color: Colors.black38),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {},
                child: Text(
                  "View All",
                  style: TextStyle(
                    color: AppColors.primaryColor,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
