import 'package:flutter/material.dart';
import 'package:midical_app/consts/consts.dart';

class BookingScreen extends StatefulWidget {
  const BookingScreen({super.key});

  @override
  State<StatefulWidget> createState() => _BookingScreen();
}

class _BookingScreen extends State<BookingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Booking Your Doctor"),
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
                CustomTextField(
                  hint: "Booking Date",
                  textColor: Colors.grey,
                  borderColor: Colors.black,
                  isSecured: false,
                ),
                10.heightBox,
                AppTextStyle.bold(title: "Time :", size: 20.0),
                CustomTextField(
                  hint: "Booking Time",
                  textColor: Colors.grey,
                  borderColor: Colors.black,
                  isSecured: false,
                ),
                10.heightBox,
                AppTextStyle.bold(title: "Name :", size: 20.0),
                CustomTextField(
                  hint: "Full Name",
                  textColor: Colors.grey,
                  borderColor: Colors.black,
                  isSecured: false,
                ),
                10.heightBox,
                AppTextStyle.bold(title: "Phone :", size: 20.0),
                CustomTextField(
                  hint: "Phone Number",
                  textColor: Colors.grey,
                  borderColor: Colors.black,
                  isSecured: false,
                ),
                10.heightBox,
                AppTextStyle.bold(title: "Notes :", size: 20.0),
                CustomTextField(
                  hint: "Any Notes ?",
                  textColor: Colors.grey,
                  borderColor: Colors.black,
                  isSecured: false,
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(10.0),
        child: CustomButton(
          onTap: () {},
          buttonText: "Book Now!",
        ),
      ),
    );
  }
}
