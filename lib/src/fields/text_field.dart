import 'package:flutter/material.dart';

class TextFields extends StatefulWidget {
  final Size sizeScreen;
  final IconData? icon;
  final Color? iconColor;
  final String hint;
  final Color? hintColor;
  final bool? security;
  final Color? fillColor;
  final TextInputType? textType;
  final Color? cursorColor;
  final Color? borderColor;
  final Color? textColor;
  final String? labelText;
  final Color? labelColor;
  final TextEditingController controller;
  final ValueChanged<String>? onChanged;

  const TextFields({
    Key? key,
    required this.sizeScreen,
    this.icon,
    required this.hint,
    this.security = false,
    this.iconColor,
    this.hintColor,
    this.fillColor,
    this.textType,
    this.cursorColor,
    this.borderColor,
    this.textColor,
    this.labelText,
    this.labelColor,
    required this.controller,
    this.onChanged,
  }) : super(key: key);

  @override
  _TextFieldsState createState() => _TextFieldsState();
}

class _TextFieldsState extends State<TextFields> {
  @override
  Widget build(BuildContext context) {
    final double width = widget.sizeScreen.width;
    final Color borderColor = widget.borderColor ?? Theme.of(context).primaryColor;
    final Color textColor = widget.textColor ?? Theme.of(context).primaryColor;
    final Color cursorColor = widget.cursorColor ?? Theme.of(context).primaryColor;
    final TextInputType keyboardType = widget.textType ?? TextInputType.text;
    final Color? iconColor = widget.iconColor ?? Colors.grey[500];
    final Color labelColor = widget.labelColor ?? Colors.grey;
    final Color hintColor = widget.hintColor ?? Colors.grey;

    return Container(
      height: width * 0.14,
      margin: EdgeInsets.symmetric(
        horizontal: width * 0.03,
        vertical: width * 0.03,
      ),
      child: TextFormField(
        controller: widget.controller,
        style: TextStyle(color: textColor),
        cursorColor: cursorColor,
        keyboardType: keyboardType,
        onChanged: widget.onChanged,
        obscureText: widget.security ?? false,
        decoration: InputDecoration(
          floatingLabelBehavior: FloatingLabelBehavior.auto,
          labelText: widget.labelText, // Label flutuante
          labelStyle: TextStyle(
            color: labelColor.withOpacity(0.7),
          ),
          floatingLabelStyle: TextStyle(
            color: labelColor,
            fontWeight: FontWeight.bold,
          ),
          hintText: widget.hint, // Dica dentro do campo
          hintStyle: TextStyle(
            color: hintColor,
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: borderColor, width: 1),
            borderRadius: const BorderRadius.all(Radius.circular(8.0)),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: borderColor, width: 2),
            borderRadius: const BorderRadius.all(Radius.circular(8.0)),
          ),
          filled: true,
          fillColor: widget.fillColor ?? Colors.transparent,
          prefixIcon: widget.icon != null
              ? Icon(widget.icon, color: iconColor, size: width * 0.06)
              : null,
        ),
      ),
    );
  }
}
