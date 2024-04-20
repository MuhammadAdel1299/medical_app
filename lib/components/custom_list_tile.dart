import 'package:midical_app/consts/consts.dart';
import '../consts/colors.dart';

class CustomList extends StatelessWidget{
  final Icon icon;
  final String title;
  final Color color = AppColors.primaryColor;
  CustomList({super.key, required this.icon, required this.title, });

  @override
  Widget build(BuildContext context) {
   return ListTile(
     title: Text(title),
     leading: icon,
     iconColor: color,
   );
  }
}