import 'package:flutter/material.dart';

class CustomInputFieldPassword extends StatefulWidget {
  CustomInputFieldPassword({
    Key? key,
    this.hintText,
    this.labelText,
    this.helperText,
    this.suffixIcon,
    this.icon,
    this.keyboardType,
    this.obscureText = false,
    required this.formProperty,
    required this.formValues,
  }) : super(key: key);

  final String? hintText;
  final String? labelText;
  final String? helperText;
  final IconData? suffixIcon;
  final IconData? icon;
  final TextInputType? keyboardType;
  bool obscureText;

  final String formProperty;
  final Map<String, String> formValues;

  @override
  State<CustomInputFieldPassword> createState() =>
      _CustomInputFieldPasswordState();
}

class _CustomInputFieldPasswordState extends State<CustomInputFieldPassword> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autofocus: true,
      initialValue: '',
      textCapitalization: TextCapitalization.words,
      keyboardType: widget.keyboardType,
      obscureText: widget.obscureText,
      onChanged: (value) {
        widget.formValues[widget.formProperty] = value;
      },
      validator: (value) {
        if (value == null) return 'Este campo es requerido';
        return value.length < 1 ? 'Escriba contraseña' : null;
      },
      autovalidateMode: AutovalidateMode.onUserInteraction,
      decoration: InputDecoration(
        hintText: widget.hintText,
        labelText: widget.labelText,
        helperText: widget.helperText,
        //prefixIcon: Icon(Icons.verified_user_outlined),
        suffixIcon: IconButton(
          icon: Icon(
            widget.obscureText ? Icons.visibility_off : Icons.visibility,
            color: Colors.white,
          ),
          onPressed: () {
            widget.obscureText = !widget.obscureText;

            setState(() {});
          },
        ),
        icon: widget.icon == null ? null : Icon(widget.icon),
      ),
    );
  }
}
