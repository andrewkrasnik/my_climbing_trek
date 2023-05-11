import 'package:flutter/material.dart';

Future<T?> showMyModalBottomSheet<T>(
    {required BuildContext context,
    required Widget child,
    double heightPersent = 0.5}) {
  return showModalBottomSheet<T>(
    context: context,
    isScrollControlled: true,
    shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(32))),
    builder: (context) {
      final double additionPadding = MediaQuery.of(context).viewInsets.bottom;
      return SizedBox(
        height: MediaQuery.of(context).size.height * heightPersent +
            additionPadding,
        child: Padding(
          padding: EdgeInsets.only(bottom: additionPadding),
          child: child,
        ),
      );
    },
  );
}
