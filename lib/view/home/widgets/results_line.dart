
  import 'package:flutter/material.dart';

Column resultsLine(BuildContext context) {
    return Column(
            children: [
              Text(
                "Results",
                style: TextStyle(color: Theme.of(context).primaryColor),
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.9,
                height: 2,
                color: Theme.of(context).primaryColor,
              )
            ],
          );
  }
