import 'package:flutter/material.dart';

class FormInput extends StatelessWidget {
  const FormInput({super.key, this.placeholder, this.obscureText, this.controller, this.onChanged});

  final String? placeholder;
  final bool? obscureText;
  final TextEditingController? controller;
  final Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        constraints: const BoxConstraints.tightFor(
          height: 48.0
        ),
        hintText: placeholder,
        hintStyle: const TextStyle(
          color: Colors.grey,
          fontWeight: FontWeight.normal
        ),
        fillColor: Colors.white,
        filled: true,
        border: InputBorder.none,
        contentPadding: const EdgeInsets.symmetric(horizontal: 16.0),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0), // Rounded corners when not focused
          borderSide: BorderSide.none, // No border line
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0), // Rounded corners when focused
          borderSide: BorderSide.none, // No border line
        ),
      ),
      style: const TextStyle(
        color: Colors.black,
        fontSize: 16.0
      ),
      obscureText: obscureText ?? false,
      controller: controller,
      onChanged: onChanged,
    );
  }
}
