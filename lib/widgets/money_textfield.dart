import 'package:flutter/material.dart';
import 'package:griyaadmin/utils/app_style.dart';

class MoneyTextField extends StatelessWidget {
  MoneyTextField(
      {this.icon,
      @required this.label,
      this.controller,
      this.validator,
      this.onChanged});
  final IconData icon;
  final String label;
  final TextEditingController controller;
  final validator;
  final onChanged;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChanged,
      autofocus: false,
      controller: controller,
      keyboardType: TextInputType.number,
      style: TextStyle(
          fontSize: 25.0, color: Colors.white, fontWeight: FontWeight.bold),
      validator: validator,
      cursorColor: Colors.white,
      decoration: InputDecoration(
        errorStyle: TextStyle(color: Colors.yellow),
        hintStyle: TextStyle(color: Colors.white24),
        prefixIcon: Padding(
          padding: EdgeInsets.all(15),
          child: Text(
            'Rp ',
            style: TextStyle(
                color: Colors.white,
                fontSize: 25.0,
                fontWeight: FontWeight.bold),
          ),
        ),
        filled: true,
        fillColor: AppStyle.primaryColor.withOpacity(1.0),
        hintText: label,
        contentPadding: EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 5.0),
        border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(5.0)),
      ),
    );
  }
}
