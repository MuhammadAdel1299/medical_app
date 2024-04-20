import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:midical_app/consts/colors.dart';
import 'package:midical_app/consts/consts.dart';
import 'package:midical_app/consts/lists.dart';
import 'package:midical_app/screens/sub_screens/category_datails.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: AppStrings.category.text.make(),
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: GridView.builder(
          physics: const BouncingScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 10.0,
            crossAxisSpacing: 10.0,
            mainAxisExtent: 200.0,
          ),
          itemCount: iconList.length,
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: (){
                Get.to(() => const CategoryDetails());
                print(iconTitleList[index]);
              },
              child: Container(
                decoration: BoxDecoration(
                  color: AppColors.bgColor,
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Align(
                        alignment: Alignment.center,
                        child: Image.asset(
                          iconList[index],
                          width: 100,
                          color: Vx.randomPrimaryColor,
                        ),
                      ),
                      const Divider(
                        color: Colors.white,
                      ),
                      AppTextStyle.bold(
                        title: iconTitleList[index],
                        size: 26.0,
                        color: Colors.black87,
                      ),
                      AppTextStyle.regular(
                        title: "12 Specialist",
                        size: 12.0,
                        color: Colors.grey,
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
