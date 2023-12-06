import 'package:tembo_ui/components/form/form.dart';
import 'package:tembo_ui/source.dart';

class ExampleForm extends StatefulWidget {
  const ExampleForm({super.key});

  @override
  State<ExampleForm> createState() => _ExampleFormState();
}

class _ExampleFormState extends State<ExampleForm> {
  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final emailController = TextEditingController();

  final formKey = GlobalKey<TemboFormState>();

  String? size;

  @override
  Widget build(BuildContext context) {
    return TemboForm(
      key: formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TemboTextField.labelled(
            "Name",
            controller: nameController,
            textInputType: TextInputType.name,
            validator: (s) => validateName(s, label: "Name"),
          ),
          vSpace(),
          TemboTextField.labelled(
            "Phone",
            controller: phoneController,
            textInputType: TextInputType.phone,
            validator: validateTZPhone,
          ),
          vSpace(),
          TemboTextField.labelled(
            "Email",
            controller: emailController,
            textInputType: TextInputType.emailAddress,
            validator: validateEmail,
          ),
          vSpace(),
          const TemboFormLabel("Choose Size"),
          TemboChips<String>(
            options: const ["Small", "Medium", "Large"],
            name: (e) => e,
            onTap: chooseSize,
            selected: (e) => size == e,
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

  void chooseSize(String e) => setState(() => size = e);

  void onPressed() {
    formKey.currentState?.validate();
  }
}
