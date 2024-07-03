import 'package:aqari/core/utils/toast_x.dart';
import 'package:aqari/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// CopyHelper is a helper class to copy text to clipboard and show Toast
class ClipboardHelper {
  /// Copy text to clipboard and show Toast
  static void copyTextToClipboard({
    required String text,
    required BuildContext context,
  }) {
    Clipboard.setData(ClipboardData(text: text));
    ToastX.showCustomToast(
      message: S.of(context).copiedToClipboard,
      context: context,
    );
  }
}
