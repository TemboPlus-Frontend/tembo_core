import 'package:flutter/material.dart';

import 'bottom_sheet.dart';

Future<T?> showAppModalBottomSheet<T>({
  required BuildContext context,
  required Widget Function(BuildContext c) builder,
  num? height,
}) async {
  final ctx = Navigator.of(context, rootNavigator: true).context;

  return showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    isDismissible: true,
    useSafeArea: true,
    useRootNavigator: true,
    builder: (_) => ModalBottomSheetView(
      height: height,
      child: builder(ctx),
    ),
  );
}
