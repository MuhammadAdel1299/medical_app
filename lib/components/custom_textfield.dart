import 'package:midical_app/consts/consts.dart';

class CustomTextField extends StatefulWidget {
  final String hint;
  final TextEditingController? textController;
  final Color textColor;
  final Color borderColor;
  final Color? preIconColor;
  final Color? sufIconColor;
  final Icon? preIcon;
  final Icon? sufIcon;
  final FormFieldValidator? validate;
  bool isSecured;

  CustomTextField({
    super.key,
    required this.hint,
    this.textController,
    required this.textColor,
    required this.borderColor,
    this.preIcon,
    this.sufIcon,
    this.validate,
    this.preIconColor,
    this.sufIconColor,
    required this.isSecured ,
  });

  @override
  State<CustomTextField> createState() => _CustomTextField();
}

class _CustomTextField extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: Colors.black38,
      controller: widget.textController,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: widget.borderColor,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: widget.borderColor,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: widget.borderColor,
          ),
        ),
        hintText: widget.hint,
        hintStyle: TextStyle(color: widget.textColor),
        prefixIcon: widget.preIcon,
        prefixIconColor: widget.preIconColor,
        suffixIcon: widget.sufIcon != null ? changePassword() : null,
        suffixIconColor: widget.sufIconColor,
      ),
      validator: widget.validate,
      obscureText: widget.isSecured,
    );
  }

  changePassword() {
    return IconButton(
      onPressed: () {
        setState(() {
          widget.isSecured = !widget.isSecured;
        });
      },
      icon: widget.isSecured
          ? const Icon(Icons.visibility)
          : const Icon(Icons.visibility_off),
    );
  }
}
