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

  var date = DateTime.now();

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
            "Name (Outline)",
            controller: nameController,
            textInputType: TextInputType.name,
            decoration: const TemboTextFieldDecoration(),
            validator: (s) => validateName(s, label: "Name"),
          ),
          vSpace(),
          TemboTextField.labelled(
            "Phone (Filled)",
            hint: "e.g 25571234567",
            controller: phoneController,
            textInputType: TextInputType.phone,
            decoration: const TemboTextFieldDecoration.filled(),
            validator: validateTZPhone,
            formatters: const [
              NoSpaceFormatter(),
              OnlyIntegerFormatter(),
              TelecomFormatter(),
            ],
          ),
          vSpace(),
          TemboTextField.value(
            "johndoe@gmail.com",
            label: "Email (Disabled)",
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
            "TIN Number (Filled)",
            controller: tinNoController,
            validator: validateName,
            textInputType: TextInputType.number,
            decoration: const TemboTextFieldDecoration.filled(),
            formatters: const [
              FixedLengthFormatter(13),
              TINNumberFormatter(),
            ],
          ),
          vSpace(),
          TemboDatePicker(
            date: date,
            label: (d) => d.format(),
            onSelected: (e) => setState(() => date = e),
          ),
          vSpace(),
          TemboTextButton(
            onPressed: () {
              showAlertDialog(
                context,
                title: "Alert Dialog",
                desc: "Alert dialog description",
              );
            },
            style: const TemboButtonStyle.outline(),
            child: const TemboText("Show Alert Dialog"),
          ),
          vSpace(),
          TemboTextButton(
            onPressed: onPressed,
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
