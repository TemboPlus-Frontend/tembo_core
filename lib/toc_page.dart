import 'source.dart';

import 'package:url_launcher/url_launcher.dart';

/// Prompts the user to agree to TemboPlus's Terms & Conditions
class TOCPage extends TemboPage {
  final VoidCallback onAgreed;
  const TOCPage(this.onAgreed, {super.key});

  @override
  String get name => "toc";

  @override
  State<TOCPage> createState() => _TOCPageState();
}

class _TOCPageState extends State<TOCPage> {
  bool agreedToTOC = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TemboAppBar(
        label: context.l.toc.title,
        leading: BackButton(
          onPressed: () => rootNavKey.pop(),
        ),
      ),
      extendBodyBehindAppBar: true,
      body: Container(
        constraints: const BoxConstraints.expand(),
        child: ThemeDataWrapper(builder: (context, theme) {
          return Column(
            children: [
              Expanded(
                child: Padding(
                  padding: kHorPadding,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(height: 20),
                      Image.asset(
                        "packages/tembo_ui/assets/images/logo_round.png",
                        height: 150,
                      ),
                      const SizedBox(height: 20),
                      const TemboText("TEMBO PLUS INC."),
                      const SizedBox(height: 10),
                      TemboText(
                        context.l.toc.desc,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w300,
                          color: theme.colorScheme.body,
                        ),
                      ),
                      const SizedBox(height: 10),
                      TemboTextButton(
                        onPressed: showTOC,
                        style: const TemboButtonStyle.outline(),
                        child: TemboText(context.l.toc.readTerms),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: kHorPadding.right),
                child: Row(
                  children: [
                    Checkbox.adaptive(
                      value: agreedToTOC,
                      onChanged: updateAgreeStatus,
                      checkColor: theme.colorScheme.onPrimary,
                      fillColor: agreedToTOC
                          ? MaterialStatePropertyAll(theme.colorScheme.primary)
                          : null,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5)),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: TemboText(
                        context.l.toc.readAlready,
                        style: const TextStyle(fontSize: 12),
                      ),
                    )
                  ],
                ),
              ),
            ],
          );
        }),
      ),
      bottomNavigationBar: agreedToTOC
          ? TemboBottomButton(callback: widget.onAgreed)
          : const _Button(),
    );
  }

  void updateAgreeStatus(bool? value) {
    if (value == null) return;
    setState(() => agreedToTOC = value);
  }

  void showTOC() async {
    try {
      launchUrl(Uri.parse("https://www.temboplus.com/app/privacy.html"));
    } catch (e) {
      showErrorSnackbar(context, "$e");
    }
  }
}

class _Button extends StatelessWidget {
  const _Button();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ThemeDataWrapper(builder: (context, theme) {
        return TemboTextButton(
          onPressed: () {},
          style: theme.bottomNavBarButtonStyle.copyWith(
            backgroundColor: Colors.grey,
            foregroundColor: Colors.white,
          ),
          child: TemboText(context.l.next),
        );
      }),
    );
  }
}
