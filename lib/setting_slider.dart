import 'package:flutter/material.dart';

class settingsSlider extends StatefulWidget {
  String label;
  String tooltip;
  double currentValue;
  double min;
  double max;
  bool locked;
  Function onChanged;
  Function toggleLock;
  Function updateCache;

  settingsSlider(this.label, this.tooltip, this.currentValue, this.min,
      this.max, this.locked, this.onChanged, this.toggleLock,this.updateCache );

  @override
  _settingsSliderState createState() => _settingsSliderState();
}

class _settingsSliderState extends State<settingsSlider> {
  @override
  Widget build(BuildContext context) {
    return Column(mainAxisSize: MainAxisSize.min,
     // padding: const EdgeInsets.all(8),
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
          child: Slider(
            onChangeEnd: (double) {
              print('*********** should update cache');
              widget.updateCache();
            },
            value: widget.currentValue,
            min: widget.min,
            max: widget.max,
            onChanged: widget.locked ? null : widget.onChanged,
            label: widget.currentValue.round().toString(),
          ),
        ),
      ],
    );
  }
}
