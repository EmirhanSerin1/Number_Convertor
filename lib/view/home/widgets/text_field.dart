import 'package:flutter/material.dart';

buildTextField(
    Key key, TextEditingController controller, BuildContext context) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Form(
      key: key,
      child: Container(
        padding: const EdgeInsets.all(2),
        decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.3),
            borderRadius: BorderRadius.circular(8)),
        child: TextFormField(
          keyboardType: const TextInputType.numberWithOptions(),
          controller: controller,
          decoration: InputDecoration(
              focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black, width: 2),
              ),
              labelText: " Write which number do you want to convert",
              labelStyle: TextStyle(color: Theme.of(context).primaryColor)),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter some number';
            }else if(double.parse(value) > 999999999999){
              return 'Max 999 billion 999 million 999 thousand 999 hundred 999';
            }
            return null;
          },
        ),
      ),
    ),
  );
}
