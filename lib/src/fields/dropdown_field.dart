import 'package:flutter/material.dart';

class DropdownField extends StatefulWidget {
  final Function(String?) onChanged;
  final Size sizeScreen;
  final String hint;
  final IconData? icon;
  final Color? iconColor;
  final Color? hintColor;
  final Color? fillColor;
  final TextStyle? textType;
  final Color? borderColor;
  final Color? textColor;
  final String? labelText;
  final Color? labelColor;
  final String? value;
  final Color? dropdownColor;
  final List<String> opcoesDeSelecao;

  const DropdownField({
    Key? key,
    required this.onChanged,
    required this.hint,
    required this.sizeScreen,
    required this.opcoesDeSelecao,
    this.icon,
    this.iconColor,
    this.hintColor,
    this.fillColor,
    this.textType,
    this.borderColor,
    this.textColor,
    this.labelText,
    this.labelColor,
    this.value,
    this.dropdownColor,
  }) : super(key: key);

  @override
  State<DropdownField> createState() => _DropdownFieldState();
}

class _DropdownFieldState extends State<DropdownField> {
  @override
  Widget build(BuildContext context) {
    final width = widget.sizeScreen.width;

    final borderColor = widget.borderColor ?? Theme.of(context).primaryColor;
    final textColor = widget.textColor ?? Theme.of(context).primaryColor;
    final hintColor = widget.hintColor ?? Colors.grey[500]!;
    final iconColor = widget.iconColor ?? Colors.grey[500]!;
    final fillColor = widget.fillColor ?? Colors.white;
    final dropdownColor = widget.dropdownColor ?? Colors.white;
    final labelColor = widget.labelColor ?? Colors.black;

    return Container(
      height: width * 0.14,
      margin: EdgeInsets.symmetric(
        horizontal: width * 0.03,
        vertical: width * 0.03,
      ),
      child: DropdownButtonFormField<String>(
        value: widget.value,
        onChanged: widget.onChanged,
        dropdownColor: dropdownColor,
        style: widget.textType ?? TextStyle(color: textColor),
        icon: Icon(Icons.arrow_drop_down, color: iconColor),
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
          fillColor: fillColor,
          prefixIcon: widget.icon != null
              ? Icon(widget.icon, color: iconColor, size: width * 0.06)
              : null,
          contentPadding: EdgeInsets.symmetric(
            horizontal: width * 0.03,
            vertical: width * 0.03,
          ),
        ),
        items: widget.opcoesDeSelecao.map((opcao) {
          return DropdownMenuItem<String>(
            value: opcao,
            child: Text(opcao),
          );
        }).toList(),
      ),
    );
  }
}
