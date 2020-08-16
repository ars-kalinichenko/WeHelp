import 'dart:async';

import 'package:flutter/material.dart';
import 'package:we_help/behaviors/toast_animation.dart';

class ToastUtils {
  /// A utility for creating toast messages about success or error.
  static Timer toastTimer;
  static OverlayEntry _overlayEntry;

  static void showCustomToast(BuildContext context, String message, Icon icon,
      Color textColor, Color boxColor) {
    /// Shows a message for 4 seconds
    if (toastTimer == null || !toastTimer.isActive) {
      _overlayEntry =
          createOverlayEntry(context, message, icon, textColor, boxColor);
      Overlay.of(context).insert(_overlayEntry);
      toastTimer = Timer(Duration(seconds: 4), () {
        if (_overlayEntry != null) {
          _overlayEntry.remove();
        }
      });
    }
  }

  static void showSuccessToast(BuildContext context) {
    showCustomToast(
      context,
      "Запрос отправлен",
      Icon(Icons.check, color: Colors.white),
      Colors.white,
      Color(0xff3EE896),
    );
  }
  static void showErrorToast(BuildContext context) {
    showCustomToast(
      context,
      "Попробуйте ещё раз.",
      Icon(Icons.clear, color: Colors.white),
      Colors.white,
      Color(0xffF14E4E),
    );
  }

  static OverlayEntry createOverlayEntry(BuildContext context, String message,
      Icon icon, Color textColor, Color boxColor) {
    /// Creates a message widget.
    return OverlayEntry(
      builder: (context) => Positioned(
        top: MediaQuery.of(context).size.height * 0.07,
        width: MediaQuery.of(context).size.width * 0.9,
        left: MediaQuery.of(context).size.width * 0.05,
        child: SlideInToastMessageAnimation(
          Material(
            elevation: 10.0,
            borderRadius: BorderRadius.circular(10),
            child: Container(
              padding:
                  EdgeInsets.only(left: 10, right: 10, top: 13, bottom: 10),
              decoration: BoxDecoration(
                  color: boxColor, borderRadius: BorderRadius.circular(10)),
              child: Align(
                alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    icon,
                    SizedBox(width: MediaQuery.of(context).size.width * 0.1),
                    Text(
                      message,
                      textAlign: TextAlign.center,
                      softWrap: true,
                      style: TextStyle(
                        fontSize: 18,
                        color: textColor,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
