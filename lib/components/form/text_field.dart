import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:tembo_core/tembo_core.dart';

class TemboTextField extends ConsumerStatefulWidget {
  final TextEditingController? controller;
  final bool obscureText;

  @Deprecated("Please use TemboTextField.fieldValidator instead")
  final Message? Function(String?)? validator;

  final String? Function(String?)? fieldValidator;

  final ValueChanged<String>? onChanged;
  final void Function(String?)? onSave;

  final TextCapitalization? textCapitalization;
  final TextInputType? textInputType;
  final FocusNode? focusNode;
  final bool? enabled;
  final List<TextInputFormatter>? formatters;
  final TextAlign? textAlign;
  final String? hint;
  final TemboTextFieldDecoration? decoration;

  final String? label;

  const TemboTextField({
    this.controller,
    this.obscureText = false,
    this.validator,
    this.focusNode,
    this.enabled,
    this.textCapitalization,
    this.onChanged,
    this.onSave,
    this.textInputType,
    this.formatters,
    this.hint,
    Key? key,
    this.textAlign,
    this.fieldValidator,
    this.decoration,
  })  : label = null,
        super(key: key);

  TemboTextField.value(
    String value, {
    this.label,
    this.textCapitalization,
    Key? key,
    this.textAlign,
    this.decoration,
  })  : textInputType = null,
        hint = null,
        validator = null,
        fieldValidator = null,
        obscureText = false,
        onChanged = null,
        onSave = null,
        focusNode = null,
        formatters = null,
        enabled = false,
        controller = TextEditingController(text: value),
        super(key: key);

  const TemboTextField.labelled(
    String lbl, {
    this.controller,
    this.obscureText = false,
    this.validator,
    this.focusNode,
    this.enabled,
    this.textCapitalization,
    this.onChanged,
    this.onSave,
    this.textInputType,
    this.formatters,
    this.fieldValidator,
    this.hint,
    Key? key,
    this.textAlign,
    this.decoration,
  })  : label = lbl,
        super(key: key);

  @override
  ConsumerState<TemboTextField> createState() => _TemboTextFieldState();
}

class _TemboTextFieldState extends ConsumerState<TemboTextField> {
  final controllerHasTextNotifier = ValueNotifier(false);

  final errorNotifier = ValueNotifier<Message?>(null);

  final fieldErrorValidatorNotifier = ValueNotifier<String?>(null);

  @override
  void initState() {
    super.initState();
    final controller = widget.controller;

    if (controller != null) {
      controllerHasTextNotifier.value = controller.text.isNotEmpty;
      controller.addListener(() {
        controllerHasTextNotifier.value = controller.text.isNotEmpty;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final scheme = getTemboColorScheme();

    final defaultDeco = TemboTextFieldDecoration(borderColor: scheme.border);
    var decoration = widget.decoration ?? defaultDeco;
    decoration = decoration.copyWith(hint: widget.hint);

    if (!(widget.enabled ?? true)) {
      decoration = decoration.copyWith(fillColor: scheme.surfaceContainer);
    }

    final mqData = MediaQuery.of(context);
    final mqDataNew = mqData.copyWith(textScaler: const TextScaler.linear(1.0));

    return MediaQuery(
      data: mqDataNew,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          if (widget.label != null)
            TemboLabel(
              widget.label!,
              style: decoration.labelStyle,
            ),
          SizedBox(
            width: decoration.size?.width,
            height: decoration.size?.height,
            child: handleValidationErrors(),
          ),
        ],
      ),
    );
  }

  Widget handleValidationErrors() {
    if (widget.fieldValidator != null) {
      return ValueListenableBuilder<String?>(
          valueListenable: fieldErrorValidatorNotifier,
          builder: (context, error, snapshot) {
            return buildField(error != null);
          });
    }

    return ValueListenableBuilder<Message?>(
        valueListenable: errorNotifier,
        builder: (context, error, snapshot) {
          return buildField(error != null);
        });
  }

  Widget buildField([bool hasError = false]) {
    final scheme = getTemboColorScheme();

    final defaultDeco = TemboTextFieldDecoration(borderColor: scheme.border);
    var decoration = widget.decoration ?? defaultDeco;
    decoration = decoration.copyWith(hint: widget.hint);

    if (!(widget.enabled ?? true)) {
      decoration = decoration.copyWith(fillColor: scheme.surfaceContainer);
    }

    final bool canExpand = decoration.size != null;

    return TextFormField(
      style: decoration.valueStyle,
      controller: widget.controller,
      focusNode: widget.focusNode,
      obscureText: widget.obscureText,
      decoration: hasError
          ? decoration
              .copyWith(borderColor: context.colorScheme.error)
              .getInputDecoration
          : decoration.getInputDecoration.copyWith(
              errorStyle: context.textTheme.bodySmall.withSize(0),
            ),
      inputFormatters: widget.formatters,
      validator: validate,
      textAlign: widget.textAlign ?? TextAlign.start,
      onTap: () {
        errorNotifier.value = null;
        fieldErrorValidatorNotifier.value = null;
      },
      onSaved: widget.onSave,
      textCapitalization: widget.textCapitalization ?? TextCapitalization.none,
      textInputAction: TextInputAction.done,
      keyboardType: widget.textInputType,
      onChanged: widget.onChanged,
      enabled: widget.enabled ?? true,
      expands: canExpand,
      textAlignVertical: TextAlignVertical.center,
      maxLines: canExpand ? null : 1,
      minLines: canExpand ? null : null,
    );
  }

  String? validate(String? value) {
    if (widget.fieldValidator != null) {
      final fieldValidatorError = widget.fieldValidator!(value);
      if (fieldValidatorError != null) {
        fieldErrorValidatorNotifier.value = fieldValidatorError;
        return fieldValidatorError;
      }
    }

    if (widget.validator != null) {
      final error = widget.validator!(value);
      if (error != null) {
        errorNotifier.value = error;
        return error.text;
      }
    }

    return null;
  }
}
