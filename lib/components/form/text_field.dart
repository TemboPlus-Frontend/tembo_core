import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:tembo_core/tembo_core.dart';

class TemboTextField extends ConsumerStatefulWidget {
  final TextEditingController? controller;
  final bool obscureText;
  final Message? Function(String?)? validator;
  final ValueChanged<String>? onChanged;
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
    this.textInputType,
    this.formatters,
    this.hint,
    Key? key,
    this.textAlign,
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
        obscureText = false,
        onChanged = null,
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
    this.textInputType,
    this.formatters,
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

    final bool canExpand = decoration.size != null;

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
            child: ValueListenableBuilder<Message?>(
                valueListenable: errorNotifier,
                builder: (context, error, snapshot) {
                  final hasError = error != null;
      
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
                    onTap: () => errorNotifier.value = null,
                    textCapitalization:
                        widget.textCapitalization ?? TextCapitalization.none,
                    textInputAction: TextInputAction.done,
                    keyboardType: widget.textInputType,
                    onChanged: widget.onChanged,
                    enabled: widget.enabled ?? true,
                    expands: canExpand,
                    maxLines: canExpand ? null : 1,
                    minLines: canExpand ? null : null,
                  );
                }),
          ),
          // buildError(),
        ],
      ),
    );
  }

  String? validate(String? value) {
    if (widget.validator == null) return null;
    final error = widget.validator!(value);
    if (error != null) {
      errorNotifier.value = error;
      // final isEn = ref.read(localesManagerProvider).isEN;
      // print(Intl.getCurrentLocale());

      final isEn = Intl.getCurrentLocale() == "en_US";
      return isEn ? error.enMessage : error.swMessage;
    }

    return null;
  }

  Widget buildError() {
    return ValueListenableBuilder(
      valueListenable: errorNotifier,
      builder: (_, error, __) {
        if (error == null) return Container();
        final isEn = Intl.getCurrentLocale() == "en_US";
        final locale = isEn ? TemboLocale.en : TemboLocale.sw;

        return Padding(
            padding: const EdgeInsets.only(top: 5),
            child: TemboText(
              error.fromLocale(locale),
              style: context.textTheme.bodyMedium.withColor(
                context.colorScheme.error,
              ),
            ));
      },
    );
  }
}
