// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final TextInputType? keyboardType;
  final String? labelText;
  final Widget? prefixIcon;
  final void Function()? onTap;

  const CustomTextField({
    Key? key,
    required this.controller,
    this.keyboardType,
    this.labelText,
    this.prefixIcon,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      onTap: onTap,
      decoration: InputDecoration(
        hintText: labelText,
        labelText: labelText,
        border: const OutlineInputBorder(),
        prefixIcon: prefixIcon,
      ),
    );
  }
}

class CustomBtn extends StatelessWidget {
  const CustomBtn({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 54,
      child: ElevatedButton(
          // MaterialButton
          onPressed: () {},
          child: const Text(
            "Login",
            style: TextStyle(
              color: Colors.white,
            ),
          )),
    );
  }
}
