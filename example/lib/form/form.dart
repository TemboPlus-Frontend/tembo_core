import '../source.dart';

class ExampleForm extends StatefulWidget {
  const ExampleForm({super.key});

  @override
  State<ExampleForm> createState() => _ExampleFormState();
}

class _ExampleFormState extends State<ExampleForm> {
  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final emailController = TextEditingController();
  final tinNoController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  String? size;

  @override
  Widget build(BuildContext context) {
    return Form(
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
            formatters: const [
              NoSpaceFormatter(),
              OnlyIntegerFormatter(),
              TelecomFormatter(),
            ],
          ),
          vSpace(),
          TemboTextField.labelled(
            "Email",
            controller: emailController,
            textInputType: TextInputType.emailAddress,
            validator: validateEmail,
          ),
          vSpace(),
          const TemboLabel("Choose Size"),
          TemboChips<String>(
            options: const ["Small", "Medium", "Large"],
            name: (e) => e,
            onTap: chooseSize,
            selected: (e) => size == e,
          ),
          vSpace(),
          TemboTextField.labelled(
            "TIN Number",
            controller: tinNoController,
            validator: validateName,
            textInputType: TextInputType.number,
            formatters: const [
              FixedLengthFormatter(13),
              TINNumberFormatter(),
            ],
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
