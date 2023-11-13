import 'package:flutter/services.dart';

import '../../source.dart';

class TemboLabelledFormField extends StatelessWidget {
  final String label;
  final TextStyle? labelStyle;
  final double space;

  final TextEditingController? controller;
  final bool? obscureText;
  final String? Function(String?)? validator;
  final ValueChanged<String>? onChanged;
  final TextCapitalization? textCapitalization;
  final TextInputType? textInputType;
  final FocusNode? focusNode;
  final bool? enabled;
  final List<TextInputFormatter>? formatters;
  final TextAlign? textAlign;
  final String? hint;
  final TemboTextFieldDecoration? decoration;

  const TemboLabelledFormField({
    required this.label,
    this.space = 10,
    this.labelStyle,
    this.controller,
    this.obscureText,
    this.validator,
    this.focusNode,
    this.enabled,
    this.textCapitalization,
    this.onChanged,
    this.textInputType,
    this.formatters,
    this.hint,
    Key? key,
    this.textAlign,
    this.decoration,
  }) : super(key: key);

  TemboLabelledFormField.disabled({
    required this.label,
    required String value,
    this.space = 10,
    this.labelStyle,
    this.textCapitalization,
    this.hint,
    Key? key,
    this.textAlign,
    this.decoration,
  })  : controller = TextEditingController(text: value),
        enabled = false,
        focusNode = null,
        obscureText = null,
        validator = null,
        formatters = [],
        textInputType = null,
        onChanged = null,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TemboFormLabel(label, bottomSpacing: space),
        TemboTextField(
          hint: hint,
          controller: controller,
          obscureText: obscureText,
          validator: validator,
          focusNode: focusNode,
          enabled: enabled,
          textCapitalization: textCapitalization,
          onChanged: onChanged,
          textInputType: textInputType,
          textAlign: textAlign,
          formatters: formatters,
       /*    decoration: decoration ??
              TemboTextFieldDecoration(
                fillColor: context.colorScheme.surface,
                borderColor: Colors.black54,
                borderWidth: 2,
                size: const Size.fromHeight(60),
                valueStyle: context.textTheme.headlineSmall.withColor(
                  context.colorScheme.onBackground,
                ),
              ), */
        ),
      ],
    );
  }
}
