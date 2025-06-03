import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final String? label;
  final String? hint;
  final String? errorMessage;
  final bool obscureText;
  final IconData? iconSuffix;
  final Function(String)? onChanged;
  final String? Function(String?)? validator;

  const CustomTextFormField({
    super.key,
    this.label,
    this.hint,
    this.obscureText = false,
    this.iconSuffix,
    this.errorMessage,
    this.onChanged,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final border = OutlineInputBorder(borderRadius: BorderRadius.circular(10));

    return TextFormField(
      onChanged: onChanged,
      validator: validator,
      obscureText: obscureText,
      decoration: InputDecoration(
        enabledBorder: border,
        focusedBorder: border.copyWith(
          borderSide: BorderSide(color: colors.primary),
        ),
        errorBorder: border.copyWith(
          borderSide: BorderSide(color: colors.error),
        ),
        focusedErrorBorder: border.copyWith(
          borderSide: BorderSide(color: colors.primary),
        ),
        isDense: true,
        label: Text(label ?? ''),
        hintText: hint,
        errorText: errorMessage,
        focusColor: colors.primary,
        suffix: Icon(iconSuffix, color: colors.primary),
      ),
    );
  }
}
