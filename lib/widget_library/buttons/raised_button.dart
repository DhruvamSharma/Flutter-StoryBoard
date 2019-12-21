import 'package:flutter/material.dart';

class CustomisedButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: const Alignment(0.0, -0.2),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ButtonBar(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              RaisedButton(
                child: const Text('RAISED BUTTON', semanticsLabel: 'RAISED BUTTON 1'),
                onPressed: () {
                  // Perform some action
                },
              ),
              const RaisedButton(
                child: Text('DISABLED', semanticsLabel: 'DISABLED BUTTON 1'),
                onPressed: null,
              ),
            ],
          ),
          ButtonBar(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              RaisedButton.icon(
                icon: const Icon(Icons.add, size: 18.0),
                label: const Text('RAISED BUTTON', semanticsLabel: 'RAISED BUTTON 2'),
                onPressed: () {
                  // Perform some action
                },
              ),
              RaisedButton.icon(
                icon: const Icon(Icons.add, size: 18.0),
                label: const Text('DISABLED', semanticsLabel: 'DISABLED BUTTON 2'),
                onPressed: null,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
