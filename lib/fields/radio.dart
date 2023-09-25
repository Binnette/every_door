import 'package:country_coder/country_coder.dart';
import 'package:every_door/widgets/radio_field.dart';
import 'package:every_door/models/amenity.dart';
import 'package:every_door/models/field.dart';
import 'package:flutter/material.dart';

class RadioPresetField extends PresetField {
  List<String> options;

  RadioPresetField({
    required String key,
    required String label,
    IconData? icon,
    FieldPrerequisite? prerequisite,
    LocationSet? locationSet,
    required this.options,
  }) : super(
          key: key,
          label: label,
          prerequisite: prerequisite,
          locationSet: locationSet,
          icon: icon,
        );

  @override
  Widget buildWidget(OsmChange element) => RadioFieldIntl(this, element);
}

class RadioFieldIntl extends StatefulWidget {
  final RadioPresetField field;
  final OsmChange element;

  const RadioFieldIntl(this.field, this.element);

  @override
  State<RadioFieldIntl> createState() => _RadioFieldIntlState();
}

class _RadioFieldIntlState extends State<RadioFieldIntl> {
  @override
  Widget build(BuildContext context) {
    return RadioField(
      options: widget.field.options,
      value: widget.element[widget.field.key],
      onChange: (value) {
        setState(() {
          widget.element[widget.field.key] = value;
        });
      },
    );
  }
}
