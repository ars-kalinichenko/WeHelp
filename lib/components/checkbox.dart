import 'package:flutter/material.dart';

class AppCheckbox extends StatefulWidget {
  final String label;
  final bool value;
  final ValueChanged<bool> onChanged;
  final TextStyle labelStyle;

  const AppCheckbox(
      {Key key, this.label, this.value, this.onChanged, this.labelStyle})
      : super(key: key);

  @override
  _AppCheckboxState createState() => _AppCheckboxState();
}

class _AppCheckboxState extends State<AppCheckbox> {
  bool _isSelected = true;

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      title: Text("title text"),
      value: _isSelected,
      onChanged: (bool newValue) {
        setState(() {
          _isSelected = newValue;
        });
      },
      controlAffinity: ListTileControlAffinity.leading, //  <-- leading Checkbox
    );
  }
}
