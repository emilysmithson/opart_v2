import 'package:flutter/material.dart';

class settingsDropdown extends StatefulWidget {
  String label;
  String tooltip;
  String currentValue;
  List<String> dropdownItems;
  bool locked;
  Function onChanged;
  Function toggleLock;


  settingsDropdown(this.label, this.tooltip, this.currentValue, this.dropdownItems, this.locked, this.onChanged, this.toggleLock);

  @override
  _settingsDropdownState createState() => _settingsDropdownState();
}




class _settingsDropdownState extends State<settingsDropdown> {

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Container(
          height: 50,

          child: Text(
            widget.tooltip,
            style: TextStyle(fontWeight: FontWeight.normal),
          ),
        ),
        Container(
            height: 50,
            child: Row(
              children: [
                Text(
                  'Lock',
                ),
                Checkbox(
                  value: widget.locked,
                  onChanged: widget.toggleLock,
                ),
              ],
            )),

        Container(
          height: 50,

            child: DropdownButton<String>(
              value: widget.currentValue,

              onChanged: widget.locked ? null : widget.onChanged,
              items: widget.dropdownItems
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),

            )

        ),
      ],
    );


  }
}
