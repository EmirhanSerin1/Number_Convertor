import 'package:arabic_number_conversion/view/settings/settings.dart';
import 'package:flutter/material.dart';

AppBar customAppBar(BuildContext context) {
    return AppBar(
      title: Text('Arabic Number Conversion',
          style: TextStyle(color: Theme.of(context).primaryColor)),
      backgroundColor: Theme.of(context).backgroundColor,
      actions: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: IconButton(
            icon: Icon(
              Icons.settings,
              color: Theme.of(context).primaryColor,
            ),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) =>  Settings()));
            },
          ),
        )
      ],
    );
  }