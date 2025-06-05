import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class EmailField extends StatefulWidget {
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
  final Color? labelColor;
  final TextEditingController controller;

  const EmailField({
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
    this.labelColor,
    required this.controller,
  }) : super(key: key);

  @override
  _EmailFieldState createState() => _EmailFieldState();
}

class _EmailFieldState extends State<EmailField> {
  bool showSecurityPassword = true;

  @override
  Widget build(BuildContext context) {
    final double width = widget.sizeScreen.width;
    final Color borderColor = widget.borderColor ?? Theme.of(context).primaryColor;
    final Color textColor = widget.textColor ?? Theme.of(context).primaryColor;
    final Color cursorColor = widget.cursorColor ?? Theme.of(context).primaryColor;
    final Color? iconColor = widget.iconColor ?? Colors.grey[500];
    final Color labelColor = widget.labelColor ?? Colors.green;
    final Color hintColor = widget.hintColor ?? Colors.grey;

    return Container(
      height: width * 0.14,
      margin: EdgeInsets.symmetric(
        horizontal: width * 0.03,
        vertical: width * 0.03,
      ),
      child: TextFormField(
        controller: widget.controller,
        autofocus: false,
        style: TextStyle(color: textColor),
        enableInteractiveSelection: true,
        cursorColor: cursorColor,
        keyboardType: widget.textType ?? TextInputType.emailAddress,
        obscureText: widget.security == true && showSecurityPassword,
        decoration: InputDecoration(
          floatingLabelBehavior: FloatingLabelBehavior.auto,
          labelText: widget.hint,
          labelStyle: TextStyle(
            color: hintColor.withOpacity(0.8),
          ),
          floatingLabelStyle: TextStyle(
            color: labelColor,
            fontWeight: FontWeight.bold,
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
          hintStyle: TextStyle(color: hintColor.withOpacity(0.6)),
          prefixIcon: widget.icon != null
              ? Icon(widget.icon, color: iconColor, size: width * 0.06)
              : null,
          suffixIcon: widget.security != true
              ? null
              : IconButton(
            icon: Icon(getIconSecury(), color: iconColor),
            onPressed: () {
              setState(() {
                showSecurityPassword = !showSecurityPassword;
              });
            },
          ),
          contentPadding: EdgeInsets.symmetric(horizontal: width * 0.02),
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Por favor, insira um email';
          }
          const pattern = r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$';
          final regex = RegExp(pattern);
          if (!regex.hasMatch(value)) {
            return 'Por favor, insira um email válido';
          }
          return null;
        },
      ),
    );
  }

  IconData getIconSecury() {
    return showSecurityPassword ? Icons.visibility : Icons.visibility_off;
  }
}
