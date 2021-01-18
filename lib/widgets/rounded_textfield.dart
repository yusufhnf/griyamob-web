import 'package:flutter/material.dart';

class RoundedTextField extends StatelessWidget {
  RoundedTextField(
      {this.icon,
      @required this.label,
      this.obsecureText,
      this.inputType,
      this.controller,
      this.validator});
  final IconData icon;
  final String label;
  final TextEditingController controller;
  final bool obsecureText;
  final TextInputType inputType;
  final validator;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autofocus: false,
      controller: controller,
      obscureText: obsecureText,
      keyboardType: inputType,
      validator: validator,
      decoration: InputDecoration(
        prefixIcon: Icon(icon, color: Color.fromRGBO(32, 71, 152, 1.0)),
        hintText: label,
        contentPadding: EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 5.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0)),
      ),
    );
  }
}
