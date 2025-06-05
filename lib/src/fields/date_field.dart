import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateField extends StatefulWidget {
  final Size sizeScreen;
  final IconData? icon;
  final Color? iconColor;
  final String hint;
  final Color? hintColor;
  final Color? fillColor;
  final TextInputType? textType;
  final Color? cursorColor;
  final Color? borderColor;
  final Color? textColor;
  final String? labelText;
  final Color? labelColor;
  final TextEditingController controller;
  final ValueChanged<DateTime>? onDateSelected;

  const DateField({
    Key? key,
    required this.sizeScreen,
    required this.hint,
    required this.controller,
    this.icon,
    this.iconColor,
    this.hintColor,
    this.fillColor,
    this.textType,
    this.cursorColor,
    this.borderColor,
    this.textColor,
    this.labelText,
    this.labelColor,
    this.onDateSelected,
  }) : super(key: key);

  @override
  State<DateField> createState() => _DateFieldState();
}

class _DateFieldState extends State<DateField> {
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2101),
    );
    if (picked != null) {
      widget.controller.text = DateFormat('dd/MM/yyyy').format(picked);
      widget.onDateSelected?.call(picked);
    }
  }

  @override
  Widget build(BuildContext context) {
    final width = widget.sizeScreen.width;

    final Color borderColor = widget.borderColor ?? Theme.of(context).primaryColor;
    final Color textColor = widget.textColor ?? Theme.of(context).primaryColor;
    final Color hintColor = widget.hintColor ?? Colors.grey;
    final Color iconColor = widget.iconColor ?? Colors.grey;
    final Color fillColor = widget.fillColor ?? Colors.white;
    final Color cursorColor = widget.cursorColor ?? Theme.of(context).primaryColor;

    return Container(
      height: width * 0.14,
      margin: EdgeInsets.symmetric(horizontal: width * 0.03, vertical: width * 0.03),
      child: TextFormField(
        controller: widget.controller,
        autofocus: false,
        readOnly: true,
        onTap: () => _selectDate(context),
        keyboardType: widget.textType ?? TextInputType.datetime,
        cursorColor: cursorColor,
        style: TextStyle(color: textColor),
        decoration: InputDecoration(
          labelText: widget.labelText,
          labelStyle: TextStyle(color: widget.labelColor ?? Colors.black),
          hintText: widget.hint,
          hintStyle: TextStyle(color: hintColor.withOpacity(0.6)),
          filled: true,
          fillColor: fillColor,
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: borderColor, width: 1),
            borderRadius: BorderRadius.circular(8),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: borderColor, width: 2),
            borderRadius: BorderRadius.circular(8),
          ),
          prefixIcon: widget.icon != null
              ? Icon(widget.icon, color: iconColor, size: width * 0.06)
              : null,
          suffixIcon: IconButton(
            icon: Icon(Icons.calendar_month),
            color: iconColor,
            onPressed: () => _selectDate(context),
          ),
          contentPadding: EdgeInsets.symmetric(horizontal: width * 0.02),
        ),
      ),
    );
  }
}
