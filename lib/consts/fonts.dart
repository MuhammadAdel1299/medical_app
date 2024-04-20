import 'consts.dart';

class AppFonts {
  static String regular = "assets/fonts/sans_regular.ttf",
      bold = "assets/fonts/sans_bold.ttf";
}

class AppTextStyle {
  static regular({String? title, Color? color = Colors.black, double? size}) {
    return title!.text.size(size).color(color).fontFamily(AppFonts.regular).make();
  }

  static bold({String? title, Color? color = Colors.black, double? size}) {
    return title!.text.size(size).color(color).fontFamily(AppFonts.bold).make();
  }
}
