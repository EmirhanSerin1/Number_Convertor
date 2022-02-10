import 'package:arabic_number_conversion/model/digits.dart';
import 'package:arabic_number_conversion/providers/list.dart';
import 'package:arabic_number_conversion/view/home/widgets/conversion_actions.dart';
import 'package:arabic_number_conversion/view/home/widgets/custom_app_bar.dart';
import 'package:arabic_number_conversion/view/home/widgets/results_line.dart';
import 'package:arabic_number_conversion/view/home/widgets/text_field.dart';
import 'package:arabic_number_conversion/view/settings/settings.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // We are creating controller here for the use textfield
  TextEditingController controller = TextEditingController();

  // We are creating GlobalKey here for the use form
  var formKey = GlobalKey<FormState>();

  String result = "";
  int x = 0;

  @override
  Widget build(BuildContext context) {
    //We are calling provider
    List list = Provider.of<ModelList>(context).list;
    List singleDigit = Provider.of<Digits>(context).single;
    List doubleDigit = Provider.of<Digits>(context).double;
    List tenPower = Provider.of<Digits>(context).tenPowers;

    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: customAppBar(context),
      body: Container(
        color: Theme.of(context).backgroundColor,
        child: Column(
          children: [
            buildTextField(formKey, controller, context),
            convertButton(list, context),
            resultsLine(context),
            convertedNumbers(context, list, doubleDigit, singleDigit, tenPower),
          ],
        ),
      ),
    );
  }

  convertedNumbers(
      BuildContext context,
      List<dynamic> list,
      List<dynamic> doubleDigit,
      List<dynamic> singleDigit,
      List<dynamic> tenPower) {
    return Flexible(
        child: ListView.builder(
      itemCount: context.read<ModelList>().list.length,
      itemBuilder: (context, indexNumber) =>
          buildListTile(indexNumber, list, doubleDigit, singleDigit, tenPower),
    ));
  }

  convertButton(List<dynamic> list, BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        setState(() {
          if (formKey.currentState!.validate()) {
            list.add(controller.text);
            controller.clear();
          }
        });
      },
      child: Text("Convert",
          style: TextStyle(
            color: Theme.of(context).backgroundColor,
          )),
      style: ElevatedButton.styleFrom(primary: Theme.of(context).primaryColor),
    );
  }

  buildListTile(int number, List list, List doubleDigitt, List singleDigett,
      List tenPower) {
    return Dismissible(
      key: UniqueKey(),
      direction: DismissDirection.endToStart,
      onDismissed: (direction) {
        setState(() {
          list.removeAt(number);
        });
      },
      child: Container(
        height: 90,
        child: Card(
          color: const Color(0xFFADB6D1),
          elevation: 4,
          child: ListTile(
            title: Text(
              list[number] +
                  " : " +
                  convertToWords(number, list, doubleDigitt, singleDigett,
                      tenPower), //convertNumbers(list, number, digit),
              style: const TextStyle(
                  color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
    );
  }
}
