import 'package:flutter/material.dart';
import 'package:midical_app/consts/colors.dart';
import 'package:midical_app/screens/home_screens/category_screen.dart';
import 'package:midical_app/screens/home_screens/home_screen.dart';
import 'package:midical_app/screens/home_screens/settings_screen.dart';
import '../screens/home_screens/bookings_list_screen.dart';

class NavBar extends StatefulWidget {
  const NavBar({super.key});
  @override
  State<StatefulWidget> createState() => _NavBar();

}
class _NavBar extends State<NavBar> {
  int selectedIndex = 0;
  List screenList = [
    const HomeScreen(),
    const CategoryScreen(),
    const BookingsListScreen(),
    const SettingScreen(),

  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screenList.elementAt(selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: AppColors.primaryColor,
        type: BottomNavigationBarType.fixed,
        selectedIconTheme: const IconThemeData(
          color: Colors.white,
        ),
        unselectedItemColor: Colors.white.withOpacity(0.5),
        selectedItemColor: Colors.white,
        currentIndex: selectedIndex,
        onTap: (value){
          setState(() {
            selectedIndex = value;

          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.category), label: "Category"),
          BottomNavigationBarItem(icon: Icon(Icons.book), label: "Bookings"),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: "Settings"),
        ],
      ),
    );
  }

}