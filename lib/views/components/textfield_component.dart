import 'package:flutter/material.dart';

class TextFieldComponent extends StatefulWidget {
  final String title;
  final bool isPassword;
  final TextEditingController controller;

  const TextFieldComponent(
      {super.key,
      required this.title,
      required this.isPassword,
      required this.controller});

  @override
  State<TextFieldComponent> createState() => _TextComponentFieldState();
}

class _TextComponentFieldState extends State<TextFieldComponent> {
  bool obscure = true;

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
          contentPadding: const EdgeInsets.only(
            left: 10,
          ),
          labelText: widget.title,
          labelStyle: const TextStyle(),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Color.fromARGB(255, 15, 74, 162)),
          ),
          suffixIcon: widget.isPassword
              ? IconButton(
                  onPressed: () {
                    setState(() {
                      obscure = !obscure;
                    });
                  },
                  icon: !obscure
                      ? const Icon(Icons.visibility_off)
                      : const Icon(Icons.visibility))
              : null),
      obscureText: widget.isPassword ? obscure : false,
      style: const TextStyle(),
      controller: widget.controller,
    );
  }
}
