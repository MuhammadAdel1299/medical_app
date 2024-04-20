import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:midical_app/screens/sub_screens/bookings_details_screen.dart';

import '../../consts/colors.dart';
import '../../consts/consts.dart';
import '../../consts/images.dart';

class BookingsListScreen extends StatelessWidget {
  const BookingsListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Your Bookings List"),
      ),
      body: ListView.builder(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.vertical,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            padding: const EdgeInsets.all(10.0),
            height: 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.0),
            ),
            child: GestureDetector(
              onTap: (){
                Get.to(()=> const BookingDetailsScreen());
              },
              child: Container(
                decoration: BoxDecoration(
                    color: AppColors.bgColor,
                    borderRadius: BorderRadius.circular(15.0)
                ),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 15.0),
                      child: CircleAvatar(
                        radius: 30.0,
                        backgroundImage: AssetImage(
                          ImageAssets.doctor1,
                        ),
                      ),
                    ),
                    30.widthBox,
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        AppTextStyle.bold(title: "Doctor Name" , size: 20.0 ,),
                        AppTextStyle.bold(title: "Booking Time", size: 15.0,color: Colors.grey),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
        itemCount: 5,
      ),
    );
  }
}
