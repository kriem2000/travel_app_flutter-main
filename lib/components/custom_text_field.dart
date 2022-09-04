import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  final TextInputType Keyboardtype;
  final bool obscurText;
  final IconData icon;
  final void Function(String) OnChanged;

  // ignore: use_key_in_widget_constructors
  const CustomTextField(
      {required this.Keyboardtype,
      required this.obscurText,
      required this.icon,
      required this.OnChanged});

  @override
  State<CustomTextField> createState() => CustomTextField_State();
}

class CustomTextField_State extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      style: (const TextStyle(
        color: Colors.grey,
        fontWeight: FontWeight.w400,
      )),
      keyboardType: widget.Keyboardtype,
      obscureText: widget.obscurText,
      cursorColor: Colors.grey,
      decoration: InputDecoration(
        border: InputBorder.none,
        fillColor: Colors.white,
        filled: true,
        prefixIcon: Icon(widget.icon),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.blueGrey,
            width: 2.0,
          ),
        ),
      ),
      onChanged: widget.OnChanged,
    );
  }
}
