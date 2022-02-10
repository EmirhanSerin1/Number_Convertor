import 'package:arabic_number_conversion/core/constants/theme.dart';
import 'package:arabic_number_conversion/model/digits.dart';
import 'package:arabic_number_conversion/modelView/theme_notifier.dart';
import 'package:arabic_number_conversion/providers/list.dart';
import 'package:arabic_number_conversion/view/home/home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  //*We are using Multi Provider here. Actually we can use normal Provider but we can add more Provider more easily if we use Multi Provider.
  runApp(
    MultiProvider(
      providers: [
        Provider(create: (_) => ModelList()),
        Provider(create: (_) => Digits()),
        ChangeNotifierProvider(create: (_) => ThemeNotifier(lightTheme))
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeNotifier = Provider.of<ThemeNotifier>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Arabic Number Conversion',
      theme: themeNotifier.getTheme(),
      home: const MyHomePage(),
    );
  }
}
