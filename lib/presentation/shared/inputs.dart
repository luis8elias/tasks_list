import 'package:flutter/material.dart';
import '/util/fields_validators.dart';
import '/config/size_constants.dart';

class GenericInput extends StatelessWidget {
  const GenericInput({
    super.key,
    required this.hintText,
    required this.label,
    required this.controller,
    this.isRequired = false,
    this.readOnly = false,
    this.onTap
  });

  final String label;
  final String hintText;
  final TextEditingController controller;
  final bool isRequired;
  final bool readOnly;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      readOnly: readOnly,
      controller: controller,
      onTap: onTap,
      cursorColor: Colors.blueGrey.shade900,
      keyboardType: TextInputType.emailAddress,
      validator: isRequired ? (value) => requiredValidator(value: value) : null,
      decoration: InputDecoration(
        filled: true,
        labelText: label,
        hintText: hintText,
        hintStyle: Theme.of(context).textTheme.labelSmall!.copyWith(
          fontSize: 16,
          fontWeight: FontWeight.normal
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(kBorderRadius),
          borderSide: BorderSide(
            width: 2, color: const Color(0xff000000).withOpacity(0.4))
          ),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        fillColor: Theme.of(context).scaffoldBackgroundColor,
      ),
    );
  }
}