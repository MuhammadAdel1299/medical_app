import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:midical_app/consts/colors.dart';
import 'package:midical_app/consts/consts.dart';

import 'booking_screen.dart';

class DoctorProfile extends StatelessWidget {
  const DoctorProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Doctor Name"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(20.0),
                height: 100,
                decoration: BoxDecoration(
                  color: AppColors.bgColor,
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 40.0,
                      backgroundImage: AssetImage(
                        ImageAssets.doctor1,
                      ),
                    ),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text("Doctor Name"),
                          const Text("Category"),
                          VxRating(
                            selectionColor: AppColors.yellowColor,
                            onRatingUpdate: (value) {},
                            count: 5,
                            value: 4,
                            maxRating: 8,
                            stepInt: true,
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              20.heightBox,
              Container(
                padding: EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                  color: Colors.white,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ListTile(
                      title: const Text(
                        "Phone Number",
                      ),
                      subtitle: const Text(
                        "+123456789",
                        style: TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                      trailing: Container(
                        width: 50.0,
                        padding: const EdgeInsets.all(10.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.0),
                          color: AppColors.yellowColor,
                        ),
                        child: const Icon(
                          Icons.phone,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    30.heightBox,
                    AppTextStyle.bold(title: "About", size: 20.0),
                    AppTextStyle.regular(
                      title: "This Section Is About Doctor",
                      size: 15.0,
                      color: Colors.grey,
                    ),
                    30.heightBox,
                    AppTextStyle.bold(title: "Address", size: 20.0),
                    AppTextStyle.regular(
                      title: "This Section Is Address Of Doctor",
                      size: 15.0,
                      color: Colors.grey,
                    ),
                    30.heightBox,
                    AppTextStyle.bold(title: "Working Times", size: 20.0),
                    AppTextStyle.regular(
                      title: "This Section Times That Doctor Is Working",
                      size: 15.0,
                      color: Colors.grey,
                    ),
                    30.heightBox,
                    AppTextStyle.bold(title: "Services", size: 20.0),
                    AppTextStyle.regular(
                      title: "This Section Is Doctor's Services ",
                      size: 15.0,
                      color: Colors.grey,
                    ),
                    30.heightBox,
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(10.0),
        child: CustomButton(onTap: (){
          Get.to(()=> const BookingScreen());
        },buttonText: "Book With This Doctor Now!",),
      ),
    );
  }
}
