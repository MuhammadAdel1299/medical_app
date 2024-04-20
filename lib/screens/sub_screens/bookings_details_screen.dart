import 'package:flutter/material.dart';
import 'package:midical_app/consts/consts.dart';

class BookingDetailsScreen extends StatefulWidget {
  const BookingDetailsScreen({super.key});

  @override
  State<StatefulWidget> createState() => _BookingDetailsScreen();
}

class _BookingDetailsScreen extends State<BookingDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Booking Details"),
      ),
      body: Container(
        padding: const EdgeInsets.all(10.0),
        width: double.infinity,
        child: Form(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppTextStyle.bold(title: "Date :", size: 20.0),
                AppTextStyle.bold(title: "Friday - 10 November 2024", color: Colors.grey),
                10.heightBox,
                AppTextStyle.bold(title: "Time :", size: 20.0),
                AppTextStyle.bold(title: "4:00 PM", color: Colors.grey),
                10.heightBox,
                AppTextStyle.bold(title: "Name :", size: 20.0),
                AppTextStyle.bold(title: "Muhammad Adel", color: Colors.grey),
                10.heightBox,
                AppTextStyle.bold(title: "Phone :", size: 20.0),
                AppTextStyle.bold(title: "+123456789", color: Colors.grey),
                10.heightBox,
                AppTextStyle.bold(title: "Notes :", size: 20.0),
                AppTextStyle.bold(title: "There is no any notes.", color: Colors.grey),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(10.0),
        child: CustomButton(
          onTap: () {},
          buttonText: "Cancel Booking",
        ),
      ),
    );
  }
}
