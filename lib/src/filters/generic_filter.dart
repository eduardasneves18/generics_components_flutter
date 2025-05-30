import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../fields/filter_fields.dart';

class GenericFilterModal extends StatefulWidget {
  final String title;
  final List<FilterFieldConfig> fields;
  final Function(Map<String, dynamic>) onApply;

  const GenericFilterModal({
    Key? key,
    required this.title,
    required this.fields,
    required this.onApply,
  }) : super(key: key);

  @override
  State<GenericFilterModal> createState() => _GenericFilterModalState();
}

class _GenericFilterModalState extends State<GenericFilterModal> {
  final Map<String, dynamic> _values = {};

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(widget.title, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          const SizedBox(height: 16),
          ...widget.fields.map((field) {
            switch (field.type) {
              case FilterFieldType.text:
                final controller = field.controller ?? TextEditingController();
                return Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: TextField(
                    controller: controller,
                    decoration: InputDecoration(labelText: field.label, border: OutlineInputBorder()),
                    onChanged: (value) => _values[field.key] = value,
                  ),
                );
              case FilterFieldType.number:
                final controller = field.controller ?? TextEditingController();
                return Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: TextField(
                    controller: controller,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(labelText: field.label, border: OutlineInputBorder()),
                    onChanged: (value) => _values[field.key] = double.tryParse(value),
                  ),
                );
              case FilterFieldType.date:
                return Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: InkWell(
                    onTap: () async {
                      final picked = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(2000),
                        lastDate: DateTime(2100),
                      );
                      if (picked != null) {
                        final formatted = DateFormat('dd/MM/yyyy').format(picked);
                        setState(() {
                          _values[field.key] = formatted;
                        });
                      }
                    },
                    child: InputDecorator(
                      decoration: InputDecoration(
                        labelText: field.label,
                        border: OutlineInputBorder(),
                      ),
                      child: Text(_values[field.key] ?? 'Selecionar'),
                    ),
                  ),
                );
              case FilterFieldType.dropdown:
                return Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: DropdownButtonFormField<String>(
                    decoration: InputDecoration(labelText: field.label, border: OutlineInputBorder()),
                    items: field.options!
                        .map((opt) => DropdownMenuItem(value: opt, child: Text(opt)))
                        .toList(),
                    onChanged: (value) => _values[field.key] = value,
                  ),
                );
            }
          }),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {
              widget.onApply(_values);
              Navigator.pop(context);
            },
            style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFF004D61)),
            child: const Text('Aplicar Filtro', style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }
}
