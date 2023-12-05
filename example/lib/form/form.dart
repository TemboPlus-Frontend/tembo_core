import 'package:flutter/material.dart';
import 'package:tembo_ui/components/form/form.dart';
import 'package:tembo_ui/tembo_ui.dart';

class ExampleForm extends StatefulWidget {
  const ExampleForm({super.key});

  @override
  State<ExampleForm> createState() => _ExampleFormState();
}

class _ExampleFormState extends State<ExampleForm> {
  final formKey = GlobalKey<TemboFormState>();

  @override
  Widget build(BuildContext context) {
    return TemboForm(
      key: formKey,
      child: Column(
        children: [
          const TemboTextField.labelled(
            "Name",
            textInputType: TextInputType.emailAddress,
            validator: validateEmail,
          ),
          vSpace(),
          const TemboTextField.labelled(
            "Email",
            textInputType: TextInputType.emailAddress,
            validator: validateEmail,
          ),
          vSpace(),
          TemboTextButton(
            onPressed: onPressed,
            style: const TemboButtonStyle.filled(
                width: double.maxFinite, height: 45),
            child: const TemboText("Save"),
          ),
        ],
      ),
    );
  }

  void onPressed() {
    formKey.currentState?.validate();
  }
}
