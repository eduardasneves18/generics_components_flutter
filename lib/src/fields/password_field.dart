import 'package:flutter/material.dart';
import 'generic_input_field.dart';

class PasswordField extends GenericInputField {
  const PasswordField({
    Key? key,
    required String hint,
    required TextEditingController controller,
    required Size sizeScreen,
    IconData? icon,
    Color? iconColor,
    Color? hintColor,
    Color? fillColor,
    TextInputType? textType,
    Color? cursorColor,
    Color? borderColor,
    Color? textColor,
    String? labelText,
    Color? labelColor,
    bool? security = true,
    Color? menuBackgroundColor,
    Color? fieldBackgroundColor,
  }) : super(
    key: key,
    hint: hint,
    controller: controller,
    sizeScreen: sizeScreen,
    icon: icon,
    iconColor: iconColor,
    hintColor: hintColor,
    fillColor: fillColor,
    textType: textType,
    cursorColor: cursorColor,
    borderColor: borderColor,
    textColor: textColor,
    labelText: labelText,
    labelColor: labelColor,
    security: security,
    menuBackgroundColor: menuBackgroundColor,
    fieldBackgroundColor: fieldBackgroundColor,
  );

  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends GenericInputFieldState<PasswordField> {
  bool showPassword = true;

  @override
  Widget build(BuildContext context) {
    final width = widget.sizeScreen?.width ?? MediaQuery.of(context).size.width;

    final borderColor = widget.borderColor ?? Theme.of(context).primaryColor;
    final textColor = widget.textColor ?? Theme.of(context).primaryColor;
    final cursorColor = widget.cursorColor ?? Theme.of(context).primaryColor;
    final iconColor = widget.iconColor ?? Colors.grey[500];
    final labelColor = widget.labelColor ?? Colors.green;
    final hintColor = widget.hintColor ?? Colors.grey;

    return Container(
      height: width * 0.14,
      margin: EdgeInsets.symmetric(horizontal: width * 0.03, vertical: width * 0.03),
      child: TextFormField(
        controller: widget.controller,
        autofocus: false,
        obscureText: widget.security == true ? showPassword : false,
        cursorColor: cursorColor,
        style: TextStyle(color: textColor),
        keyboardType: widget.textType ?? TextInputType.visiblePassword,
        validator: (value) {
          if (value == null || value.isEmpty) return 'Campo obrigatório';
          if (value.length < 6) return 'A senha deve ter no mínimo 6 caracteres';
          return null;
        },
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
            borderRadius: BorderRadius.circular(8),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: borderColor, width: 2),
            borderRadius: BorderRadius.circular(8),
          ),
          filled: true,
          fillColor: widget.fillColor ?? Colors.transparent,
          hintStyle: TextStyle(color: hintColor.withOpacity(0.6)),
          hintText: widget.hint,
          prefixIcon: widget.icon != null
              ? Icon(widget.icon, color: iconColor, size: width * 0.06)
              : null,
          suffixIcon: widget.security == true
              ? IconButton(
            icon: Icon(showPassword ? Icons.visibility : Icons.visibility_off, color: iconColor),
            onPressed: () => setState(() => showPassword = !showPassword),
          )
              : null,
          contentPadding: EdgeInsets.symmetric(horizontal: width * 0.02),
        ),
      ),
    );
  }
}
